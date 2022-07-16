Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389DDC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jul 2022 09:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wGP4odTqFlFOVFeqF3dosLXF6kyG+gX2dZQKVkN/+J0=; b=hdAZXiadpgBU8nToBXQcpI0kre
	zm1VSAKXxLJzzgABDhcyHV2vgOs3V3Fdv3KI/YqV8gMyycodF0xjKgWI1ZOQD/yJXwFa9MaCH8NWk
	tBjx3nZkdSdRDA+JwSQ3wW2JDP5/meAr66yn7/W8Ylar4vZDz48fqM+pRhy6/FKo4XWywKTxq+pQJ
	XoGhBeAoAxOV4t3iolUfww0VGeNJ+V4x2ipdJZlUKss9rM+oKAhS2/NXfj7tAQgvBTrbXbPcbLBsU
	abK4VAsr+Nny+ctZxIt3Np0q05CLMaQ73LVrKB+PADoY2ElPJpfPg5nwR9Z8+cUtk8do767tw+mgF
	I9rNbe5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCea7-00FCfh-BO; Sat, 16 Jul 2022 09:59:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCea5-00FCdX-3T; Sat, 16 Jul 2022 09:59:26 +0000
X-UUID: d7105e1c5959466f93686356b3984fd0-20220716
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:e54a5fb0-de77-40c1-ba7f-09379b620277,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:46892433-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: d7105e1c5959466f93686356b3984fd0-20220716
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1703586662; Sat, 16 Jul 2022 02:59:19 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 16 Jul 2022 17:38:16 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Sat, 16 Jul 2022 17:38:15 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
	<angelogioacchino.delregno@collabora.com>, Tiffany Lin
	<tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>
CC: Yong Wu <yong.wu@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 4/5] media: mediatek: vcodec: Fix bitstream crop information error
Date: Sat, 16 Jul 2022 17:38:07 +0800
Message-ID: <20220716093808.29894-5-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220716093808.29894-1-irui.wang@mediatek.com>
References: <20220716093808.29894-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_025925_168432_E7B3BB6E 
X-CRM114-Status: GOOD (  12.47  )
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

Usually, the real bitstream width and height will set to driver
by vidioc_s_fmt, and vidioc_try_fmt() does align to get the
buffer width and height, driver calculate the encoded bitstream
crop information through them. The aligned resolution will be set
as real resolution now if user didn't set crop info by
V4L2_SEL_TGT_CROP, and the encoded bitstream may exist green line
because of crop information error.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
index 25e816863597..c310bb1dbbcf 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
@@ -503,13 +503,13 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 		f->fmt.pix.pixelformat = fmt->fourcc;
 	}
 
-	ret = vidioc_try_fmt_out(ctx, f, fmt);
+	q_data->visible_width = f->fmt.pix_mp.width;
+	q_data->visible_height = f->fmt.pix_mp.height;
+	q_data->fmt = fmt;
+	ret = vidioc_try_fmt_out(ctx, f, q_data->fmt);
 	if (ret)
 		return ret;
 
-	q_data->fmt = fmt;
-	q_data->visible_width = f->fmt.pix_mp.width;
-	q_data->visible_height = f->fmt.pix_mp.height;
 	q_data->coded_width = f->fmt.pix_mp.width;
 	q_data->coded_height = f->fmt.pix_mp.height;
 
-- 
2.18.0


