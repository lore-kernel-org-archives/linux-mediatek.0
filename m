Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F72C369C2
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Apr 2025 08:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIoPxPd/4SKxFzQ2sbT9yyaISz0ZfnDIApKeqMxKAVM=; b=XTIuCceg6LQX7ny0bnobvS0jVp
	5x2CcgwRYrvZwommlXPZF9KjfNyYij0ExrS+tLTlHq9a/+U2Vv/oSiVn6qokE6XWROKdy1vEuWLZB
	iTbgc1gmywoYwA3UfsQ1BJcal0rHtPqD/yMdQ0X50MqbkThCjNh39/2NFl5zxf9p581k9LISMshWP
	efKrSjEAVL8atuYwoQvAuhBZykXK+w6j9JqndNJbkiMKj/TVG3sP8vXP+cuZPx6Tjc9P3zJxSPItH
	jTmWyjTfMMMLiXCkehp95WxZIMYcpRoP7YGCYeLZGu5lqOrjTodKdgW1Qjbp7Hi+zq34HTMg/s9Kk
	JP/Uj9iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ENr-0000000GKDU-2TTE;
	Fri, 25 Apr 2025 08:26:07 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ENo-0000000GKBE-3Bjg
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Apr 2025 08:26:06 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3015001f862so1723517a91.3
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Apr 2025 01:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745569564; x=1746174364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIoPxPd/4SKxFzQ2sbT9yyaISz0ZfnDIApKeqMxKAVM=;
        b=WpzxIHx7ZQ643m+96B3bEXRLu73omuoKGJeUsFWkA2ZU4B0Mq8qtII5RI/sn/BkPbl
         ym4lCV5TLekLPc39jVTgyReyoMJgZcOQMLra2517EzXKY5G8IStLNDvJLFHbnvWLslkV
         ugb3/GIziaQL6/cg0e3XNzp8QtOEhr0YVh4ew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745569564; x=1746174364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIoPxPd/4SKxFzQ2sbT9yyaISz0ZfnDIApKeqMxKAVM=;
        b=OWWRgAMpG0G50LSXDeIg/jpT+h28wgCm9bwQC6uzPb2kZZmijAH+cSo/1p8aq/wv1u
         MsXMfyyAMKyAboRig3+VlL1wOyfsfgGFWIRjPkY8BS/ArJvObyyJrh+ne/tdxMzDRbGy
         np2LAxMT2/wEmEZsHm1e7ASNVPb1m8zoREr+zU2IL8sQRq8eR2yic8UOzXu0Y7fc1w+u
         7jq0s3P4+47lZ+t/zPr0xBAEVLvoV7aozgVbZxa7xYRVJi/Fjqmh/D/gFGp2itZByWQn
         eTRA6qPZM53IDP5bH8BTKRzPpTg9a7f0FaRiSEgced30UF6+Di+QLzsHLIpI+YW6v+C8
         lUXg==
X-Forwarded-Encrypted: i=1; AJvYcCVGmIRjh4RSAMkzzU1x9NLxvBPtAPx/A29v6hzgzXVX/UTggAiyVAjyG/5swDkJz+Ak0Pe3Y+EhrtACOvZ39w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1GDANkuqwYe+UNaREDGqJMw68QbtekPO5GVDNAFtc8+SkjCbX
	hSder2VaETVeIeNSF9UVH+it9oLPs1bXwJ9aJ8fd2P0K8SD7cJjglZfSPtbjSA==
X-Gm-Gg: ASbGncvuA1iNOy/VldfpxlF2tL3ClJHOMskIGi5ZbJqqf4M10NudO39RbVPeXA1eMDC
	5qtF6Abmn52D3tWMT0aXuiY9Ykshr7gXqZuT5pTDU2oCqySdR12i08jR3gwzvBvlk5hyps4PpNg
	Pt1gGlkNVqm1qlBROY/bh7Iew6RoMs5rb0XXfgu94dBhs4LEY6y263JXvNqBge0xv9pJCkAPC92
	2I5HkEVxmp4tN2d6pfJX/HBDjSvqFDcwVa0qlylenoA767EFH5KhjZ9eQ+VFIqzfuPWibblE58w
	csjOkAx1TLE+a6YHSN1N6yah915WCmRBszk3w5vMtVYHNOLZBKwjuhCiUCuX2P+hf6d6pg==
