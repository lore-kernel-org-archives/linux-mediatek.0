Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA24EC54E76
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 21:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHtXO9XtiC85W+x/HW1S1eU0VwIPJlyCXEkRfSi7Djs=; b=u1FUjmcPmxOUEP1W8KrIyKq6oD
	N4qiFh0V9d/7BcYaOPeSSZEADx1g5WKFfgk6BBw5gpmyAgyPbHXBOKRca18qXSe3EFXN7z1J/C/Mw
	9uFRpYlioCFdcJCl5drGJKMmFyo5rbaaB5E6mhKDenUcUeNt8sVzVS3BIiZFcxOnUaWSvMKUBl7Z2
	N/FxEgf0DR+QmswynxN0r+QC6Bb2JAHona7kq6lNUsaPGF+sHgAmthr1n7Hlfu2heXQvtBzaOE+Cc
	Ysc0/JfE36hjSYK0GXM4rNBbSN1gQecYHrHe0tUHYSdJmInWHVrFf958jTpCZlem6EyTl2pt+iqDR
	Ke4wL+HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5C6P-00EuMH-1H;
	Mon, 20 Nov 2023 21:46:45 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5C6L-00EuIQ-0S;
	Mon, 20 Nov 2023 21:46:42 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-32fa7d15f4eso3781045f8f.3;
        Mon, 20 Nov 2023 13:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700516799; x=1701121599; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHtXO9XtiC85W+x/HW1S1eU0VwIPJlyCXEkRfSi7Djs=;
        b=jQZEbR5KNLxQiYYrf0gNGVfQPvBZiAQDEyNZYX5+s4sC53F8i4+399R7ztgKvIjPgc
         9utOVoK7a8043zyXgjw0ufjlZbeAQs7BstQwqGbbjFachnD2dB9TAYzms/cW2WOTfL+V
         HL6JT9T9M1YlwV3vUA0Lcy+2zB+S5S2mYe5gtJtk7i2PF8SsEo3me/p3MXChREd4ZzZV
         Gxx1q3ke90L20lzHGyv1rqgN5LFMqk14m/kwkBSu7tETSZrLtqur4y5HqA+IbHV20D4J
         BTHaUxrRdieYpNPR43j2WfORq422T9OgcXm/gv+BB2IRIQ+58QJNsqCWwzf5w8NFeLkF
         ekZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700516799; x=1701121599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHtXO9XtiC85W+x/HW1S1eU0VwIPJlyCXEkRfSi7Djs=;
        b=MluGLpSKcVBe1i0CTSiyb2uCBtgjjrtrI2BXjDG2h28gPioMxbJKc7dZFqdEsf8Iwz
         Vy9ivNrnQUvyEMhqa2PhXn8tbpf8+sS2bNvhkMWYLvZ4rYFRQkKlAOytxiGibDuuVRFt
         Owk9T+J24LRglUaQax75YG2BlMCYmHOlS6jXx54WH75dkAjMCClvko82NuLxsC7G1C4Y
         aI1Od+R6G8wGKiCL04Ct9npqqh2rztGLtaFb8Ar8HHDgXEtgVJQD52YHQCORdw0X8phX
         LMNf+4zNWrXrpkdx5yJgQr4XRFdS/WGMI65jwAzHZir9BH5awvXT6Qp2ivh5JlwiOuin
         ZXIQ==
X-Gm-Message-State: AOJu0YzTB7JZEw6BlJu2AFTwO250IVKAhfn085AI9LnfaHUwwTYZVHdT
	pZllr3o8AUA7Ky/6SjJzWmzKVKdYSe8=
X-Google-Smtp-Source: AGHT+IEPEt13Bi9UDLuM7ucKuA1EJUrPpC7p/7AqpQmlWfFXaZtyMu7XxxZkwo1OTgJaGb+DXzLqfg==
X-Received: by 2002:a5d:4531:0:b0:331:6df2:3603 with SMTP id j17-20020a5d4531000000b003316df23603mr4725750wra.61.1700516798842;
        Mon, 20 Nov 2023 13:46:38 -0800 (PST)
Received: from zotac.lan. (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de. [2a02:3100:9030:5a00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:46:38 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 12/20] drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c: remove I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:15 +0100
Message-ID: <20231120214624.9378-13-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231120214624.9378-1-hkallweit1@gmail.com>
References: <20231120214624.9378-1-hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_134641_246857_E9E172F5 
X-CRM114-Status: GOOD (  13.10  )
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

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
index d675c954b..54e46e440 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
@@ -297,7 +297,6 @@ static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
 
 	strscpy(ddc->adap.name, "mediatek-hdmi-ddc", sizeof(ddc->adap.name));
 	ddc->adap.owner = THIS_MODULE;
-	ddc->adap.class = I2C_CLASS_DDC;
 	ddc->adap.algo = &mtk_hdmi_ddc_algorithm;
 	ddc->adap.retries = 3;
 	ddc->adap.dev.of_node = dev->of_node;


