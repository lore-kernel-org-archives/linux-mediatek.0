Return-Path: <SRS0=L+xn=ZT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 389F3C432C0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 10:04:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 092862070A
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 10:04:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ULPUviJ1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RwOyeu/b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 092862070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pR0Rtp93JLVxpaakucEruulswGajOCxERLqxXVVOU7A=; b=ULPUviJ1QQ+YS0
	YnOHLBQV6VWZhljGrSbUTmmvi8zNVnih8QYa1AJ7116csBsnLDVX4eJmobZpMspSoZczh4RKNIZSZ
	zcjSrWZS6/nNMDotxbpJ2KaJtgQhBgiGBHAv+lE1tqrvV8cSRLGGEeXRX4jnkBxxGNJDWooB0H3Cj
	vzn6AfDBi0+rXmt44BaJWFYLo567EnnKXiG9nFOHCcGE3e/9z5nP4JoKnENNJZQIeuMH4WQer6DIw
	nzNh88DzzjV0oOrdCVMOqxuQL6u+Kg35O6zESQJzQV6ZKxGLBQkrxAA350i8GuUUgyZa+jmp9+64X
	QxUt17HW40QoW4caysPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZuBf-0003qH-B8; Wed, 27 Nov 2019 10:04:43 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZuBQ-0003gB-Oh
 for linux-mediatek@lists.infradead.org; Wed, 27 Nov 2019 10:04:30 +0000
Received: by mail-pg1-x544.google.com with SMTP id 6so6023965pgk.0
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Nov 2019 02:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fla0mLE3kPARMpuw52rBb145CpRIcrUfv5y6FZzfYow=;
 b=RwOyeu/bPVGltW59qJ4ylCblmR5cOGkzUq9UNiaKHpWvfQPMChAxhON+4bSUJovU8n
 zUPQsv3tpq+x4Lwhx4KaW+DIEzK+DzY9Kc7Cg5Lh4sj0Tgu9zIi8ibZ8YPn58QTJuUO+
 G4lekg7BfIooWsOH7uQR0q7Y9LKF4gHyFwK9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fla0mLE3kPARMpuw52rBb145CpRIcrUfv5y6FZzfYow=;
 b=YCFcVRTOczn53PN5kvyuYM4Ml+lMJJceukLq1mnPI3IZzI2NsfjTZOgYotUNHMD8fx
 D0HBPMm2pBEqK+qSl3s9419thrkeQS/BrBhmtnrA7PS8624Kpx4p6z15SBUzVN8oVpcR
 9wpvmFHK3p4bfyjWoh2DfmyQsnPlH47eAsGn/R0BSn7cwYQ7NnDqPzPI1LJ5aEsTSadL
 Txx3WCXGX1NDtyF/IWAHccNpya/0LKZ2nqoUO3EEcj3cmLHeoJ8KYVUpY77kUIh6fXoj
 f+a6RA07N+UXZBPctlDZdfdBsxjITaJRShSeuD0/q21f34Zrlug1VzREi8DVEDTPv3KD
 y7OA==
X-Gm-Message-State: APjAAAUdUshRx6U7peubIQN6AwiOi9aPBhRUDuE0dLG7AbBpwogkxUys
 iesSEaMeyaLGpj+a8chkEmSOEg==
X-Google-Smtp-Source: APXvYqzXspCMDcVbYgH/6lgSpThq/u782otjCOXgjkwhYm6xw8BQ13uACOi72z9Q3T6FJKzNAto7hg==
X-Received: by 2002:a65:4809:: with SMTP id h9mr3814513pgs.265.1574849067339; 
 Wed, 27 Nov 2019 02:04:27 -0800 (PST)
Received: from pihsun-z840.tpe.corp.google.com
 ([2401:fa00:1:10:7889:7a43:f899:134c])
 by smtp.googlemail.com with ESMTPSA id
 n18sm16063907pff.152.2019.11.27.02.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 02:04:26 -0800 (PST)
From: Pi-Hsun Shih <pihsun@chromium.org>
To: 
Subject: [PATCH] drm/mediatek: Fix can't get component for external display
 plane.
Date: Wed, 27 Nov 2019 18:04:19 +0800
Message-Id: <20191127100419.130300-1-pihsun@chromium.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_020428_832236_4D8C7E62 
X-CRM114-Status: GOOD (  11.20  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Sean Paul <seanpaul@chromium.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

The original logic is ok for primary display, but will not find out
component for external display.

For example, plane->index is 6 for external display, but there are only
2 layer nr in external display, and this condition will never happen:
if (plane->index < (count + mtk_ddp_comp_layer_nr(comp)))

Fix this by using the offset of the plane to mtk_crtc->planes as index,
instead of plane->index.

Fixes: d6b53f68356f ("drm/mediatek: Add helper to get component for a plane")
Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index f80a8ba75977..b34e7d70702a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -215,11 +215,12 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_ddp_comp *comp;
 	int i, count = 0;
+	unsigned int local_index = plane - mtk_crtc->planes;
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
 		comp = mtk_crtc->ddp_comp[i];
-		if (plane->index < (count + mtk_ddp_comp_layer_nr(comp))) {
-			*local_layer = plane->index - count;
+		if (local_index < (count + mtk_ddp_comp_layer_nr(comp))) {
+			*local_layer = local_index - count;
 			return comp;
 		}
 		count += mtk_ddp_comp_layer_nr(comp);

base-commit: 1875ff320f14afe21731a6e4c7b46dd33e45dfaa
-- 
2.24.0.393.g34dc348eaf-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
