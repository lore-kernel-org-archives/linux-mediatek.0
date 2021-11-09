Return-Path: <SRS0=Xaha=P4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DB4C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 07:13:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DA5561181
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 07:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6DA5561181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=63y+UwuKkHtGuvi7tzZ6IXujXgh0NRnvCgCDH3wKyr0=; b=220dHbyItXFGBD
	Rbca7/bXbEpQes5bNfxvxroXjncr29j/byBlWhWQp3qTJdqyF8Dz44fnAsNLegx30DZCar5o/kd1M
	fv670Ol6bxl3kAavrHn7ezjWnaiOpErUWtL5j9CxqCIDx3LqPUMSaArfbzhkhhv4j2sAMn9N49kAW
	/ApEXhLBcbZ1QrWX7wHh8i+feWQgaC2RmvPoiedXfDbSrpI4TINoxNMqM7U37cc+b4FP6/7FnCP2B
	tXeNrI/tOhKLCaXNUrNJiR9r+3gCSo9je4FT5MESXeFPMi5MsVdSJ8dGr2QjCrU298uN96MQKyL/8
	nq7koelIHXSnesuqVcXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkLK9-000qV0-Mi; Tue, 09 Nov 2021 07:13:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkLJk-000qNT-MB; Tue, 09 Nov 2021 07:13:18 +0000
X-UUID: f72cf7637ed942638a520472d0e291cf-20211109
X-UUID: f72cf7637ed942638a520472d0e291cf-20211109
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 188006667; Tue, 09 Nov 2021 00:13:12 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Nov 2021 23:13:10 -0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkexhb01.mediatek.inc (172.21.101.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Nov 2021 15:13:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs10n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 9 Nov 2021 15:13:08 +0800
From: roy-cw.yeh <roy-cw.yeh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Fabien Parent
 <fparent@baylibre.com>, "Roy-CW . Yeh" <roy-cw.yeh@mediatek.com>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, daoyuan huang <daoyuan.huang@mediatek.com>, 
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v1] media: platform: mtk-mdp3: Fix mdp hyfbc get plane size
Date: Tue, 9 Nov 2021 15:13:07 +0800
Message-ID: <20211109071307.29785-1-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_231316_769705_E2A99DAF 
X-CRM114-Status: GOOD (  13.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>

mdp_fmt_get_hyfbc_plane_size should return size depends on different plane
rather than one same size (buffer size)

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
---
 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
index ac5d0f06f39e..aabc1c2a9166 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
@@ -151,7 +151,8 @@ int mdp_enum_fmt_mplane(struct mdp_dev *mdp, struct v4l2_fmtdesc *f)
 	return 0;
 }
 
-static u32 mdp_fmt_get_hyfbc_plane_size(u32 width, u32 height, u32 color)
+static u32 mdp_fmt_get_hyfbc_plane_size(u32 width,
+					u32 height, u32 color, unsigned int plane)
 {
 	u32 y_data_size = 0;
 	u32 c_data_size = 0;
@@ -176,7 +177,10 @@ static u32 mdp_fmt_get_hyfbc_plane_size(u32 width, u32 height, u32 color)
 	c_data_ofst = ((y_data_ofst + y_data_size + c_header_size + 4095) >> 12) << 12; // align 4k
 	c_header_ofst = c_data_ofst - c_header_size;
 
-	return (c_data_ofst + c_data_size);
+	if (plane == 0)
+		return c_header_ofst;
+	else
+		return (c_data_ofst + c_data_size);
 }
 
 static u32 mdp_fmt_get_afbc_plane_size(u32 width, u32 height, u32 color)
@@ -256,7 +260,7 @@ const struct mdp_format *mdp_try_fmt_mplane(struct mdp_dev *mdp,
 
 		if (MDP_COLOR_IS_HYFBC_COMPRESS(fmt->mdp_color)) {
 			si = mdp_fmt_get_hyfbc_plane_size(pix_mp->width,
-							  pix_mp->height, fmt->mdp_color);
+							  pix_mp->height, fmt->mdp_color, i);
 		} else if (MDP_COLOR_IS_COMPRESS(fmt->mdp_color)) {
 			si = mdp_fmt_get_afbc_plane_size(pix_mp->width,
 							 pix_mp->height, fmt->mdp_color);
@@ -529,7 +533,7 @@ static void mdp_prepare_buffer(struct img_image_buffer *b,
 			b->format.plane_fmt[i].size =
 				mdp_fmt_get_hyfbc_plane_size(pix_mp->width,
 							     pix_mp->height,
-							     b->format.colorformat);
+							     b->format.colorformat, i);
 		} else if (MDP_COLOR_IS_COMPRESS(b->format.colorformat)) {
 			b->format.plane_fmt[i].size =
 				mdp_fmt_get_afbc_plane_size(pix_mp->width,
@@ -562,7 +566,7 @@ static void mdp_prepare_buffer(struct img_image_buffer *b,
 			b->format.plane_fmt[i].size =
 				mdp_fmt_get_hyfbc_plane_size(pix_mp->width,
 							     pix_mp->height,
-							     b->format.colorformat);
+							     b->format.colorformat, i);
 		} else if (MDP_COLOR_IS_COMPRESS(b->format.colorformat)) {
 			b->format.plane_fmt[i].size =
 				mdp_fmt_get_afbc_plane_size(pix_mp->width,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
