Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6F2C2D0CD
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 May 2025 07:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79ms8c2FnuEoP2QG4BxhZzqQ6Y78M53niO7yuu/SbRQ=; b=1wgCRzDMY1R4kEGSaEluP07RNB
	XgguP4wq857d2og7ChUChzsH6JQRb85NKbD1OcMAx1CX0awpxsLN+BHR59R8tAawMyHbtKTls9CZi
	02MDZKP4LI5vJFIzsAQ92U6slR6dM12tj3qAoF77fALCKHRrKLS3qh9d/4P1vTAgC1IJWSkjtGzrs
	DCcOWK2uABI6i8RDQsZLzfnUs7Vi+phdhooQbV3pVtaqfANGJOemlPbVxwxDQF8+sraUNeZ5/T+kM
	it+5+92UEqw9JazEpIaooDyiGffhiwvN0cxMFexrQ/Ccx2a+XJ+xzigIKPTVHjQ+tKuQu0f/egAiK
	teG2nilA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTAr-0000000HNVV-47Gh;
	Thu, 15 May 2025 07:38:37 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTAq-0000000HNUF-0lKI
	for linux-mediatek@lists.infradead.org;
	Thu, 15 May 2025 07:38:37 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-22fa414c565so5255815ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 15 May 2025 00:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747294715; x=1747899515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79ms8c2FnuEoP2QG4BxhZzqQ6Y78M53niO7yuu/SbRQ=;
        b=l0XxpczTaeC70M+zytH2FbiOIocNvINfY+laQPH7H2YWaq+/cowYEAj1NpOdqnlR1I
         6x9a+95SqE004Qwnzd/9SJ15yBgkNM5LXexNQI9cDIfiVCdGUQQ551j31N3wpzHVEnZf
         fKl+SSKHxkGgDcE4BEFVV6riH3ftBPH5Wa8YQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747294715; x=1747899515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79ms8c2FnuEoP2QG4BxhZzqQ6Y78M53niO7yuu/SbRQ=;
        b=Q6j3ZHqtv5xk+MnznCf1A72jot8riIC+1ZGj1FViUr6iGw/sBzkisIpB9Hrcmiu0Ax
         bnhBTDFv2mf94LBnYld8jnCHUp9hNXEa7Zotaf8rYkUVjp3RKiNHjBxrvtPRsrhjdt+H
         g1o0W3FyLKQIFSW8lagqcH6pmaK0+DANGrkhaebHZhftF/L+vFbUXRFtkUBYRm7G2ttG
         9lpt7ye2WKhnyUXTSiqxIpbLfFnPUv6fXWPUa4gcb4IGJ0+aih0zjgI59oZ77dBvp6dz
         0CuUWRnLi4AiPiTRlqykf/hVsUSZTPjhaotNoXL1wRpN/kQRRIPE1plER35nzZVB1Ef/
         y8iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe81KG3Ur0O1zWU7sNHRcNCYHbNchBIezsgW9Bu6wZHZt6hw0L/++OCGvVdGP2l8UiWx7ELtqx2iFqf9Sj7A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0BhnuvylI2R7q4L9BBZCqtTFu0n7XPSNc8aLuAHa01J+Aqj6O
	S2KfhfpmMCbTlkJEkgq46G78qzmAO/GlIZmLeRFpfruUeteIxosgD/DI5GR12g==
X-Gm-Gg: ASbGncss8Wfkwo9HbXbWxAmsknVZIJ/y6587LTNbbX98ioo6dXOfO3VUGJt4G+nXSUP
	DTqOMwmZecdC9IyQbfZlGVc1zUpJQBBNudLXzo7wmtmit/QUQDGS+QwXMwoba4ZVGzcJUXcn67q
	zfTvMqWndCtlxOqZH9dHcvJdM7R202R127pZxiWCnBIziuk2yLY5xr8poPzc11zo8XJaZDepvCl
	gm+Ohu6WbWSUax/J59cTJixpFNz8dxUcIghvN7fFmE8beYsSgfEVc25lIXW3qJYkAsFzuKfHXFu
	Q2Maxsomq2wbKKpIafnbi5FjQkFZP4qNn482bRGosp+AplTCav0yKAOYBh2B5asCJSg6pQ==
