Return-Path: <SRS0=M313=EX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3571FC5519F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2020 11:26:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F420221FF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2020 11:26:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hL9eu2Gp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O5bBWmVT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F420221FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f6nOymQJcFfZ9VInwqZIY+q6m6WLE6jQgxIBXJEBMZo=; b=hL9eu2Gp58yauY5EVY/QTA3NkA
	PDSH+PG7sL/6YRt1TuILf6FvcdhGsaQyJA/GcQzfS8NEIu9gugZCqmD8zFzrTkPAKrYPODzKCjOUd
	q00xf9M301fb5TrdTNxA1m413zccxrEt2hEwJg7rqIWoQbPaeXxjg1BxIhUHi0uJf4xNXH9F4crw7
	x0v5QUauGb5XooOmWcF00lIbZP7V5t2s0FUzkRMl2r4oCv6TGK56Jotf8CmjVBj6CF6e8fHsxbe2c
	QtxyaJeTe7AMZvryd80lC1NUzu+i2aPgB0Sa7IyRDZ6ZKFmyOVLpKeKGIVxDstsedrLgq6oIDKD2a
	1i61Fyhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kez7o-0005Xh-0s; Tue, 17 Nov 2020 11:26:16 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kez7m-0005WP-1m
 for linux-mediatek@lists.infradead.org; Tue, 17 Nov 2020 11:26:15 +0000
Received: by mail-pf1-x443.google.com with SMTP id a18so17103137pfl.3
 for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2020 03:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5QH8l3HzZjblS+KPiXb77NBbNTh6S8myLIAJDUGNsj8=;
 b=O5bBWmVTPEBh/wG/pGQE0dEyVrFSP9Ty3BF956K66kZY8Ga5Bv0ZO+dPKZdFwQnUU6
 8Re+odTtvmBPW/Pe/ey4gvN2NwnMSTVjO0THOf/mTGSSmHPJE1u1htYGpGgjUweZl0hu
 Y3d/hvn8/ZvmSbXbLF2FhktSTDJEfHaB5FbPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5QH8l3HzZjblS+KPiXb77NBbNTh6S8myLIAJDUGNsj8=;
 b=Q++QCsgLr9WYr/VbnDjSiErwK+XK7bEGitCcBmH4GG7mr18OXNI4HflW9jUgiPtg13
 D0YIYwFeXnOICaIakf7xGO811XMsELM6rfZX/T8gng4RPLJc1ddxyXbaK74G/fmXx/xV
 Dvmh/reDr4mjHaO1FRG/xeI5v+XdMh+Qhw92tEUPa6t5pcZBL+7ZXoxQQh40SpyQCO3R
 Obj0ks3pYTDOTG9UH+tm536UwsCAvsfSK2WKJLBeB4iblkzdhSFtQq7NTRTPZcLzeQgh
 hSd4CWA+hUl1KxENq0hr8ImDfguqvIbEe3llTnowngJ5N7jGbWLotomS0mNvcKX3SlxV
 XK9w==
X-Gm-Message-State: AOAM533HbiLfdOxH+bgsEDylO7E7uMLQpLZc0S0J6WHIGUPfzVVYVBhL
 nYVkdEFwMtYTAZJYl/wb7K6nVw==
X-Google-Smtp-Source: ABdhPJyrnAjBQ/jtFgnI1ZSF/1TLY+kjZEhSgcrRqfC80FgaKc4a5J8gFviPhqMlAnXOMeI4QK8f7A==
X-Received: by 2002:aa7:9414:0:b029:18c:23f6:bc6d with SMTP id
 x20-20020aa794140000b029018c23f6bc6dmr18205106pfo.21.1605612370295; 
 Tue, 17 Nov 2020 03:26:10 -0800 (PST)
Received: from localhost ([100.102.99.29])
 by smtp.gmail.com with ESMTPSA id t20sm2843368pjg.25.2020.11.17.03.26.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 03:26:09 -0800 (PST)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: hdmi-codec: Get ELD in before reporting plugged event
Date: Tue, 17 Nov 2020 19:26:03 +0800
Message-Id: <20201117112603.210620-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_062614_165483_407FE911 
X-CRM114-Status: GOOD (  14.19  )
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
 sound/soc/codecs/hdmi-codec.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 403d4c6a49a8..f0e0e1836000 100644
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
+		memset(hcp->eld, 0, sizeof(hcp->eld));
 		hdmi_codec_jack_report(hcp, 0);
+	}
 }
 
 static int hdmi_codec_set_jack(struct snd_soc_component *component,
-- 
2.29.2.299.gdc1121823c-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
