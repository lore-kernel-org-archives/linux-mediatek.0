Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1173ECD54A9
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 08:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AFgJ89zcFrRudWbk8kdaUIQLDil/i3wCbCwtmAyU7YI=; b=310Wj8LlL8QX42kEKKgzxIa4er
	MBalorFnRn0nvglOnY5rQYMhRzSa3g8uHQk7JtLObRqQw2TPDDB4XgojJs3iUS1aqmiqpmPhhC0cQ
	CEvVcW3sgPVVIVUmyvzWZkDwiuQ1e/gDSlHsQrU3VAAgfMakL/7AEVZGN+oF9m4TCuLq85K7zOCkY
	fgMXDF7yUvuIVLZq61wPRHXPrECp5ulcPz+E5uNVOHUGSX9ErvaJBfqxTHFnKKfXi7z+9XEHkmNJ2
	thjnpe8FSYa2oDYEBOz4n7Lu8yVnqzcgO1EbLGZDrA8a6370EVtH7tiS1z+pYQGyK9fV06nqqUbXK
	U4GXVjUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiWE6-00HNSB-2u;
	Tue, 19 Sep 2023 08:36:58 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiWE3-00HNQB-2U
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 08:36:57 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1c44c0f9138so23726775ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Sep 2023 01:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695112613; x=1695717413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AFgJ89zcFrRudWbk8kdaUIQLDil/i3wCbCwtmAyU7YI=;
        b=Gwst4jivpTMR+l0S05Xr+pa5sPOSBfZPQt+t0nzpn34Gth7ClbZRF6//HkqMAYzxhc
         y+MxIHaCmOe4Q4F6yKnZlJqBNdMCCQivMG7LRvQCFKmZp+X6gF5ykTSeOb46fZHdpj6m
         ZyFReA2OYTBaxZLIUW6Q32Bm7MfhmJ5h/Sju8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695112613; x=1695717413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFgJ89zcFrRudWbk8kdaUIQLDil/i3wCbCwtmAyU7YI=;
        b=uTeufQjDppKsg7f6LZuiUgsgnKTz/KlaPpDn/0KTiNx2oPkq+OQnix4q5Qj63LTp10
         JGLhNlbFbrFW+lyRFCzyDnqfxGURn8jArBXCMMArX2WfCIc8cX0Vunb1obEEY97gGrPE
         ELjekTLta745BEIMqY6dWExBcwpzk5oijiI2na5CX1zhb1q+7CvnBu6vpoMN9yZM+ik6
         1FaU7YHYgOWQ8AnivrROUItk4T/QQBe641AqFLhr11S7co/KG32ZLzJPHG4YAigkNzMm
         WTvNibzg+EOjhZL+nyH9UEQe9si4dCN3DWKx5taGM66TMqLJVCAlq41L4aS9YMuX9sYC
         GDZA==
X-Gm-Message-State: AOJu0YwvF2LWtNGvOa9SxUVLBFQneNuhmktCRvcXrb/5N7xS4/RrFkhM
	wQk87sgrQwjjwIeYOILRevrBig==
X-Google-Smtp-Source: AGHT+IGUM8ymdxjj4POLq8H28T5j0ptbAtl7ppCRBLRUAtI5mr/Ss0hb0+yr4ezvyyOGjEHgf0CnDw==
X-Received: by 2002:a17:90a:e547:b0:268:1355:b03e with SMTP id ei7-20020a17090ae54700b002681355b03emr9292692pjb.38.1695112612649;
        Tue, 19 Sep 2023 01:36:52 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:40a:900d:e731:5a43])
        by smtp.gmail.com with ESMTPSA id n20-20020a17090ade9400b00274b018489asm5508204pjv.1.2023.09.19.01.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 01:36:52 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] regulator: mt6358: return error for get/set mode op on linear range LDO
Date: Tue, 19 Sep 2023 16:36:46 +0800
Message-ID: <20230919083647.3909889-1-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_013655_808636_12B2EB21 
X-CRM114-Status: GOOD (  12.10  )
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

The buck and linear range (VSRAM_*) regulators share one set of ops.
This set includes support for get/set mode. However this only makes
sense for buck regulators, not LDOs. The callbacks were not checking
whether the register offset and/or mask for mode setting was valid or
not. This ends up making the kernel report "normal" mode operation for
the LDOs.

Instead, make the callbacks return -EINVAL if the mode register mask is
not set, signaling that it is not supported.

Fixes: f67ff1bd58f0 ("regulator: mt6358: Add support for MT6358 regulator")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/regulator/mt6358-regulator.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index b9cda2210c33..120c60d40ed4 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -408,6 +408,9 @@ static int mt6358_regulator_set_mode(struct regulator_dev *rdev,
 	const struct mt6358_regulator_info *info = to_regulator_info(rdev->desc);
 	int val;
 
+	if (!info->modeset_mask)
+		return -EINVAL;
+
 	switch (mode) {
 	case REGULATOR_MODE_FAST:
 		val = MT6358_BUCK_MODE_FORCE_PWM;
@@ -433,6 +436,9 @@ static unsigned int mt6358_regulator_get_mode(struct regulator_dev *rdev)
 	const struct mt6358_regulator_info *info = to_regulator_info(rdev->desc);
 	int ret, regval;
 
+	if (!info->modeset_mask)
+		return -EINVAL;
+
 	ret = regmap_read(rdev->regmap, info->modeset_reg, &regval);
 	if (ret != 0) {
 		dev_err(&rdev->dev,
-- 
2.42.0.459.ge4e396fd5e-goog


