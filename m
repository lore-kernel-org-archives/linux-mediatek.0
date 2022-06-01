Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801B0C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 09:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iO0D3Q0b/3O+QqA0G9FFmKUm0MtGz3wItFyMaoRcpGA=; b=NMp3NEetCPlRRl
	bGp8PuTLtHAvlE2NLHX5uI4/1tZ3oOsXb2bAirOqnmEQ07ZX3Po45gzDiUqIgaeC/tNP0o9VXo6o+
	HqzMY9Awzo4YLfIk7i6J0SQg1irai/pCD6tqmE7OLjQYWf1yaboO2fFlyUgu+2QdXoSGJDV88/Tu5
	1aPd4LyJgmiG9Q87dc4HEgQWdboaCah1wBreLaNxs/QRks7znf0NkRDl8GB2YWZXNboOwrm7u5Rsg
	fzVjFwqZ2nA7LkEqQojVMf5m9orBcwRtR5z1/mFNYoRKmBIsx/unlN6XkA9a/zEC5JoSj9Hy9FvHC
	RSHRCOpCVMVqdctjPvMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwL7r-00F5kC-Vz; Wed, 01 Jun 2022 09:58:52 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwKwQ-00F1NA-UP
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 09:47:04 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d22so1285444plr.9
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 02:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uKIVyDAwCRbl3j6LCvOq2/nCq7m+//LNqW8/74aUWVc=;
        b=K55Diq2ttR9WJlI2/Wd+H9Ph2pL1ao/2eEjG7R/EElPqrHWmBsDDo2bMhx/9i6sjnq
         9QbVWH6KHA9eu0L55xByn5/Y2fdGlY6l5yy8HeM+Jl69l4r8ee4Jbm+ctn6gS9wU4bMV
         dTqPBZMZKk10KcmnLXZVIxTJVWbgjkTwGEbV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uKIVyDAwCRbl3j6LCvOq2/nCq7m+//LNqW8/74aUWVc=;
        b=DWZ7v+Cy/X4aNGx24zj6dBdSPmOaMGjCtz3LsbrKxyVwn4P0GUSCBG+7s9HTuHMJga
         VoCtho0UCX30tUxAdUg9Ila9X6FZVqGbGiEnS9r9pCZol5FP/Um8QhK3hT0chErw8ooQ
         H/vaKSZtlGgHht7b2oUCyNRq9AfVg5GA0i8RGwQxxWeiqNNVPt4FDCyp/riQ8yXddPyH
         p7gOAXGn0k7P3A7YbXdehirkYmRkPhGfD841cqpUtso74z0sOl4+KnCHOpIgu+8nUkfd
         /FIlYSKt4ooqpAO86H2Il8RiE+sijzJbIVpq8yMGnsOXSpJ9TP+VwD0p2oA+FW9r4YPR
         k/ig==
X-Gm-Message-State: AOAM530sdzMlwhalNYgZ6WH+QChCN0+23O864sCwx2VTKe56tFBYmm7N
	3HMHsY/opgzH+V4WBPslRQi9WA==
X-Google-Smtp-Source: ABdhPJx+L9NeZp/yBLzjW5DmKKRxM5eCbinJMWNY6Kiy9cOR+7U+YTZTSf56rWT+/WOY/0EfnFPp/w==
X-Received: by 2002:a17:90a:b88:b0:1df:2b03:20c with SMTP id 8-20020a17090a0b8800b001df2b03020cmr33285059pjr.46.1654076817876;
        Wed, 01 Jun 2022 02:46:57 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
        by smtp.gmail.com with ESMTPSA id x42-20020a056a0018aa00b0050dc762815esm1039494pfh.56.2022.06.01.02.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 02:46:57 -0700 (PDT)
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
Subject: [PATCH v2 4/8] drm/panel: lvds: Implement .get_orientation callback
Date: Wed,  1 Jun 2022 17:46:33 +0800
Message-Id: <20220601094637.1200634-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601094637.1200634-1-hsinyi@chromium.org>
References: <20220601094637.1200634-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_024703_027581_1D88299A 
X-CRM114-Status: GOOD (  11.77  )
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
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
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
