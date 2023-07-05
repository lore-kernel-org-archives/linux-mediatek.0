Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F55AEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jul 2023 09:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=se64KQH3gerKnz6HlAf5ClGc47AESPwNkTnbl8HVi8g=; b=cPK0Rh8v0ff9BAYeYexDNhkAT2
	O3hqrDaP5x6E36a6QvhgDoyGKMkXzjhh+QOK5EwTpyvPiqZQbdQdxhdH9QZaLV2JKXvYl0wqLLSPj
	7cLo8CP++xhioeR1Rn6XSY3mrZ8zjaQDQ27de/QgX2zw1aky6/ZgHAESEmQ4tv0qtGhfVmVSgqXtF
	pODiUVG2epfPxU7v3jVJOgJICVtWL5XJAjvQi2kfS/Y4eRNeOBQffXh0DnKQsl3hVHF0WNGXNmvvf
	pG/vtuLhAilblQ3t1jAgptV6dEQsAf3m/f27+U9vwzj6BRxOCgH5fVTA4R7/YhCM6AxUs6VzUz8JN
	Fso0jEiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGybi-00FK9e-0P;
	Wed, 05 Jul 2023 09:15:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGybf-00FK8q-31;
	Wed, 05 Jul 2023 09:15:29 +0000
X-UUID: 76d3cf9e1b1411ee912e1518a6540028-20230705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=se64KQH3gerKnz6HlAf5ClGc47AESPwNkTnbl8HVi8g=;
	b=YWQ9JoRBZdmLS8nv8rYO9ZB9EVD+SYsX2BcYHf4nkYU2GluDUlUYHr6yAIAG6FH6MfsCpXNen8gd1SwBabFJssrI94NS/zcDxKj3BuidFVDFzStHUQqpUTBHl2tY6t2hfNrD2uh2eog7aHTdBaiqEHQPh4lsSfz3Sh88UDzZCaU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:cf90bba3-fef4-43c0-be11-4a633f5fedec,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.27,REQID:cf90bba3-fef4-43c0-be11-4a633f5fedec,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:01c9525,CLOUDID:596da6da-b4fa-43c8-9c3e-0d3fabd03ec0,B
	ulkID:230705171455BG3EQGNF,BulkQuantity:1,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_ULN,
	TF_CID_SPAM_SNR,TF_CID_SPAM_SDM
X-UUID: 76d3cf9e1b1411ee912e1518a6540028-20230705
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2082162887; Wed, 05 Jul 2023 02:15:20 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 5 Jul 2023 17:14:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 5 Jul 2023 17:14:43 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong
	<yunfei.dong@mediatek.com>, Maoguang Meng <maoguang.meng@mediatek.com>, "Irui
 Wang" <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3] media: mediatek: vcodec: Return NULL if no vdec_fb is found
Date: Wed, 5 Jul 2023 17:14:41 +0800
Message-ID: <20230705091441.16926-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_021528_004936_9F722C1A 
X-CRM114-Status: GOOD (  12.69  )
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

"fb_use_list" is used to store used or referenced frame buffers for
vp9 stateful decoder. "NULL" should be returned when getting target
frame buffer failed from "fb_use_list", not a random unexpected one.

Fixes: f77e89854b3e ("[media] vcodec: mediatek: Add Mediatek VP9 Video Decoder Driver")
Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
changed with v2:
 - add Fixes tag.

changed with v1:
 - remove the added flag variable.
 - updata commit message.
---
 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
index 70b8383f7c8e..a27a109d8d14 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
@@ -226,10 +226,11 @@ static struct vdec_fb *vp9_rm_from_fb_use_list(struct vdec_vp9_inst
 		if (fb->base_y.va == addr) {
 			list_move_tail(&node->list,
 				       &inst->available_fb_node_list);
-			break;
+			return fb;
 		}
 	}
-	return fb;
+
+	return NULL;
 }
 
 static void vp9_add_to_fb_free_list(struct vdec_vp9_inst *inst,
-- 
2.18.0


