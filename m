Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345A9C2D0CD
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 May 2025 07:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cuw9i37af/1ORneMvev0+QG19FsjaSUWkPdlSl+CJ68=; b=KBqycwkf7sw0m9C6tNfJSZSy3t
	FzqG1YPO/cAdLKLH4CTTLhvE+Vcph7jPcx2JuvKHFZGt5kNsn+RPow6EcB9eFedi4TMB/+Z7VR6DG
	JDIhpbkLkc1Yygw6EkcDoDDG66cBGloiIky14A2HHP3Mem9iLh4ZI3rAYBYa44SYMVr6e26jvZtOM
	KtsHCQrCzHlLFLcK2rECqa89o0WVC32AwOSLZVwqj8l008uGyc1lYTTfmN3j9pbfiYzTBXCxEnmDb
	lFw49EvCQzxCWmZh2wcFz6R4Hyh0RfW5P8iTM00NocMcGh8PZFetfZCaPO3XykBdlpQMHMmYdG7GY
	VCt6ZklQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTAv-0000000HNXO-1FMp;
	Thu, 15 May 2025 07:38:41 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTAs-0000000HNVo-35KD
	for linux-mediatek@lists.infradead.org;
	Thu, 15 May 2025 07:38:39 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7411f65811cso660195b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 15 May 2025 00:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747294718; x=1747899518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cuw9i37af/1ORneMvev0+QG19FsjaSUWkPdlSl+CJ68=;
        b=RnBquZcZy5yaInXdqrqP2W5Mt99bH7kCLV8Ntk4jrHK8CCOwqMMvj59294mbHTPGNi
         qJ7ipgUx3OQIHQKjoHAb3waPG9Lk5XuQajHdTSGqqEmkv5e4mzpsCoaoOqg66tnu7QyT
         y9sia1WpxqsVa1nY4oqTCgcIixokpOaftyHxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747294718; x=1747899518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cuw9i37af/1ORneMvev0+QG19FsjaSUWkPdlSl+CJ68=;
        b=dAnCA78wcSGXHyWm99Q77LNO7IwNaTOxSvpBTWzOLheTEK/K4r97JHm+8rZ4m2YAsu
         1xAjaoJR0CxcfQD322NeK8YEMTCmIT5hiVY+5ceHDbyWsiR+oy8sCmSt67WgZk98fZTK
         WnkNFuoIhgu9Na5mTBlhzUr4rfcG+SI6JLVSL7GqO2y/pR13+EBYTZKZf2oYgeJfChMW
         5DfGMWmRixnvdLSwpcaJ4l7zAmv8auos+CvHulYbtTGIgVTJefkxzHJpN9IFLpK+eEFO
         EM3eESuJN38u4zoY+YFcGqAIFvO0KOx50Ir/W8b7s3JDlBbWAk50MoGyTKX2/BsrkRMD
         H8dg==
X-Forwarded-Encrypted: i=1; AJvYcCVoD9WMvtFhAYWG7aCT2ddUDnWUNn7bPPYvm2OkQQi8UsjI33F7TKFWqz20tmBmtNFfVD9LTFmOKQWoM/6WbA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9YtL65bLx9Eocr9/RxvMw5uDWN4mQIL+F+6kDykmiw7XbHpIp
	uM0Uv/NOuTmhcu2JFjzgFrFGJS+niJNX+8/Wct0Uo+bTDIVz8bNgeoOCnEVqIw==
X-Gm-Gg: ASbGncutjtx5uZ7ie9DVTq/XpRLlkVPMKBRAFpQErUOoqsLxqiyg538W9FtOuAdEtfp
	BBvPXSmt1/PABvBSIxuAQmxPZ6MsIT1blhlYpjgyav/4tDCCBcQMcKhngUQ3PADwXw3o/C7TK/8
	MNtGR0xkwMZy6hsB04tfbVK3KQDbeSJ1NBIkBwiYKguztbDztoOQt8AUpa/XDrb1RlD5WVzQsNz
	L7Fg3BPsAh6as6Ch5O7pOdVgOSqAxszj3jMVfsO+9j4+nA7If/Lu6VSKS224C57OwbrHge7FwGL
	ksco4sJ2xV6DoTHUURuGkJumT28QGtX12CRj13sM4d1VwLhiZgNvybfQf41vp5wz2Oo9IA==