X-Google-Smtp-Source: AGHT+IE+oWnqezIF5QTQ7EIBKtLTRzikzPqtq43CZyZeO14t1RTBDnr586S2uXPfRLUc6SCZYpMdRg==
X-Received: by 2002:a17:903:1984:b0:21f:6a36:7bf3 with SMTP id d9443c01a7336-231b5e67c01mr20669115ad.12.1747294715147;
        Thu, 15 May 2025 00:38:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c43a:aaea:5f52:5763])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271f61sm109750825ad.142.2025.05.15.00.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 00:38:34 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Darren Ye <darren.ye@mediatek.com>
Subject: [PATCH v2 1/3] ASoC: mediatek: mt8183-afe-pcm: Shorten memif_data table using macros
Date: Thu, 15 May 2025 15:38:21 +0800
Message-ID: <20250515073825.4155297-2-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
In-Reply-To: <20250515073825.4155297-1-wenst@chromium.org>
References: <20250515073825.4155297-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_003836_220522_772B6888 
X-CRM114-Status: GOOD (  14.16  )
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

The memif_data table describes all the supported PCM channels for the
audio frontend. Most of the fields are either the same or can be derived
from the interface's name. This results in a very long table (in source
code) that can be shortened with macros.

Do just that. Some "convenience" macros were added to cover non-existent
register fields that would otherwise require multiple layers of macros
to handle.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes since v1:
- Rebased onto -next, dropping bits for DMA address MSB registers
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 243 +++++----------------
 1 file changed, 54 insertions(+), 189 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index d083b4bf0f95..a4bed8e335d8 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -424,196 +424,61 @@ static const struct snd_soc_component_driver mt8183_afe_pcm_dai_component = {
 	.name = "mt8183-afe-pcm-dai",
 };
 
+#define MT8183_MEMIF_BASE(_id, _en_reg, _fs_reg, _mono_reg)    \
+	[MT8183_MEMIF_##_id] = { \
+		.name = #_id,				\
+		.id = MT8183_MEMIF_##_id,		\
+		.reg_ofs_base = AFE_##_id##_BASE,	\
+		.reg_ofs_cur = AFE_##_id##_CUR,		\
+		.reg_ofs_end = AFE_##_id##_END,		\
+		.fs_reg = (_fs_reg),			\
+		.fs_shift = _id##_MODE_SFT,		\
+		.fs_maskbit = _id##_MODE_MASK,		\
+		.mono_reg = (_mono_reg),		\
+		.mono_shift = _id##_DATA_SFT,		\
+		.enable_reg = (_en_reg),		\
+		.enable_shift = _id##_ON_SFT,		\
+		.hd_reg = AFE_MEMIF_HD_MODE,		\
+		.hd_align_reg = AFE_MEMIF_HDALIGN,	\
+		.hd_shift = _id##_HD_SFT,		\
+		.hd_align_mshift = _id##_HD_ALIGN_SFT,	\
+		.agent_disable_reg = -1,		\
+		.agent_disable_shift = -1,		\
+		.msb_reg = -1,				\
+		.msb_shift = -1,			\
+	}
+
+#define MT8183_MEMIF(_id, _fs_reg, _mono_reg) \
+		MT8183_MEMIF_BASE(_id, AFE_DAC_CON0, _fs_reg, _mono_reg)
+
+/* For convenience with macros: missing register fields */
+#define MOD_DAI_DATA_SFT	-1
+#define HDMI_MODE_SFT		-1
+#define HDMI_MODE_MASK		-1
+#define HDMI_DATA_SFT		-1
+#define HDMI_ON_SFT		-1
+
+/* For convenience with macros: register name differences */
+#define AFE_VUL12_BASE		AFE_VUL_D2_BASE
+#define AFE_VUL12_CUR		AFE_VUL_D2_CUR
+#define AFE_VUL12_END		AFE_VUL_D2_END
+#define AWB2_HD_ALIGN_SFT	AWB2_ALIGN_SFT
+#define VUL12_DATA_SFT		VUL12_MONO_SFT
+#define AFE_HDMI_BASE		AFE_HDMI_OUT_BASE
+#define AFE_HDMI_CUR		AFE_HDMI_OUT_CUR
+#define AFE_HDMI_END		AFE_HDMI_OUT_END
+
 static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
