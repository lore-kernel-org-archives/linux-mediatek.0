Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE61C54E60
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Mar 2024 07:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QFCQcKgColevbSb+qogs2cN+XhmY4yT0db/AAfjr4Q=; b=0w3HeRoWo9NTawIsUey02m8Dkv
	f5Q8QZAB/JUnK2b9Qmr2OHdYrRsxFu+ea617SU1pUvXP7zU/5bTZW8Znu5OAONAwJjjvva2R3tdzM
	rN7PDLzLlEs2sxWkhAd4MQ1de+DTr4JetF1Gr0v7jMFWbh1JFuZxEeC0yJbRvixHUaa8fC/0nlwkv
	UDYT6Qw3WIdiuxW/uRRD7AsM7ZzGlXT7I7vpTx8wcTJppJUQajT3/WHMsitN27PfbQDKPsDAXZcWM
	WRQs3j6t2W4Iw9yA0gC1Gt68T4h2Aa7uJdu0N9eNA9FwdCv02ZtGm5t3AaxXOMC+nZYlZc/2lrQ+8
	BPhR4lqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmTVG-0000000Bc2b-2CEm;
	Tue, 19 Mar 2024 07:03:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmTV8-0000000Bbwq-3W43;
	Tue, 19 Mar 2024 07:03:12 +0000
X-UUID: bbba9546e5be11ee9aa9374d6d45775a-20240319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4QFCQcKgColevbSb+qogs2cN+XhmY4yT0db/AAfjr4Q=;
	b=b43RzMG/lRKw7R0kAFWS6IHr13ttjZgOwduGUUdQBsFrx0mCv1TwfUc2DNdYJ1z8qb9kbO7UQAhjrqAbgGYBXGpy4aq60gratrTTn6f4FJQneUl8ovMDkkQbenXJuCZarrWBWjEpvVKNhgPVFAvJA2PbuLLekz1o66N2wyxm+po=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:4e0ea61b-abd0-4deb-9bd5-6be044505a4e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:a6f02a85-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bbba9546e5be11ee9aa9374d6d45775a-20240319
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1464124572; Tue, 19 Mar 2024 00:03:05 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Mar 2024 15:03:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Mar 2024 15:03:00 +0800
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
Subject: [PATCH v2 11/14] drm/mediatek: Rename files "mtk_drm_plane.c" to "mtk_plane.c"
Date: Tue, 19 Mar 2024 15:02:54 +0800
Message-ID: <20240319070257.6443-12-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240319070257.6443-1-shawn.sung@mediatek.com>
References: <20240319070257.6443-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.145600-8.000000
X-TMASE-MatchedRID: pxZ747jJzGC4pD9RIlWSGjl/LoO+pjoA1cuIRwt/4MiSYqzYmxOFIvKC
	81FnsF5I+22OskOP/1/M4DgYt2okipH0YXYnbGozFEUknJ/kEl7dB/CxWTRRu4as+d5/8j56uJM
	m6seGO7WxT/4fpUXCiHV3a4sG484pfGlvIDTgud/f0+PZHSsrPg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.145600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 47EE3DFAA1D14EB5E562DE1EFC945EBDE599355E1B13DC44606942FAA5F7F0742000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_000311_072033_69F78926 
X-CRM114-Status: GOOD (  10.36  )
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

Rename files mtk_drm_plane.c to mtk_plane.c and
modify the Makefile accordingly.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/Makefile                         | 4 ++--
 drivers/gpu/drm/mediatek/{mtk_drm_plane.c => mtk_plane.c} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename drivers/gpu/drm/mediatek/{mtk_drm_plane.c => mtk_plane.c} (99%)

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index bdb71738e1f31..a47fbec7b9ce1 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -12,12 +12,12 @@ mediatek-drm-y := mtk_crtc.o \
 		  mtk_disp_rdma.o \
 		  mtk_drm_drv.o \
 		  mtk_drm_gem.o \
-		  mtk_drm_plane.o \
 		  mtk_dsi.o \
 		  mtk_dpi.o \
 		  mtk_ethdr.o \
 		  mtk_mdp_rdma.o \
-		  mtk_padding.o
+		  mtk_padding.o \
+		  mtk_plane.o
 
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
similarity index 99%
rename from drivers/gpu/drm/mediatek/mtk_drm_plane.c
rename to drivers/gpu/drm/mediatek/mtk_plane.c
index 95a4328a9b0b6..4625deb21d406 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -16,7 +16,7 @@
 #include "mtk_crtc.h"
 #include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
-#include "mtk_drm_gem.h"
+#include "mtk_gem.h"
 #include "mtk_plane.h"
 
 static const u64 modifiers[] = {
-- 
2.18.0


