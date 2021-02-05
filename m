Return-Path: <SRS0=sOPI=HH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C06CC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 08:18:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B153764F91
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 08:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B153764F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vJaoox6fiCK4yWn1h4YBsK2HLDFb+0w/Q1x6wdIdZao=; b=ZRewcs7vG0Kk85/mwnfb18ezcr
	huNGBhImSfnBIFfNIX3Lh4aBJg0zaZXnRnhLAIwYYXPt79c3vZTTt1+++liX5gr8JrA2TrvQh7Cah
	jB0ng2zM9K2stQkm/TgCWlakIoFMFFpX9fGZSZwFqwA1T7lNAhuxLvfCh3l21XYX3kKW88MFZFa+R
	RBQIFZ90f0D9s43dkRXwNxSBv+KaVzgZcztf+UBvR6UqD68euqUwzYTZ4R3lgmNnUCMyNWzbS39Iw
	hE7D24RnB7/tolXF8dilCfCIS7gJuzousdYmO+X/IOycOtf+2X29x/WvqE9yV+7EuA4DmpSl3KXUo
	WTuPvIPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7wJV-0003Dy-Ei; Fri, 05 Feb 2021 08:18:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7wJS-0003Ci-EB; Fri, 05 Feb 2021 08:17:59 +0000
X-UUID: f15a2383b53e4242bad49af67471358f-20210205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=NG+H6DQf7vMRzu/aBlcDFo2ASq4rEMiKUDfTT9VgBQg=; 
 b=DPlyIsgTCC+YMQutv9YL8ohr1KA10rx077rmZMyoey6J3+d6GakY+OmyXqwMJMJLvoq8P2VmUB0BkCPiDFy+s5g/x0wRJWu+9ZNNsn3CAvaBnHQVD0HjQsuVlgQJu+OeJXHlrhTHEgsqP50pHU+gtdCkvF6mgKcMntIqgmG3kyk=;
X-UUID: f15a2383b53e4242bad49af67471358f-20210205
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1290950267; Fri, 05 Feb 2021 00:17:51 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Feb 2021 00:17:49 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Feb 2021 16:16:55 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Feb 2021 16:16:55 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: mediatek: mt8183-mt6358: set playback and capture
 constraints
Date: Fri, 5 Feb 2021 16:16:52 +0800
Message-ID: <1612513012-27688-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: ABDA0BD1C6EEB5A07F7B91F8D61EE9147B36F064D4DF7B33ACAC22C941DBE8892000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_031758_684551_1FC447BB 
X-CRM114-Status: GOOD (  11.92  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 tiwai@suse.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 linux-kernel@vger.kernel.org, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 cychiang@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Sets playback and capture constraints to S16_LE, stereo, 48kHz.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 3cf8aea..271413e 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -118,6 +118,45 @@ static int mt8183_rt1015_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 }
 
 static int
+mt8183_mt6358_startup(struct snd_pcm_substream *substream)
+{
+	static const unsigned int rates[] = {
+		48000,
+	};
+	static const struct snd_pcm_hw_constraint_list constraints_rates = {
+		.count = ARRAY_SIZE(rates),
+		.list  = rates,
+		.mask = 0,
+	};
+	static const unsigned int channels[] = {
+		2,
+	};
+	static const struct snd_pcm_hw_constraint_list constraints_channels = {
+		.count = ARRAY_SIZE(channels),
+		.list = channels,
+		.mask = 0,
+	};
+
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	snd_pcm_hw_constraint_list(runtime, 0,
+				   SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
+	runtime->hw.channels_max = 2;
+	snd_pcm_hw_constraint_list(runtime, 0,
+				   SNDRV_PCM_HW_PARAM_CHANNELS,
+				   &constraints_channels);
+
+	runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
+	snd_pcm_hw_constraint_msbits(runtime, 0, 16, 16);
+
+	return 0;
+}
+
+static const struct snd_soc_ops mt8183_mt6358_ops = {
+	.startup = mt8183_mt6358_startup,
+};
+
+static int
 mt8183_mt6358_ts3a227_max98357_bt_sco_startup(
 	struct snd_pcm_substream *substream)
 {
@@ -356,6 +395,7 @@ static void mt8183_mt6358_tdm_shutdown(struct snd_pcm_substream *substream)
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		.ops = &mt8183_mt6358_ops,
 		SND_SOC_DAILINK_REG(playback1),
 	},
 	{
@@ -403,6 +443,7 @@ static void mt8183_mt6358_tdm_shutdown(struct snd_pcm_substream *substream)
 			    SND_SOC_DPCM_TRIGGER_PRE},
 		.dynamic = 1,
 		.dpcm_capture = 1,
+		.ops = &mt8183_mt6358_ops,
 		SND_SOC_DAILINK_REG(capture3),
 	},
 	{
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
