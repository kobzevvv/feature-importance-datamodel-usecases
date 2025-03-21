WITH creative_performance AS (
    SELECT 
        -- Basic campaign and ad identifiers
        "23860131070260354" AS campaign_id,
        "23861957754540354" AS ad_id,
        "Spring Collection | DR | Skincare Serum | No Testimonial" AS ad_name,
        "Has activity" AS ad_activity,
        DATE '2024-03-01' AS first_date_used,
        DATE '2024-03-15' AS last_date_used,
        "23861957868080354" AS creative_id,

        -- Creative properties
        '{"ad_formats":["AUTOMATIC_FORMAT"],"additional_data":{"is_click_to_message":false}}' AS asset_feed,
        '{"instagram_actor_id":"123456789","page_id":"987654321"}' AS object_story,
        "{{product.name}} 2024-03-01-dummyhash12345" AS name_creative,
        "Rejuvenate Your Skin | Hydrate and Glow" AS title_texts,

        -- Video properties (fake values)
        "123456789012345" AS video_id_creative,
        "https://video-content.fbcdn.net/example_video.mp4" AS video_link_creative,
        "987654321098765" AS video_id_1,
        "https://video-content.fbcdn.net/example_object_story_video.mp4" AS video_link_object,
        '["123456789012345", "987654321098765"]' AS video_ids,
        "https://video-content.fbcdn.net/example_asset_video1.mp4" AS video_link_asset_1,
        "https://video-content.fbcdn.net/example_asset_video2.mp4" AS video_link_asset_2,
        "https://video-content.fbcdn.net/example_asset_video3.mp4" AS video_link_asset_3,
        '["https://video-thumbnail.fbcdn.net/example_thumb1.jpg", "https://video-thumbnail.fbcdn.net/example_thumb2.jpg"]' AS video_thumbnails,

        -- Image properties (fake values)
        "111111111111111" AS image_id_info,
        "https://image-content.fbcdn.net/example_image.jpg" AS image_link_image_info,
        "example_image_1.jpg" AS image_file_name,
        "https://image-content.fbcdn.net/example_image_url.jpg" AS image_url,
        "https://image-content.fbcdn.net/example_image_url1.jpg" AS image_url_1,
        "abcd1234efgh5678ijkl9012mnop3456" AS image_hash,
        "mnop3456ijkl9012efgh5678abcd1234" AS image_hash_1,
        '{"left_top": "10x10", "right_bottom": "100x100"}' AS image_crops,

        -- Object information (fake values)
        "PRODUCT" AS object_type,
        "999999999999999" AS object_id,
        "https://ecommerce-website.com/product_page" AS object_url,
        "https://ecommerce-website.com/template_page" AS template_url,
        "https://video-thumbnail.fbcdn.net/example_thumbnail.jpg" AS thumbnail_url,
        "555555555555555" AS product_set_id,
        "333333333333333" AS object_story_id,
        NULL AS instagram_story_id,
        "https://www.instagram.com/p/example_permalink/" AS instagram_permalink_url,
        "444444444444444" AS effective_object_story_id,
        "666666666666666" AS source_instagram_media_id,
        NULL AS effective_instagram_story_id,

        -- Ad settings
        "AUTOMATIC_FORMAT" AS ad_formats,
        "Image" AS automatically_assigned_format,
        FALSE AS is_click_to_message,
        "PLACEMENT" AS optimization_type,
        '["123123123", "456456456"]' AS body_label_ids,
        '["placement_asset_a1b2c3d4", "placement_asset_e5f6g7h8"]' AS body_label_names,

        -- Targeting (fake values)
        65 AS age_max,
        18 AS age_min,
        '["facebook_feed", "instagram_story"]' AS facebook_positions,
        '["story", "reels"]' AS instagram_positions,
        '["story"]' AS messenger_positions,
        '["facebook", "instagram", "audience_network", "messenger"]' AS publisher_platforms,

        -- Ad copy and links
        "https://business.facebook.com/123456789/posts/987654321" AS link_to_creative,
        "Experience radiant skin with our best-selling serum. Clinically proven to hydrate, tighten, and glow. 🌟" AS body_text,
        "Glow Like Never Before" AS title_main,
        "Limited-Time Offer | Free Shipping" AS link_description_text,
        "SHOP_NOW" AS call_to_action_type,
        "https://ecommerce-website.com/buy-now" AS call_to_action_link,

        -- Performance metrics
        150000 AS impressions,
        4500 AS clicks,
        200 AS conversions,
        850.00 AS cost_usd,
        4800.00 AS revenue_usd,

        -- AI-generated creative description
        "A high-resolution image featuring a smiling woman applying a hydrating skincare serum. The product is in focus with a soft-glow effect, emphasizing youthful and moisturized skin. The background is minimalistic with soft pink hues, evoking feelings of freshness and beauty."
        AS gpt_generated_description
    UNION ALL
    -- Generate additional rows
    SELECT 
        "23860131070260355", "23861957754540355", "Summer Collection | DR | Hydration Boost", 
        "Has activity", DATE '2024-03-02', DATE '2024-03-16', "23861957868080355",
        '{"ad_formats":["AUTOMATIC_FORMAT"]}', '{"instagram_actor_id":"987654321","page_id":"123456789"}',
        "{{product.name}} 2024-03-02-dummyhash56789", "Hydration Like Never Before",
        "234567890123456", "https://video-content.fbcdn.net/example_video2.mp4",
        "876543210987654", "https://video-content.fbcdn.net/example_object_story_video2.mp4",
        '["234567890123456", "876543210987654"]', "https://video-content.fbcdn.net/example_asset_video4.mp4",
        "https://video-content.fbcdn.net/example_asset_video5.mp4", "https://video-content.fbcdn.net/example_asset_video6.mp4",
        '["https://video-thumbnail.fbcdn.net/example_thumb3.jpg"]',
        "222222222222222", "https://image-content.fbcdn.net/example_image2.jpg", "example_image_2.jpg",
        "https://image-content.fbcdn.net/example_image_url2.jpg", "https://image-content.fbcdn.net/example_image_url3.jpg",
        "wxyz6789mnop1234qrst5678abcd9012", "qrst5678abcd9012wxyz6789mnop1234",
        '{"left_top": "20x20", "right_bottom": "200x200"}', "PRODUCT", "888888888888888",
        "https://ecommerce-website.com/product_page2", "https://ecommerce-website.com/template_page2",
        "https://video-thumbnail.fbcdn.net/example_thumbnail2.jpg", "666666666666666", "444444444444444",
        NULL, "https://www.instagram.com/p/example_permalink2/", "555555555555555",
        "777777777777777", NULL, "AUTOMATIC_FORMAT", "Video", FALSE, "PLACEMENT",
        '["789789789", "101010101"]', '["placement_asset_i9j8k7l6", "placement_asset_m5n4o3p2"]',
        65, 18, '["facebook_reels", "instagram_story"]', '["story", "reels"]',
        '["story"]', '["facebook", "instagram", "audience_network", "messenger"]',
        "https://business.facebook.com/234567890/posts/876543210", "Revitalize your skin with our hydration boost serum.",
        "Hydrate Instantly", "Exclusive Offer | 20% Off", "SHOP_NOW", "https://ecommerce-website.com/hydration-boost",
        140000, 4200, 180, 750.00, 4300.00,
        "A captivating video showing a close-up of a model applying a refreshing serum with water droplets in the background, emphasizing deep hydration and rejuvenation."
)

SELECT * FROM creative_performance