X-Google-Smtp-Source: AGHT+IF7ci9aHN2WDhs7A1XDuuym2fXQ0c+JrRPPEzEqgV1pI/nJMNeBjSjR3voxcnyJVTXvDDG1FQ==
X-Received: by 2002:a17:90b:35c5:b0:2ee:c6c8:d89f with SMTP id 98e67ed59e1d1-309f7df0012mr2983136a91.14.1745569563829;
        Fri, 25 Apr 2025 01:26:03 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4b10:d9aa:98d0:5bb5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f77417d6sm1019179a91.4.2025.04.25.01.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:26:03 -0700 (PDT)
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
Subject: [PATCH 3/3] ASoC: mediatek: mt8183-afe-pcm: shorten mt8183_is_volatile_reg()
Date: Fri, 25 Apr 2025 16:25:50 +0800
Message-ID: <20250425082551.1467042-4-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
In-Reply-To: <20250425082551.1467042-1-wenst@chromium.org>
References: <20250425082551.1467042-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_012604_802818_43DF9ADB 
X-CRM114-Status: GOOD (  12.52  )
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

mt8183_is_volatile_reg() is a large switch-case block that lists out
every register that is volatile. Since many pairs of registers have
consecutive addresses, the cases can be compressed down with the
ellipsis, i.e. GCC extension "case ranges" [1] to cover more addresses
in one case, shortening the source code.

This is not completely the same, since the addresses are 4-byte aligned,
and using the case ranges feature adds all unaligned addresses in
between. In practice this doesn't matter since the unaligned addresses
are blocked by the regmap core. This also ends up compiling slightly
smaller with a reduction of 128 bytes in the text section.

