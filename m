Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C302EC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 04:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HEXNGmvImDiIabX0ha1Bsn0g9dYiCmRV9oIQI3tuzTE=; b=nxxV7pbj4KfNNlIHV6Xu6l977t
	uDGWFdRlhL3a6ZIXO3FBh4VElX8FSBZzTCE1FwUhvaS5x161925J+B/v8l5EUL71b4PY/W3RWjhCO
	MtGTmZ5+raXh2ILITNkHVNXYwT6XuQK9VzRL5q+rF7sP3mduVG0J9eBp0LTZX/Yo2gVRIWY9qEXHR
	LGBTddiV3kZsmdww9OkqTPok5XnXX7xDjPy66khS/JuHzFXmnKnh9FvrOn1ZSse1M60nY6Xh3G4G4
	7HPVqXOjSwLTPGVdwSxwYAjyCNk6c/xZR7LXQHO1DiQxQCXG0YKyUEN9HdIbgWp8t7AIs5AMiZlzL
	gm+7d6bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNRfQ-00EOH8-JS; Thu, 02 Feb 2023 04:57:48 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNRfN-00EOG4-KH
	for linux-mediatek@lists.infradead.org; Thu, 02 Feb 2023 04:57:46 +0000
Received: by mail-pl1-x629.google.com with SMTP id n13so693873plf.11
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Feb 2023 20:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HEXNGmvImDiIabX0ha1Bsn0g9dYiCmRV9oIQI3tuzTE=;
        b=ESpEpRiNOlnHvH9iNu/RZlLGQnQ96XRBURzcxRZVB28y7PlIkfsK/EAyAPBMfbFPd5
         BHhZKgH7VX7HQwhFASIBKcWbVepGgF1zn88RUpIUIVWkNJKcLSuTVxk8t1Fqj9H6WPG7
         NxDmDF731XI7VUDgqABnlgaIORhRosSMgWIMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HEXNGmvImDiIabX0ha1Bsn0g9dYiCmRV9oIQI3tuzTE=;
        b=webUj9YO8gawi7+yuU2XeVu783e6n9DcgwFEs0Mzo76QV4Bk9LRy5wrF6dk7Qijw6E
         KKzxcp3v2AHSzqsIktY8YiB2GHyoxD+nhlR8nGqKWmNWAjHsWF5PEXFlNKVeeKLZOFkb
         MIMKdZdWVzNIgBbi1CElmCcWhdjA5wCBry0a9bwK3cvPyXNv5lsOp1fDPYW4wDyDqVK/
         ptupLFSVithq2FUSGSZ2vZVWuKekGCm1zJIhRyacznUoxh4S+rCJCo+4GoyIbkqtO0yD
         neANmxz5anVpsSM6THzUHwysIgLT/MTxeyLZFxvdEnWfx54o6LN9wTHNjS1vE+Ke0YMb
         hk0w==
X-Gm-Message-State: AO0yUKWe/jcUax9NbXiU69vY5VpAZz/LtIFYHw2DjF/iga/3pdyMiJHD
	Av0c1lRhGfoDE/CmUUyvAg5X0A==
X-Google-Smtp-Source: AK7set8WyD5ReUIueqrJ73xdpvTR1OAyoDOAo/QkEW005hwgtutfWFDZBrKjjW302/sUWzEzjRRm+Q==
X-Received: by 2002:a17:903:11cd:b0:196:704e:2c9a with SMTP id q13-20020a17090311cd00b00196704e2c9amr5774070plh.22.1675313858323;
        Wed, 01 Feb 2023 20:57:38 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:68a6:9bbd:a36a:4d1f])
        by smtp.gmail.com with ESMTPSA id ba2-20020a170902720200b00186a437f4d7sm3667203plb.147.2023.02.01.20.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 20:57:37 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guillaume Ranquet <granquet@baylibre.com>
Subject: [PATCH v2] drm/mediatek: dp: Only trigger DRM HPD events if bridge is attached
Date: Thu,  2 Feb 2023 12:57:34 +0800
Message-Id: <20230202045734.2773503-1-wenst@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_205745_671262_124CBDED 
X-CRM114-Status: GOOD (  11.85  )
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

The MediaTek DisplayPort interface bridge driver starts its interrupts
as soon as its probed. However when the interrupts trigger the bridge
might not have been attached to a DRM device. As drm_helper_hpd_irq_event()
does not check whether the passed in drm_device is valid or not, a NULL
pointer passed in results in a kernel NULL pointer dereference in it.

Check whether the bridge is attached and only trigger an HPD event if
it is.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Guillaume Ranquet <granquet@baylibre.com>
---
Changes since v1
- Dropped prerequisite-patch-ids
- Added Guillaume's Reviewed-by

This applies on top of mediatek-drm-next.

 drivers/gpu/drm/mediatek/mtk_dp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 1f94fcc144d3..a82f53e1a146 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1823,7 +1823,8 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 	spin_unlock_irqrestore(&mtk_dp->irq_thread_lock, flags);
 
 	if (status & MTK_DP_THREAD_CABLE_STATE_CHG) {
-		drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
+		if (mtk_dp->bridge.dev)
+			drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
 
 		if (!mtk_dp->train_info.cable_plugged_in) {
 			mtk_dp_disable_sdp_aui(mtk_dp);
-- 
2.39.1.456.gfc5497dd1b-goog


