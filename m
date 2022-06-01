Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0CEC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 08:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HVRGzK6aHwNpDpepZ5CXbxBzGGWA/rSxhO38yu0gg1E=; b=kStuQRvNZaYua7
	KBd4lAiWuaSm5IvbW3DQP6HgX2hdC7C0/Y1iVCYDg/FXZcs15Eg225tt8cFCHXTYgQeuO8kak3Id3
	48omMGUIAjsddnLf/Oc+Nxp9C+SSq52z+HEHechA8VZIg5dcIs/xFmx0YtgqKiGNCojfNlUXywIEl
	3jXUgeTSwP6Eg7XABbqnJNgrGmq9tcpihdM5D3sm/zyCkckeqxFBY/8cxesAhJ0bzCrfr2TfdKXQR
	hcBtIKHUx03ZqcyvWmYUfKQjQF60rkwhJmDkFVLzDoV777LzhwATRMrLLjSZ0OK3Bernm42jZK7eR
	qU89YmATfDETHI9KCc8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwJb8-00EbVJ-TD; Wed, 01 Jun 2022 08:20:58 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwJZ3-00EaOX-QD
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 08:18:51 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d22so1085952plr.9
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 01:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PdPl/Tf6jL9+D3LT0u150RT4I6KqqkA79M7TaHGqeRs=;
        b=T8iFrxlGkDnezem3qfebm9nWuH2n0YbQw2LTIT85bYvGyWqfRsYh5tWeX+uuL2GHHH
         Hcig0S6hO3U8bdSdxwGUJaC69Ku95h6my1S7xZvpIT5ALq/Aas+WyotltbQtw+44YRVo
         5AksVCmgz8eam66xN85U5ePqXAjiMGHFnFSek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PdPl/Tf6jL9+D3LT0u150RT4I6KqqkA79M7TaHGqeRs=;
        b=mcQI2dgya2wVqMzpB1/7jHc9MsjFtgzAoiPgneFYdY3SJgoo7urFnsigqDnfS3idCz
         uCqk9Rs5RzGrwF5S8EtpECozgJOcgZ5uddGNFujU5cSxB4Dcl3MFDpLWaPxX797h9OLX
         R8KqBSWd9DpGhooHMKZREJVXVJMLGgT/QGJZO4GF42Q3KkpYIMcQ27oZYZFl3Y9y/xNg
         ecTjaqDfO72u44fW030bEKGx+dfmaDBAOaqPHg6NyPwpAwCm2E+6fvS7aq49YfI/OvH/
         JElmUU0Ip2TTMNnZzYLnY/RU/1f45DNwNgs7bnobeNSBoTnaFuruCfKTAwVXr2D8fugR
         yAtQ==
X-Gm-Message-State: AOAM532YLjNB1R/lzfx00rfANDf5FbB7O5R++gxtVf4WZubpz5c87xZc
	8evJZUZvY/T5UxTOdWwurYskyg==
X-Google-Smtp-Source: ABdhPJxKELhOFU4LHTDmNuq52nBBrczXLmtFgK6gdtzyOHFSGBG4Ze/wn5pXmjLWXZGt7iwaLDo+WQ==
X-Received: by 2002:a17:90a:5b0b:b0:1e2:8e28:1a61 with SMTP id o11-20020a17090a5b0b00b001e28e281a61mr25453869pji.187.1654071525517;
        Wed, 01 Jun 2022 01:18:45 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
        by smtp.gmail.com with ESMTPSA id c3-20020aa78803000000b0050dc7628182sm824680pfo.92.2022.06.01.01.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 01:18:45 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Rob Clark <robdclark@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] drm/panel: lvds: Implement .get_orientation callback
Date: Wed,  1 Jun 2022 16:18:19 +0800
Message-Id: <20220601081823.1038797-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601081823.1038797-1-hsinyi@chromium.org>
References: <20220601081823.1038797-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_011849_870880_0596EA2F 
X-CRM114-Status: GOOD (  11.76  )
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

To return the orientation property to drm/kms driver.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/panel/panel-lvds.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 27a1c9923b09..dc50f73d400f 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -107,10 +107,18 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
 	return 1;
 }
 
+static enum drm_panel_orientation panel_lvds_get_orientation,(struct drm_panel *panel)
+{
+       struct panel_lvds *lvds = to_panel_lvds(panel);
+
+       return lvds->orientation;
+}
+
 static const struct drm_panel_funcs panel_lvds_funcs = {
 	.unprepare = panel_lvds_unprepare,
 	.prepare = panel_lvds_prepare,
 	.get_modes = panel_lvds_get_modes,
+	.get_orientation = panel_lvds_get_orientation,
 };
 
 static int panel_lvds_parse_dt(struct panel_lvds *lvds)
-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
