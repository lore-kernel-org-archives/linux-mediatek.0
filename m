Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2818DECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 14:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYJy8WgMUAn0VEuaq5aXmaoEnUqoMBjQF+74z8dXbcI=; b=tl4V6uRKiO6cPWbaATYhxr4Hog
	dAd7foLTUeEzd9tD+bYjNSesar2yEQ3cgL7yF90L4CHv/4HwsX/fHWruED798qh2hguhsCq01WQC1
	41GlA6/23npKp32wkzOEo2Q/e4Nlpu/aev/RCs9h1yhQ1uuGvWBgdV39FzvNjyHdX90bDhZ1ivczd
	NyGp5IU3TM/craCZU5xfdsFUQk9I01F5c1oFrUxUWSR/6q1OGCGfNRk3gM/8Wy8DVN1tQXs60DWwl
	EO6XtHV0rz8vjz9A+Oy7/Ok9Jrh1GEFr4zPzUXr4ZnexTlExTXcEAHgZaemQkJG26LM0pJBTubzrK
	u4WgJy/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snf1W-00000002Ccc-2p6Q;
	Mon, 09 Sep 2024 14:05:46 +0000
Received: from mail-ej1-f42.google.com ([209.85.218.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sneoB-000000028kB-1lrX
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 13:52:01 +0000
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a8a87c7c68dso12366166b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 06:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889917; x=1726494717; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYJy8WgMUAn0VEuaq5aXmaoEnUqoMBjQF+74z8dXbcI=;
        b=IsOn+8pYQQm1qM1EwNFPkcuKKQhqvKA4gWTBxzvBNKS49dWzqshanuI5WM9jw1ndLJ
         xEGqt7BXMNxNIEdWo5pIjpZjfwM+QAz7VlJBXyNupVmU/uQpfZZGsM2LVnbcJQaylpmd
         9VqD0Z+vJLlM162Plfnhy0ISGAXwR9IpWcbt6ntZtYfKlX29J5tQhvEU9V5MZxT/Dea8
         2XeMEN4k9bkWiDcJ320M0exOqV4MAGUPCzhfYGg9BZDwi3fA7QmL/C3LvIbTjXEbHxPo
         PRI7j5xqfsDrDdXFeDpWkas0ZAD11zV4NfY6L2VDZPbeIDsSdiNhBOv90SP4fVqViKy0
         JCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889917; x=1726494717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYJy8WgMUAn0VEuaq5aXmaoEnUqoMBjQF+74z8dXbcI=;
        b=ALhV3Cu7fMoKt/olKx5par05jN8/h6cJfuA2ztlf8c336nEEJ/oLCS0wm2aR5ouNnq
         yvRdmQj/NIXeNL5dPY6j4pYF3E7M7OG5bw/pYAIjgtWd0zeMfnNmiV7iqtfmkMNh/wfu
         A9rZITTxhb8gSlrfKHOmXtoP404AeyKMN6UyulO6MkOcW+m3i1ZWVxqMbUgDQwTsMmv+
         PNz01KN8O7RXE8+/inaz2oBGgOPTGCB0hTfB2upxP3QoVZI05cU5DBiMRn8VZg6s9cpl
         t7I3lg8+Hv0Ywi1UQxf1DjqRzQYek8vgQ99qmhz7OXvrPo2dDXG63VFASSeqT1x3MLxe
         AfEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuvV6wi9/lACTV0ZZS8svgTbHnJFf3bSHa0Bs+jNmcr3ZIIxvXWTKArAe5LVmfgndQi5InX9kKFZKvzf8SZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRpCUSDOrcsDC8rijcr/tJ0U2ID62MAYRIlDK7edYtUI6+gCZi
	xjel3FjhU+/HC+TXJXyINH2OQT1MkB6boiBPScycsKyUwaGTila/7NxTA2NPPSA=
X-Google-Smtp-Source: AGHT+IGzfXZ15lM7AABSl1WEEBoTSjYJRhQxhU3CuhHvNSnGY43koVrWg9eO+EQ6ZFAnE+Rywyd0Lw==
X-Received: by 2002:a17:907:da3:b0:a83:70d0:7a1e with SMTP id a640c23a62f3a-a8a888e61a0mr406855066b.9.1725889916851;
        Mon, 09 Sep 2024 06:51:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:24 +0200
Subject: [PATCH 13/17] regulator: pfuze100: Constify static data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-13-8934704a5787@linaro.org>
References: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
In-Reply-To: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2916;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HRKyZjGM94NkFQ6StvG56VA5RTKeFKEABwUAsw2nTr0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1j85Ng6PdTzeDBq/rz5MGVUOdHrew/KeKhR
 UAfJ5DrtbyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79YwAKCRDBN2bmhouD
 1yq9D/9tEjTOPlkRyFze0AvTYAD9mQWQGKm7MqyAuFjex4vzWptpuDisJx4iUpkQGmRhr25LLQX
 oXu120pBSWEDyQFmdFWxvR1i6Xjdl9p8ssy7QiCXyXw9LWTDUxT2v26LV5QzupmqthvQ0mEH6ae
 Kk7gQmRAnIMnVliMEojJJ2KkwvVrye1X+xfnycZobF2ebIi82li/lQ5fDcEyLsm/g89FKLP723D
 en12o+9U4G6pVLlxeXMDXfxXojQtJzrkujgF6AMsRsuxZs6e6bZJck4wyPC1M2lbdFN7/Y9l4Wp
 xAIahb3R59XqJ1OMcHNHo897iLmXClURj3Q0ENgymMYfRcVdaqyUTRDal3wXBcfMdfAEwb6d47+
 miiThY7QV7kjifx3aZGRwEX6JnwRkw+BZqtTuTw90GwNDsSCEZI6DuHZWWvBPRYiPYqEBWBiTzL
 yrtKPWp0HEb138JnN1PW505GszshVpkyNd8ghcmPCrmrhOk9HZsVdBd5cU9CY2mv6xEwW+n6loy
 51xKnNZ/RYG+mu5B8VhF623N1mZPISanAnuYhEjXfbZI28dSOs75HHcrdVbfxcbjLsbJ0uPq/rj
 3p7t129yZIjYUXz4cGYDgLPis2PpWCshGD0TdTvKAqo3F/xR1Yw41HJD0E14ZzKfHxyBYo/1osg
 UG/PHCWPadpT4/w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_065159_617923_CA5764F6 
X-CRM114-Status: GOOD (  13.32  )
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

Driver does not modify static data with regulator description (struct
pfuze_regulator), so make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/pfuze100-regulator.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/pfuze100-regulator.c b/drivers/regulator/pfuze100-regulator.c
index 7c04870442d3..7d56c22b5e40 100644
--- a/drivers/regulator/pfuze100-regulator.c
+++ b/drivers/regulator/pfuze100-regulator.c
@@ -76,7 +76,7 @@ struct pfuze_chip {
 	struct device *dev;
 	struct pfuze_regulator regulator_descs[PFUZE100_MAX_REGULATOR];
 	struct regulator_dev *regulators[PFUZE100_MAX_REGULATOR];
-	struct pfuze_regulator *pfuze_regulators;
+	const struct pfuze_regulator *pfuze_regulators;
 };
 
 static const int pfuze100_swbst[] = {
@@ -367,7 +367,7 @@ static const struct regulator_ops pfuze3000_sw_regulator_ops = {
 }
 
 /* PFUZE100 */
-static struct pfuze_regulator pfuze100_regulators[] = {
+static const struct pfuze_regulator pfuze100_regulators[] = {
 	PFUZE100_SW_REG(PFUZE100, SW1AB, PFUZE100_SW1ABVOL, 300000, 1875000, 25000),
 	PFUZE100_SW_REG(PFUZE100, SW1C, PFUZE100_SW1CVOL, 300000, 1875000, 25000),
 	PFUZE100_SW_REG(PFUZE100, SW2, PFUZE100_SW2VOL, 400000, 1975000, 25000),
@@ -386,7 +386,7 @@ static struct pfuze_regulator pfuze100_regulators[] = {
 	PFUZE100_COIN_REG(PFUZE100, COIN, PFUZE100_COINVOL, 0x7, pfuze100_coin),
 };
 
-static struct pfuze_regulator pfuze200_regulators[] = {
+static const struct pfuze_regulator pfuze200_regulators[] = {
 	PFUZE100_SW_REG(PFUZE200, SW1AB, PFUZE100_SW1ABVOL, 300000, 1875000, 25000),
 	PFUZE100_SW_REG(PFUZE200, SW2, PFUZE100_SW2VOL, 400000, 1975000, 25000),
 	PFUZE100_SW_REG(PFUZE200, SW3A, PFUZE100_SW3AVOL, 400000, 1975000, 25000),
@@ -403,7 +403,7 @@ static struct pfuze_regulator pfuze200_regulators[] = {
 	PFUZE100_COIN_REG(PFUZE200, COIN, PFUZE100_COINVOL, 0x7, pfuze100_coin),
 };
 
-static struct pfuze_regulator pfuze3000_regulators[] = {
+static const struct pfuze_regulator pfuze3000_regulators[] = {
 	PFUZE3000_SW_REG(PFUZE3000, SW1A, PFUZE100_SW1ABVOL, 0x1f, pfuze3000_sw1a),
 	PFUZE100_SW_REG(PFUZE3000, SW1B, PFUZE100_SW1CVOL, 700000, 1475000, 25000),
 	PFUZE3000_SW_REG(PFUZE3000, SW2, PFUZE100_SW2VOL, 0x7, pfuze3000_sw2lo),
@@ -419,7 +419,7 @@ static struct pfuze_regulator pfuze3000_regulators[] = {
 	PFUZE100_VGEN_REG(PFUZE3000, VLDO4, PFUZE100_VGEN6VOL, 1800000, 3300000, 100000),
 };
 
-static struct pfuze_regulator pfuze3001_regulators[] = {
+static const struct pfuze_regulator pfuze3001_regulators[] = {
 	PFUZE3000_SW_REG(PFUZE3001, SW1, PFUZE100_SW1ABVOL, 0x1f, pfuze3000_sw1a),
 	PFUZE3000_SW_REG(PFUZE3001, SW2, PFUZE100_SW2VOL, 0x7, pfuze3000_sw2lo),
 	PFUZE3000_SW3_REG(PFUZE3001, SW3, PFUZE100_SW3AVOL, 900000, 1650000, 50000),

-- 
2.43.0


