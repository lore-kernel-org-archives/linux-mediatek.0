Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FE5C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 07:34:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3156B6102A
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 07:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3156B6102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7XL4M3zAJUej6MONpzXegcXukEtZwV7KaL6JRl476oA=; b=X662MG1jyWW+0l/6YjkocIM7q
	R0FTChdyoXcgRhwWoyrtawg0E//KDzkvo/RuQtzv4r0C0gp/FJp/QCw8DV7pouj29qkvPyslY/Q/a
	Kpbl+L7M9Yf0Uiu2HP5JIUWJv/wBli1+aC4wRYO+8LhzR7p/xvLBvB6XxCqITxKhHwNX+wZAVQdhY
	C6fSdVP3SMCQPUoC6k4H3rJMtuVizTZ+QdzpIH3TjOiqEUwUU+HlfBqM9eaGrB1O4ScaJJrSJg5Ox
	vGh1rrNS22xKrd+bOqAqMUajM9tOewnLAGzTixVRcVCV1uspaJQisB55ADK5PRqaFMyhB5bqhfYoT
	voJdDuecg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYOQJ-009LfI-B0; Mon, 19 Apr 2021 07:34:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYOPA-009LIs-8s
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 07:33:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Q4YDvpAD1UGIZmGY7ATXAVL5J0kUewQGcgvVMVoEerk=; b=To+FXntXuKe2nf2Dm2K+Hyq4G4
 06WueRQmwYHBqqwKMBySfpaLUgE2kML6hTc5hAsRhNrpcrPq6qea0TjsON01ad7GMNCg0wNb0wGO7
 Vc5LxLD1e0zjI2KoBXHjKFVwCiTiK2M/tfQsKG2YGix4CcedCOMMY3F1KNDfo1clEzDYzRt7QwjJj
 im6l73NaOt8rTfbBTwey1XAkWv+cB033JXhFn16exOq+rNSr1FITjU9Mn4vWf3S9rbQX23FAnGjyL
 jPSWxYShs0phlGCsO0XKW357XRslJ8IEWFWLCknUmBOZmkpaA8zMOeQhGN5SkTI7wQ2HpykkZAW0l
 knnSKRkQ==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYOP4-00B8N0-7x
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 07:33:11 +0000
Received: by mail-wr1-x42d.google.com with SMTP id e5so4188294wrg.7
 for <linux-mediatek@lists.infradead.org>; Mon, 19 Apr 2021 00:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q4YDvpAD1UGIZmGY7ATXAVL5J0kUewQGcgvVMVoEerk=;
 b=XkSOZwT/oa3mmMJht/SBoeMg2otJHicOZgzMpmC08FMiEwdqB0yn1q8KQZzzpNhaQo
 Ef7Myuk86h3cyP0dJSislHg6EhhfFefA9P3S2ErrnyqQhc9pbLy1jsHm6lKEpPqJ0SOR
 JuvPgdaVP9vS0tullk/0uT0ETPm7YmGbR4YnCfZDukTHal2rtqSbauJpv0FQu4/PdrHD
 oLRdZlZI9WTqm+7QLbTKRF3/m/KPCKoZ8pObnB+KJ2z1ZbOwVpdQSk3LTrk8Ncan/Sqs
 VdIXcx6KfdSiYoHEgooNeGOxo6EfXmZm+eExlzuI8w1OaOd3aiCSczk5XB6NS6qd55Lz
 T/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q4YDvpAD1UGIZmGY7ATXAVL5J0kUewQGcgvVMVoEerk=;
 b=PHpcMeOMfaQBZ5ufAItkWEQ1Q4FnU9aOiEwQZzCfwHpD7somes4lfc1k0deaJhGQw3
 XPZsrCU88hh1e9deLq4VSi1NBe2GKw7VEaUJC1vIwedTQtD+ppreflpjnEaAKf9dBuV5
 RhqGQOFJSA3kIBkHff3IUXoIro3WJSzl1g/hVfFqgfU+LnLlrqghExWIezZsxz4logwN
 ntWd1VRY+weqikqWxXrDeLBJZaMYG+8fxfY7i48y7GNCJBpHqSur8IMgVesBEm//pzF7
 6h0Pnkw4vBICz2tc7Ufke8Y2+nnAWz7B4BLsPdPwvfqowo8h7HXttRhiCpHWWOunWUwg
 Txbg==
