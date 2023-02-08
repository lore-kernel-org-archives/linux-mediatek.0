Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7BDC6379F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 09:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dmmAN53knGP8A38vOJ+8chP7YSe5P6lPPiDtcUaDnc=; b=ysCCvTixdIHpcFmuonvYuPUml8
	IrZHlr6IV+laA41bWS/PLF0edIl69Xi+mlSl8x/OdeYYKlSCeux48B/h7p1bgKbGHxRmjGpjQbfQ+
	MfpTBjeQSRBhj7PNFw2cSZd67QeiuxfUn0zJnt3Q52oCBPpeWeDWAK8rfeFEO2bXuJm4lkI5DP4Ti
	RlW9R4OI2FSD5hOO6FhvZXK0sIRxyPOoLQin5UPIl3av0uH20BDujO0VWt8SyuhEvY2OmuR1EymBn
	TZqT2GnF09wKwk6H3w5I094B2pcy6J8z+grDVm16MVWH/7cj1J7A5lWw9cYVaPKGgKEiRhRDDgxi+
	KdMYJaLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPgRy-00EhIU-CA; Wed, 08 Feb 2023 09:09:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPgRv-00EhEC-Gk; Wed, 08 Feb 2023 09:09:08 +0000
X-UUID: 394c489ca79011edbbe3f76fe852e059-20230208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5dmmAN53knGP8A38vOJ+8chP7YSe5P6lPPiDtcUaDnc=;
	b=ackzU80UetfWsnTwPin9CGR6eXZJw1y711GdFysAMpjEIfuL5MHBg4JQAIQ2EdZHnMtj3nzv70EBohKHheVk/P5pu+/w1+nSXeguqRB5szjcp9SCnu5bPH77XDTMdpjvv5Rslny2uifeQR4HS7G79GJH1aqvOiLBP5PNA1RQktw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:bcfd107e-0f21-487c-859f-6812c16c9acf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:885ddb2,CLOUDID:0721458e-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 394c489ca79011edbbe3f76fe852e059-20230208
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1763499284; Wed, 08 Feb 2023 02:08:59 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 8 Feb 2023 17:08:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 8 Feb 2023 17:08:56 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Ping-Hsun
 Wu <ping-hsun.wu@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v6 01/12] media: platform: mtk-mdp3: fix potential frame size overflow in mdp_try_fmt_mplane()
Date: Wed, 8 Feb 2023 17:08:44 +0800
Message-ID: <20230208090855.18934-2-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230208090855.18934-1-moudy.ho@mediatek.com>
References: <20230208090855.18934-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_010907_580278_96D8B7CA 
X-CRM114-Status: GOOD (  10.96  )
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

Fix overflow risk when setting certain formats whose frame size exceeds
a RGB24 with 7723x7723 resolution.

For example, a 7723x7724 RGB24 frame:
    1. bpl (byte per line) = 7723 * 3.
    2. Overflow occurs when bpl * 7724 * depth.

Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c
index 4e84a37ecdfc..36336d169bd9 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c
@@ -4,6 +4,7 @@
  * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
  */
 
+#include <linux/math64.h>
 #include <media/v4l2-common.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/videobuf2-dma-contig.h>
@@ -428,14 +429,15 @@ const struct mdp_format *mdp_try_fmt_mplane(struct v4l2_format *f,
 		u32 bpl = pix_mp->plane_fmt[i].bytesperline;
 		u32 min_si, max_si;
 		u32 si = pix_mp->plane_fmt[i].sizeimage;
+		u64 di;
 
 		bpl = clamp(bpl, min_bpl, max_bpl);
 		pix_mp->plane_fmt[i].bytesperline = bpl;
 
-		min_si = (bpl * pix_mp->height * fmt->depth[i]) /
-			 fmt->row_depth[i];
-		max_si = (bpl * s.max_height * fmt->depth[i]) /
-			 fmt->row_depth[i];
+		di = (u64)bpl * pix_mp->height * fmt->depth[i];
+		min_si = (u32)div_u64(di, fmt->row_depth[i]);
+		di = (u64)bpl * s.max_height * fmt->depth[i];
+		max_si = (u32)div_u64(di, fmt->row_depth[i]);
 
 		si = clamp(si, min_si, max_si);
 		pix_mp->plane_fmt[i].sizeimage = si;
-- 
2.18.0


