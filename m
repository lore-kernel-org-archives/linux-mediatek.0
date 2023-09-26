Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3976E8181B
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 04:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KeCQHNN67pQ7pJgPPlVJkQB5FjS2X6XolXrY+Dloy10=; b=sRtFfJM5Sv+WZH5wAfkTkP1s6q
	DHgZXkzeBKJ04/37n8slpqWiCgCbz6I7EBQXbcSx7uFle5MJegRLMquZgzz+FSkkCkM/Sq9ATNHby
	VMNvXwyJrgA3JsWI7grX/51pThXvknfiqnXLabLfvyTX1rN3KUhWYQNbT3dMDV1zrbhQsAK1VQWBA
	87e7bfk4RoqC2RTwoWhndYUH2DmzjL3uCu2TjSUC3b1lgbJYBImJpSWMpxLJIuw6vnWtgL6grXetN
	setOyrdudjkPXM4sKKYYj2rkOcgCNc0GXBzjIpkU/eUquFdNdFuMDVB4SV5KDE8y9j6sGUQqbvbhB
	SRp2mf7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkzs1-00FZFb-1n;
	Tue, 26 Sep 2023 04:40:25 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkzrs-00FZA3-0z
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Sep 2023 04:40:17 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3a86a0355dfso4686342b6e.0
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Sep 2023 21:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695703212; x=1696308012; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeCQHNN67pQ7pJgPPlVJkQB5FjS2X6XolXrY+Dloy10=;
        b=dNZEaO/cYz6B/Z2XWh09f22Z0g1SiHu9KoUvNCNUTiK2PQ95P7uwtxIAXpkV+oScc5
         Ktk0RTgd+J7GpqF4c+xyxgDMSF6pY0CK9CKNmaZymFrDc/iLLfBrrVUDMppG25z6gUek
         MxTjEbk3++FDWH/cl46l5rXiBaoUZk7jokYAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695703212; x=1696308012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeCQHNN67pQ7pJgPPlVJkQB5FjS2X6XolXrY+Dloy10=;
        b=XTn+8c25aGaPgOxGxvR1Uy0I5ANOZEumALsMLok/0pI/2Yu9kV+sbAx/2sjXHt1ijz
         ACBT4I9+ld9LCc9p6XD2HQ9uEKEQXfGuc/R79mSI/go+fEQXNb2VWZO7ZAfOkdZWIaOI
         F3YSb7SuHnVwo8qRijM+rvhXWbs73zI8YXcuyGtRXwCT+uKmSOBrz2CI2SkuWvktap0w
         x9YhoZD7vOCXi8gVhSRf9KKF60Ysq8GVqTKWXGiGo3Fi3+vzOcKinOf9ibxlqi6NWcUs
         DkmTA6UV/Y08GHvw+M3/29tPd0ODsxH2ZVkb3I0gNDztCCb381v+4BqDIoFZrTUFO+OO
         je/w==
X-Gm-Message-State: AOJu0YwU/9RQJru6X4MXiX2DVWL8N/NLffKTsI22m7Ly/WYqVEDdoWPX
	iX+4uU2Rg4x1/MQcMtpN5Q96rA==
X-Google-Smtp-Source: AGHT+IHehDzy+dlk1eUDD0RZV2ctyJps9+It45O13YJejel9PHZX4R6qjb0iIyY7nNel3o2UK3jpPg==
X-Received: by 2002:a05:6870:340d:b0:1dc:797a:daf4 with SMTP id g13-20020a056870340d00b001dc797adaf4mr9384807oah.7.1695703212418;
        Mon, 25 Sep 2023 21:40:12 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:ba86:87c4:df1a:be60])
        by smtp.gmail.com with ESMTPSA id p11-20020a63ab0b000000b00563590be25esm8667210pgf.29.2023.09.25.21.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 21:40:11 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RESEND v3 1/3] regulator: mt6358: Fail probe on unknown chip ID
Date: Tue, 26 Sep 2023 12:34:46 +0800
Message-ID: <20230926043450.2353320-2-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
In-Reply-To: <20230926043450.2353320-1-wenst@chromium.org>
References: <20230926043450.2353320-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_214016_357182_1C1CD6A6 
X-CRM114-Status: GOOD (  16.77  )
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

The MT6358 and MT6366 PMICs, and likely many others from MediaTek, have
a chip ID register, making the chip semi-discoverable.

The driver currently supports two PMICs and expects to be probed on one
or the other. It does not account for incorrect mfd driver entries or
device trees. While these should not happen, if they do, it could be
catastrophic for the device. The driver should be sure the hardware is
what it expects.

Make the driver fail to probe if the chip ID presented is not a known
one.

Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Fixes: f0e3c6261af1 ("regulator: mt6366: Add support for MT6366 regulator")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/regulator/mt6358-regulator.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index 65fbd95f1dbb..4ca8fbf4b3e2 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -688,12 +688,18 @@ static int mt6358_regulator_probe(struct platform_device *pdev)
 	const struct mt6358_regulator_info *mt6358_info;
 	int i, max_regulator, ret;
 
-	if (mt6397->chip_id == MT6366_CHIP_ID) {
-		max_regulator = MT6366_MAX_REGULATOR;
-		mt6358_info = mt6366_regulators;
-	} else {
+	switch (mt6397->chip_id) {
+	case MT6358_CHIP_ID:
 		max_regulator = MT6358_MAX_REGULATOR;
 		mt6358_info = mt6358_regulators;
+		break;
+	case MT6366_CHIP_ID:
+		max_regulator = MT6366_MAX_REGULATOR;
+		mt6358_info = mt6366_regulators;
+		break;
+	default:
+		dev_err(&pdev->dev, "unsupported chip ID: %d\n", mt6397->chip_id);
+		return -EINVAL;
 	}
 
 	ret = mt6358_sync_vcn33_setting(&pdev->dev);
-- 
2.42.0.515.g380fc7ccd1-goog


