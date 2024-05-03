Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17DCC41513
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 May 2024 22:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kta59gfQkdmQ0TL4kfPKXK/PL72P/0YD8zIuorS00AE=; b=C2rGmwd0U9o+6fiDhwz7qRnSAd
	SxQLaSGiAjWAfuHxU063pmFrVx1TIUEZdbYi51TlN2s55SVrT+F7xsk8HSJLnryN4KFl0qyx/30/K
	m3ao4WFCN/BxAJrgN57ir75iPgfR+fUsTxJc9G7IlrRSOjdMXa6Qlp0AOXIHlF1CfdtTPode04lsW
	+VhDuVBA5vJpsJTKsuX/l8SINzhLObDSVAgjAQgWe3/Oh2M2I16dmH4989b1K7ttbu3TpvCXv3sEW
	zl/91PM2qS+XYrglqiEoV34Q6FSfQmJEtsuLvt37R/p8S5Qn4kGHxvqRfuLU+ffq0NcCjRxC+clY4
	2ZVCd5xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s31fn-00000000eQr-1ohs;
	Fri, 03 May 2024 22:46:35 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s30a6-00000000RaY-3bLI
	for linux-mediatek@lists.infradead.org;
	Fri, 03 May 2024 21:36:48 +0000
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e65a1370b7so1133575ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 03 May 2024 14:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714772197; x=1715376997; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kta59gfQkdmQ0TL4kfPKXK/PL72P/0YD8zIuorS00AE=;
        b=SLWkyM7byMBkk5D0/vTqz15IwR4dxOV8Pf2tjzBypLWvMzqPE9vBNT/D6WMGUy6cks
         TJ1M/kZ/0YVSzGSPcD3t5lG6M1fGvTJKOidqQghWLBTFALh7q6mY8iplV2SwA5ONjVge
         a5c3xKrK6dGolXLxp+OglOb7q2JF3UR2LVB88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714772197; x=1715376997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kta59gfQkdmQ0TL4kfPKXK/PL72P/0YD8zIuorS00AE=;
        b=gc6vf93wzoNVG6OIRmpoVySpzZKQjnKWf2Y1kike7GNthHBJUqIBZcDa3ndUUCnVIs
         a34gBebgf9YtQKO/3fjWy3LY9yRTdjLqhpADUYn8WLtIpIbUUUihgqHwkg+hR03Gpmnp
         KgAl8ht95hQDYPAcJXPEtU2IQK4eFHxLQvFJi4g+cPMxiWsArCNNBQnDhSfmJrS/qplN
         YmTVg+ZgAfSexN6FN7yCAhPSpkTibXD5d22MAjW2SASq3243PV6K9COd5/bEVexEe3N0
         DNq7h1P79m5SU+fahat9Qsz3KMEFFiPir/j2QZSmSD4ikhEzhEouo8cLDjQOM3JGdGXV
         TGaw==
X-Forwarded-Encrypted: i=1; AJvYcCVZLETzEhIvap4sJQJX7vF8fVogvfo95t9AYlAirNATLa/SYptHbyOcqnLoMs+kmLt8o945h3Ln5CPJ8mbTE7pNvUQW2wrtRrnoji9gcxYDn1/u
X-Gm-Message-State: AOJu0YysHXTjsKcowP7+gx4TLnHWjaKKylOrIP0wT+WimG9Ie+HFwzLM
	Ln8tGxyzwB/BXyQGudoNQzFVkQkgWYZsgVzJNc+LNs9k0aIG6zOOEeEUGed04VZmufD8V6b5ipk
	U8Q==
X-Google-Smtp-Source: AGHT+IHVhWhn4/nQtVyQZZLqUsnywWTqYGnhPIFneTo2Pek/30GOWy84nbyfus1Fy+LIRhpR3w7cFQ==
X-Received: by 2002:a17:902:d4c7:b0:1e5:4f5:7fa7 with SMTP id o7-20020a170902d4c700b001e504f57fa7mr5769734plg.21.1714772197003;
        Fri, 03 May 2024 14:36:37 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
        by smtp.gmail.com with ESMTPSA id j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 14:36:36 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Yuran Pereira <yuran.pereira@hotmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [RFT PATCH v2 05/48] drm/panel: boe-tv101wum-nl6: Don't call unprepare+disable at shutdown/remove
Date: Fri,  3 May 2024 14:32:46 -0700
Message-ID: <20240503143327.RFT.v2.5.I5bd120aa0b7d17a1149ea43cc4852492834058c0@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
References: <20240503213441.177109-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_143639_101317_C1A8C3C8 
X-CRM114-Status: GOOD (  14.55  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

It's the responsibility of a correctly written DRM modeset driver to
call drm_atomic_helper_shutdown() at shutdown time and that should be
disabling / unpreparing the panel if needed. Panel drivers shouldn't
be calling these functions themselves.

A recent effort was made to fix as many DRM modeset drivers as
possible [1] [2] [3] and most drivers are fixed now.

A grep through mainline for compatible strings used by this driver
indicates that it is used by Mediatek and Qualcomm boards. Both of
those drivers appear to be correctly calling
drm_atomic_helper_shutdown() so we can remove the calls.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: Jitao Shi <jitao.shi@mediatek.com>
Cc: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 667e1bb4a58b..77b20e24cac7 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1910,21 +1910,11 @@ static int boe_panel_probe(struct mipi_dsi_device *dsi)
 	return ret;
 }
 
-static void boe_panel_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct boe_panel *boe = mipi_dsi_get_drvdata(dsi);
-
-	drm_panel_disable(&boe->base);
-	drm_panel_unprepare(&boe->base);
-}
-
 static void boe_panel_remove(struct mipi_dsi_device *dsi)
 {
 	struct boe_panel *boe = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	boe_panel_shutdown(dsi);
-
 	ret = mipi_dsi_detach(dsi);
 	if (ret < 0)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);
@@ -1972,7 +1962,6 @@ static struct mipi_dsi_driver boe_panel_driver = {
 	},
 	.probe = boe_panel_probe,
 	.remove = boe_panel_remove,
-	.shutdown = boe_panel_shutdown,
 };
 module_mipi_dsi_driver(boe_panel_driver);
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


