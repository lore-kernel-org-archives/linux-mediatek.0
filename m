Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C36CA5507
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 08:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVZVDk0nVt9xPkuQ7kA0rk+skb+IlHVfGj8ZHv+S3fY=; b=IDgCFfN3MsNdZ+QswH7gcWeOuZ
	D6N+y3XEd8i77QyYngG21/uJKM9DoJjev6m5qYTuLhhQsthda5k2n3FnbDq9QGC9K/NBIuPhLDfM/
	Zl5FIg0QxQZk8IF/YsyeFQ7fappb01JfMB2B20I3peAcK22udT2MFDlu6liYTIiLQl+Mlfy7HJ/q4
	oV6HnZRmCreE5xU4mp3YcsRNBOpFVZh06db2O3yxZB7XA5U3iiMz0lehQGjP3+ySrBUskL74SfGXM
	9pypknh341kKykU577QlqsIa6RD6wKlVWTyuR/JqJbFsEXheS4g/floXHnIeqfVTQD0c5Ddcvbnj1
	i120Sk3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLFm-0056FN-1u;
	Wed, 13 Sep 2023 08:29:42 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLFj-0056Bi-1h
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Sep 2023 08:29:40 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-573f8afe1d9so4902292a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Sep 2023 01:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694593775; x=1695198575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVZVDk0nVt9xPkuQ7kA0rk+skb+IlHVfGj8ZHv+S3fY=;
        b=LZpwk7mNGonEg0mdhFNJBmdsWHMT0EfpYYBZPhYyHcd+nVDhLR3eJ4hLGjrrboEI9V
         6E3iBLqcwyunBM8b7rJ+Gipp4VrUKiYDT1CaNEt+3kAxPtD2hI/pezhJ2hg1JH5tTVZ1
         xSAcGfoS/dcfDTeR0vxxU5U99e5e572Ob4YFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694593775; x=1695198575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVZVDk0nVt9xPkuQ7kA0rk+skb+IlHVfGj8ZHv+S3fY=;
        b=VAMABJiwyEDWdeSVsy7Yb9wqCPhjY4CQ62ceILobkw4rhp789fXJSMTdaM+33VixaQ
         2QK2Fd1fhZ7gROB9rW+9mFr2wqcB7vPWBvz+U+Q0/AO7HpsFqDuz0NXxGPhxPy19nWpT
         jBSkc+tZjkN1nle7YVhVhyGqemHUMaOCxBNpK6Kniw3b74264NnzUws8abf3cZfENZqY
         k3GyBPtPVs5cAc6nOnRFeOp1DIQFPgViv0KYQmfT1rrfM2TCyO++NLeTkykir0iSKZKl
         nqUkr2NYNYm2YE3St0NY1yLWKLMyHN6+alp/+EQLBGCw2cgCseiwtInB+8BJh3jVNbOI
         Ow/A==
X-Gm-Message-State: AOJu0Yw8yXg05U9iXg8MUcAuS5XqkRwwOGkj7e5Zg0tl3UrmiaMr6W7a
	+lXZF0rfs/4jUHaaOtf2+7ZBzw==
X-Google-Smtp-Source: AGHT+IEF2Cbs43/GwH2qUvBaNCgggY8+SfaBpnPQY9+z0cUqRzQ1FP5ckChyMhczwlBC41km5t3GYA==
X-Received: by 2002:a05:6a20:2444:b0:134:30a8:9df5 with SMTP id t4-20020a056a20244400b0013430a89df5mr2039361pzc.43.1694593775198;
        Wed, 13 Sep 2023 01:29:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b24c:3be4:d952:d3b1])
        by smtp.gmail.com with ESMTPSA id g6-20020aa78746000000b006901bd3a9e4sm418781pfo.104.2023.09.13.01.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 01:29:34 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 1/3] regulator: mt6358: Fail probe on unknown chip ID
Date: Wed, 13 Sep 2023 16:29:16 +0800
Message-ID: <20230913082919.1631287-2-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230913082919.1631287-1-wenst@chromium.org>
References: <20230913082919.1631287-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_012939_567604_112C4E46 
X-CRM114-Status: GOOD (  16.94  )
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
index 120c60d40ed4..935c7ad56c7e 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -682,12 +682,18 @@ static int mt6358_regulator_probe(struct platform_device *pdev)
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
2.42.0.283.g2d96d420d3-goog


