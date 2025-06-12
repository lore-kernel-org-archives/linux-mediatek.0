Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C42C71136
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jun 2025 08:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kzq7pTlEyk3DwCXw2bvXC8EVAUqzh3hKoNDLtBSSl4A=; b=tw2vCrLuLqvBXZkLZRCprMpstz
	DRApwcqheqw8f7iHt0yFhtJtXIJCTUjMuceeeAQ5MDrL1/qUDctCcW2dCm/xpyOW5HFVNdaurBKJH
	5jNTItEnPyP2ztk1OmML700zQdMYRGg583oN/N42TOSuMl9DhrkzGLrcOC1qCYqzydmgvAxfBSM9d
	qVyC4Lz3V2o1DmgP7UpW/XQQkEiqQuxFNph8UYGptV8UcAYrn/zFD61qmDTPxm2qnA/JoT3Xz5dwl
	K4PrzAHA+Z/nJu20BR5ZVGCHylqnHMrFgcSyNFPe6hvZ9K3wmeLKbSZYZywS5fCmRQd1gIyCFNoRu
	Ri73LyZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdH0-0000000CcLF-2ltS;
	Thu, 12 Jun 2025 08:26:58 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcgq-0000000CVVM-0xeH
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Jun 2025 07:49:37 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-235ae05d224so15861875ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Jun 2025 00:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749714576; x=1750319376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kzq7pTlEyk3DwCXw2bvXC8EVAUqzh3hKoNDLtBSSl4A=;
        b=AZYuT7fGc03zqywlSjJDV69EQWcmW0tqCm5rmTucVqfQd8s7/ZhnCZxkL0SM77yQjl
         HVvyoSEr2R7JnMSWPEhyzWbBXsktMyZIbeJMgnpkaV+t+0uD3cJrLcXZAKg2hN0tVYXD
         uEQJg2kQH+CWxX1FFBxnF9/gRhHkYVxUAxb0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714576; x=1750319376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kzq7pTlEyk3DwCXw2bvXC8EVAUqzh3hKoNDLtBSSl4A=;
        b=iGd8wCVS8Bhn1EDXpy/9L31igD1/FkhnnpK8oothAz1c2+cnu6GN2B1FQkm9hTVyvL
         LO7XA7L3C0GR8EFDFV9yRllVF81OYgu6sc9BflAIyESdZoFB/O6H7FS8JNBCLYBG+4fj
         E1IeOqeJg2XFg2Mxs6HSb2OY3D/2BinkQxf5iPXKNdQIveDIy116vNGqApaTaJZ9KuaK
         olIBgrXPgYQzzsr2XTzrRFi8G+myzZ8g3D32evHDIIxSzPsPidTmTLtZG64PZ9h1OEz6
         E6CAobGABHGZIKvpQYAiaVZSLqt85YCpbdT6tIoN9CtWGTDuzCdU71722hY5TBvp1mIP
         VVlg==
X-Forwarded-Encrypted: i=1; AJvYcCXOK55LDy9hhNe34eXWF6gxuwJXUmNvIUK6+VholXEtgTfBIshKxNnINHYrCSVVpqfG9XnIT3KeoXGr3nFkpw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwG2tmZLw3pHsZulVO5r/s6zapca1J1LExhtsFmlGb7t29VPFI1
	slOrkZkhapp8fiSnsiv7Bkv7EGDx2LJblNjscbiH9jCSonPKyfd6ZcRBXmNKaCLmNg==
X-Gm-Gg: ASbGncsdIMX2nOZGETLaRzjwII29paosQZo3bhMfvxknC0PP5s+B0lBf34cIEhCTDlE
	FDj0smSHbMQyHyebmxhoLmo2AhWW4gN1rJwj2MCmwaQ1gTNF2F77ZK0qnOTTq4k4GUm+EZTFzpn
	PSuENR8vzNbq68OV7goTBqynEpdh8lZWSWefHu5y+y2k0T0KEVD9DjXQwIHX7sIXbF8yVSR9H3t
	tJ2hVOAerVlPerUVwEsC5ZRO1crT+axbATafM/AGCQeWteXxsVY5v8NuNHfmKEk/NloXDJyWYXR
	sUftE+xAMnq2pG73JjRZ3ymM55qDyf6LEhim6vswYyCzVeF0aeiq5VMz+dr5CdcepHdpcVVYBII
	3Wxk=
