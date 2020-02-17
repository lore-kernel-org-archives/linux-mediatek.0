Return-Path: <SRS0=sDSL=4F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C9E2C7619B
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 03:17:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1072B208C4
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 03:17:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uzpnxcSK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="XM+8y09N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1072B208C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X+MucpNAlEl/OoR7vNng0V1eHWECF/lqKpgIM1aSfK4=; b=uzpnxcSK708TiF
	G0t8BuFfYLmU5ub0UJcWgZkShyyocrHGoRYQvdBQWAM0FYHjI1Ymz0mk5YBG408gU99FUcbxSr4Bq
	IauIH49HFgjsiWstiB7JHyuLPumn0FZ/FvH420hMwBznpi9Gxr167ROBTauTLnIaRcis5FuoPoubv
	pV6BFZKEuKob8ElODxeee/7VNBEIWc2Sx7buGeXV0YKgGEiOTJlbmZqY1ey2o53JnLRr8MuBm75Gp
	UQRNmxNR8Z+JL0Nij8u42WPttU/f21c0F0acsKXsXjPQ73U6URS3wBqDKlmEByx8ovMj1T5DVgaWY
	i52Q+vUo7z5uvafFV9BA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3WuY-00038S-6n; Mon, 17 Feb 2020 03:17:30 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3WuF-0002iK-KT
 for linux-mediatek@lists.infradead.org; Mon, 17 Feb 2020 03:17:12 +0000
Received: by mail-pg1-x549.google.com with SMTP id i21so10824315pgm.21
 for <linux-mediatek@lists.infradead.org>; Sun, 16 Feb 2020 19:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=WyY8AR/W9Xhoq+FoZI+JwslnVAFfNuC6P4tiCJpqlNM=;
 b=XM+8y09NmdcBqI5tENuyJPgoZPkNcFlWhBEVm/VyNB+qqCVUPFfySf1XAX9fcSBAQN
 eoRDs7U0lYvGlwNkmFXyFzeq6BdniLjOJdL8ITVb/+H3yghkqT+ZlpKBIGI884IyFMKE
 W+qoM4sYK9ncnSBM1vyoFvhdPR3Y+wXyKIsptwL6L4IBBER1s29g3hi9t7du2SiwtH9a
 ihemetgpwqoBtq8J7DqYEER4KfPtAMXdRYwRUdSF3OwK5AHiXTqky3ZK0LAlUctdGYFs
 xmKWCss+5sKWOwC/dkSf/EEGUoIDUZOJFRfZNiJ+iincRUpl9wM1x5EGjizutSP0ABkC
 De8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=WyY8AR/W9Xhoq+FoZI+JwslnVAFfNuC6P4tiCJpqlNM=;
 b=luYv22kiHhR0zbXqwKNixH5qpaPH19UbYW4kh3OEHxq9o9CgDNywIp/PtK7Bw18oBV
 r5V45LHDMxkJuuiBBgFW//lp+w/F709FEmJMHZ+EtdoS+MDvUTKA5NvPi3Auk1msWwZS
 7Bq81xeNr5E52/AbhoKXKMugI/pKU7aGeZRZ2KxPpgs0vXltQG9YVbhHO971sKYDF6hA
 JTAPyjG9oghY1e8V+DXzfTbZ7SFHFgg2AuVW+nVQqkBT36SJeMjDmWhR/C9zwP1YBRow
 mQJfd0AhW8os2peo9X6yGK3/R/1I0yMRNcZOefa3Jx8jSaVEl+enfT/tNQVXSvS3jcLQ
 64+A==
X-Gm-Message-State: APjAAAU0aPr/k2icplNeGq6uISdT4jXs2zTCYLlqVU2TSH0AHbzADZnH
 QP77h0vpUW6vyxE4MZUgkG9azcnk3zpq
X-Google-Smtp-Source: APXvYqyaA0c4C3Cy5dT8KODvRZRHXgVJd5DJOU44ArgLhO1/lknUXh2t3cF80g4vSNUWgNRWhTevS8xJmETl
X-Received: by 2002:a63:ac46:: with SMTP id z6mr13808575pgn.301.1581909425929; 
 Sun, 16 Feb 2020 19:17:05 -0800 (PST)
Date: Mon, 17 Feb 2020 11:16:52 +0800
In-Reply-To: <20200217031653.52345-1-tzungbi@google.com>
Message-Id: <20200217105513.1.Icc323daaf71ad02f191fd8d91136b01b61eca5e3@changeid>
Mime-Version: 1.0
References: <20200217031653.52345-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH v2 1/2] ASoC: hdmi-codec: set plugged_cb to NULL when
 component removing
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, airlied@linux.ie, daniel@ffwll.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200216_191711_691512_C1DA8EF0 
X-CRM114-Status: GOOD (  10.05  )
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

Sets plugged_cb to NULL when component removing to notify its consumers
: no further plugged status report is required.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/hdmi-codec.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 444cc4e3374e..f005751da2cc 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -779,7 +779,17 @@ static int hdmi_of_xlate_dai_id(struct snd_soc_component *component,
 	return ret;
 }
 
+static void hdmi_remove(struct snd_soc_component *component)
+{
+	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
+
+	if (hcp->hcd.ops->hook_plugged_cb)
+		hcp->hcd.ops->hook_plugged_cb(component->dev->parent,
+					      hcp->hcd.data, NULL, NULL);
+}
+
 static const struct snd_soc_component_driver hdmi_driver = {
+	.remove			= hdmi_remove,
 	.dapm_widgets		= hdmi_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(hdmi_widgets),
 	.of_xlate_dai_id	= hdmi_of_xlate_dai_id,
-- 
2.25.0.265.gbab2e86ba0-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
