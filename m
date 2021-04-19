Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 437B8C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 07:34:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC84E6102A
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 07:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC84E6102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WlmtBEjtMz3dh1PolFAU5NbjSssEoDP6mtGKymabOw0=; b=keYyNk7EyWngEnI5dHxWp0i30
	6OXRIMZvk5qpWYnx2VB0cXJFiuaXzHZ6v4qNIiLzEVEqNxBCF15gloOlcRizUc74IhiFpOJ+QPm+h
	0UnNnr8ornpOPhB9JaVoJcQ5uYUkDAhq3zffxNFfbLeleRuvQWMY1Y8utn/4PhAjov+2Khqi+hkxL
	l3/xrGhk0Ktu+LJxT7RrsFyc5qxw0y2rR0nvoh9Hoy/3e7hqeJ5w3M8qS1It4/VBRo8n2LDvSkbd+
	8OGbTsPX6wRuPIu3SSJFk/KNmmkizogIZLnCdxO2BWMW9R6lMi/EnYwM5ipQr8mhuRyPTojVsAv/d
	9D29JtUag==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYOPk-009LQg-1s; Mon, 19 Apr 2021 07:33:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYOP7-009LIJ-D5
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 07:33:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=b64pfOb+ESukFQpojWv0aNxV3D5E9ms1GDFWEsqil0U=; b=QDPtw3Pz237LHSrgcuSZvNmDYK
 jl4OK03FoLEVjjfjqzIzAgTVmX5tof4jyMU+yWQ0QZy2nBnmTbR1q/hfPC1nt1aZ53l1jx1awb+Ov
 YkzYgdsXvcvx6kaE/XGFGZa2f8HkpXCAVw3qzi1h7eHP2OCkanoMfenpVS8VsDlJI3q9Xf//biCIP
 RuqfplDSGAb59XJq8HgvSjP1TFhm2wh/BcB/+r1CnXzAznDOSWjKZLrqH2+ictO9GAeor2xeMbiO0
 dshOkkMGh64D8uZ1xy8lJsCJkXfyJ1sZwKn76JC3dDH8dgG1nrUBaqF3emJ84Kt1tOHkpdEa6GvnF
 j2x69D9w==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYOP2-00B8MX-D7
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 07:33:08 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 o9-20020a1c41090000b029012c8dac9d47so10540500wma.1
 for <linux-mediatek@lists.infradead.org>; Mon, 19 Apr 2021 00:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b64pfOb+ESukFQpojWv0aNxV3D5E9ms1GDFWEsqil0U=;
 b=NxXHEJGDikQ8Z9gwWWHAZBvLF63JKD5m8/wy4XbGV9oVmxbhPmetFs9Zze9uKo5IvS
 5JhQ+0QPB1uRqGrBXSffE4M7SeW7jT22k2wLOA6dVlE9Eu7Qh/BmPgtRbmM538F2UXRD
 4V3RYJypYSCUvBrFtHrNMGByj+KEiShw7rJIWXaT1CD84l+ThS4Q0lBJdyLYLtv9UlQp
 +oHWfLbbZ0MpprqDTw855tChXKLgJIOxq0+I7DZXYXepgNb+Kq1ODHpddxomIUze1S7p
 4YlOyCnqgUmh/Fga0kgUHF2bdk4QQBQwbJDtyPDbqAS23jUBP8eCO2LSLGU2bNR485Va
 f8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b64pfOb+ESukFQpojWv0aNxV3D5E9ms1GDFWEsqil0U=;
 b=PVUxDufbi9egelrIsIDMMHNdgTTS1ASven35rvYbmQ682BRNYu5qHcTr16wYOFmd3A
 HiIxqjhUOHVb2r271coC08Y/XDe6CVxk9BtjSBSGnNNAxk0p22b/P36Zm+5Ij7qu8fEE
 kMUyfvEfBzDq6DUoKLJZzUz1RzrVdu4VC1yLOqbBH8msMa3XWhxioICOzwkEIX1VXY77
 AMJ4BIjHTDaWR4XWZl3xhf+70L1MT6ZiLPgh3lsoLUjBmhcLx0LlbmKPv/MgC9+mpezC
 qwtiWU7rVLZKpnMw5IylqPZseOZ8zuscvph61+7kAhOaYRg7LvcsoY/YSfsai5wa7ZO9
 oLxQ==
