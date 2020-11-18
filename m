Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3DF1C5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 04:39:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8921721D7E
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 04:39:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j3k9k4S9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O940nd56"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8921721D7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=46jLdmmWEdgskkhel+9MzH7p3D8oUCPRls1J/9gLRKQ=; b=j3k9k4S9qD82EhcD3cIPGb0vxs
	+t5M+3rYVBzq72FNMW2bCNfWRblnGW40RxIO6WZfG9rTdlDbz3uSWXO7LPtFfhuNuUeqpnYVdv8km
	xl4tMpIxKOs7kpaC7N1x3dch5r9PqXcdveXRgClXqvOpXYxVEXaK0n8qjBrgZ3XlT5Dph9HQ1HBXD
	JPhrla+HxlmqkCmMCKjmgupolxfZGinaCkBiI/ZniqfygrfRSDoJKrktHUWCZ5AUu1n5bQEf6L9Sj
	46hWTAYopD6COG/wq0SX+W15GU+nc2Hh4183RHvHppo9/xZvx8ZDMMGxJFVim9fHMVMjTfH9jKh+4
	4xkauF0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfFFG-00040l-TW; Wed, 18 Nov 2020 04:39:02 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfFFE-0003zJ-Io
 for linux-mediatek@lists.infradead.org; Wed, 18 Nov 2020 04:39:01 +0000
Received: by mail-pg1-x544.google.com with SMTP id j19so333611pgg.5
 for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2020 20:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=owERzaYqHwi5W3jNP2ap5wqI6aYFg8h8r6Iq4kQIegs=;
 b=O940nd56EF39C6shvsKKS7HBzyblt8tQFn/ktV4VByDF3Bk4MvBDHLBh6/6DWlKKb2
 3TKGn7hW4DPSD1Yoqk7hTzjznUzG8YnmM1jz+RF7xckxqITG1sWpbnUeBApKS507K4v6
 F6l1Hpgmi4AZL6YUSAnqGw34DuXTeMVLXekVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=owERzaYqHwi5W3jNP2ap5wqI6aYFg8h8r6Iq4kQIegs=;
 b=XA42Hgj2Q59hKTjJdOTUakxfPrC0ZAyN5S2Yt+cT2k3OCbxLZQifp0it2iFp2rKCk8
 8G2YxY+s03Trrm+72zMuo2Ita7D1oGmFW43Wr1bqYY7v6tS1JSsn6QcVsaYksdC0IeWV
 Cdp1FWCQdTxrLxyxIFpjX0YlkNTgdAXvnMDDlvleq2TM0fhuTBsb8TbpI0IqbyV6X28F
 aC/SzxN8OqLkIYEeCOlpAJWM5l21PjIP41P9YG7r1MVFScOKTvPMdNiup3RATnrQZMbR
 SBS/5xRlJoNE2Q4+6CfCRpP3gS37keUeSTUKUYD8sTAaWxr06zpfhiQuvhoHD5zGVz4X
 Hvyg==
X-Gm-Message-State: AOAM531hzQREJOXoA5c9jgepTM2CkgU7VngAYvaR4rbGomwKyHmkUkcI
 v8qRJ8zvNTCTqdr324KyRsKpvw==
X-Google-Smtp-Source: ABdhPJyLY/ULmYE7kL4z+NpXB7dygkTdqOpK+q9RIVgz26oFSNkBFFbemBEILFCvjOfFPaMHn/lqfw==
X-Received: by 2002:aa7:84d0:0:b029:18b:fac7:29b with SMTP id
 x16-20020aa784d00000b029018bfac7029bmr2744535pfn.29.1605674338308; 
 Tue, 17 Nov 2020 20:38:58 -0800 (PST)
Received: from localhost ([100.102.99.29])
 by smtp.gmail.com with ESMTPSA id k7sm22725611pfa.184.2020.11.17.20.38.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 20:38:57 -0800 (PST)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: hdmi-codec: Get ELD in before reporting plugged event
Date: Wed, 18 Nov 2020 12:38:52 +0800
Message-Id: <20201118043852.1338877-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_233900_826788_ADBEC45B 
X-CRM114-Status: GOOD (  13.80  )
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
Cc: alsa-devel@alsa-project.org, dianders@chromium.org,
 Srinivasa Rao <srivasam@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 tzungbi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, dgreid@chromium.org,
 Jaroslav Kysela <perex@perex.cz>, judyhsiao@chromium.org,
 linux-arm-kernel@lists.infradead.org, Cheng-Yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In plugged callback, ELD should be updated from display driver so that
user space can query information from ELD immediately after receiving jack
plugged event.

When jack is unplugged, clear ELD buffer so that user space does not get
obsolete information of unplugged HDMI.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
Change from v1 to v2:
 - Report jack unplug event then clear ELD. This makes sure user will not get a
   cleared ELD during their usage of jack.

 sound/soc/codecs/hdmi-codec.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 403d4c6a49a8..e8410b2433de 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -692,10 +692,16 @@ static void plugged_cb(struct device *dev, bool plugged)
 {
 	struct hdmi_codec_priv *hcp = dev_get_drvdata(dev);
 
-	if (plugged)
+	if (plugged) {
+		if (hcp->hcd.ops->get_eld) {
+			hcp->hcd.ops->get_eld(dev->parent, hcp->hcd.data,
+					    hcp->eld, sizeof(hcp->eld));
+		}
 		hdmi_codec_jack_report(hcp, SND_JACK_LINEOUT);
-	else
+	} else {
 		hdmi_codec_jack_report(hcp, 0);
+		memset(hcp->eld, 0, sizeof(hcp->eld));
+	}
 }
 
 static int hdmi_codec_set_jack(struct snd_soc_component *component,
-- 
2.29.2.299.gdc1121823c-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
