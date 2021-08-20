Return-Path: <SRS0=yE1p=NL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBAA3C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 13:03:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 775AC610CA
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 13:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 775AC610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nPcxsskoF19GbwUWazlKqz3PrgXsyUKGpCQ4twm94BQ=; b=hMmkldORD9CNP+
	sVqLOYtIeKhRbai8WDUblbIBqfUkIC8Tr16PkPFXMW+FASIgGAZ0PessszmxikQX5kfYD8VfJi5+S
	wGJ9n1D+74QaBGx/iM7/TGkGHiAmDSRcRJEeZ3+UdkQ+PBTsUHZ8VcggLHtP/gmvvqjO3PpiJmUTe
	G/2ilQy3dVNUBAaIoHs9sMMtlDnvPW5H1Ry9PRIkNZewjWkYo+QFv80GkZjZJe+VjgbJDkByct8/n
	Bq/iIN5LSarlPPYpakj6qh3O/6iJbwa0dffO5S3N85eHPkNpW0FcwSQ/G46fNkip2ztD4Vgir1Orn
	+tZyTj5OCwEL9B7IZR7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH4Ab-00BDmE-K4; Fri, 20 Aug 2021 13:02:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH4AK-00BDjq-Lo; Fri, 20 Aug 2021 13:02:37 +0000
X-UUID: f8778c64684948a9a80bd9657c2a9a2a-20210820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Pvpi5r5EUk7jaAtme8LpXTHr1qAdnmuVSVNnoYrdr0o=; 
 b=FXxIQEfoXK6NFXExlJAt46NNdDpl2hEnOl+JT6wEIy35ltLJu3IBWxxCKQj2/6yDP2yg5Jf/11aLtqHUpNPJDPkZwDemT7Z0SQHwWSxGRi/9Dp3qzNJK6z6U34zEK4G+UKZQAbow24aTTbSOh2lRavgRMVdSvH5mBnZQtmweIF8=;
X-UUID: f8778c64684948a9a80bd9657c2a9a2a-20210820
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chien-yu.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1058692239; Fri, 20 Aug 2021 06:02:28 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 06:02:26 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 21:02:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 20 Aug 2021 21:02:25 +0800
From: Chien-Yu Lin <chien-yu.lin@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <yichin.huang@mediatek.com>, <hungjung.hsu@mediatek.com>,
 <allen-hw.hsu@mediatek.com>, <chien-yu.lin@mediatek.com>
Subject: [PATCH] ASoc: fix ASoC driver to support ops to register get_time_info
Date: Fri, 20 Aug 2021 21:02:10 +0800
Message-ID: <20210820130210.3321-1-chien-yu.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_060234_169317_076F4DDF 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "chien-yu.lin" <chien-yu.lin@mediatek.com>

Because ASoC soc_new_pcm() function didn't register
.get_time_info() ops and cause snd_pcm_update_hw_ptr0() can not find
substream->ops->get_time_info, it will not be called due to ASoC
driver which register in HW device driver.

Add .get_time_info() ops in ASoC soc_new_pcm() and
register by snd_pcm_set_ops() function.
If HW device driver want to implment timestamp by itself,
ASoC should register .get_time_info function.

Signed-off-by: chien-yu.lin <chien-yu.lin@mediatek.com>
---
 include/sound/soc-component.h |  4 ++++
 sound/soc/soc-component.c     | 21 +++++++++++++++++++++
 sound/soc/soc-pcm.c           |  2 ++
 3 files changed, 27 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 8c4d6830597f..52b5228b7a8d 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -484,6 +484,10 @@ int snd_soc_pcm_component_sync_stop(struct snd_pcm_substream *substream);
 int snd_soc_pcm_component_copy_user(struct snd_pcm_substream *substream,
 				    int channel, unsigned long pos,
 				    void __user *buf, unsigned long bytes);
+int snd_soc_pcm_component_get_time_info(struct snd_pcm_substream *substream,
+					struct timespec64 *system_ts, struct timespec64 *audio_ts,
+					struct snd_pcm_audio_tstamp_config *audio_tstamp_config,
+					struct snd_pcm_audio_tstamp_report *audio_tstamp_report);
 struct page *snd_soc_pcm_component_page(struct snd_pcm_substream *substream,
 					unsigned long offset);
 int snd_soc_pcm_component_mmap(struct snd_pcm_substream *substream,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 3a5e84e16a87..56caec7ec00b 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1000,6 +1000,27 @@ int snd_soc_pcm_component_copy_user(struct snd_pcm_substream *substream,
 	return -EINVAL;
 }
 
+int snd_soc_pcm_component_get_time_info(struct snd_pcm_substream *substream,
+					struct timespec64 *system_ts, struct timespec64 *audio_ts,
+					struct snd_pcm_audio_tstamp_config *audio_tstamp_config,
+					struct snd_pcm_audio_tstamp_report *audio_tstamp_report)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_component *component;
+	int i;
+
+	/* FIXME. it returns 1st get_time_info now */
+	for_each_rtd_components(rtd, i, component) {
+		if (component->driver->get_time_info)
+			return soc_component_ret(component,
+				component->driver->get_time_info(component,
+				substream, system_ts, audio_ts,
+				audio_tstamp_config, audio_tstamp_report));
+	}
+
+	return -EINVAL;
+}
+
 struct page *snd_soc_pcm_component_page(struct snd_pcm_substream *substream,
 					unsigned long offset)
 {
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index d1c570ca21ea..cff7025027a6 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2786,6 +2786,8 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 			rtd->ops.mmap		= snd_soc_pcm_component_mmap;
 		if (drv->ack)
 			rtd->ops.ack            = snd_soc_pcm_component_ack;
+		if (drv->get_time_info)
+			rtd->ops.get_time_info	= snd_soc_pcm_component_get_time_info;
 	}
 
 	if (playback)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
