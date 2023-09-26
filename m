Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2009E7D279
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 10:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40Z60dywDiXam7OraAE9s6YIBV6xPjNlnKiDsQUuJu8=; b=Zc1EbyOCHL7DIKAF2gcsOTB5uW
	SC0dMsiZRAChmd9z7j5N/CxiLZdf/H5jrZBt4e9LfnjJN4msYB3oiYG+YHJffG+N4pbUv4go4RM/y
	hqLvxIp4zdHC8tOIhW2q/da11iOu0DvXLrc3Ar5nNGSZZxkiM5MEdbJP6bFQQz2HsZokS5NSVAjf5
	0t8JDy5MCW8Zy260PmgtG4kafO6+kuaxs3vgQZB0OS7n28fWmWljJyeXhOnQr2qqck7PYvu61wQek
	TzFqMBk3QaWP15CvBMyGrcSxHlNP52XBSE/slAIjNIH4slCFNZ0Zvv9U3obam5K1bgK2IlgFA3t1/
	Qsz/cnHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql5Aa-00G2Si-21;
	Tue, 26 Sep 2023 10:19:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql5AX-00G2S9-1w;
	Tue, 26 Sep 2023 10:19:54 +0000
X-UUID: 3916a5f45c5611ee9b7791016c24628a-20230926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=40Z60dywDiXam7OraAE9s6YIBV6xPjNlnKiDsQUuJu8=;
	b=ZJYpMlQezmvm/RmzGzn6vV5ZFBg1gKBchkKwIG6vxZTAA0mrYk7dUZgCaENnaOsqD7L2ODhzHn8WC2URQcL8D25I7nO4Hc7TCArzm/pNVPlGALw6DVmpy+FP/xoqa7yl0W9Ui56Tui6wKaE8zxUybJETEl7mqkHs9SDuVbfWGD0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:2791c5b3-ee81-46d3-b54d-234f1807bd9d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5f78ec9,CLOUDID:22596414-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 3916a5f45c5611ee9b7791016c24628a-20230926
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 340538886; Tue, 26 Sep 2023 03:19:48 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 26 Sep 2023 18:19:14 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 26 Sep 2023 18:19:13 +0800
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
Subject: [PATCH 2/2] media: mediatek: vcodec: Handle encoder vsi NULL pointer case
Date: Tue, 26 Sep 2023 18:19:09 +0800
Message-ID: <20230926101909.15030-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230926101909.15030-1-irui.wang@mediatek.com>
References: <20230926101909.15030-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.091600-8.000000
X-TMASE-MatchedRID: cp51Uxq7L6sEshQLfIZrysnlbo5l7mGFJwFLIHVZ6fvfc2Xd6VJ+yrx1
	VMA+w2QulTJXKqh1ne29cOdjc/43lZH0YXYnbGozFEUknJ/kEl4YSQiB0ZTudfoLR4+zsDTtIFg
	EzOKKV2ZWlXDJGO9dw1RaeKIGTQfJwTnaD7mFxuQCohBZVD+eQlZca9RSYo/b
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.091600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 5C163453A2C201611508BB54AA4306416D94492B541BA8C6922B690B29CF1F5F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_031953_640877_2663E138 
X-CRM114-Status: GOOD (  10.80  )
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

There will be a kernel null pointer exception if 'vsi' is NULL, check
'vsi' is not NULL before assign it to encoder instance.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../platform/mediatek/vcodec/encoder/venc/venc_h264_if.c     | 5 +++++
 .../platform/mediatek/vcodec/encoder/venc/venc_vp8_if.c      | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
index a68dac72c4e4..385bcc0d14f3 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
@@ -597,6 +597,11 @@ static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
 	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base, VENC_SYS);
 
 	ret = vpu_enc_init(&inst->vpu_inst);
+	if (!inst->vpu_inst.vsi) {
+		mtk_venc_err(ctx, "share buffer is NULL");
+		kfree(inst);
+		return -EFAULT;
+	}
 
 	if (MTK_ENC_IOVA_IS_34BIT(ctx))
 		inst->vsi_34 = (struct venc_h264_vsi_34 *)inst->vpu_inst.vsi;
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_vp8_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_vp8_if.c
index 05abca91e742..23ca0d93324f 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_vp8_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_vp8_if.c
@@ -326,6 +326,11 @@ static int vp8_enc_init(struct mtk_vcodec_enc_ctx *ctx)
 	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base, VENC_LT_SYS);
 
 	ret = vpu_enc_init(&inst->vpu_inst);
+	if (!inst->vpu_inst.vsi) {
+		mtk_venc_err(ctx, "share buffer is NULL");
+		kfree(inst);
+		return -EFAULT;
+	}
 
 	inst->vsi = (struct venc_vp8_vsi *)inst->vpu_inst.vsi;
 
-- 
2.25.1


