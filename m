Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09D2C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 08:43:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A0896103E
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 08:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A0896103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jo9Tcr7ZHw25jjqg7W7eFoHabt0KMRJc/jV91gbcRMU=; b=lIVcJ3iFH3CpVXCIvN68dj2evn
	jqlh2YgwOBRySu26BN+BYkbBw/ZTUMOHXSWoDUCM5PdLGTkINbm4ZggQV40nLkBeGOZAcXZ0W+2B0
	rdu9qMcq4woUlpIAiR+kCBedTnPifXf/VgDGnh2sr6ur7ffcK8AR6PvzH/sqnmTypnguqNJiBBh7D
	GJoIvlYtyG/fpTzcEcsdEKUDfoyiZPx7IYIGrhOsyuJuEB8HVF37wWULrzsDiWu0K5INr+FeqSGDH
	eetru5esa8/6FQzYtLH3rjZcNYxikOW9mBlxFUa9RM4P88IslFoH78DjIV9HXt3DXW8LEKPMX1KsW
	ylu9KDoQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUmjc-0005GJ-0H; Fri, 09 Apr 2021 08:43:24 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUmjX-0005Em-RS
 for linux-mediatek@lists.infradead.org; Fri, 09 Apr 2021 08:43:21 +0000
Received: by mail-wr1-x436.google.com with SMTP id w4so1052098wrt.5
 for <linux-mediatek@lists.infradead.org>; Fri, 09 Apr 2021 01:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SxAVnkvMBucxc7nVmzkehM55ix3ppr1nutixxEdT8mc=;
 b=hzi/nQIm8IbBk14mZiIsufRcM2Cw+6f99hud3p8ZpsCLObKl7z1S650qtmxg5CMtaD
 RIJ9RjLF8E7L1KpF7o/zuDQmpn7JKmqEcVY8fYIbiGHqEeQfDKW1ZBx3l/ijasZ+aJ4x
 b7Am0q/FC5+lKR4GLkRYGODR4ffE+C25mAOiBDtkerPcyM5yBctoW94hYBre/MJfelFz
 UNlUxeKGJ8qtQwcaoofpFf5zZ2iWx0y9MOzAXUJhG6pMomlWGcKkXGYXHAASPDtCJeMd
 M01f4oOBLkQX5TTVD+MmLwWEALjMO9ylf6sRR6ZLXO7BRvyH2YX6+PCmfXrsjF2zyLYI
 rgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SxAVnkvMBucxc7nVmzkehM55ix3ppr1nutixxEdT8mc=;
 b=CoCVayah/YhpEDWFlHA2yDczAPy9QJH7baX0ago15K5IRrzJSA/y4INSY8XCJsbTH9
 wZfCdu0LYSh22uTyKQhvE7rpJCpx+9f109O8aatJ/niYlTOzzfw2CLtBVNDqDkdt8PW5
 OCFQfD+dSRwizNXDtu4noaYvn4q07KIMC6NPpL8L5Mo298iSBex4fX6VUvJMfGFF0zbv
 E+M0EbWY68akZPhPe8y2N+g/64N9momickiAflnFZGYhLPyaQxrNcQuyTnlGDZgwkMsd
 lOueW2sCu1B5AtEG9L4t4fHm3ZhLG9LwQXJ4kwls58qx01o0S8a0OHDSozTzEAZprg/X
 yKOw==
X-Gm-Message-State: AOAM533+b56TyTBLQkiIZyMHee4kfSVzorGnVG4BoqPlLV3sbNbTnEkU
 zTLqa4+Mk9srvWW8E3Dzt42Oiw==
X-Google-Smtp-Source: ABdhPJyH5BhpUZCaFcVaAl1X3duZCpaxmI4fJOW8UUTkeb23ThLiMR1Qt0/IhBcS9m7rAYQjbh655A==
X-Received: by 2002:a5d:5152:: with SMTP id u18mr15986534wrt.289.1617957795526; 
 Fri, 09 Apr 2021 01:43:15 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:d6f1:3413:d06b:d6a2])
 by smtp.gmail.com with ESMTPSA id
 w7sm3545504wro.43.2021.04.09.01.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 01:43:14 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>
Subject: [PATCH] gpu/drm: mediatek: hdmi: check for valid modes on MT8167
Date: Fri,  9 Apr 2021 10:43:08 +0200
Message-Id: <20210409084308.481185-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_094320_018608_A53947E3 
X-CRM114-Status: GOOD (  13.31  )
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

On MT8167, only CEA modes and anything using a clock below 148500 is
supported for HDMI. This change adds some checks to make sure the
video format is OK for MT8167.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 8ee55f9e2954..991e2e935b93 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -148,6 +148,8 @@ struct hdmi_audio_param {
 
 struct mtk_hdmi_conf {
 	bool tz_disabled;
+	unsigned long max_mode_clock;
+	bool cea_modes_only;
 };
 
 struct mtk_hdmi {
@@ -1259,6 +1261,13 @@ static int mtk_hdmi_conn_mode_valid(struct drm_connector *conn,
 			return MODE_BAD;
 	}
 
+	if (hdmi->conf->cea_modes_only && !drm_match_cea_mode(mode))
+		return MODE_BAD;
+
+	if (hdmi->conf->max_mode_clock &&
+	    mode->clock > hdmi->conf->max_mode_clock)
+		return MODE_CLOCK_HIGH;
+
 	if (mode->clock < 27000)
 		return MODE_CLOCK_LOW;
 	if (mode->clock > 297000)
@@ -1810,10 +1819,18 @@ static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
 	.tz_disabled = true,
 };
 
+static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8167 = {
+	.max_mode_clock = 148500,
+	.cea_modes_only = true,
+};
+
 static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-hdmi",
 	  .data = &mtk_hdmi_conf_mt2701,
 	},
+	{ .compatible = "mediatek,mt8167-hdmi",
+	  .data = &mtk_hdmi_conf_mt8167,
+	},
 	{ .compatible = "mediatek,mt8173-hdmi",
 	},
 	{}
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
