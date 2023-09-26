Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EABE7D27B
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 10:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9pAB4vHxgXuOrF3cQ2v7MgCCwLtC7aUzC54ZVS4HYqQ=; b=nZhBgQmpCgZhfPTu/Ys4+YYMSm
	huxfbNhZL2+QeP9tKIK3kxW4HqpNv4EMW7CKnOYqX0EXZeBUD+r8XeysMGY2lN4Oijb6bY8d1O87H
	b0gy3/rDlWBRQJq6ZIwOKy9zrWFIjpEcXJWooUzJt5V0XwpY1aINKV+bNYL/JfuBCxyrh2m7bXR/0
	OUam2Owj1r99VF3fCyntNPNymB6ubko+tJElWxY1BTvmjuBVO1FXHwQlfVXrQeRUlrDpYPET4cka1
	NCTzw5RXt9mqlh90h7v9s31kmA/4OKgQZePnH4MOuYveOkmRSpDKDrBvM108wjmpTf72n2oFdDYc/
	sIIkI1pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql5A9-00G2NO-04;
	Tue, 26 Sep 2023 10:19:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql5A6-00G2Mt-1r;
	Tue, 26 Sep 2023 10:19:27 +0000
X-UUID: 24c4deb85c5611ee9b7791016c24628a-20230926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=9pAB4vHxgXuOrF3cQ2v7MgCCwLtC7aUzC54ZVS4HYqQ=;
	b=K8bbdp7gq1NlWfol4J5gyjwhwQRd431TAgeFUo+8LQzkjfnkyJwQV7udbjxAInoKdjl/BfdY78D5v5YRqFl0/4hNuLUsjEVhISr/Hr1Rl8Dx3s3oUjl7HXimQ+gO4lmw+sd1oYscZVbI1eiUEntCaXBM9jWYR3cQIWf1Eg5JLaY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:b5730924-3bff-40d3-9b90-b43ec521d7b8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:2c067bc3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 24c4deb85c5611ee9b7791016c24628a-20230926
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 707863151; Tue, 26 Sep 2023 03:19:14 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 26 Sep 2023 18:19:11 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 26 Sep 2023 18:19:10 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>, Irui Wang <irui.wang@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Maoguang Meng
	<maoguang.meng@mediatek.com>
Subject: [PATCH 1/2] media: mediatek: vcodec: Fix encoder access NULL pointer
Date: Tue, 26 Sep 2023 18:19:08 +0800
Message-ID: <20230926101909.15030-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.105600-8.000000
X-TMASE-MatchedRID: GEfnc4mEQr+uhCBFl/b63nQIOMndeKgE5Y0kb0hqatxnerzbhugqspVD
	ZsT0rYWCzpwM53iUVtXbCHv011Gy9dS7ezKc1AokngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIx1F
	PlNAAmcDr4JEOMLTOvRaDB3e61dbj0hR2WQtXdazG0iw/N0V7hZ6oP1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.105600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F52746FEAA883B08C25F18637D5B84EC5699F7FD68D85E3D7C3A99FE851EC73F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_031926_625593_B6157163 
X-CRM114-Status: UNSURE (   9.73  )
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

Need to set the private data with encoder device, or will access
NULL pointer in encoder handler.

Fixes: 1972e32431ed ("media: mediatek: vcodec: Fix possible invalid memory access for encoder")

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
index d299cc2962a5..ae6290d28f8e 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
@@ -138,7 +138,8 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
 	vpu->ctx->vpu_inst = vpu;
 
 	status = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler, vpu->id,
-					    vpu_enc_ipi_handler, "venc", NULL);
+					    vpu_enc_ipi_handler, "venc",
+					    vpu->ctx->dev);
 
 	if (status) {
 		mtk_venc_err(vpu->ctx, "vpu_ipi_register fail %d", status);
-- 
2.25.1