X-Google-Smtp-Source: AGHT+IHe6IzxFNkLauCy9bZU1Uvquc1KSUc5NpKfBLs8LJxHMC9d6kRf1QOHhUOkDzpc6Nk9gUSZew==
X-Received: by 2002:a17:903:3bc6:b0:224:18bb:44c2 with SMTP id d9443c01a7336-231b5e51feemr15907235ad.6.1747294717753;
        Thu, 15 May 2025 00:38:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c43a:aaea:5f52:5763])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271f61sm109750825ad.142.2025.05.15.00.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 00:38:37 -0700 (PDT)
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
Subject: [PATCH v2 2/3] ASoC: mediatek: mt8183-afe-pcm: Shorten irq_data table using macros
Date: Thu, 15 May 2025 15:38:22 +0800
Message-ID: <20250515073825.4155297-3-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
In-Reply-To: <20250515073825.4155297-1-wenst@chromium.org>
References: <20250515073825.4155297-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_003838_771977_4D742055 
X-CRM114-Status: GOOD (  12.22  )
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

The irq_data table describes all the supported interrupts for the audio
frontend. The parameters are either the same or can be derived from the
interrupt number. This results in a very long table (in source code)
that can be shortened with macros.

Do just that.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 176 ++++-----------------
 1 file changed, 33 insertions(+), 143 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index a4bed8e335d8..fe315224a259 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -481,150 +481,40 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 	MT8183_MEMIF_BASE(HDMI, -1, -1, -1),
 };
 
