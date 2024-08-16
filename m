Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4687C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 15:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlPHB4gr+L6a3Oj22+1JrD6FFL140QqYHUkR8oZywNI=; b=qxTI4THCnZQVJVhVj7l+JAMZeY
	Occo70L/nvttF0koof4yzUYbIt5PJAyzq4XPTZSAL690cY4eWJgC8iTBL9dJYDfd1zdMqV9BoSYq5
	wPCf6fcLT+AuS19Wqlav63GeW9LNYiCeGew6A5sDAYr7+UMrEpBdn0zIII/WR89tLMhQq687Gkq8d
	jlkihc0ncID77LoVGIOYogYWNTCgfH4ACsnNGKor1SB27UPW3fesmug/8rXhXCxaW8tBkfkwqgQlZ
	84vVFoqEVtxWJFDvEFKc+Dj8Y3KdZ5aPbjiXHoLtHBKWEtpTyX4nUpjXKrRYzMJ6b6hRJAFS1N3d6
	9WdseGFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyzf-0000000DPsp-1Ckh;
	Fri, 16 Aug 2024 15:35:59 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyvs-0000000DOaF-3Ed0
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 15:32:06 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-42816ca797fso15597505e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Aug 2024 08:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822323; x=1724427123; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SlPHB4gr+L6a3Oj22+1JrD6FFL140QqYHUkR8oZywNI=;
        b=rn8RkvDPMJ1BPEq3mb6RREZ0L34p5bOt9dr8AYia0uOR9o9uKA8wjv2T/web08cv0Z
         TldHDGedN/U0BDSXJqE2rHCj7ppEfNpAGZ+wRNEKFFgYCrqtx4DydmeRji5e6DjHFn9Q
         eQ5uRGBMnXNpwAyfLBDtjw1ku1jrs8YyI8vo5l9cLey1qac8oIH8viZowG63lMIq1OIF
         1rKUYVOs6wQ83yCC/ghLkrSWbiZVxgy/ptm+d4I/AlsjfGXjpqQudUyex5L2+4fOrYI9
         9opKWcUttUQnoeMmgKsjc7cfflSyWjYPVcF7EBG1TQ7JEuW8jLt94qLRbN7A3H1u3ZlC
         1IHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822323; x=1724427123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SlPHB4gr+L6a3Oj22+1JrD6FFL140QqYHUkR8oZywNI=;
        b=UGPC0bjyEt2R4JTt+R95gaxZK69hEMWz0ZpAgSJddLKsi90FUqxW8f/A+cla9K9Y1l
         rT8o0lFjusR/yDSvaMBvwcC1f1sYhmwEfpxV53oaTnV0WbFJtnPeS3wCczuUeNgDds6M
         SQubOGXP3HqrpaQef9E5pc0/uJGP+Nz2Igz54y8pbeL2WSM4Xbmsk/oDQ4pxRbBxcrWc
         1wPDFJfke1EiwZyIiiEhdH1Gm6JqplyXSCZFu5YdP9AlBlbUlyqAwo+uYhZl3dx+/at2
         hjYL/bkuPPf5ARP7oB7T8nzMrQBzBLcJH7tqdj+YZwYMjevGIvVavKtQC+HtWJy9sG8E
         8N+A==
X-Forwarded-Encrypted: i=1; AJvYcCXNcVR1DRh7ctAUYfqFd0ubmGf6idalGXezHDcdYj81e/Fn8tez9vlJbwdBkpmvDhdrK5l33YAyJyJV7k1nRN1C6g+nmNjT+/5Q2G13TQ24voVc
X-Gm-Message-State: AOJu0YwHMipryLgTAD4nCqBMxtokkn4zIeBukb5hn6UCsozctZbIKqkG
	pqaQRTTas47/yVva/g5VcW1roAXZ3NOr+5uY5qDg5V+n0xVY8VqFJW+lpAJKmxo=
X-Google-Smtp-Source: AGHT+IFBqViSqYS/Qn+XxO+w4C7+CaQs7V1F2BGvW2XzllPgvjc7cAPVBUQf03iTq4tSEpEg3x4Iag==
X-Received: by 2002:a05:600c:3589:b0:426:6388:d59f with SMTP id 5b1f17b1804b1-429ed7a6224mr21796435e9.1.1723822323342;
        Fri, 16 Aug 2024 08:32:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:32:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:38 +0200
Subject: [PATCH 06/17] leds: aw2013: Simplify with scoped for each OF child
 loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-6-1d0292802470@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1390;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=jPAa7n3fQCOZoqW7oKViIUd50z7rPIx9W0P9wLhVk9w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3DerHRigkFM7NozDs05CzB4VVyXWnkCs7tkx
 sIk5q1y1CuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w3gAKCRDBN2bmhouD
 18ZrD/97YWODT5Z5+DTebBI3wZE+0JSm6MgT/9fQqSV/jAaNDxPDxtcrU9f1tlmGpI9FQ3ztA1w
 5kIZXiEWrzUgc01OD/J1u+jXMzVC1rntgQmcCz3eR3mo7vdPoClcn8T4O64bLR388bwI+a/olF8
 ujcI81Zj77ajVSpsdceGMgG+REsRgUhZioX3In0qTtBtjFsadb/4L8RWNBVOt0AO5upLV8A/3gn
 JF6ZkJUcMAY0Qi0Da3wK33LBIxv2tlml2WyLQR7yfSeNJ+dBKo3cAPBXVC/GV/put6MdXTZbbOG
 ntf71ez6jrXpLB9FsKzXgKCZzAXfFyaj7c6KDKJZ0qdComtXvSZ9+mSp1BaMRlT4eBSVFgM3cZR
 aKo+cuCf9Ncg2VJFtXFtMzUFZexM9DjBvAC1DEpVp+NIeqZRM3mp7qsMfRUG9nTl2RVE3i62Yer
 peM1zsF7ZPtFOxd4B+nLZz4t6+pY9/fwPN8b5qz6rLrUQw6zir30lR/BIxNcgMmuFUK2hhjIedu
 zkFHEl6XDKHT1SYYpTDgvlWsGjQll18W4iojiDomjGXNaDHA6idfH18a2C2nDQ0S6Grm5I/A4RB
 9B5KZAgZi4zpiIw7aIsDRpYPQKDdovhX36Zqllgl60VZ5jN4ls0x1PBS4nHla9fOA5RQvPNMBvL
 PMAHdiIqEHJcgMA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_083204_887181_7057B219 
X-CRM114-Status: GOOD (  12.07  )
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

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/leds-aw2013.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index 6475eadcb0df..216755d6010f 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -263,7 +263,7 @@ static int aw2013_blink_set(struct led_classdev *cdev,
 
 static int aw2013_probe_dt(struct aw2013 *chip)
 {
-	struct device_node *np = dev_of_node(&chip->client->dev), *child;
+	struct device_node *np = dev_of_node(&chip->client->dev);
 	int count, ret = 0, i = 0;
 	struct aw2013_led *led;
 
@@ -273,7 +273,7 @@ static int aw2013_probe_dt(struct aw2013 *chip)
 
 	regmap_write(chip->regmap, AW2013_RSTR, AW2013_RSTR_RESET);
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		struct led_init_data init_data = {};
 		u32 source;
 		u32 imax;
@@ -304,10 +304,8 @@ static int aw2013_probe_dt(struct aw2013 *chip)
 
 		ret = devm_led_classdev_register_ext(&chip->client->dev,
 						     &led->cdev, &init_data);
-		if (ret < 0) {
-			of_node_put(child);
+		if (ret < 0)
 			return ret;
-		}
 
 		i++;
 	}

-- 
2.43.0


