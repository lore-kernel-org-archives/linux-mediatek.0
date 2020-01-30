Return-Path: <SRS0=00t5=3T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 563A7C2D0DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jan 2020 19:25:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DD29205F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jan 2020 19:25:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fnBnaAjK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="DgRjlq3+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DD29205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=De7Fi/7H2XYysdiopxsAL86a8WIAIGnKEystuxURSEo=; b=fnBnaAjKCOngvk
	CVGhK3bkPITlBk53zNV0/5rOYLFWGCmlTFximKwBkxiHsF9daB2VviR4Xstix+rCCGhgmyILQN6Vv
	VEzPmrweCF+xMn9Lg8ponJJC8/GHf0XEjU6S+k5rnjayd1+ZSYOqsbrGf4LKWLZvYo8GkTkQDmEJk
	exRuT5MvNk1N94vOoURZGmSBllQ1kKYQlixvG1akTvgaa61hFbm+3Xk9XaM6t2teQrFPX7cEKk43H
	HoEmXutxUEKfHU75CZmnSuiqVSAA2Sz1mJcNrPY9fU4rO26VAv5XIsDSa0sYzQIlJIzf2ZDTbIhQN
	lJLn9bcVeIc74cWVN9GA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixFRF-0004lU-Hl; Thu, 30 Jan 2020 19:25:17 +0000
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixFRD-0004kj-4X
 for linux-mediatek@lists.infradead.org; Thu, 30 Jan 2020 19:25:16 +0000
Received: by mail-yb1-xb43.google.com with SMTP id k15so1927023ybd.10
 for <linux-mediatek@lists.infradead.org>; Thu, 30 Jan 2020 11:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xqLc/hiOsciiuReeei4PXbgfrPt2jGOWmt/3LtzVX+A=;
 b=DgRjlq3+8uQ60Z4tZCeDI0XkrzyloKfvhUsMa2JS2PIDqrvsT8vNPnJKkzCFxpDXdg
 zNfMU5tYYw26ODXUUcOV+ncqGdHYZTDHZm+gplAaRAJnYla6/12srb8veAqa1itI/572
 IOL4515vgO3xWVjo4hGUHMK8NYXvRKZFHyRBg58rixOCnVQCIbJwMurKfUxZPJ6x7tpz
 csX9SZ2LSYEVMjxH4gD7ehi2IZDwfkEh9FTqBHhjhlzZTjtoyNjEQZCDIwzv5XsjgI2u
 l2WStydYRiGLfVsAawn9AUDhXHBlWmNKw2vg0OYQBcdaskTFnkStHR30VUkzGRw3eA5z
 qx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xqLc/hiOsciiuReeei4PXbgfrPt2jGOWmt/3LtzVX+A=;
 b=Px5H7mZ+DL2yBc/e2xLCyS6t3/Z1V1Nxquxif0ilq1N33zNjPSwbGcejEXDdCx9kcM
 KUWE3WUgsqlqOFr98Kh+959MRC8rCJ4l1g3hFnXfBgLKFNsAsc7iYRhQVOi7PyUvPEau
 sDNui9s0LBivsxmtjDFHDtmwCgxPdMwChr5+P5uEjPA57LP6e4hoSMvdzZ5GBMb//IXw
 ekb1fEgWENFuUiPgGcr/xo7v3aj2PLZFxONPFGl14J7fzIt5hsV/g2Y9lYLflWNafXB4
 LbLtqstAbM1o7Wwdgt0hX+AtHkn+YvJFQTvVjIpusQ+iRoe9gRL7LrYH2K1IwOmYiVkJ
 g36g==
X-Gm-Message-State: APjAAAXvalP4wcyL7WzWjrqF9L2TG8MS+5PElByVOoI7cFSNXmq5wM3K
 keneCnsQwcJXvP/H666qrwZdEw==
X-Google-Smtp-Source: APXvYqx+ZkhVmVEkjn3RME81x0M11aBuvdISwPw+4I0dmwSnJ11ZrG50bodS1GIP/bPXGsAVyBL5Ew==
X-Received: by 2002:a25:d74c:: with SMTP id o73mr5252636ybg.102.1580412313620; 
 Thu, 30 Jan 2020 11:25:13 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id q62sm2879183ywg.76.2020.01.30.11.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 11:25:13 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mediatek: Ensure the cursor plane is on top of other
 overlays
Date: Thu, 30 Jan 2020 14:24:55 -0500
Message-Id: <20200130192511.81205-1-sean@poorly.run>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200130_112515_238052_8D03DA2B 
X-CRM114-Status: GOOD (  10.01  )
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
Cc: dcastagna@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 CK Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Paul <seanpaul@chromium.org>

Currently the cursor is placed on the first overlay plane, which means
it will be at the bottom of the stack when the hw does the compositing
with anything other than primary plane. Since mtk doesn't support plane
zpos, change the cursor location to the top-most plane.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 0dfcd1787e651..4ac76b9613926 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -689,11 +689,12 @@ static int mtk_drm_crtc_num_comp_planes(struct mtk_drm_crtc *mtk_crtc,
 }
 
 static inline
-enum drm_plane_type mtk_drm_crtc_plane_type(unsigned int plane_idx)
+enum drm_plane_type mtk_drm_crtc_plane_type(unsigned int plane_idx,
+					    unsigned int num_planes)
 {
 	if (plane_idx == 0)
 		return DRM_PLANE_TYPE_PRIMARY;
-	else if (plane_idx == 1)
+	else if (plane_idx == (num_planes - 1))
 		return DRM_PLANE_TYPE_CURSOR;
 	else
 		return DRM_PLANE_TYPE_OVERLAY;
@@ -712,7 +713,8 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
 		ret = mtk_plane_init(drm_dev,
 				&mtk_crtc->planes[mtk_crtc->layer_nr],
 				BIT(pipe),
-				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr),
+				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr,
+							num_planes),
 				mtk_ddp_comp_supported_rotations(comp));
 		if (ret)
 			return ret;
-- 
Sean Paul, Software Engineer, Google / Chromium OS


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