X-Gm-Message-State: AOAM530oT6tyyqvh1PPm3ftmtVRzfLJ7NFUFGjOUeCRbyBP8KdRg65z/
 Dn7JJ1BNRyhUIMX+LbICJyk2Og==
X-Google-Smtp-Source: ABdhPJzqovubh4OIWgMpiHuIhqzqftX8pIo/o42SHQDoE+imJW2kEiaMLsGF7g8XzUNuo5obehrM7g==
X-Received: by 2002:adf:ba94:: with SMTP id p20mr12928692wrg.300.1618817584363; 
 Mon, 19 Apr 2021 00:33:04 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:2e82:31e6:67f1:4f33])
 by smtp.gmail.com with ESMTPSA id
 y125sm5492311wmy.34.2021.04.19.00.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 00:33:03 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>
Subject: [PATCH v3 4/5] gpu/drm: mediatek: hdmi: add optional limit on maximal
 HDMI mode clock
Date: Mon, 19 Apr 2021 09:32:43 +0200
Message-Id: <20210419073244.2678688-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419073244.2678688-1-narmstrong@baylibre.com>
References: <20210419073244.2678688-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=fmerdT5sHqIGuoUTZDrccRl/0zoMQFtVjUuTCnM2Nu4=;
 m=kS8rkVG4drN6qA/sYwEi96Os3BdhRRg85LscWfEOz9U=;
 p=XzRamrwQ2kdOF7GfyCvXP4CcM6GKIYyeek0NDT5Wv0U=;
 g=cc05bb87977587a07030f409f3d9b83309a9f1c7
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE;
 b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmB9MgwACgkQd9zb2sjISdGlFg//d/P
 CVZrkoJp/X4KUj/7Z+BhPfopOjq0Wiun0RiLoVicfOFVE23BrE2jif6szo9bLnddyzHnqRC/LOmDG
 sQEiX89TVIsnsasXsRPGFbHqMgpdzHdZeg0JVUEkacKc7WObdzdorYa7E1Sy85lkLQQFZERYRxIYs
 x7l8Rfn+fYO0g/2bM5Xo39BN+vjktqt2Z6+jf8PMaNHdWHbZ/Sibggehilqv1gvbNGzArviBVbogb
 CzbuFkm4caJlGpyuOh9lzqb5oX1dS1b4sJOKlV0vab8riyRDSWIrvSve6lIJKS5Zy2nnePFJDRIdo
 KXCX8tTjJ3oR9eFt0I6uDo1tPnQNUN+I+YPiwH1ADYzFZe/l6jgrmJ8vmD3sEPsqu8StxA2C97stl
 kPJjY6S3CSQAwoWUiXOY06ExKPKQdzJlilfy0bwmBllmpHeaV2AgOUw/SUVZQKFLQ8gy0dHTgCuhJ
 xtYcQKSob+AoJUPLuKlkJ5rWm7DvsLQ59ZkIVczynpm5b+fxtQtAwgFXqqcVrOe/BwQGzcTkG+w69
 g3JFk9Jgf3DMbQ9SL1gKIdDr+DqyBPjvgu2XxQk+4d8A8MV36AQpEUTrF5WKJnf6aM9l7TIUr8hOw
 vDn318ylmunNTWomQl7CBbWMUxB26/KBGzy/HJ/rlIaRskMmDaGmzSMMQQD2KUYs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_003306_302387_78D60F19 
X-CRM114-Status: GOOD (  11.81  )
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

Some SoCs like the MT8167 have a hard limit on the maximal supported HDMI TMDS
clock, so add a configuration value to filter out those modes.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 0539262e69d3..bc50d97f2553 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -149,6 +149,7 @@ struct hdmi_audio_param {
 struct mtk_hdmi_conf {
 	bool tz_disabled;
 	bool cea_modes_only;
+	unsigned long max_mode_clock;
 };
 
 struct mtk_hdmi {
@@ -1226,6 +1227,10 @@ static int mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 	if (hdmi->conf->cea_modes_only && !drm_match_cea_mode(mode))
 		return MODE_BAD;
 
+	if (hdmi->conf->max_mode_clock &&
+	    mode->clock > hdmi->conf->max_mode_clock)
+		return MODE_CLOCK_HIGH;
+
 	if (mode->clock < 27000)
 		return MODE_CLOCK_LOW;
 	if (mode->clock > 297000)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
