Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7904FC25B08
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 03:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EALpKughYJVN4eL+rE5tR0CgISez0fYXKza8J2Flgug=; b=K99OT5WWd6LzWxB0BFjGoE/o82
	JKb90ULqaja8Opwc3zDLw/bIyw4r70UPD7tvhoCtkVk+1EeHO/sojHHqiR7Z3hGtVW8FTcXaSg9KD
	3NCfZfIY68/wa+EzzAxjjxhOqWLmMCBZqg06KvGi2wtxa2Siu1PnTR4dfZiNnaSK4YdyVHV5p4SvQ
	rZ3WbqGN81w/614H89KfCvHtKodDgmbahr6oaRWqlukeghmm9+RflrcCq/KnGiy2LZJiqoYTwksqR
	UHhys3GXYB8QNJ5FkP1h3onyFTbETQVKPs90apkob1ZDyi9Jtet7iR+zK9/Olus8/9jfLMPFmDpn+
	qAnBGCYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOW3C-00ClyL-Oc; Thu, 18 Aug 2022 03:18:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOW3A-00Clqp-8h; Thu, 18 Aug 2022 03:18:29 +0000
X-UUID: 1fbb9c1f270149efb12976de930b887d-20220817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=EALpKughYJVN4eL+rE5tR0CgISez0fYXKza8J2Flgug=;
	b=SJky7Y+aUlPnfctT+069EZMYV3H5G1PvsFnFbp+Hiu8u5+44qF5Xd57WfaX0x3ou3boZ9kyZox/DlHg4kRx/hjvpgssstexN7Ljwmeb3oWBEwbkKqKgjj9for6QwIrk+9UpwpMaYU87jRMeuke3Pv0OQqXJ401v74YgkU3uDFOo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:f394a378-0808-42c7-b7b5-69d28b3a64ed,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:271a25af-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1fbb9c1f270149efb12976de930b887d-20220817
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunxu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1176937370; Wed, 17 Aug 2022 20:12:23 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 18 Aug 2022 10:51:20 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 18 Aug 2022 10:51:19 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <jiaxin.yu@mediatek.com>, <tzungbi@google.com>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<project_global_chrome_upstream_group@mediatek.com>, Chunxu Li
	<chunxu.li@mediatek.com>
Subject: [PATCH RESEND 1/3] ASoC: mediatek: mt8186: support DSP downlink
Date: Thu, 18 Aug 2022 10:51:11 +0800
Message-ID: <20220818025113.17144-2-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818025113.17144-1-chunxu.li@mediatek.com>
References: <20220818025113.17144-1-chunxu.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_201828_361061_ADC7D2E0 
X-CRM114-Status: UNSURE (   9.10  )
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
index d7a227169548..e553a555d168 100644
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
2.25.1


