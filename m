Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE80E95A61
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Oct 2023 11:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G2hwZoXcbyNGfedM4B88uDwT0h+xRYSV2MrJHG+Tp70=; b=gHoGdaj21MSm7Yq5o5Nz+Ztr+h
	k4NR0HMzrLr+fE33GHe1XkUtSBlu06I858pGceNUMsk4w+dI/EmO0232kYIPUrJ2kSltmMN+rgbAy
	Y8/R0O1koTQg8/ZXIjW2aoz0NfW8w9Bv6TWt7HNQdjYMQSzBOQr+1hWlkH3ht+EPgdFpobIhBuS7d
	dZAOKRxRz1Pw619p6TqrNwey8m6E3PLcpynBqp+oD9VUCY4zbMdqbzAPPJjJnYiP+Ja1+SWGFEGCh
	ICH/Eorq9eh8Lo+7Y/7APshGqwrlEj/sNw+vZsirS2xNgqs85qnDBkBkwvMBNxWiKHXfPKfCfkOqw
	yz1VmDGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp5ZL-007VNZ-24;
	Sat, 07 Oct 2023 11:34:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp5ZJ-007VN7-0J;
	Sat, 07 Oct 2023 11:34:02 +0000
X-UUID: 64c4a3d8650511ee9b7791016c24628a-20231007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=G2hwZoXcbyNGfedM4B88uDwT0h+xRYSV2MrJHG+Tp70=;
	b=u6NylKEHefPx9u32F9X61no9/4crwSlY0fqNlz/W58Ust3yRp/qaLMEUOWouFfYb3HlmVLgiauRKzSxfHbSVj4bDo2hKanlmqS8CUJdZRd0mdAMnd0YRPackxq59O+OA7F+ITlAA7XUKU0YkWrSjdPBq/uQwBR5b5q2CQ5YIYro=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:4e821f16-b234-4dbc-8452-9ca5eba52bb8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:abee8bf0-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 64c4a3d8650511ee9b7791016c24628a-20231007
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 998247035; Sat, 07 Oct 2023 04:33:53 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 7 Oct 2023 19:33:50 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 7 Oct 2023 19:33:49 +0800
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
Subject: [PATCH v2] media: mediatek: vcodec: Handle invalid encoder vsi
Date: Sat, 7 Oct 2023 19:33:47 +0800
Message-ID: <20231007113347.28863-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_043401_161268_494A02E5 
X-CRM114-Status: GOOD (  10.75  )
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

Handle invalid encoder vsi in vpu_enc_init to ensure the encoder
vsi is valid for future use.

Fixes: 1972e32431ed ("media: mediatek: vcodec: Fix possible invalid memory access for encoder")

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
changed with v1:
 - add Fixes tag
 - move vsi check to vpu_enc_init
 - update commit message
---
 drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
index d299cc2962a5..39e8f3ac53ca 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
@@ -153,6 +153,11 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
 		return -EINVAL;
 	}
 
+	if (IS_ERR_OR_NULL(vpu->vsi)) {
+		mtk_venc_err(vpu->ctx, "invalid venc vsi");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
2.18.0


