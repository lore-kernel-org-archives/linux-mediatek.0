Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D78D2444F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 21:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmicnpp9cd9JtqZFSnHyB6Y93ime6LMtu/deyDIKcMk=; b=Mfud4KqtA1sg8EJI6Uq4QV4Tp7
	FokZ8wELWT1nFfJQ5NEWRoBk5vVpDrEElnxKzl9GKkuU18Mzt1fhJs/IrRghUp2B7bQO6ILvuxOSw
	L9f2DflYsWuxedYHBoAI6ZQkEJW9MKNgBJ7So5XT+BgP8NLiDITfQwuD+vQ2OnC7R4ASHFAoK2m5D
	L6PHsywIWOgw/oG9LivI4rGBdMj0Gx1m6nzMyflMNsP/A3oxtCWtFLBKOOe4upssz7G4g2pQ+wamr
	WCanfY9gD1vnjzej2SH617pCk/xy/SsrBNqDVAJVTSEuAPcxSDk+PzZhbcg/hlaR21XB8ZwHZn7Rf
	Ov5n53xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0s4-0000000EQee-3HkQ;
	Thu, 10 Oct 2024 21:38:56 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0ft-0000000EP8Q-1g8W;
	Thu, 10 Oct 2024 21:26:22 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-37d4a5ecc44so767217f8f.2;
        Thu, 10 Oct 2024 14:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595579; x=1729200379; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmicnpp9cd9JtqZFSnHyB6Y93ime6LMtu/deyDIKcMk=;
        b=Czm9T8vE4GOM1Kpph7qiecEdE5ihsw/6qyZUT2U6taS5O925eSpuHL5PaS48rSuFvY
         k1X4VwAphf9HCMeOoqVeDhrMJFvwbe2yAvAJKxPvZqZdqa7tIZ9C33tNQGI5+4O/GMwh
         172sSLf8XxhlQrMM/xFPab7e+bQJhqbMbs8jE/mZYHjR48ZlJVREmWuBE1xhuOBYI4yo
         CVM8rCkIsr3pnqJbb8PXlq+f9xvnUkTmO8Ubd7ehd9qwl5bAraKvzGBihBOHIYvLmJWH
         LpQBb2gw49qmWp9kZpO2eSBAhkqUH58hXh056a5orFbNj83P8C7hlE3EwALv8RQGRqoN
         gWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595579; x=1729200379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmicnpp9cd9JtqZFSnHyB6Y93ime6LMtu/deyDIKcMk=;
        b=qu+VeVBqfLp/EitXM/XjJDPPYYvd0leNh5YL6KZOVfcWp30uOHdw6XSoMAtDwHvSq5
         atkx6m5PbvMhNmbIXI6G87fWYiAn4NwV3dZD4FNtFmc9nLtf6rq0gkV8apELoLX5kKR/
         kWJe4GP14MMwOCKIRAS6bgxUvJf7Z9cVdJqTHdZCDEPoFYniIiaxPx9gTWIVQIY4dVbv
         TW71MTqYxdKFlHFKHQXTYl8r/9rSOppiPdFX9xriVNzcsCxN8LMyhRCltnVSnDPjBR3W
         zEk6LtkkhBYl+YST92pwv4TEeGmTNC47wtxGkeTiXk5GkZOheLxUrNDp92y57dZWCyDj
         MW3w==
X-Forwarded-Encrypted: i=1; AJvYcCUaMj2P6VSmHxiO1aYXvbedN+QmNEycsf2dtTui06nyR8nYpvm14xXSUIm3SWe7uvgHKYq8vGYzzh1p5rzli/S7@lists.infradead.org, AJvYcCWCSavDSVwXpqHsyTqY3T8dXjPS/MqFIhXeKuONYHypcSXCoN+ebtA6YGx1wZTbvT5US8b75WX3EWy09LtrHy8=@lists.infradead.org, AJvYcCWI2m06LQ0vVLeAaPfLysoEGGOCsOHT9oKIgetpuMH2pl+UVF2etb+TH1bY3nM2RSzqjM3ddsryqtBWXWA88EM/3A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyod2rR1hYjTdDV7JHzpoV89TTRvSPoHpvvUCWtQYXNIXX2EHzY
	bocRlPN0Z6IsJfNFFCXwfkgPQpraFUlE28PawkuSx7DcE/dwse2b
X-Google-Smtp-Source: AGHT+IF35HrnKs7WD26F1nGHKplWO56RdKrMZQ7OOp7vbg+9vF8z0Burx6lY8GWTwDksnELnrk9jIQ==
X-Received: by 2002:adf:e90f:0:b0:37d:50f8:a801 with SMTP id ffacd0b85a97d-37d5531323bmr302685f8f.47.1728595579251;
        Thu, 10 Oct 2024 14:26:19 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:26:18 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:25:59 +0200
Subject: [PATCH 09/10] Input: raspberrypi-ts - use cleanup facility for
 device_node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-9-ebc62138fbf8@gmail.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
In-Reply-To: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=1209;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=qaHmN1vj3OJMngtAh5LlltSL6miuty/pRQh556o6ku0=;
 b=e1/0RKq2raIunj/4RBLVw/Zc3mleb5v6VF2G0Gas11OFUKozTrqrF4MulYBCUvD857OzZgntV
 dW/x3ybOLxPDEqlxp2QL8JWTqTMc0scMnU0b57l0w0WuOer7yfMUZp7
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_142621_474116_C74F92B8 
X-CRM114-Status: GOOD (  13.01  )
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

Use the '__free(device_node)' macro to automatically free the device
node, removing the need for explicit calls to 'of_node_put()' to
decrement its refcount.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/touchscreen/raspberrypi-ts.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/raspberrypi-ts.c b/drivers/input/touchscreen/raspberrypi-ts.c
index 45c575df994e..841d39a449b3 100644
--- a/drivers/input/touchscreen/raspberrypi-ts.c
+++ b/drivers/input/touchscreen/raspberrypi-ts.c
@@ -122,20 +122,18 @@ static int rpi_ts_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct input_dev *input;
-	struct device_node *fw_node;
 	struct rpi_firmware *fw;
 	struct rpi_ts *ts;
 	u32 touchbuf;
 	int error;
 
-	fw_node = of_get_parent(np);
+	struct device_node *fw_node __free(device_node) = of_get_parent(np);
 	if (!fw_node) {
 		dev_err(dev, "Missing firmware node\n");
 		return -ENOENT;
 	}
 
 	fw = devm_rpi_firmware_get(&pdev->dev, fw_node);
-	of_node_put(fw_node);
 	if (!fw)
 		return -EPROBE_DEFER;
 

-- 
2.43.0


