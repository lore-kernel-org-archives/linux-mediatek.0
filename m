Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66053C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 16:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f0ESKMQFpm4YiLCeUzvQbkRJki5AHo+qK/u6Y+vz6Y8=; b=q9sfCXJtQIexg/xhmCuymiWC7+
	n6C8X5VCJzD/WzrNZpK+lpZ0HF01s1ICf2aufuUGkreaNM5+LgX4u8i2wAp7e34qIKKz/ZlGHj3Q6
	ikvqChPhrbqJ4McbONxmVr6g3pElEhIKLz4bTk+ZGpBSiUJUF7GEIbRbE4dOMyXM/GAhULC1WOZ26
	n1J4BYlKCBDHlfZfqUv+0ZPGDmUvDsqQbZOQwZbSH+ITQG0rp76R42pkd1NOh5Lrm4FwBmlAshf/M
	59GxV90J9OjYwbziw4bVH7rol3wCXr8GKMMxs+ZVj8gyp5/5zo8fmh1T6E2c+kNsRRMCmbcQG1Nqg
	XyWRJ5Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEXJi-00000003BsT-00Cm;
	Tue, 04 Jun 2024 16:47:22 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEXJe-00000003Bpu-3GLt
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Jun 2024 16:47:20 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-57a50fecbadso3830392a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Jun 2024 09:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717519636; x=1718124436; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f0ESKMQFpm4YiLCeUzvQbkRJki5AHo+qK/u6Y+vz6Y8=;
        b=ejWbYz/SslwRh/8KunQrfSpl84/TDNt9vLcy8SXG14rDEtoexJMeDup+oPtmbymtVy
         sdVMgUEZlhge0TiWVmT4NfG4igfG3YtErrldj2x92Yec11VrBmgf466lbGZWhK7Wjh3a
         UC5jlevQIimRSezgv85JSGuNCFLkY/eJQhNnn95+mM+MgzkQeb/al0FWm4oE6WpTTx+8
         6fWQFsQqQR9LO1uj3kISJhxwMsDYsf5kImF0Og1n4GErUB1N/Nel8WaAbT6TNmwp4Z7M
         YSnqjycuSomLJyfCOYubRVA/sP/7+nUm8lq65CMdD2S6NZ9BP5Wuowgbga8ctCMg/Aq6
         JT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717519636; x=1718124436;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f0ESKMQFpm4YiLCeUzvQbkRJki5AHo+qK/u6Y+vz6Y8=;
        b=mIf8s9IBA9epgMVSUmMPp7YrB6beq3BltFQJJO8q4cqU5vJQkuv0EyOvczIOyOdyH3
         /tjzfOxHlCCFXr+tFlnAMVPLZ7hxZPChH30sfYeKilZeKyXvDSsjrfNNd5vgUEWf6y3P
         Pre1Lrb19NOlTETUsOdBgGHn9TaYyMAXqCd59tc+e1S3CqMcY85PBOuybJD++EZJBpqy
         z+pD7Jjh+7mTX220l+2SthhHMZ2ozZBlbYajfAVR9z/7UMJ2egiMm6cOvjWmKNbnjCXS
         LTf7/keiwuhRHAKe1q4Fm8ie9B531+WQvujpJsU5+IqRch19CHFhrIulGNesyQW9s61H
         ghRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu0MoKLS4doTjcGFuVngKC6BZVncHC+QOdq5MuFcC96+LoxDwihUPZnXbL3A1CRk87IbQy55dn0/E2uOCpnjk7ZxAPVk4QpSduwlRRl+3O5AiV
X-Gm-Message-State: AOJu0YwYBvmqLpXxerzYxjVqv9g3Gjb+390WtXH7dWaRqXa4crhlZF3D
	KjdHoWRWqRqcB9K+iP6R9LgFvJOKDxe9ljBvN8hs+77OOxbEj7FRUUZwI74idcc=
X-Google-Smtp-Source: AGHT+IFEPd0Vtbd+VXJMfTA36KaKJHIzdgkRVLIFSS5iHePEF4hFxrrXE82EzlfPdPNon9Pquk4nwQ==
X-Received: by 2002:a50:a411:0:b0:57a:4b31:5d7c with SMTP id 4fb4d7f45d1cf-57a8b6b7e3dmr105648a12.19.1717519635848;
        Tue, 04 Jun 2024 09:47:15 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.231])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a3968bdb7sm7291358a12.46.2024.06.04.09.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 09:47:15 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Tue, 04 Jun 2024 18:46:58 +0200
Subject: [PATCH v2] thermal/drivers/mediatek/lvts_thermal: Return error in
 case of invalid efuse data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240604-mtk-thermal-calib-check-v2-1-8f258254051d@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAFFX2YC/4WNSw7CMAxEr1J5jVGShi5YcQ/UReK6xOoPJVVEV
 fXuhF6A5ZvRvNkhcRROcK92iJwlyTIXMJcKKLj5xShdYTDKWNWoGqd1wDVwnNyI5EbxSIFpQO8
 Mk7FOU22grN+Re/mc5mdbOEhal7idR1n/0v/OrFHjrWt8r6yy2tLDu63Uka+0TNAex/EFcms9U
 sEAAAA=
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Nicolas Pitre <npitre@baylibre.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717519634; l=1587;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=fEeSbzfW7og883E6MMBCf0UFNWwK83m/m3pTbV2VcBY=;
 b=cLEAzCE+q/hlZXnwOs3Z0gAUMVPvwZApsPRLT5AzjW3HNJ27YxRfcwRnYZkWI5avHQFon6E/2
 GGk0D05B68pCh+oeaWZfQt7ze5LG8FokCaZHE17FRCX+sMr2p3SF0kY
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_094718_928527_68725A75 
X-CRM114-Status: GOOD (  12.19  )
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

This patch prevents from registering thermal entries and letting the
driver misbehave if efuse data is invalid. A device is not properly
calibrated if the golden temperature is zero.

Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
Guard against invalid calibration data, following this discussion:
https://lore.kernel.org/all/ad047631-16b8-42ce-8a8d-1429e6af4517@collabora.com/
---
Changes in v2:
- Add Fixes tag.
- Link to v1: https://lore.kernel.org/r/20240603-mtk-thermal-calib-check-v1-1-5d6bf040414c@baylibre.com
---
 drivers/thermal/mediatek/lvts_thermal.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 0bb3a495b56e..185d5a32711f 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -769,7 +769,11 @@ static int lvts_golden_temp_init(struct device *dev, u8 *calib,
 	 */
 	gt = (((u32 *)calib)[0] >> lvts_data->gt_calib_bit_offset) & 0xff;
 
-	if (gt && gt < LVTS_GOLDEN_TEMP_MAX)
+	/* A zero value for gt means that device has invalid efuse data */
+	if (!gt)
+		return -ENODATA;
+
+	if (gt < LVTS_GOLDEN_TEMP_MAX)
 		golden_temp = gt;
 
 	golden_temp_offset = golden_temp * 500 + lvts_data->temp_offset;

---
base-commit: 632483ea8004edfadd035de36e1ab2c7c4f53158
change-id: 20240603-mtk-thermal-calib-check-ba2ec24a1c32

Best regards,
-- 
Julien Panis <jpanis@baylibre.com>


