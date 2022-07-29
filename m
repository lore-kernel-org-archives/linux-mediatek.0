Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A859C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 09:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MaI3gZ5KXO098DayDXRisWnPjpwBdZbKeEz9oN9Yyzo=; b=CC9xbWyafaXaaUIUbbQ7mPZZMh
	cVw2UL7cIReFLkZ4tcSXKoEhw4LSq1djg6hjnjkAod4d1/AWVzDnO6OES1NLmHuzCwWgFrTbuVK+4
	Ol1J1dJNea/wBFa8zgce+hfk4con6bGnh13NzNH5SAw+oqjc17LugO9lQoC3zPn+Ie5Nk8XJX+dPH
	UXrDsjjCDAXdLG07LjQ+CyZRrxP3vjeAHh8T975gI3raQFMGlICsPkIlTEWXtBQIyVFA+bDujkpEt
	2/1Z9Y+mhh4QTS0Ld74HtDimYFN7UMk5OXXkaDTxODK8FW5bTtYbFabGc4YdiNqdfVlBGjMEOns3n
	Ri2ipnuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHM77-003icF-3X; Fri, 29 Jul 2022 09:16:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHM65-003iAC-05; Fri, 29 Jul 2022 09:15:54 +0000
X-UUID: a0822812c2334e11b188b082f85618c9-20220729
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:2d268656-8771-4545-a10b-cf04813bf90b,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:5504bfcf-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: a0822812c2334e11b188b082f85618c9-20220729
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chunxu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 571014674; Fri, 29 Jul 2022 02:15:46 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 29 Jul 2022 17:14:14 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 29 Jul 2022 17:14:14 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <jiaxin.yu@mediatek.com>, <tzungbi@google.com>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<project_global_chrome_upstream_group@mediatek.com>, Chunxu Li
	<chunxu.li@mediatek.com>
Subject: [PATCH 1/3] ASoC: mediatek: mt8186: support DSP downlink
Date: Fri, 29 Jul 2022 17:14:02 +0800
Message-ID: <20220729091404.7799-2-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220729091404.7799-1-chunxu.li@mediatek.com>
References: <20220729091404.7799-1-chunxu.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_021553_078437_4D830A6A 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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

1. add DSP downlink link widget
2. add DSP to I2S route path

Signed-off-by: Chunxu Li <chunxu.li@mediatek.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c |  3 +++
 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index eb729ab00f5a..d7e94e6a19c7 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -1359,6 +1359,9 @@ static const struct snd_soc_dapm_widget mt8186_memif_widgets[] = {
 	SND_SOC_DAPM_MUX("UL5_IN_MUX", SND_SOC_NOPM, 0, 0,
 			 &ul5_in_mux_control),
 
+	SND_SOC_DAPM_MIXER("DSP_DL1_VIRT", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("DSP_DL2_VIRT", SND_SOC_NOPM, 0, 0, NULL, 0),
+
 	SND_SOC_DAPM_INPUT("UL1_VIRTUAL_INPUT"),
 	SND_SOC_DAPM_INPUT("UL2_VIRTUAL_INPUT"),
 	SND_SOC_DAPM_INPUT("UL3_VIRTUAL_INPUT"),
diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c b/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
index ec79e2f2a54d..32778799d708 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
@@ -658,9 +658,15 @@ static const struct snd_soc_dapm_route mtk_dai_i2s_routes[] = {
 	{"I2S1_CH1", "DL1_CH1 Switch", "DL1"},
 	{"I2S1_CH2", "DL1_CH2 Switch", "DL1"},
 
+	{"I2S1_CH1", "DL1_CH1 Switch", "DSP_DL1_VIRT"},
+	{"I2S1_CH2", "DL1_CH2 Switch", "DSP_DL1_VIRT"},
+
 	{"I2S1_CH1", "DL2_CH1 Switch", "DL2"},
 	{"I2S1_CH2", "DL2_CH2 Switch", "DL2"},
 
+	{"I2S1_CH1", "DL2_CH1 Switch", "DSP_DL2_VIRT"},
+	{"I2S1_CH2", "DL2_CH2 Switch", "DSP_DL2_VIRT"},
+
 	{"I2S1_CH1", "DL3_CH1 Switch", "DL3"},
 	{"I2S1_CH2", "DL3_CH2 Switch", "DL3"},
 
@@ -728,9 +734,15 @@ static const struct snd_soc_dapm_route mtk_dai_i2s_routes[] = {
 	{"I2S3_CH1", "DL1_CH1 Switch", "DL1"},
 	{"I2S3_CH2", "DL1_CH2 Switch", "DL1"},
 
+	{"I2S3_CH1", "DL1_CH1 Switch", "DSP_DL1_VIRT"},
+	{"I2S3_CH2", "DL1_CH2 Switch", "DSP_DL1_VIRT"},
+
 	{"I2S3_CH1", "DL2_CH1 Switch", "DL2"},
 	{"I2S3_CH2", "DL2_CH2 Switch", "DL2"},
 
+	{"I2S3_CH1", "DL2_CH1 Switch", "DSP_DL2_VIRT"},
+	{"I2S3_CH2", "DL2_CH2 Switch", "DSP_DL2_VIRT"},
+
 	{"I2S3_CH1", "DL3_CH1 Switch", "DL3"},
 	{"I2S3_CH2", "DL3_CH2 Switch", "DL3"},
 
-- 
2.18.0


