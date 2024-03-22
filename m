Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81218C47DD9
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 01:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJt1nKNgrkXP+kAfgyhqIEi0kY1kNO04ElypM0mbftk=; b=OO+c57qA9r2sEYOQy4V6XZRJAF
	OvhSVv4J1acV3/6zh9n/Q0exFt2oacLSzgwLKj7JW2ydMb6A2mUso5A1YYvVjgldMRE8B6aF3KN9+
	QOLoMzgGnvETh2jwTejc7iYBDqZf2GNvJZifrsRkjJhhiwMjZuxpY/fidnRMxytsJeqXS82emrFqh
	a8ZtbQyOm99bZj0ik1E538untd3eLWFCwOl0pMQnwZG2Ve6txGFSw7jF+xFZoB6pOHhcenrD0fQ/A
	8lOiMLzi9nAZCjR9s9gJ+yS67n15v8SPwjwO1dFJUYMRz4HiIWelVtbayV97jJDFGiuZKjiIZeccw
	rDLHakug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnThw-00000005NDK-04hx;
	Fri, 22 Mar 2024 01:28:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnThm-00000005N8h-39xF;
	Fri, 22 Mar 2024 01:28:24 +0000
X-UUID: 73d1743ce7eb11eeacdb61a41848c7d2-20240321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zJt1nKNgrkXP+kAfgyhqIEi0kY1kNO04ElypM0mbftk=;
	b=c5RN5lLJUxVFpWM6+SKgMwTQHH9jpe0iNMDUX7iDlr/13bLHqSf0MluqJ6kj1giOtsNm4jTT5q8rMTJEzmOzBAE5pipZMP6qLQ5ItycjwHrCUprbF/a9P5Ngr8npZ37bQU0JVbYSLhntxUJoUB3cdlB1BfAyUfJNbr3mUWJTxKI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:cc1da714-2799-42fa-857f-1581d56a1e1c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:42a82e00-c26b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 73d1743ce7eb11eeacdb61a41848c7d2-20240321
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 401658473; Thu, 21 Mar 2024 18:28:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 09:28:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 09:28:10 +0800
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
Subject: [PATCH v4 07/14] drm/mediatek: Rename files "mtk_drm_crtc.c" to "mtk_crtc.c"
Date: Fri, 22 Mar 2024 09:28:01 +0800
Message-ID: <20240322012808.26234-8-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240322012808.26234-1-shawn.sung@mediatek.com>
References: <20240322012808.26234-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.320300-8.000000
X-TMASE-MatchedRID: z+1rZbcYA6y4pD9RIlWSGjl/LoO+pjoA1cuIRwt/4Mg1LB46LFAAkkfp
	kQx2u0KsbDDGr42tgBOb94a9aKYgZT13WcdbGR6Qtw+xHnsmQjN3Bf9JIqsoeMnKcJMuNOWgo8W
	MkQWv6iXBcIE78YqRWo6HM5rqDwqtcUMxtgayi+JjGvmfcUwkX199DkWxEQdhs2VJT05J8nL7QD
	4WQBDTOEMMprcbiest
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.320300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DAB789DCCAC938BD7D08F9980D60F1AB6FE6B6A88517F66749143ED778170AA92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_182822_819391_706E8900 
X-CRM114-Status: UNSURE (   9.30  )
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

Reviewed-by: AngeloGiaocchino Del Regno <angelogioacchino.delregno@collabora.com>
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