X-Gm-Message-State: AOAM530EF0xEFyFjV7L3U1L/VRHMRW4D+QEWbw9qBtVwNnY7vKmG7lK9
 pB2ZhgAGNu3UPB8WJ5lrSRPwuw==
X-Google-Smtp-Source: ABdhPJw0d7BQTNzJ5es+sguom1+qdvQWC5lAGSwxNOAjaTAytr4cn3xUUFf2qM4dVwLHnn7ppXDrDg==
X-Received: by 2002:a7b:cb45:: with SMTP id v5mr20761875wmj.2.1618817583230;
 Mon, 19 Apr 2021 00:33:03 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:2e82:31e6:67f1:4f33])
 by smtp.gmail.com with ESMTPSA id
 y125sm5492311wmy.34.2021.04.19.00.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 00:33:02 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>
Subject: [PATCH v3 3/5] gpu/drm: mediatek: hdmi: add check for CEA modes only
Date: Mon, 19 Apr 2021 09:32:42 +0200
Message-Id: <20210419073244.2678688-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419073244.2678688-1-narmstrong@baylibre.com>
References: <20210419073244.2678688-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=8hZCU8l60f4io5DjF0ScarfKg+RXuxNEKXbnKgyzEvU=;
 m=p9m3qQg9ro9SNdO45JuikwvmDNAXyAV1Ql4r4DZfEGY=;
 p=3uqgx9h0NLat9GhpnH/7lHx4Omxj//rcVoYK6CVuKP0=;
 g=19421281216f8c01edb5b08ac035741d73dddc53
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE;
 b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmB9MgwACgkQd9zb2sjISdFStg/7Bfk
 iMsl/JsD8ylGFg39AeUNYyCs6C4eUkyDyeEhc22g66p2B11Zff/gIQ24FSdUu38vmW6pQm0zlw8h6
 bUoAA45N3tGtxKBJbsJg3rj8tU9AyajQjTbHTMXslGiMEk/8T6WOti7jedTAv1yB2jKbwEyMyGqfD
 vB6gC6m8TBs877WfOIbnGq/z7Kj+JY9TrIsPu/4CoidUSDGXSvewYpfO01CtNDRqHPnxO03ep7Wgl
 XcvVp4y7+BnxpiD06evJzQEmoBGpITlAnJQVKWePqM0qB9jCGet2rLlrpe+QMX38kSMmnVRkT2FLd
 vVcO3cr2DyiHTugOcFZGdY4Prf/Mwd+fZ5F73EEGFH9KGBwm8b5PnmhlzX40/OROWEVZjpJUQtcl9
 nbwb80rprYYQbo84X9gLJMn1ZeafTScj+nkzVkZc9IFFRiEKHovgoRcAM9sawmJ6fbIh+w29XTZ3X
 LNABEzq4WsLoT5tDsp5zJ6elpRgj2qzPwLrgZTAtH5CwPYMEVBYZBTgeFPBl/r/qaecngE5hyNq2b
 ovTVqV5d0ip55pZGxXINUGt1WAG4W5yqCKHeOl5V+Qw5L284AlhBykZCwCgbH2jid4gEvfIRLEeJk
 o28EAt6n9FDaUxCv3hXXaLCpRwdaBcER8KtE0hORVvjcpEEGbx+47CNddJ9S9YJM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_003304_459763_7770947E 
X-CRM114-Status: GOOD (  12.63  )
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

Some SoCs like the MT8167 are not validated and supported for HDMI modes
out of HDMI CEA modes, so add a configuration boolean to filter out
non-CEA modes.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index dea46d66e712..0539262e69d3 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -148,6 +148,7 @@ struct hdmi_audio_param {
 
 struct mtk_hdmi_conf {
 	bool tz_disabled;
+	bool cea_modes_only;
 };
 
 struct mtk_hdmi {
@@ -1222,6 +1223,9 @@ static int mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 			return MODE_BAD;
 	}
 
+	if (hdmi->conf->cea_modes_only && !drm_match_cea_mode(mode))
+		return MODE_BAD;
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