[1] https://gcc.gnu.org/onlinedocs/gcc/Case-Ranges.html

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 152 ++++++---------------
 1 file changed, 40 insertions(+), 112 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 5e340e77b9d5..c88a6705bf7e 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -533,86 +533,46 @@ static bool mt8183_is_volatile_reg(struct device *dev, unsigned int reg)
 	/* these auto-gen reg has read-only bit, so put it as volatile */
 	/* volatile reg cannot be cached, so cannot be set when power off */
 	switch (reg) {
-	case AUDIO_TOP_CON0:	/* reg bit controlled by CCF */
-	case AUDIO_TOP_CON1:	/* reg bit controlled by CCF */
+	case AUDIO_TOP_CON0 ... AUDIO_TOP_CON1:	/* reg bit controlled by CCF */
 	case AUDIO_TOP_CON3:
-	case AFE_DL1_CUR:
-	case AFE_DL1_END:
-	case AFE_DL2_CUR:
-	case AFE_DL2_END:
-	case AFE_AWB_END:
-	case AFE_AWB_CUR:
-	case AFE_VUL_END:
-	case AFE_VUL_CUR:
-	case AFE_MEMIF_MON0:
-	case AFE_MEMIF_MON1:
-	case AFE_MEMIF_MON2:
-	case AFE_MEMIF_MON3:
-	case AFE_MEMIF_MON4:
-	case AFE_MEMIF_MON5:
-	case AFE_MEMIF_MON6:
-	case AFE_MEMIF_MON7:
-	case AFE_MEMIF_MON8:
-	case AFE_MEMIF_MON9:
-	case AFE_ADDA_SRC_DEBUG_MON0:
-	case AFE_ADDA_SRC_DEBUG_MON1:
-	case AFE_ADDA_UL_SRC_MON0:
-	case AFE_ADDA_UL_SRC_MON1:
+	case AFE_DL1_CUR ... AFE_DL1_END:
+	case AFE_DL2_CUR ... AFE_DL2_END:
+	case AFE_AWB_END ... AFE_AWB_CUR:
+	case AFE_VUL_END ... AFE_VUL_CUR:
+	case AFE_MEMIF_MON0 ... AFE_MEMIF_MON9:
+	case AFE_ADDA_SRC_DEBUG_MON0 ... AFE_ADDA_SRC_DEBUG_MON1:
+	case AFE_ADDA_UL_SRC_MON0 ... AFE_ADDA_UL_SRC_MON1:
 	case AFE_SIDETONE_MON:
-	case AFE_SIDETONE_CON0:
-	case AFE_SIDETONE_COEFF:
+	case AFE_SIDETONE_CON0 ... AFE_SIDETONE_COEFF:
 	case AFE_BUS_MON0:
-	case AFE_MRGIF_MON0:
-	case AFE_MRGIF_MON1:
-	case AFE_MRGIF_MON2:
-	case AFE_I2S_MON:
+	case AFE_MRGIF_MON0 ... AFE_I2S_MON:
 	case AFE_DAC_MON:
-	case AFE_VUL2_END:
-	case AFE_VUL2_CUR:
-	case AFE_IRQ0_MCU_CNT_MON:
-	case AFE_IRQ6_MCU_CNT_MON:
-	case AFE_MOD_DAI_END:
-	case AFE_MOD_DAI_CUR:
-	case AFE_VUL_D2_END:
-	case AFE_VUL_D2_CUR:
-	case AFE_DL3_CUR:
-	case AFE_DL3_END:
+	case AFE_VUL2_END ... AFE_VUL2_CUR:
+	case AFE_IRQ0_MCU_CNT_MON ... AFE_IRQ6_MCU_CNT_MON:
+	case AFE_MOD_DAI_END ... AFE_MOD_DAI_CUR:
+	case AFE_VUL_D2_END ... AFE_VUL_D2_CUR:
+	case AFE_DL3_CUR ... AFE_DL3_END:
 	case AFE_HDMI_OUT_CON0:
-	case AFE_HDMI_OUT_CUR:
-	case AFE_HDMI_OUT_END:
-	case AFE_IRQ3_MCU_CNT_MON:
-	case AFE_IRQ4_MCU_CNT_MON:
-	case AFE_IRQ_MCU_STATUS:
-	case AFE_IRQ_MCU_CLR:
+	case AFE_HDMI_OUT_CUR ... AFE_HDMI_OUT_END:
+	case AFE_IRQ3_MCU_CNT_MON... AFE_IRQ4_MCU_CNT_MON:
+	case AFE_IRQ_MCU_STATUS ... AFE_IRQ_MCU_CLR:
 	case AFE_IRQ_MCU_MON2:
-	case AFE_IRQ1_MCU_CNT_MON:
-	case AFE_IRQ2_MCU_CNT_MON:
-	case AFE_IRQ1_MCU_EN_CNT_MON:
-	case AFE_IRQ5_MCU_CNT_MON:
+	case AFE_IRQ1_MCU_CNT_MON ... AFE_IRQ5_MCU_CNT_MON:
 	case AFE_IRQ7_MCU_CNT_MON:
 	case AFE_GAIN1_CUR:
 	case AFE_GAIN2_CUR:
 	case AFE_SRAM_DELSEL_CON0:
-	case AFE_SRAM_DELSEL_CON2:
-	case AFE_SRAM_DELSEL_CON3:
-	case AFE_ASRC_2CH_CON12:
-	case AFE_ASRC_2CH_CON13:
+	case AFE_SRAM_DELSEL_CON2 ... AFE_SRAM_DELSEL_CON3:
+	case AFE_ASRC_2CH_CON12 ... AFE_ASRC_2CH_CON13:
 	case PCM_INTF_CON2:
-	case FPGA_CFG0:
-	case FPGA_CFG1:
-	case FPGA_CFG2:
-	case FPGA_CFG3:
-	case AUDIO_TOP_DBG_MON0:
-	case AUDIO_TOP_DBG_MON1:
-	case AFE_IRQ8_MCU_CNT_MON:
-	case AFE_IRQ11_MCU_CNT_MON:
-	case AFE_IRQ12_MCU_CNT_MON:
+	case FPGA_CFG0 ... FPGA_CFG1:
+	case FPGA_CFG2 ... FPGA_CFG3:
+	case AUDIO_TOP_DBG_MON0 ... AUDIO_TOP_DBG_MON1:
+	case AFE_IRQ8_MCU_CNT_MON ... AFE_IRQ12_MCU_CNT_MON:
 	case AFE_CBIP_MON0:
-	case AFE_CBIP_SLV_MUX_MON0:
-	case AFE_CBIP_SLV_DECODER_MON0:
+	case AFE_CBIP_SLV_MUX_MON0 ... AFE_CBIP_SLV_DECODER_MON0:
 	case AFE_ADDA6_SRC_DEBUG_MON0:
-	case AFE_ADD6A_UL_SRC_MON0:
-	case AFE_ADDA6_UL_SRC_MON1:
+	case AFE_ADD6A_UL_SRC_MON0... AFE_ADDA6_UL_SRC_MON1:
 	case AFE_DL1_CUR_MSB:
 	case AFE_DL2_CUR_MSB:
 	case AFE_AWB_CUR_MSB:
@@ -622,55 +582,23 @@ static bool mt8183_is_volatile_reg(struct device *dev, unsigned int reg)
 	case AFE_VUL_D2_CUR_MSB:
 	case AFE_DL3_CUR_MSB:
 	case AFE_HDMI_OUT_CUR_MSB:
-	case AFE_AWB2_END:
-	case AFE_AWB2_CUR:
+	case AFE_AWB2_END ... AFE_AWB2_CUR:
 	case AFE_AWB2_CUR_MSB:
-	case AFE_ADDA_DL_SDM_FIFO_MON:
-	case AFE_ADDA_DL_SRC_LCH_MON:
-	case AFE_ADDA_DL_SRC_RCH_MON:
-	case AFE_ADDA_DL_SDM_OUT_MON:
-	case AFE_CONNSYS_I2S_MON:
-	case AFE_ASRC_2CH_CON0:
-	case AFE_ASRC_2CH_CON2:
-	case AFE_ASRC_2CH_CON3:
-	case AFE_ASRC_2CH_CON4:
-	case AFE_ASRC_2CH_CON5:
-	case AFE_ASRC_2CH_CON7:
-	case AFE_ASRC_2CH_CON8:
-	case AFE_MEMIF_MON12:
-	case AFE_MEMIF_MON13:
-	case AFE_MEMIF_MON14:
-	case AFE_MEMIF_MON15:
-	case AFE_MEMIF_MON16:
-	case AFE_MEMIF_MON17:
-	case AFE_MEMIF_MON18:
-	case AFE_MEMIF_MON19:
-	case AFE_MEMIF_MON20:
-	case AFE_MEMIF_MON21:
-	case AFE_MEMIF_MON22:
-	case AFE_MEMIF_MON23:
-	case AFE_MEMIF_MON24:
-	case AFE_ADDA_MTKAIF_MON0:
-	case AFE_ADDA_MTKAIF_MON1:
+	case AFE_ADDA_DL_SDM_FIFO_MON ... AFE_ADDA_DL_SDM_OUT_MON:
+	case AFE_CONNSYS_I2S_MON ... AFE_ASRC_2CH_CON0:
+	case AFE_ASRC_2CH_CON2 ... AFE_ASRC_2CH_CON5:
+	case AFE_ASRC_2CH_CON7 ... AFE_ASRC_2CH_CON8:
+	case AFE_MEMIF_MON12 ... AFE_MEMIF_MON24:
+	case AFE_ADDA_MTKAIF_MON0 ... AFE_ADDA_MTKAIF_MON1:
 	case AFE_AUD_PAD_TOP:
 	case AFE_GENERAL1_ASRC_2CH_CON0:
-	case AFE_GENERAL1_ASRC_2CH_CON2:
-	case AFE_GENERAL1_ASRC_2CH_CON3:
-	case AFE_GENERAL1_ASRC_2CH_CON4:
-	case AFE_GENERAL1_ASRC_2CH_CON5:
-	case AFE_GENERAL1_ASRC_2CH_CON7:
-	case AFE_GENERAL1_ASRC_2CH_CON8:
-	case AFE_GENERAL1_ASRC_2CH_CON12:
-	case AFE_GENERAL1_ASRC_2CH_CON13:
+	case AFE_GENERAL1_ASRC_2CH_CON2 ... AFE_GENERAL1_ASRC_2CH_CON5:
+	case AFE_GENERAL1_ASRC_2CH_CON7 ... AFE_GENERAL1_ASRC_2CH_CON8:
+	case AFE_GENERAL1_ASRC_2CH_CON12 ... AFE_GENERAL1_ASRC_2CH_CON13:
 	case AFE_GENERAL2_ASRC_2CH_CON0:
-	case AFE_GENERAL2_ASRC_2CH_CON2:
-	case AFE_GENERAL2_ASRC_2CH_CON3:
-	case AFE_GENERAL2_ASRC_2CH_CON4:
-	case AFE_GENERAL2_ASRC_2CH_CON5:
-	case AFE_GENERAL2_ASRC_2CH_CON7:
-	case AFE_GENERAL2_ASRC_2CH_CON8:
-	case AFE_GENERAL2_ASRC_2CH_CON12:
-	case AFE_GENERAL2_ASRC_2CH_CON13:
+	case AFE_GENERAL2_ASRC_2CH_CON2 ... AFE_GENERAL2_ASRC_2CH_CON5:
+	case AFE_GENERAL2_ASRC_2CH_CON7 ... AFE_GENERAL2_ASRC_2CH_CON8:
+	case AFE_GENERAL2_ASRC_2CH_CON12 ... AFE_GENERAL2_ASRC_2CH_CON13:
 		return true;
 	default:
 		return false;
-- 
2.49.0.850.g28803427d3-goog


