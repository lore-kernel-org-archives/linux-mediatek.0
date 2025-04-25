Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DD9C369D1
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Apr 2025 08:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=25qtAe27NbS9Sy8H+gEjhudVwNOOMd+NsbpUa5zlVyE=; b=YGMkDmNVKCZiDzZ5TiVus9UYBQ
	1XaUN2bOflp2OT0uTN8f63ST8tXHFJYFvmc8ku1sTzpg79GlUcP+54LOr+TxpHbSMJNlfO598g0QL
	8aX0z8avwXulfexP4PfuGyk+bK8yy+RbS6c5sHfdjuTol5FtRnRc5gPN8KYSyZyLNJdgVCmpxWYeb
	6xcRgT0cMKR8ipxFWJElb/8oxdh6egcaX9ka74CcUyMj2MRkHIVsnvk8pUXRFomOTy0zhEBigIgXP
	6X+nh6J0IeMN8XjxZuQ0i3qWhXPrTnXW6PGkYU7IwfP2JdnXxEtjjpO8kWfmEhVRYtKNIn+m5mk5g
	ZC5k1jqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ENo-0000000GKBh-40HD;
	Fri, 25 Apr 2025 08:26:04 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ENm-0000000GK9u-0wCh
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Apr 2025 08:26:03 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-af9925bbeb7so1440560a12.3
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Apr 2025 01:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745569561; x=1746174361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25qtAe27NbS9Sy8H+gEjhudVwNOOMd+NsbpUa5zlVyE=;
        b=IWAklHKA5WLpI46HXKr8uUK6GzbYOc3HeHwpcvc8rLaie5nCFFCm8tqasYmR9/f8FG
         RPmswZ7PJa5MEETO0EZ/4FqSI4jHv5cV6eEwCVjygIJ3cfWSEuH7J7Gs7G+RG+B0o/T3
         34gwLkUntu4eF8bTOTs4eKd6W7978A7XAhExo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745569561; x=1746174361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25qtAe27NbS9Sy8H+gEjhudVwNOOMd+NsbpUa5zlVyE=;
        b=F9YHWe0igdV+tHkASaTV1umT33qajuKy3e/yG/Zf2SEj4nwpY1knDVGvGVCpgbHsS/
         IR+qSL3qw5ddMWGu4eE+ycXSl91yp8mtukj3nBxt9E+oU5UM6NWlbGhw6Nz/LSl7KB00
         Bi7RWaSKeI14ssResSOSsGEX3Pe2SwrkPpGWSzvZfGp71d997xcjjEDlLBobKay9PM8H
         blSlvt7x2EeWRvlNcWIFPqj2dOA/41Ju+xZsJBoR1dP3PrLxSHk0j2zfsA0b5eE+O9bD
         9aJYrhVU6N9eiLJnQkuEbjn/vXNTU2hiu7w0XNX6Dxl+jsOBT+UXF5M+dtpP/oK6h4pQ
         g4pA==
X-Forwarded-Encrypted: i=1; AJvYcCUn2hseg/zueojfWkV1BPbyfQUyUb0CuRhbOlQjfRP17WEy49jqXdAseQRWd+KSbJpglnGlQtStk2BpZ1pOmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwikcuQcm7aPt3WZABp2fx0vR95JPKh8m++NTpQaRTOgNsPXT33
	O94Ezf6ynwvLzGj0TELidNo/2ToNkwbKdHVZLv3MqDfrOIfbZuprwGh+cKojpA==
X-Gm-Gg: ASbGncsY8gciuDykvHLWft+CFBF8c9wDhwEmpZAtpSrB1is4oWf0MG+npqe/7V1Z2zu
	f5ioGTQx+8JsLnhymD47j3yq2cuVheU7wlA+SEgBE/K1Yu7/wfwWLLkfEzqB//enF+XiNjqlPU+
	vGq4EL8jE6xiIpNI+CBAm0tYPXcKttALEUBMdJYHGDcFfpTBOggbGVDVnikjffHpqEGR8Lod6iw
	5cIlGW5OhqtiLTE2l/BaUHO3cYyIxVmLYZqT2oDFYAPTBu2tQCV6VHB4GFvS7b8dChypA7IsnBv
	WB/Ln1P3iCoO/9eEI6eINysCcwt9aic4Wc8SPov0yQnNXvvgwpe6V7FgP4c=
X-Google-Smtp-Source: AGHT+IHRb1TUeUC4eX4OBKdkwz3OlzDchQGfNMxwnYR0yofVxixYxMjC/RCpY9rv5Oen0VtQF6OBhQ==
X-Received: by 2002:a17:90b:2c8c:b0:2ee:8e75:4aeb with SMTP id 98e67ed59e1d1-309f7de6abdmr2641119a91.17.1745569561318;
        Fri, 25 Apr 2025 01:26:01 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4b10:d9aa:98d0:5bb5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f77417d6sm1019179a91.4.2025.04.25.01.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:26:00 -0700 (PDT)
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
Subject: [PATCH 2/3] ASoC: mediatek: mt8183-afe-pcm: Shorten irq_data table using macros
Date: Fri, 25 Apr 2025 16:25:49 +0800
Message-ID: <20250425082551.1467042-3-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
In-Reply-To: <20250425082551.1467042-1-wenst@chromium.org>
References: <20250425082551.1467042-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_012602_264580_423A3C93 
X-CRM114-Status: GOOD (  12.41  )
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
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 176 ++++-----------------
 1 file changed, 33 insertions(+), 143 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 3e2334e9324b..5e340e77b9d5 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -492,150 +492,40 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
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
2.49.0.850.g28803427d3-goog


