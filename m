Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D34C433E5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 12:33:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A579521D79
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 12:33:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q/o+VRW5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GH0UPLX7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A579521D79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+JYdQCf8NehBbDEdyZwcD3ftLd2KLlfUSGKKtUXWF1k=; b=q/o+VRW5kA0KhNcIpH7R0R+FJn
	TyeIRXtVEB7c9WJEB4fr4NEvdlGOjXEWbFZPHOFawolRhUrBZO5y3hHh5eqiz+rU2kl5dz88HnNFa
	eEicSW3Kw5/Ows2edZKNb1Dj0qgHGRdgdF4aMAQW1Ou1uTBKZdGBT/YOj9VcUKsRCLAchRYAtIgfV
	0u/RAimxvnf7Mhbgrp/EKaGGVnUqx2n8UbNwwsa9WkfkGHNDBCS6DPlkuinK8119ZYDoH+mSxhpVR
	OE/rNXJF1t7N8o2PgWqTzwYDAfUZup/y2HeWFU3FlXD3bektVPCXEcw59nAhHEPNP42MzCruNdUtH
	qmt5Oang==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvK7y-0001ZL-Cv; Tue, 14 Jul 2020 12:33:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvK7w-0001Xb-15
 for linux-mediatek@lists.infradead.org; Tue, 14 Jul 2020 12:33:41 +0000
X-UUID: 1feaf9fad9ad48c0978bca070568dc06-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Wb9Fg/DmCPoZvHFLV++Y4wJJ7QCWM6MgqBt23e2lcAY=; 
 b=GH0UPLX76G/0Qc+7HBFMgCT3BZIQUy8i7zZcEUvsfs6aZy6ZJxp0G4lM7FNSnFZbvqdjr0y7C9uzFVQsdjjEAKGQ0hBxOYI7G1vWzh4duqFriFyAI5maLNI8EO2kriFHgimDVtNtQqzU5ihHtvJ88OO1/xzeuEKpNH4YyVslRHg=;
X-UUID: 1feaf9fad9ad48c0978bca070568dc06-20200714
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 763712352; Tue, 14 Jul 2020 04:33:31 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 05:33:26 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 14 Jul 2020 20:33:22 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 14 Jul 2020 20:33:23 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/panel: Fix auo,
 kd101n80-45na horizontal noise on edges of panel
Date: Tue, 14 Jul 2020 20:33:32 +0800
Message-ID: <20200714123332.37609-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: 18BDFD4BAA21069D5BD3D14833E558734FF6512BDBB22C05656E7C8D6A48DBC92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_083340_203452_3DB2FF90 
X-CRM114-Status: UNSURE (   7.97  )
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
Cc: ck.hu@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-mediatek@lists.infradead.org, Jitao Shi <jitao.shi@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fine tune the HBP and HFP to avoid the dot noise on the left and right edges.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 48a164257d18..3edb33e61908 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -615,9 +615,9 @@ static const struct panel_desc boe_tv101wum_nl6_desc = {
 static const struct drm_display_mode auo_kd101n80_45na_default_mode = {
 	.clock = 157000,
 	.hdisplay = 1200,
-	.hsync_start = 1200 + 80,
-	.hsync_end = 1200 + 80 + 24,
-	.htotal = 1200 + 80 + 24 + 36,
+	.hsync_start = 1200 + 60,
+	.hsync_end = 1200 + 60 + 24,
+	.htotal = 1200 + 60 + 24 + 56,
 	.vdisplay = 1920,
 	.vsync_start = 1920 + 16,
 	.vsync_end = 1920 + 16 + 4,
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
