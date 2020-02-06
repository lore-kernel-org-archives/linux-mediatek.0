Return-Path: <SRS0=Uacl=32=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20A6C35254
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2020 03:19:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FFFE20674
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2020 03:19:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YgqkOTBH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ueuYkYfz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FFFE20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TyM9YyXLVyuAEaWpwUxg2xwPZ+OArY6vtEsJWHXx0js=; b=YgqkOTBHlcpyyU
	Rz40yd6qXNyQ5gGoIFpgh3TQsOqCRJRNcobnDQGosKWo8jQ25ZViPooBetVvMs4htrB3hhEl4Nx6j
	bgQqEucpGWOw4my7AKRBeBdl9RshxA6IVLvy4KTAFLTODBB2nPHXUC7phbhsg7iY9OmvNy3ueUgbv
	MRV6WUjF7W9cf1OdUSsFRh+XgrcdIb+I4WloOc87CQh8JrKvUG42J1ZZM+IkfPeSia0vs1EwyBGy+
	ugd76pgBHOGFS3pf9SXaVcxP6KtQo7OcIcYAsTiFGa3vDmUkTaDLcxPSU9t5zVBzc/IOr5VKnaYYb
	Mq6xx/glIugEuDAb+gjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izXgw-0004Uy-MS; Thu, 06 Feb 2020 03:18:58 +0000
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izXgS-0003zM-DX
 for linux-mediatek@lists.infradead.org; Thu, 06 Feb 2020 03:18:30 +0000
Received: by mail-qk1-x749.google.com with SMTP id 12so2681397qkf.20
 for <linux-mediatek@lists.infradead.org>; Wed, 05 Feb 2020 19:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=3xSqtFmkuhmH7fZvAamf8hbYq+ufSxebJYVWVye4C7Y=;
 b=ueuYkYfzd1J7mUX84rods+zZPBEDPeQEpjWo1fKgNXmmkJRjFmQ57clQ25FbxVrB81
 0BoeuWRSAlLi4ikcBydPblOqMIIYdUZlWt96IlppvTopxt4MrWxe1NJNb00pEILdALIL
 mwP9m3shNI4otFS5JNL2mDva9EvmqHjaLpSPV+4fWAoYFTZp1nvG0CRMuMvaQQpiTocd
 RdQCWBIwo+BGVgpp3NbIEtfA/GO13BcJrwl9r2EoO9jqfv5ogBgO5W/6Q7nyLCxted8+
 Q/tls29mCNiLAHzFozF2uSg8V5VCuOfUUjtgXE6vmEdrV5rvwC9qaa9Tedzul30Dx9L2
 FkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=3xSqtFmkuhmH7fZvAamf8hbYq+ufSxebJYVWVye4C7Y=;
 b=Bpq0DAIKygDCk/FYEGKLspA0hzCh1PjMj/Ey5mouecnAE//giPHJp3dY9FOZsZLnuD
 XMvztJ8BIoYGoJc6PkwILr9jUEe9Fu5Zx9zgx4wDVez+D8Pe3RyfoX8oU1I2mRr4T1wa
 mMO7l32TMn0ZZfeZ85/HA9YFuz3FcfZqDHQ3YQzl6w2V4DGgTusykNA3MniQxfRrXHy5
 AFjiXhIFG0DMe8xlvm4rN9aAMVavwHT6hK1eFFjU3zs/Ku+UDR7ofl93zdpfD2r54ext
 TQ83mTE+nGAyZ/ulUK2xGRsG6O7B5rwaKuOjaFrLWBvi35c1bTKFVVsMpiuWPWYQ4C/e
 97eA==
X-Gm-Message-State: APjAAAUh0pk/vokUU9hOf2qTWGrICpWuK9d4phzibtMnUCYMrbX8T46X
 eIFDXcc159IupUKIUFnGT/mKBoCcLi35
X-Google-Smtp-Source: APXvYqz/fAMuYGvIwuayOCKaf8jH3Jt4uA2sxWoRh0ciqFGB/O4svWNUa/d29O7qRqPWaudemfa9s6lehhZc
X-Received: by 2002:a0c:fe8e:: with SMTP id d14mr705336qvs.106.1580959106204; 
 Wed, 05 Feb 2020 19:18:26 -0800 (PST)
Date: Thu,  6 Feb 2020 11:17:52 +0800
In-Reply-To: <20200206031752.193298-1-tzungbi@google.com>
Message-Id: <20200206102509.3.I253f51edff62df1d88005de12ba601aa029b1e99@changeid>
Mime-Version: 1.0
References: <20200206031752.193298-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v2 3/3] ASoC: mediatek: mt8173-rt5650: support HDMI jack
 reporting
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, airlied@linux.ie, daniel@ffwll.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_191828_542454_DA037D3E 
X-CRM114-Status: GOOD (  10.43  )
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
Cc: alsa-devel@alsa-project.org, cychiang@google.com, tzungbi@google.com,
 dri-devel@lists.freedesktop.org, ck.hu@mediatek.com,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, dgreid@google.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Uses hdmi-codec to support HDMI jack reporting.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/mt8173/mt8173-rt5650.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index ef6f23675286..849b050a54d1 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -11,6 +11,7 @@
 #include <linux/of_gpio.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
+#include <sound/hdmi-codec.h>
 #include "../../codecs/rt5645.h"
 
 #define MCLK_FOR_CODECS		12288000
@@ -98,7 +99,7 @@ static const struct snd_soc_ops mt8173_rt5650_ops = {
 	.hw_params = mt8173_rt5650_hw_params,
 };
 
-static struct snd_soc_jack mt8173_rt5650_jack;
+static struct snd_soc_jack mt8173_rt5650_jack, mt8173_rt5650_hdmi_jack;
 
 static int mt8173_rt5650_init(struct snd_soc_pcm_runtime *runtime)
 {
@@ -144,6 +145,19 @@ static int mt8173_rt5650_init(struct snd_soc_pcm_runtime *runtime)
 				      &mt8173_rt5650_jack);
 }
 
+static int mt8173_rt5650_hdmi_init(struct snd_soc_pcm_runtime *rtd)
+{
+	int ret;
+
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
+				    &mt8173_rt5650_hdmi_jack, NULL, 0);
+	if (ret)
+		return ret;
+
+	return hdmi_codec_set_jack_detect(rtd->codec_dai->component,
+					  &mt8173_rt5650_hdmi_jack);
+}
+
 enum {
 	DAI_LINK_PLAYBACK,
 	DAI_LINK_CAPTURE,
@@ -222,6 +236,7 @@ static struct snd_soc_dai_link mt8173_rt5650_dais[] = {
 		.name = "HDMI BE",
 		.no_pcm = 1,
 		.dpcm_playback = 1,
+		.init = mt8173_rt5650_hdmi_init,
 		SND_SOC_DAILINK_REG(hdmi_be),
 	},
 };
-- 
2.25.0.341.g760bfbb309-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