X-Google-Smtp-Source: AGHT+IEN7g9Kd2emZe+eC0bnFztivo7RuDUPLjNRq7/X/nnou4s5GK5KxWmXAWf3A6OG+nnmmIHeYQ==
X-Received: by 2002:a17:902:c941:b0:232:59b:5923 with SMTP id d9443c01a7336-2364cf36e59mr38491355ad.23.1749714575691;
        Thu, 12 Jun 2025 00:49:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5b9:e73a:2e58:5a47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d42esm7893295ad.74.2025.06.12.00.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:49:35 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/9] ASoC: mediatek: mt8183-afe-pcm: Support >32 bit DMA addresses
Date: Thu, 12 Jun 2025 15:48:58 +0800
Message-ID: <20250612074901.4023253-8-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250612074901.4023253-1-wenst@chromium.org>
References: <20250612074901.4023253-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_004936_267059_C9186EE4 
X-CRM114-Status: GOOD (  14.12  )
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

The AFE DMA hardware supports up to 34 bits for DMA addresses. This is
missing from the driver and prevents reserved memory regions from
working properly when the allocated region is above the 4GB line.

Fill in the related register offsets for each DAI, and also set the
DMA mask. Also fill in the LSB end register offsets for completeness.

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes in v3:
- Rebased on top of "mt8183-afe-pcm: Shorten source code"
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 9b6b45c646e6..7383184097a4 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -6,6 +6,7 @@
 // Author: KaiChieh Chuang <kaichieh.chuang@mediatek.com>
 
 #include <linux/delay.h>
+#include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
@@ -432,6 +433,9 @@ static const struct snd_soc_component_driver mt8183_afe_pcm_dai_component = {
 		.reg_ofs_base = AFE_##_id##_BASE,	\
 		.reg_ofs_cur = AFE_##_id##_CUR,		\
 		.reg_ofs_end = AFE_##_id##_END,		\
+		.reg_ofs_base_msb = AFE_##_id##_BASE_MSB,	\
+		.reg_ofs_cur_msb = AFE_##_id##_CUR_MSB,		\
+		.reg_ofs_end_msb = AFE_##_id##_END_MSB,		\
 		.fs_reg = (_fs_reg),			\
 		.fs_shift = _id##_MODE_SFT,		\
 		.fs_maskbit = _id##_MODE_MASK,		\
@@ -463,11 +467,17 @@ static const struct snd_soc_component_driver mt8183_afe_pcm_dai_component = {
 #define AFE_VUL12_BASE		AFE_VUL_D2_BASE
 #define AFE_VUL12_CUR		AFE_VUL_D2_CUR
 #define AFE_VUL12_END		AFE_VUL_D2_END
+#define AFE_VUL12_BASE_MSB	AFE_VUL_D2_BASE_MSB
+#define AFE_VUL12_CUR_MSB	AFE_VUL_D2_CUR_MSB
+#define AFE_VUL12_END_MSB	AFE_VUL_D2_END_MSB
 #define AWB2_HD_ALIGN_SFT	AWB2_ALIGN_SFT
 #define VUL12_DATA_SFT		VUL12_MONO_SFT
 #define AFE_HDMI_BASE		AFE_HDMI_OUT_BASE
 #define AFE_HDMI_CUR		AFE_HDMI_OUT_CUR
 #define AFE_HDMI_END		AFE_HDMI_OUT_END
+#define AFE_HDMI_BASE_MSB	AFE_HDMI_OUT_BASE_MSB
+#define AFE_HDMI_CUR_MSB	AFE_HDMI_OUT_CUR_MSB
+#define AFE_HDMI_END_MSB	AFE_HDMI_OUT_END_MSB
 
 static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 	MT8183_MEMIF(DL1, AFE_DAC_CON1, AFE_DAC_CON1),
@@ -764,6 +774,10 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct reset_control *rstc;
 	int i, irq_id, ret;
 
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
+	if (ret)
+		return ret;
+
 	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
 		return -ENOMEM;
-- 
2.50.0.rc1.591.g9c95f17f64-goog


