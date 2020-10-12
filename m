Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFFCEC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 11:57:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62C8A2074A
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 11:57:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gZDh4TCR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62C8A2074A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wZHF0w3S/K6mIE89h5vvxqQ4SEXtp9nEf23KdpnFlCc=; b=gZDh4TCRuTj6K+H5piFgkOuMMj
	p5niDiEZwlZKLyp1NARMx9Ay7VFY5IAkjlkIrZg3FkDo1RDHNYAyFEznv5NzNy0uGQjv25vJ00z0+
	9mqxWp3VlAdda6cmwpSUzj1u4R0K8iEFCm88NFH4CFD6KXDD28Ry6bUguoiPY700XV40WITQuQypB
	Wmmr497LhAAbvYmIA4ogjVnRJIk5NThYvn99ItM+SPiyWiN43z317/2Is7HANL8lfGNDosG5o67Aj
	3jsHQ+4xffzjy7ZBt+UclkkvB0+5iwlKey49L8m6A1aJVqMR7TABaQUWyPzyQ8TJ78tl9LkTgwzKL
	RRRbkSZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRwSC-0005u8-5h; Mon, 12 Oct 2020 11:57:24 +0000
Received: from mail-m17613.qiye.163.com ([59.111.176.13])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRwRz-0005o0-N7
 for linux-mediatek@lists.infradead.org; Mon, 12 Oct 2020 11:57:22 +0000
Received: from ubuntu.localdomain (unknown [157.0.31.124])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id D2857482BD2;
 Mon, 12 Oct 2020 19:57:05 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpu/drm/mediatek: fix unused parameter warning
Date: Mon, 12 Oct 2020 04:56:59 -0700
Message-Id: <20201012115700.8925-1-bernard@vivo.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZSkpLTE5JTElCTUMaVkpNS0lOS0hDSU1KSk1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MzI6NRw4HD8eQjk3IxccFQ1M
 Tj4aC1FVSlVKTUtJTktIQ0lNTk9OVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU9ZV1kIAVlBSEtMTDcG
X-HM-Tid: 0a751cabda8693bakuwsd2857482bd2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_075712_136658_25EF69D1 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Functions mtk_drm_crtc_atomic_flush & mtk_drm_crtc_atomic_enable
& mtk_drm_crtc_atomic_disable don`t use the second parameter.
So we may get warning like : warning: unused parameter '***'
[-Wunused-parameter].
This change is to fix the compile warning with -Wunused-parameter.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 4d29568be3f5..6e55ec0e80bb 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -542,7 +542,7 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 }
 
 static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
-					struct drm_crtc_state *old_state)
+					struct drm_crtc_state __attribute__((unused)) *old_state)
 {
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
@@ -575,7 +575,7 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 }
 
 static void mtk_drm_crtc_atomic_begin(struct drm_crtc *crtc,
-				      struct drm_crtc_state *old_crtc_state)
+				      struct drm_crtc_state __attribute__((unused)) *old_crtc_state)
 {
 	struct mtk_crtc_state *state = to_mtk_crtc_state(crtc->state);
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
@@ -592,7 +592,7 @@ static void mtk_drm_crtc_atomic_begin(struct drm_crtc *crtc,
 }
 
 static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
-				      struct drm_crtc_state *old_crtc_state)
+				      struct drm_crtc_state __attribute__((unused)) *old_crtc_state)
 {
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	int i;
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
