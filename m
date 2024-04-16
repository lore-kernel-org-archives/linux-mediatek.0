Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61BBC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 15:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGhN4tMDnWFook0es8LuAXt5ZA9TrdmyBXYcCQvtS3Y=; b=ZTc51875c60IXYQHpDPQbExO3M
	b5C9V2vtLDl7UK5Xwm1kyLPxukm4eB32Q4JY64ZXWD54uQSMrc6g/NUJqXtUeJctcLgaI67DCEV99
	EL0bZEa3NDwVvmpFBq/9fEdquxeBIblB7kHkMIhmidsdhHCKF3vj0/Fgc/94vdjTClzbHjO0h2EvH
	Pcscxt90JPuAQfwo1tTWYmW3Dd3WsNdTRvlA+jE/8JnyAQwE9vRz8mnQ0/XXMRiGe4YzQ1ADJh/j3
	ssXTxZQx4KnHiBzL7O7KZSYZNuwsCMIKLR7CUgnBhahZ/FybVB3FpMfL1k52PxC2c4XD6LCnCSEqh
	IpPo/uVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl9f-0000000Cryf-0gEh;
	Tue, 16 Apr 2024 15:55:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl80-0000000Cqti-0wuN
	for linux-mediatek@bombadil.infradead.org;
	Tue, 16 Apr 2024 15:53:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=nGhN4tMDnWFook0es8LuAXt5ZA9TrdmyBXYcCQvtS3Y=; b=cIBbRwFo1owCbvNXaC1COOjFY7
	ys4YarGYfqVd1c7QI5fB9MJXBZB9TCpup+LbVCDthQ+1ZfQN1wSemp6KdV3XDZLJkNAjAYfngOjSt
	92lvJurbuD9H8Qm0W4GpJgPqTLphroeB+oCBgQjUWXcvTm7z9GIvZAc3iiJUU5UKM91A2n8fJH+4W
	j9BPGlvT6bEPmV7wy1OFpPtpMGKpWAyMrMT4xos0INY9pD7v5MdyIdpieCqCQqQ7SEodTceSelkjS
	rhJL5QNUAom1VTPVLubmWH13BPjztEtUEvdijNyFoa/guFZfRRHbeB6SRJy6QXAiJY9URq7n8EvaL
	E6pbjeGg==;
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl7w-0000000B8eZ-3pwk
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 15:53:46 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a44665605f3so500824566b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 08:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282823; x=1713887623; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGhN4tMDnWFook0es8LuAXt5ZA9TrdmyBXYcCQvtS3Y=;
        b=vW29VjdHthe2WfCTOK/zim3A4G3sBkcO66nKkuNx9zOEmzT5pwGxvqfCcYL0WRw2mt
         JJOqhrthj8VZOWyNrzfclJGbpBG81fbTjH52MR/vKwCX8gXmcMDLIZBjNZ1+WIUEC6eJ
         M+i1NRAaojUlvilvQFFpgv61s5AqDvncQ2z5i6YXGn5g/we3SdEaO527xXpAJkZFgKjD
         Pt/0z1dCSCenK1cDPHV6Sg2ee+8i/9bIHdbxrtNQWqeZJrl4RDijTdNrSXjNO7qkit8a
         FZAZdhMEA6yudB4vBr6Q37N/AHMhwzjtqlHSKkbIjnoJtdp24IyR+zRwSiDPbDuxWF0a
         Negg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713282823; x=1713887623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGhN4tMDnWFook0es8LuAXt5ZA9TrdmyBXYcCQvtS3Y=;
        b=l03IPJiN9zlk1r2a/xdzMCKh9MBGEWNDlpVlcKmfH/WM2H/azhwiDKjZU13ykCPx7J
         qLfRlySG1/DOW6COakLNkNCSdsVb6lUC5kBTmO7euGZgb1Sej/pIfwP4j/rhV4LUVNWm
         3RHxflz0x6Xp9t3k3iHasSoIm5TbDTyTkj1s2t2sM/IruugNVV2GqaZt2AubXAYHZmvF
         gc1TElS59CkqhhQ215b1sFICmt4VYxr4dmfmak7+5tGPNFabP8dMevlyO6kpTT49cAa8
         NJ9gBaZmm2AQrNW71jULnSNBYObtZAawiNLxAhHTcZDzjEhz0SHqy3wb/Sj+rUaeXL1B
         +mFA==
X-Forwarded-Encrypted: i=1; AJvYcCW5cfppAnp60/IRzDlJxlPNBW4o2o7OOnBFUI69JtrAqAHxmIknOZTveqCo7oSEQKnjcqBXaL0TEOFwY9nJesjHL3O0Bt7wXWWsQhRVaF+U+w8X
X-Gm-Message-State: AOJu0YzzjsRZBFGsVov9lFh5dKVsCn0p+6gggW1QHXH+KpnGWYZE9TgI
	/Pywxu8LhNazsz92e25UFvMLbiidDLfBZPiXl+5VJduFlJCqsKYTl3E2H7jfUnU=
