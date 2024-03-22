Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AF1C47DD9
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 09:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=op9aiY3TOWj6dPubjkg2dvGqaIeTnrx2TAJelM32Z9k=; b=jtBrUkjYJIhPM7zrjBIMsRstPJ
	Ie9b3QCP58t9GB6aHoPscqoktd74gnooGJQhdDo5KbXPND7ebYLPf+IMoBtqYkuAZRSCXTX1NEwX6
	kzL/sWB6ZgrmsBe42NlpGz/JS56QVlrJkeEhap9k5j4Cn6J8S+epsbcwNKM2twB9Z0bT5EjkdA7mP
	ti7+Viw3OXjaZBsJds7n6RZ7KAvcCQpIHEifAFnZWcP+S+muuck3OGDVF9XSmhw0K4d1FvkGt6X8j
	9aOC+/6PQk+u9OgBz/3XFJu6B+VeNTE5rKbU0PKAOPXANLJN3hcvRArOtsJ44LtTuOE9HDH5mOgGr
	8S+HUDGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnayN-00000006Vgg-20Rv;
	Fri, 22 Mar 2024 09:13:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnaxd-00000006VEy-1qJl;
	Fri, 22 Mar 2024 09:13:24 +0000
X-UUID: 6688b358e82c11ee9aa9374d6d45775a-20240322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=op9aiY3TOWj6dPubjkg2dvGqaIeTnrx2TAJelM32Z9k=;
	b=SiFYPpUvCcZ238Oj9i+4n8M4NgzNyCMxC43KdmUk/yz4/TdXuH0Vn9VDPzrghuHE3fOZs1viOonTSKRs9uGDl3cfA+XZ7yQ5uR722xxGehY/qCduA0+EreOzf//iPeDwOKQWOR2uoL6jK0f8QosVOD+hM1rcpCtz4xr5PqryneA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:e1b69751-564c-42dc-881e-f34379503674,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:96213400-c26b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 6688b358e82c11ee9aa9374d6d45775a-20240322
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 917327066; Fri, 22 Mar 2024 02:13:09 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 17:12:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 17:12:34 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>, Hsiao Chien Sung
	<shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH v5 07/14] drm/mediatek: Rename files "mtk_drm_crtc.c" to "mtk_crtc.c"
Date: Fri, 22 Mar 2024 17:12:25 +0800
Message-ID: <20240322091232.26387-8-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240322091232.26387-1-shawn.sung@mediatek.com>
References: <20240322091232.26387-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_021314_818202_FAE3D714 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Rename files mtk_drm_crtc.c to mtk_crtc.c and
modify the Makefile accordingly.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/Makefile                       | 4 ++--
 drivers/gpu/drm/mediatek/{mtk_drm_crtc.c => mtk_crtc.c} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename drivers/gpu/drm/mediatek/{mtk_drm_crtc.c => mtk_crtc.c} (100%)

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 5e4436403b8d2..0198b50820d4c 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
-mediatek-drm-y := mtk_disp_aal.o \
+mediatek-drm-y := mtk_crtc.o \
+		  mtk_disp_aal.o \
 		  mtk_disp_ccorr.o \
 		  mtk_disp_color.o \
 		  mtk_disp_gamma.o \
@@ -8,7 +9,6 @@ mediatek-drm-y := mtk_disp_aal.o \
 		  mtk_disp_ovl.o \
 		  mtk_disp_ovl_adaptor.o \
 		  mtk_disp_rdma.o \
-		  mtk_drm_crtc.o \
 		  mtk_drm_ddp_comp.o \
 		  mtk_drm_drv.o \
 		  mtk_drm_gem.o \
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
similarity index 100%
rename from drivers/gpu/drm/mediatek/mtk_drm_crtc.c
rename to drivers/gpu/drm/mediatek/mtk_crtc.c
-- 
2.18.0


