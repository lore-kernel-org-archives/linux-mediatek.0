Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F97C531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 15:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4sCEiKf2B9DqzQ8Bb94EFqGzHc8DX0w0QdFuF8Rhqn4=; b=lUyzcUDUsTXEzp08mzlmKIxWwt
	cMx78BssoSY5cz7tFfZuT+OxVWG9Ox5SprdPa8bC6okeCsynCeW8SSlx6L/bG0QCBZ3gT/gc7mdM8
	5UYw2IZ49QJh1jgwja0DJkCkkj7h6cS94BMaI8peKnuGMadZMkw/1xEjVeK+MTP4huoJ1WPqRllp8
	V5HRQigv4PFsl3/Le13zvmp9A/M1IaCy64Wto0HyKc4ObbhW2sLXUYokWXyKlp9gBhD3M1kPlJOrF
	64ltUt0Cwffx6ohsFKiajXEpDv1MCtyXFKuEBvClaMA39g+Wv3Q555c2JL+ppLVaDTT9GJsaISqMa
	mHQV7xCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyx8-0000000DP7X-3aK7;
	Fri, 16 Aug 2024 15:33:22 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyvm-0000000DOWd-2eSg
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 15:32:00 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-428f5c0833bso16921055e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Aug 2024 08:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822317; x=1724427117; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4sCEiKf2B9DqzQ8Bb94EFqGzHc8DX0w0QdFuF8Rhqn4=;
        b=qNKAaI8wq/Mwx8mO5q51juTq5uHMGTqcmBIaKh3KN9C5QYkPvq05JzEi5CiIz+6hAM
         aNfDGZz4NYDV5T46bYMp1Sum+W/51glu1sk7lzWAyahmhDyrm7bMn5dC4Utbvxk9DbFB
         AOwx3B5SoEj9GFb3AAuQ7mMVVjtKGMcmPftWR/3wlIlF7WUUcEcYBeo4/fl95uQ1aPn6
         txpKR7Pwp75JcCCSuMy3q/rN0xooFK8Apjlxlb6rEeir7GFE/oy2yd2eBif1w5nw6oLF
         klfMboptuwfrt74xMhnHpqZbVGN634eWFA6/XnV/JDysRA1zMAdanXX3Y0V5m6elRJlS
         I7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822317; x=1724427117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sCEiKf2B9DqzQ8Bb94EFqGzHc8DX0w0QdFuF8Rhqn4=;
        b=BL3ACSDEskH8u+0rIZafY3LLc+7MS1krspOQ61KynSk66dHued3T92X2mjVV2MQFXM
         /pXpqoSStGt5OlN2AuZBM2ABP1hYLNPwB0YG/P0mav9+/ZrZJWwW+pI/ShTHlJJ6LiLu
         +SjS9QLtaKYI5ATycFt/3fyIPZYb7GYAcorT17oX+sUMCcklkHCeX0pGhlpzn0ckghXU
         WeNZfJ9lerEk5usx35SzqnLyQ40MwE7fCIEJQmfnnFRcx/0a1K05vkrlgZMhCzKj7Ez1
         mRLcCkwh37Xjc2gddfE3YJ0sAcFzRZWzR5z0Pjf7+N4CZ/d1rlwkGbOocBzjYbldTgxY
         BTug==
X-Forwarded-Encrypted: i=1; AJvYcCUWuM8pmGohuQA+esJk/n4/3lvhwCqC/dlKfWhOOaRvRZSu7/hsgnUuj24IDn76dHHq4nEHjkxN4C5jtlnZEwxu/1j6FaKTwAP9cOuEg1OMN9+y
X-Gm-Message-State: AOJu0YwT2i8ACnZ14v97UBrT+cRYAkdfs7cFJ2pP2toI8Xhy3vDGv6hk
	njT7Fs/+nnYjza/tMszYVdM5DWsRyFhHaA5TS1qpr3d14tZX3D3XGw1kL+vcSs8=
X-Google-Smtp-Source: AGHT+IHyXrDHQQ8xvlWiTDWTVoEhaAwJIa4Z1GZboPifzHF1ML55V2Wee10MVI+0W3m/5b6OJzB4SQ==
X-Received: by 2002:a05:600c:1909:b0:427:ee01:ebf0 with SMTP id 5b1f17b1804b1-429e232c0e2mr51862515e9.8.1723822317254;
        Fri, 16 Aug 2024 08:31:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:31:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:34 +0200