X-Google-Smtp-Source: AGHT+IHE3IMPQIqSmq6KIJpD1JErkwc/ZC6yokArJ+CPVqxWkiFzKoESqoTqA+wQ8DzRyw7HJwxPgA==
X-Received: by 2002:a17:906:815:b0:a51:ff7e:7a7 with SMTP id e21-20020a170906081500b00a51ff7e07a7mr7894409ejd.31.1713282823327;
        Tue, 16 Apr 2024 08:53:43 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 08:53:42 -0700 (PDT)
From: amergnat@baylibre.com
Date: Tue, 16 Apr 2024 17:53:16 +0200
Subject: [PATCH v2 15/18] drm/mediatek: add MT8365 SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-15-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2801; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=r/rf6DH3u4/RIc/AgVSnOwA+TJLknIEXoBhT9allVNg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7qMFH+7sfSqeWLXOz/HUS4LGcd89tLTKMjKVO/
 0NzGpSWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURYmZD/
 92TsXLF05lBYvoV/0KqLPJzeJU4k+zDii6If4+OxnLLmQj/rTZQICYhBS+7EDJmQzZfqau6EvpxklL
 iWd4cz9FNDLn97xOw8qS6XS7a+gZdP0YKxg2ifs0+suc6UKmw//n26Hq5MhL7y1pwebRsv9RV2OqxG
 jeuC5azqD53hm3WT5KLxS3LHpH+6f63na1tFgZnY34Sevc7Q5/E9gUVCjV9K79Nh4Rj3Ai5YLtUKFE
 fUp8KD44okwab+ALRkWRrQocbXZITXD7q7+eAvwDJ+ZchHPpv9mi45qbuPIdm3CMQ0yqzy3ohLfg+I
 NbmgIpXCC9E4dry6GEbCiEGi+C4S0YSx/0skFgKVYWdMXekpAYkZXhoxPVQhXc56tiuWYxUCRo/UE1
 ARFQbEja65OF7bPPtE5ga46JcEX7AGNIC+ycAKk9TMzA5+rEyzIjAeMFydRrRwBRENYVg4/83Ji3eS
 E+uMdRQQAjxOxN6hCvuyBo8U/q+mfMAZjMz5I9J6u0nqkqeUGMBJwJMSeaKPYiljCQMnPmpjb0mdTJ
 +gOUCPWxYPVbdeNBZHFiosO1ZMDPdz3vkybZ6OnMqX3YBuuVgvBKaznDvvayRiqD0T9seflYAXLcuS
 IkqmHyuBsh9Cx/edcgOveyIcGywpSXm94jO2vKGVQpPm/LEJlbJVw/xhIAcQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_165345_181252_27B45E4A 
X-CRM114-Status: GOOD (  11.05  )
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

From: Fabien Parent <fparent@baylibre.com>

Add DRM support for MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 74832c213092..427b601309c4 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -230,6 +230,22 @@ static const unsigned int mt8195_mtk_ddp_ext[] = {
 	DDP_COMPONENT_DP_INTF1,
 };
 
+static const unsigned int mt8365_mtk_ddp_main[] = {
+	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_RDMA0,
+	DDP_COMPONENT_COLOR0,
+	DDP_COMPONENT_CCORR,
+	DDP_COMPONENT_AAL0,
+	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_DITHER0,
+	DDP_COMPONENT_DSI0,
+};
+
+static const unsigned int mt8365_mtk_ddp_ext[] = {
+	DDP_COMPONENT_RDMA1,
+	DDP_COMPONENT_DPI0,
+};
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.main_path = mt2701_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
@@ -317,6 +333,14 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.mmsys_dev_num = 2,
 };
 
+static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
+	.main_path = mt8365_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt8365_mtk_ddp_main),
+	.ext_path = mt8365_mtk_ddp_ext,
+	.ext_len = ARRAY_SIZE(mt8365_mtk_ddp_ext),
+	.mmsys_dev_num = 1,
+};
+
 static const struct of_device_id mtk_drm_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-mmsys",
 	  .data = &mt2701_mmsys_driver_data},
@@ -344,6 +368,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8195_vdosys0_driver_data},
 	{ .compatible = "mediatek,mt8195-vdosys1",
 	  .data = &mt8195_vdosys1_driver_data},
+	{ .compatible = "mediatek,mt8365-mmsys",
+	  .data = &mt8365_mmsys_driver_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
@@ -729,6 +755,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8195-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8365-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
 	{ .compatible = "mediatek,mt2701-disp-ovl",
@@ -793,6 +821,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt8188-dsi",
 	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8365-dpi",
+	  .data = (void *)MTK_DPI },
 	{ }
 };
 

-- 
2.25.1