+#define MT8183_AFE_IRQ_BASE(_id, _fs_reg, _fs_shift, _fs_maskbit)	\
+	[MT8183_IRQ_##_id] = {	\
+		.id = MT8183_IRQ_##_id,			\
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT##_id,	\
+		.irq_cnt_shift = 0,			\
+		.irq_cnt_maskbit = 0x3ffff,		\
+		.irq_fs_reg = _fs_reg,			\
+		.irq_fs_shift = _fs_shift,		\
+		.irq_fs_maskbit = _fs_maskbit,		\
+		.irq_en_reg = AFE_IRQ_MCU_CON0,		\
+		.irq_en_shift = IRQ##_id##_MCU_ON_SFT,	\
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,		\
+		.irq_clr_shift = IRQ##_id##_MCU_CLR_SFT,	\
+	}
+
+#define MT8183_AFE_IRQ(_id) \
+	MT8183_AFE_IRQ_BASE(_id, AFE_IRQ_MCU_CON1 + _id / 8 * 4,	\
+			    IRQ##_id##_MCU_MODE_SFT,	\
+			    IRQ##_id##_MCU_MODE_MASK)
+
+#define MT8183_AFE_IRQ_NOFS(_id) MT8183_AFE_IRQ_BASE(_id, -1, -1, -1)
+
 static const struct mtk_base_irq_data irq_data[MT8183_IRQ_NUM] = {
-	[MT8183_IRQ_0] = {
-		.id = MT8183_IRQ_0,
-		.irq_cnt_reg = AFE_IRQ_MCU_CNT0,
-		.irq_cnt_shift = 0,
-		.irq_cnt_maskbit = 0x3ffff,
-		.irq_fs_reg = AFE_IRQ_MCU_CON1,
-		.irq_fs_shift = IRQ0_MCU_MODE_SFT,
-		.irq_fs_maskbit = IRQ0_MCU_MODE_MASK,
-		.irq_en_reg = AFE_IRQ_MCU_CON0,
-		.irq_en_shift = IRQ0_MCU_ON_SFT,
-		.irq_clr_reg = AFE_IRQ_MCU_CLR,
-		.irq_clr_shift = IRQ0_MCU_CLR_SFT,
-	},
-	[MT8183_IRQ_1] = {
-		.id = MT8183_IRQ_1,
-		.irq_cnt_reg = AFE_IRQ_MCU_CNT1,
-		.irq_cnt_shift = 0,
-		.irq_cnt_maskbit = 0x3ffff,
-		.irq_fs_reg = AFE_IRQ_MCU_CON1,
-		.irq_fs_shift = IRQ1_MCU_MODE_SFT,
-		.irq_fs_maskbit = IRQ1_MCU_MODE_MASK,
-		.irq_en_reg = AFE_IRQ_MCU_CON0,
-		.irq_en_shift = IRQ1_MCU_ON_SFT,
-		.irq_clr_reg = AFE_IRQ_MCU_CLR,
-		.irq_clr_shift = IRQ1_MCU_CLR_SFT,
-	},
-	[MT8183_IRQ_2] = {
-		.id = MT8183_IRQ_2,
-		.irq_cnt_reg = AFE_IRQ_MCU_CNT2,
-		.irq_cnt_shift = 0,
-		.irq_cnt_maskbit = 0x3ffff,
-		.irq_fs_reg = AFE_IRQ_MCU_CON1,
-		.irq_fs_shift = IRQ2_MCU_MODE_SFT,
-		.irq_fs_maskbit = IRQ2_MCU_MODE_MASK,
-		.irq_en_reg = AFE_IRQ_MCU_CON0,
-		.irq_en_shift = IRQ2_MCU_ON_SFT,
-		.irq_clr_reg = AFE_IRQ_MCU_CLR,
-		.irq_clr_shift = IRQ2_MCU_CLR_SFT,
-	},
-	[MT8183_IRQ_3] = {
-		.id = MT8183_IRQ_3,
-		.irq_cnt_reg = AFE_IRQ_MCU_CNT3,
-		.irq_cnt_shift = 0,
-		.irq_cnt_maskbit = 0x3ffff,
-		.irq_fs_reg = AFE_IRQ_MCU_CON1,
-		.irq_fs_shift = IRQ3_MCU_MODE_SFT,
-		.irq_fs_maskbit = IRQ3_MCU_MODE_MASK,
-		.irq_en_reg = AFE_IRQ_MCU_CON0,
-		.irq_en_shift = IRQ3_MCU_ON_SFT,
-		.irq_clr_reg = AFE_IRQ_MCU_CLR,
-		.irq_clr_shift = IRQ3_MCU_CLR_SFT,
-	},
-	[MT8183_IRQ_4] = {
-		.id = MT8183_IRQ_4,
-		.irq_cnt_reg = AFE_IRQ_MCU_CNT4,
-		.irq_cnt_shift = 0,
-		.irq_cnt_maskbit = 0x3ffff,
-		.irq_fs_reg = AFE_IRQ_MCU_CON1,
-		.irq_fs_shift = IRQ4_MCU_MODE_SFT,
-		.irq_fs_maskbit = IRQ4_MCU_MODE_MASK,
-		.irq_en_reg = AFE_IRQ_MCU_CON0,
-		.irq_en_shift = IRQ4_MCU_ON_SFT,
-		.irq_clr_reg = AFE_IRQ_MCU_CLR,
-		.irq_clr_shift = IRQ4_MCU_CLR_SFT,
-	},
-	[MT8183_IRQ_5] = {
-		.id = MT8183_IRQ_5,
-		.irq_cnt_reg = AFE_IRQ_MCU_CNT5,
-		.irq_cnt_shift = 0,
-		.irq_cnt_maskbit = 0x3ffff,
-		.irq_fs_reg = AFE_IRQ_MCU_CON1,
-		.irq_fs_shift = IRQ5_MCU_MODE_SFT,
-		.irq_fs_maskbit = IRQ5_MCU_MODE_MASK,
-		.irq_en_reg = AFE_IRQ_MCU_CON0,
-		.irq_en_shift = IRQ5_MCU_ON_SFT,
-		.irq_clr_reg = AFE_IRQ_MCU_CLR,
-		.irq_clr_shift = IRQ5_MCU_CLR_SFT,
-	},
-	[MT8183_IRQ_6] = {
-		.id = MT8183_IRQ_6,
-		.irq_cnt_reg = AFE_IRQ_MCU_CNT6,
-		.irq_cnt_shift = 0,
-		.irq_cnt_maskbit = 0x3ffff,
-		.irq_fs_reg = AFE_IRQ_MCU_CON1,
-		.irq_fs_shift = IRQ6_MCU_MODE_SFT,
-		.irq_fs_maskbit = IRQ6_MCU_MODE_MASK,
-		.irq_en_reg = AFE_IRQ_MCU_CON0,
-		.irq_en_shift = IRQ6_MCU_ON_SFT,
-		.irq_clr_reg = AFE_IRQ_MCU_CLR,
-		.irq_clr_shift = IRQ6_MCU_CLR_SFT,
-	},
-	[MT8183_IRQ_7] = {
-		.id = MT8183_IRQ_7,
-		.irq_cnt_reg = AFE_IRQ_MCU_CNT7,
-		.irq_cnt_shift = 0,
-		.irq_cnt_maskbit = 0x3ffff,
-		.irq_fs_reg = AFE_IRQ_MCU_CON1,
-		.irq_fs_shift = IRQ7_MCU_MODE_SFT,
-		.irq_fs_maskbit = IRQ7_MCU_MODE_MASK,
-		.irq_en_reg = AFE_IRQ_MCU_CON0,
-		.irq_en_shift = IRQ7_MCU_ON_SFT,
-		.irq_clr_reg = AFE_IRQ_MCU_CLR,
-		.irq_clr_shift = IRQ7_MCU_CLR_SFT,
-	},
-	[MT8183_IRQ_8] = {
-		.id = MT8183_IRQ_8,
-		.irq_cnt_reg = AFE_IRQ_MCU_CNT8,
-		.irq_cnt_shift = 0,
-		.irq_cnt_maskbit = 0x3ffff,
-		.irq_fs_reg = -1,
-		.irq_fs_shift = -1,
-		.irq_fs_maskbit = -1,
-		.irq_en_reg = AFE_IRQ_MCU_CON0,
-		.irq_en_shift = IRQ8_MCU_ON_SFT,
-		.irq_clr_reg = AFE_IRQ_MCU_CLR,
-		.irq_clr_shift = IRQ8_MCU_CLR_SFT,
-	},
-	[MT8183_IRQ_11] = {
-		.id = MT8183_IRQ_11,
-		.irq_cnt_reg = AFE_IRQ_MCU_CNT11,
-		.irq_cnt_shift = 0,
-		.irq_cnt_maskbit = 0x3ffff,
-		.irq_fs_reg = AFE_IRQ_MCU_CON2,
-		.irq_fs_shift = IRQ11_MCU_MODE_SFT,
-		.irq_fs_maskbit = IRQ11_MCU_MODE_MASK,
-		.irq_en_reg = AFE_IRQ_MCU_CON0,
-		.irq_en_shift = IRQ11_MCU_ON_SFT,
-		.irq_clr_reg = AFE_IRQ_MCU_CLR,
-		.irq_clr_shift = IRQ11_MCU_CLR_SFT,
-	},
-	[MT8183_IRQ_12] = {
-		.id = MT8183_IRQ_12,
-		.irq_cnt_reg = AFE_IRQ_MCU_CNT12,
-		.irq_cnt_shift = 0,
-		.irq_cnt_maskbit = 0x3ffff,
-		.irq_fs_reg = AFE_IRQ_MCU_CON2,
-		.irq_fs_shift = IRQ12_MCU_MODE_SFT,
-		.irq_fs_maskbit = IRQ12_MCU_MODE_MASK,
-		.irq_en_reg = AFE_IRQ_MCU_CON0,
-		.irq_en_shift = IRQ12_MCU_ON_SFT,
-		.irq_clr_reg = AFE_IRQ_MCU_CLR,
-		.irq_clr_shift = IRQ12_MCU_CLR_SFT,
-	},
+	MT8183_AFE_IRQ(0),
+	MT8183_AFE_IRQ(1),
+	MT8183_AFE_IRQ(2),
+	MT8183_AFE_IRQ(3),
+	MT8183_AFE_IRQ(4),
+	MT8183_AFE_IRQ(5),
+	MT8183_AFE_IRQ(6),
+	MT8183_AFE_IRQ(7),
+	MT8183_AFE_IRQ_NOFS(8),
+	MT8183_AFE_IRQ(11),
+	MT8183_AFE_IRQ(12),
 };
 
 static bool mt8183_is_volatile_reg(struct device *dev, unsigned int reg)
-- 
2.49.0.1045.g170613ef41-goog