Subject: [PATCH 02/17] leds: ktd2692: Use scoped device node handling to
 simplify error paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-2-1d0292802470@linaro.org>
References: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
In-Reply-To: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Riku Voipio <riku.voipio@iki.fi>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2165;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=9Die7rsR0B6JZR+OB5IykGhnUTGNXFPzBPfH+JonqpE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3DaAzLdZslDk0FQE8r1wjsl32N1ooly3he/+
 EvtSvhfqEaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w2gAKCRDBN2bmhouD
 17GeEACO5DbF3CFK0Jm/yLGicXuoliag3DYz7K6gsIaFii1FHbBFpZHVfrfgWYFVJ8CYd37v68w
 soy0nF1zPooHW/VDuHGHdPQM+JHUmVqvUunZEIc6hxiP2ega264eB3t/cyXxpJyTy8EvxTvH2S8
 RLZm6GSGQmTFb9b8tFr9kTeC0FPg7i9FJRzkCCEnlXJsRplK/CW/sk/c0+7xsTXgWn1+cHnB/z4
 1nWHl/IamnG7It/5//a4DlRR+8XeAL4iQLc5liQIgR8ab1IjKSuVly/W2f3FPjckkMMVIAiP0NY
 lXZuuMD4Xg/spf/HqwoTG9qlMAo2UDELs19WB5qozuKnq/OLe9OJzUV/t5gEjEOKr7Kf6HnP4NP
 pPGUQwe9j9k1bsE36op0VjHzY6nDR1vZDxTvmO6sJeGeptqHCWQtkQoXncP0hdgHEy+YiO9j7Sf
 MyH6enXPvNslJ+WiY6GLycxqvWbCVG/y7jOtjlzW9Nl3UNHbPuh7ZVt+C8GZ5DfJxPZVUHZ4yxU
 JI6xexzf69WgGGMsrLOmRbNZeopiDlAirPTz/tKiocePbzX73jydUexldAE2IPUgDYT0hjPcWpk
 yk5iGPgYLagzljdrUiIib+oUnd6ApXqoYlXT8TLGe1VdfmbbssaXp6dH/f3iRB+T0u79f23A33U
 ex5HyA/XSxDiKpw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_083158_728118_1099EE45 
X-CRM114-Status: GOOD (  12.35  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/flash/leds-ktd2692.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/flash/leds-ktd2692.c b/drivers/leds/flash/leds-ktd2692.c
index 7bb0aa2753e3..16a01a200c0b 100644
--- a/drivers/leds/flash/leds-ktd2692.c
+++ b/drivers/leds/flash/leds-ktd2692.c
@@ -6,6 +6,7 @@
  * Ingi Kim <ingi2.kim@samsung.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
 #include <linux/leds-expresswire.h>
@@ -208,7 +209,6 @@ static int ktd2692_parse_dt(struct ktd2692_context *led, struct device *dev,
 			    struct ktd2692_led_config_data *cfg)
 {
 	struct device_node *np = dev_of_node(dev);
-	struct device_node *child_node;
 	int ret;
 
 	if (!np)
@@ -239,7 +239,8 @@ static int ktd2692_parse_dt(struct ktd2692_context *led, struct device *dev,
 		}
 	}
 
-	child_node = of_get_next_available_child(np, NULL);
+	struct device_node *child_node __free(device_node) =
+		of_get_next_available_child(np, NULL);
 	if (!child_node) {
 		dev_err(dev, "No DT child node found for connected LED.\n");
 		return -EINVAL;
@@ -252,26 +253,24 @@ static int ktd2692_parse_dt(struct ktd2692_context *led, struct device *dev,
 				   &cfg->movie_max_microamp);
 	if (ret) {
 		dev_err(dev, "failed to parse led-max-microamp\n");
-		goto err_parse_dt;
+		return ret;
 	}
 
 	ret = of_property_read_u32(child_node, "flash-max-microamp",
 				   &cfg->flash_max_microamp);
 	if (ret) {
 		dev_err(dev, "failed to parse flash-max-microamp\n");
-		goto err_parse_dt;
+		return ret;
 	}
 
 	ret = of_property_read_u32(child_node, "flash-max-timeout-us",
 				   &cfg->flash_max_timeout);
 	if (ret) {
 		dev_err(dev, "failed to parse flash-max-timeout-us\n");
-		goto err_parse_dt;
+		return ret;
 	}
 
-err_parse_dt:
-	of_node_put(child_node);
-	return ret;
+	return 0;
 }
 
 static const struct led_flash_ops flash_ops = {

-- 
2.43.0


