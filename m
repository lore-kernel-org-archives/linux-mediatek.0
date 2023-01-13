Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7508C54EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 06:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8k9F/t2cGOgm7cgze3tgM/N3f5OW0K5CP5YZeJ76/Ok=; b=BInlb+e30iyxNlpQ6GbYhcxgkd
	kjvRw5LdbKs+6gUL2dMXnTCilnzvdChxZ9uvUX7HRvAfOVvUkRxpGDNb4q677DjFam5IqcbW3t8Lx
	6tBO4XVYa+JO7kMHMTirdmeWOCuwZznGgez0OhvLKOp5SmFZjbS7eGiwgBvtA4YQYXteX56LaopQH
	D1/fO8lT19ehUiSIIsxtckIbzky75x+ka5vXN580CUQfn54/7QR0Hq7BJlKU95qvnQ33hhQEz2zWG
	8Bm/8dGYSP5qw6A1q/EqbaKQbx3HsdTA7iiKnbJJ7Yv20+3OZ7B6c2++gAl/nfWy7y+wOqQq04eCE
	TsZTg8gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDlJ-000r5n-Dv; Fri, 13 Jan 2023 06:42:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDlI-000r4x-9U
	for linux-mediatek@bombadil.infradead.org; Fri, 13 Jan 2023 06:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8k9F/t2cGOgm7cgze3tgM/N3f5OW0K5CP5YZeJ76/Ok=; b=cZxguvHWJdT+NEoMTxafrfgqfM
	8U9KvIv8rCrePZyi+eNKWemC8/3z3AsUnaIMhTk6ssCfRgiQpmwULAL01NPsPdPkSfmmjqLYYHj4Q
	GLandYP2Ossj2IW2AJUL5bj8Q0Gc227oxxSnBOvpfXKlDE1fcJmJEYOckYxJPItAJj2hqTBnmZ2Yf
	9IWLyx4Au378NXUeamOi/CdXNpUB/yPupAkNgy+mqzeZV7FwIXJ+rD5XFx4IR30JdSNepLj0Thf2P
	vYJxRDxlbjHx0tLJZWOKMydhrxsb36AACzxPOGA+wufKiuzFZXz9AcQVfJMjK8XtNFjsSrKwxKjKy
	4QrOLtPg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pGDkz-004G1o-2E
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Jan 2023 06:41:45 +0000
X-UUID: 578bb488930d11eda08d4d6090ec5a5c-20230112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8k9F/t2cGOgm7cgze3tgM/N3f5OW0K5CP5YZeJ76/Ok=;
	b=lXUBGSd55VTQxheE2ayM/JyvbAG+XUFis+WdwAZxCGq3SxpB/l3WEsF+Zc7hFrioKArm6OoCopv8a2xM26Uk7oHyWQb0oTd0x2fnVBI4v9H0NCiLi+0DMnN/pcWrMNbI585vHGT49vPWhlgruPL3QHRWFLKN6qRLuUTPtxjAqDM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:30136608-3449-4754-9e70-d2ef1c6d0b0e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.17,REQID:30136608-3449-4754-9e70-d2ef1c6d0b0e,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:543e81c,CLOUDID:321f8c54-dd49-462e-a4be-2143a3ddc739,B
	ulkID:230113144144OF9JR3UY,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0
X-CID-APTURL: Status:success,Category:nil,Trust:0,Unknown:0,Malicious:0
X-CID-BVR: 0,NGT
X-UUID: 578bb488930d11eda08d4d6090ec5a5c-20230112
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1478962740; Thu, 12 Jan 2023 23:41:43 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 13 Jan 2023 14:41:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 13 Jan 2023 14:41:06 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v5 01/12] media: platform: mtk-mdp3: fix potential frame size overflow in mdp_try_fmt_mplane()
Date: Fri, 13 Jan 2023 14:40:53 +0800
Message-ID: <20230113064104.22402-2-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230113064104.22402-1-moudy.ho@mediatek.com>
References: <20230113064104.22402-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_064143_156926_7767BC13 
X-CRM114-Status: GOOD (  10.71  )
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
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c
index 4e84a37ecdfc..c63bd5e479e0 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c
@@ -432,9 +432,9 @@ const struct mdp_format *mdp_try_fmt_mplane(struct v4l2_format *f,
 		bpl = clamp(bpl, min_bpl, max_bpl);
 		pix_mp->plane_fmt[i].bytesperline = bpl;
 
-		min_si = (bpl * pix_mp->height * fmt->depth[i]) /
+		min_si = ((u64)bpl * pix_mp->height * fmt->depth[i]) /
 			 fmt->row_depth[i];
-		max_si = (bpl * s.max_height * fmt->depth[i]) /
+		max_si = ((u64)bpl * s.max_height * fmt->depth[i]) /
 			 fmt->row_depth[i];
 
 		si = clamp(si, min_si, max_si);
-- 
2.18.0


