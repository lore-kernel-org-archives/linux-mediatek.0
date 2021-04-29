Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508F2C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 04:31:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C314261450
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 04:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C314261450
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/bTGpQDjoE6twSUHm+qNXqx5PIRVx4vG7B18bmSp/Xc=; b=l6VlbrDFprS8BRiSidKvT6kYJ
	PeuOprQfqxw2oyOWEOdVQWypDuFXtj9BRgX2rieN2LlQ6Qy5/GxZsK6ONMYFHON8yywQHSi9ka+/7
	cIdPaHYCZgoWe3sdAB4a2m65tUJqbeQM0aKLf68ypLtAH3HN41aGsGlDWEbM9H/w5GC1QLF9870bh
	OJz2khVjW4AYHNgYaNXgiauskjNcH6NZx3NaVe5Dflc/oY0lIwrTLZJ75eW5HmBbAb76xtxemkjbM
	oGs6pYLYxc51OJhY+uWtv/47vu/c7DJNWNU6K+kaMyCm4EPNqQwFU/a5yiwC/TafGv3uAbmqRhyD8
	wMdR3GOdg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbyJz-004se2-P0; Thu, 29 Apr 2021 04:30:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbyIB-004sTq-B9
 for linux-mediatek@desiato.infradead.org; Thu, 29 Apr 2021 04:28:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Q5arbhYfGXT82qjQUTN0xccKMerRCIU7+UPVnm07W9Y=; b=uOpnrCxjqcbADQWXMALTNTLceq
 n32JRY1yB4Ie9hO4/zK+oTZO2umWGU5vdS4QSYKl6WpHnQM7Z8cf3BzvKGqDcooa0sreZq8hyW5oH
 eAB7PiYEKoE/nQFOGC3S/CVKwMO6C9LJ8v9t3BHkl0Lj42ku8Z1dLfEEQGJF10+7sA8aWF30Pnbbw
 HBJb0SZ0ctINoxaKdFP9jRC2rAeEFw4Bn01E5asFrSV8fAavX9xs/skSSFf5UTmnLA30RBLDjsobG
 WJH5Tg6DLdSHWHa00CflVOxzKvfSzCEjIiRVETIc+OSR8LrSF18aKzxFlzJmwWpj+rBCzMc3MwIbe
 BuKbsMIw==;
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbyI6-000Mc9-Tb
 for linux-mediatek@lists.infradead.org; Thu, 29 Apr 2021 04:28:46 +0000
Received: by mail-pf1-x434.google.com with SMTP id b15so977490pfl.4
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Apr 2021 21:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q5arbhYfGXT82qjQUTN0xccKMerRCIU7+UPVnm07W9Y=;
 b=G85VcZJiBhrc0Z+xTBYX6C5fC+iasG268uM+qWiT0xg/xpPu0RRhUrnr8buAZ+LlV1
 lSKD7pRAcedECmwTgS8kTxBRZ76a6Itsaz2/daIKpP6tkNusndubKuXvj0rjc6r64pQ6
 ektV8bQmN/zPS9egbWIlp0qx+zMjeyKhAqJOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q5arbhYfGXT82qjQUTN0xccKMerRCIU7+UPVnm07W9Y=;
 b=m0XBMmaMRVeuqAdZpC5GFiKeqDiOp+BSFq+oWsNfSaicjsKszELG8HyyJfhMxkuxIt
 0YBUCltMvUnI7fU1GohNceU/YOI3lxanJPXGtbcM9q8Y/doBupa0kTi0mpxCUiVVFmZV
 IRrlPr94BJFhogRfIapZw4y3ReTipRUpgO270GOyx5mxAo74ewzFQwxyyfnRg4LA6lB9
 F61YG/iovL/jG7lbpETuuJ+wVl5fKLDLogA0GS4Gd2j5VufSjF2LX9raufcNnKRldMua
 we1OfRChI00vCW3GE/WcF67H5DFFanKYTWuCxPX2Dz/eEbZj1gZOx1hQkckKk4iLeR6k
 X28g==
X-Gm-Message-State: AOAM532hE+yt6Sb1p3yXYiVeWHeumqLbbtLkFW57X2P3AqE8X2DgLJBj
 DjiXdXXMWBXo4y+EuoqM3Y4Gdg==
X-Google-Smtp-Source: ABdhPJz7d0lwcYiWWsZ+p9irRnLEfdh2OXdUkleFkMQkFzA1hAfKA+4YpXWMxwylDQGJh7nhUk4LhA==
X-Received: by 2002:a63:4550:: with SMTP id u16mr30275755pgk.440.1619670522054; 
 Wed, 28 Apr 2021 21:28:42 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:f701:2ca2:56ba:8e83])
 by smtp.gmail.com with ESMTPSA id w124sm1069390pfb.73.2021.04.28.21.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 21:28:41 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v6 2/3] drm/mediatek: init panel orientation property
Date: Thu, 29 Apr 2021 12:28:33 +0800
Message-Id: <20210429042834.1127456-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210429042834.1127456-1-hsinyi@chromium.org>
References: <20210429042834.1127456-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_212842_988066_6D13B6F0 
X-CRM114-Status: GOOD (  11.80  )
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

Init panel orientation property after connector is initialized. Let the
panel driver decides the orientation value later.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index ae403c67cbd9..9da1fd649131 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -964,6 +964,13 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		ret = PTR_ERR(dsi->connector);
 		goto err_cleanup_encoder;
 	}
+
+	ret = drm_connector_init_panel_orientation_property(dsi->connector);
+	if (ret) {
+		DRM_ERROR("Unable to init panel orientation\n");
+		goto err_cleanup_encoder;
+	}
+
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
 	return 0;
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
