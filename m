Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8547EEB64DC
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Jul 2023 09:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W3jSrELTXqHxAyOLqDfz/nZ3j+MAw+i0E6FGyxIbrI0=; b=XWc6NBzPGcBqBCAoRF3l10eYDI
	uQlWbnMqHah0Ada3Patt8W5Xzn07c//dV8TvWA4pntbrfiRenRY+JBcvb6lLZvahp5/SuB7Ax5BF1
	7PTqviWEsW5vCP9Pw5mol9rlpyn5U+z+hYJvIbFvMfabtoeuIrq8oQg5oHtqSOZWWBQ5o1M/y78pF
	WK0RJZk0+1m//xDlkKgm07Xv9djriJznMYah+venAOSgo1txyuPatDi5J/gfFpew0KiXUoC2e4wH2
	6njcZA+aMZj9oigP68Z+lvdwU21lr5+jyK4ONDua6vgu7EnakOMEfbs1ulFWmAdGdgRMhhlM3no/v
	Rx1my+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFWZC-005UmR-0L;
	Sat, 01 Jul 2023 09:06:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFWZ8-005Ulh-0p;
	Sat, 01 Jul 2023 09:06:51 +0000
X-UUID: 99ed2f1c17ee11ee912e1518a6540028-20230701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=W3jSrELTXqHxAyOLqDfz/nZ3j+MAw+i0E6FGyxIbrI0=;
	b=USz0t5UNVfubVTRNjFx/crLydxLQRn792jBUZ3L4lWoG/mHl8P55d/So8jPIM+tanyf3Bh1H+2XZo7yLqmXxT99jZU9Qb2NX0rsvZvH4R6xaxVppsKYMto+TznTDw86JlxyikMQI3TuvrL2k/wJ5ysePA4OMiXFtRw7EqIy55EM=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:289b40a3-9253-4f72-8fc9-e7c9beab86df,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.27,REQID:289b40a3-9253-4f72-8fc9-e7c9beab86df,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:01c9525,CLOUDID:dda1710d-26a8-467f-b838-f99719a9c083,B
	ulkID:230701170646LIZD5JJY,BulkQuantity:1,Recheck:0,SF:19|48|38|29|28|16,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_USA,
	TF_CID_SPAM_FSD,TF_CID_SPAM_ULN
X-UUID: 99ed2f1c17ee11ee912e1518a6540028-20230701
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1255322155; Sat, 01 Jul 2023 02:06:44 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 1 Jul 2023 17:05:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 1 Jul 2023 17:05:54 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] media: mediatek: vcodec: Add a flag to indicate vdec_fb finding status
Date: Sat, 1 Jul 2023 17:05:21 +0800
Message-ID: <20230701090521.22240-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230701_020650_306362_CD40F310 
X-CRM114-Status: GOOD (  11.88  )
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

"fb_use_list" is vp9 stateful decoder driver to store current
used or referenced frame buffer, and "fb_free_list" is used to
store current available to be freed frame buffer. When the
target frame buffer cannot be found in "fb_use_list", "NULL"
should be returned to prevent unexpected frame buffer from being
placed into "fb_free_list".

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
index 70b8383f7c8e..e77d5a2452c1 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
@@ -220,15 +220,21 @@ static struct vdec_fb *vp9_rm_from_fb_use_list(struct vdec_vp9_inst
 {
 	struct vdec_fb *fb = NULL;
 	struct vdec_fb_node *node;
+	bool found = false;
 
 	list_for_each_entry(node, &inst->fb_use_list, list) {
 		fb = (struct vdec_fb *)node->fb;
 		if (fb->base_y.va == addr) {
 			list_move_tail(&node->list,
 				       &inst->available_fb_node_list);
+			found = true;
 			break;
 		}
 	}
+
+	if (!found)
+		fb = NULL;
+
 	return fb;
 }
 
-- 
2.25.1