-	[MT8183_MEMIF_DL1] = {
-		.name = "DL1",
-		.id = MT8183_MEMIF_DL1,
-		.reg_ofs_base = AFE_DL1_BASE,
-		.reg_ofs_cur = AFE_DL1_CUR,
-		.fs_reg = AFE_DAC_CON1,
-		.fs_shift = DL1_MODE_SFT,
-		.fs_maskbit = DL1_MODE_MASK,
-		.mono_reg = AFE_DAC_CON1,
-		.mono_shift = DL1_DATA_SFT,
-		.enable_reg = AFE_DAC_CON0,
-		.enable_shift = DL1_ON_SFT,
-		.hd_reg = AFE_MEMIF_HD_MODE,
-		.hd_align_reg = AFE_MEMIF_HDALIGN,
-		.hd_shift = DL1_HD_SFT,
-		.hd_align_mshift = DL1_HD_ALIGN_SFT,
-		.agent_disable_reg = -1,
-		.agent_disable_shift = -1,
-		.msb_reg = -1,
-		.msb_shift = -1,
-	},
-	[MT8183_MEMIF_DL2] = {
-		.name = "DL2",
-		.id = MT8183_MEMIF_DL2,
-		.reg_ofs_base = AFE_DL2_BASE,
-		.reg_ofs_cur = AFE_DL2_CUR,
-		.fs_reg = AFE_DAC_CON1,
-		.fs_shift = DL2_MODE_SFT,
-		.fs_maskbit = DL2_MODE_MASK,
-		.mono_reg = AFE_DAC_CON1,
-		.mono_shift = DL2_DATA_SFT,
-		.enable_reg = AFE_DAC_CON0,
-		.enable_shift = DL2_ON_SFT,
-		.hd_reg = AFE_MEMIF_HD_MODE,
-		.hd_align_reg = AFE_MEMIF_HDALIGN,
-		.hd_shift = DL2_HD_SFT,
-		.hd_align_mshift = DL2_HD_ALIGN_SFT,
-		.agent_disable_reg = -1,
-		.agent_disable_shift = -1,
-		.msb_reg = -1,
-		.msb_shift = -1,
-	},
-	[MT8183_MEMIF_DL3] = {
-		.name = "DL3",
-		.id = MT8183_MEMIF_DL3,
-		.reg_ofs_base = AFE_DL3_BASE,
-		.reg_ofs_cur = AFE_DL3_CUR,
-		.fs_reg = AFE_DAC_CON2,
-		.fs_shift = DL3_MODE_SFT,
-		.fs_maskbit = DL3_MODE_MASK,
-		.mono_reg = AFE_DAC_CON1,
-		.mono_shift = DL3_DATA_SFT,
-		.enable_reg = AFE_DAC_CON0,
-		.enable_shift = DL3_ON_SFT,
-		.hd_reg = AFE_MEMIF_HD_MODE,
-		.hd_align_reg = AFE_MEMIF_HDALIGN,
-		.hd_shift = DL3_HD_SFT,
-		.hd_align_mshift = DL3_HD_ALIGN_SFT,
-		.agent_disable_reg = -1,
-		.agent_disable_shift = -1,
-		.msb_reg = -1,
-		.msb_shift = -1,
-	},
-	[MT8183_MEMIF_VUL2] = {
-		.name = "VUL2",
-		.id = MT8183_MEMIF_VUL2,
-		.reg_ofs_base = AFE_VUL2_BASE,
-		.reg_ofs_cur = AFE_VUL2_CUR,
-		.fs_reg = AFE_DAC_CON2,
-		.fs_shift = VUL2_MODE_SFT,
-		.fs_maskbit = VUL2_MODE_MASK,
-		.mono_reg = AFE_DAC_CON2,
-		.mono_shift = VUL2_DATA_SFT,
-		.enable_reg = AFE_DAC_CON0,
-		.enable_shift = VUL2_ON_SFT,
-		.hd_reg = AFE_MEMIF_HD_MODE,
-		.hd_align_reg = AFE_MEMIF_HDALIGN,
-		.hd_shift = VUL2_HD_SFT,
-		.hd_align_mshift = VUL2_HD_ALIGN_SFT,
-		.agent_disable_reg = -1,
-		.agent_disable_shift = -1,
-		.msb_reg = -1,
-		.msb_shift = -1,
-	},
-	[MT8183_MEMIF_AWB] = {
-		.name = "AWB",
-		.id = MT8183_MEMIF_AWB,
-		.reg_ofs_base = AFE_AWB_BASE,
-		.reg_ofs_cur = AFE_AWB_CUR,
-		.fs_reg = AFE_DAC_CON1,
-		.fs_shift = AWB_MODE_SFT,
-		.fs_maskbit = AWB_MODE_MASK,
-		.mono_reg = AFE_DAC_CON1,
-		.mono_shift = AWB_DATA_SFT,
-		.enable_reg = AFE_DAC_CON0,
-		.enable_shift = AWB_ON_SFT,
-		.hd_reg = AFE_MEMIF_HD_MODE,
-		.hd_align_reg = AFE_MEMIF_HDALIGN,
-		.hd_shift = AWB_HD_SFT,
-		.hd_align_mshift = AWB_HD_ALIGN_SFT,
-		.agent_disable_reg = -1,
-		.agent_disable_shift = -1,
-		.msb_reg = -1,
-		.msb_shift = -1,
-	},
-	[MT8183_MEMIF_AWB2] = {
-		.name = "AWB2",
-		.id = MT8183_MEMIF_AWB2,
-		.reg_ofs_base = AFE_AWB2_BASE,
-		.reg_ofs_cur = AFE_AWB2_CUR,
-		.fs_reg = AFE_DAC_CON2,
-		.fs_shift = AWB2_MODE_SFT,
-		.fs_maskbit = AWB2_MODE_MASK,
-		.mono_reg = AFE_DAC_CON2,
-		.mono_shift = AWB2_DATA_SFT,
-		.enable_reg = AFE_DAC_CON0,
-		.enable_shift = AWB2_ON_SFT,
-		.hd_reg = AFE_MEMIF_HD_MODE,
-		.hd_align_reg = AFE_MEMIF_HDALIGN,
-		.hd_shift = AWB2_HD_SFT,
-		.hd_align_mshift = AWB2_ALIGN_SFT,
-		.agent_disable_reg = -1,
-		.agent_disable_shift = -1,
-		.msb_reg = -1,
-		.msb_shift = -1,
-	},
-	[MT8183_MEMIF_VUL12] = {
-		.name = "VUL12",
-		.id = MT8183_MEMIF_VUL12,
-		.reg_ofs_base = AFE_VUL_D2_BASE,
-		.reg_ofs_cur = AFE_VUL_D2_CUR,
-		.fs_reg = AFE_DAC_CON0,
-		.fs_shift = VUL12_MODE_SFT,
-		.fs_maskbit = VUL12_MODE_MASK,
-		.mono_reg = AFE_DAC_CON0,
-		.mono_shift = VUL12_MONO_SFT,
-		.enable_reg = AFE_DAC_CON0,
-		.enable_shift = VUL12_ON_SFT,
-		.hd_reg = AFE_MEMIF_HD_MODE,
-		.hd_align_reg = AFE_MEMIF_HDALIGN,
-		.hd_shift = VUL12_HD_SFT,
-		.hd_align_mshift = VUL12_HD_ALIGN_SFT,
-		.agent_disable_reg = -1,
-		.agent_disable_shift = -1,
-		.msb_reg = -1,
-		.msb_shift = -1,
-	},
-	[MT8183_MEMIF_MOD_DAI] = {
-		.name = "MOD_DAI",
-		.id = MT8183_MEMIF_MOD_DAI,
-		.reg_ofs_base = AFE_MOD_DAI_BASE,
-		.reg_ofs_cur = AFE_MOD_DAI_CUR,
-		.fs_reg = AFE_DAC_CON1,
-		.fs_shift = MOD_DAI_MODE_SFT,
-		.fs_maskbit = MOD_DAI_MODE_MASK,
-		.mono_reg = -1,
-		.mono_shift = 0,
-		.enable_reg = AFE_DAC_CON0,
-		.enable_shift = MOD_DAI_ON_SFT,
-		.hd_reg = AFE_MEMIF_HD_MODE,
-		.hd_align_reg = AFE_MEMIF_HDALIGN,
-		.hd_shift = MOD_DAI_HD_SFT,
-		.hd_align_mshift = MOD_DAI_HD_ALIGN_SFT,
-		.agent_disable_reg = -1,
-		.agent_disable_shift = -1,
-		.msb_reg = -1,
-		.msb_shift = -1,
-	},
-	[MT8183_MEMIF_HDMI] = {
-		.name = "HDMI",
-		.id = MT8183_MEMIF_HDMI,
-		.reg_ofs_base = AFE_HDMI_OUT_BASE,
-		.reg_ofs_cur = AFE_HDMI_OUT_CUR,
-		.fs_reg = -1,
-		.fs_shift = -1,
-		.fs_maskbit = -1,
-		.mono_reg = -1,
-		.mono_shift = -1,
-		.enable_reg = -1,	/* control in tdm for sync start */
-		.enable_shift = -1,
-		.hd_reg = AFE_MEMIF_HD_MODE,
-		.hd_align_reg = AFE_MEMIF_HDALIGN,
-		.hd_shift = HDMI_HD_SFT,
-		.hd_align_mshift = HDMI_HD_ALIGN_SFT,
-		.agent_disable_reg = -1,
-		.agent_disable_shift = -1,
-		.msb_reg = -1,
-		.msb_shift = -1,
-	},
+	MT8183_MEMIF(DL1, AFE_DAC_CON1, AFE_DAC_CON1),
+	MT8183_MEMIF(DL2, AFE_DAC_CON1, AFE_DAC_CON1),
+	MT8183_MEMIF(DL3, AFE_DAC_CON2, AFE_DAC_CON1),
+	MT8183_MEMIF(VUL2, AFE_DAC_CON2, AFE_DAC_CON2),
+	MT8183_MEMIF(AWB, AFE_DAC_CON1, AFE_DAC_CON1),
+	MT8183_MEMIF(AWB2, AFE_DAC_CON2, AFE_DAC_CON2),
+	MT8183_MEMIF(VUL12, AFE_DAC_CON0, AFE_DAC_CON0),
+	MT8183_MEMIF(MOD_DAI, AFE_DAC_CON1, -1),
+	/* enable control in tdm for sync start */
+	MT8183_MEMIF_BASE(HDMI, -1, -1, -1),
 };
 
 static const struct mtk_base_irq_data irq_data[MT8183_IRQ_NUM] = {
-- 
2.49.0.1045.g170613ef41-goog


