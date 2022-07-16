Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB61C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jul 2022 09:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDRQ11cGiF+/cXfjLp+3cFkxHEWLn+DP8J+mbPRLnY4=; b=areaYH1WhY1chI5+a6/ChnaVBJ
	Ko3EIyNqeGbir7xBXCVXQ8BXf4aaL7Pf/YqVRpbE9hHfld+z864MdjeEQ8kD7rPR8GHxikqQhjAaL
	ezUCPYsoLzDEVhxGUu3jAFU9CrN51bDaIjQdfnu3E5w+NvkLxpVS76WnUXtNsPKNlcXz0mxqmTJNx
	/SLAk67uUBEIn1u8K2fgFuaYJ1RgiBJZUiu4lJdqVqPH3IjyXJ0JxsE4Cj2v5Embkf++vGIE4IB3I
	o70A+6ABYDqcuuYLW3rOHf0oQTlMPQ5fq3Ffwkq1xKl+6RnwY2tqUhL6eWtrLvNin5p4YOkv5E0Hw
	cPCsC5jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCeCU-00Ezea-Ep; Sat, 16 Jul 2022 09:35:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCeCO-00EzZq-OQ; Sat, 16 Jul 2022 09:34:57 +0000
X-UUID: f4b6e55e78964e6f96d92b7414da853a-20220716
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:20688616-b301-4314-abe1-f3241e980422,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:765a2433-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: f4b6e55e78964e6f96d92b7414da853a-20220716
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1302665682; Sat, 16 Jul 2022 02:34:51 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 16 Jul 2022 17:34:21 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Sat, 16 Jul 2022 17:34:20 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	<wenst@chromium.org>, kyrie wu <kyrie.wu@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
	<srv_heupstream@mediatek.com>, irui wang <irui.wang@mediatek.com>
Subject: [V5,8/8] mtk-jpegdec: add stop cmd interface for jpgdec
Date: Sat, 16 Jul 2022 17:34:08 +0800
Message-ID: <20220716093408.29734-9-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220716093408.29734-1-irui.wang@mediatek.com>
References: <20220716093408.29734-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_023456_807796_80995F17 
X-CRM114-Status: GOOD (  10.14  )
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

From: kyrie wu <kyrie.wu@mediatek.com>

Add stop cmd interface for jpgdec to stop stream

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
Signed-off-by: irui wang <irui.wang@mediatek.com>

---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 1c2cbd00781e..4202b675a9e7 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -666,6 +666,9 @@ static const struct v4l2_ioctl_ops mtk_jpeg_dec_ioctl_ops = {
 	.vidioc_streamoff               = v4l2_m2m_ioctl_streamoff,
 
 	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
+
+	.vidioc_decoder_cmd = v4l2_m2m_ioctl_decoder_cmd,
+	.vidioc_try_decoder_cmd = v4l2_m2m_ioctl_try_decoder_cmd,
 };
 
 static int mtk_jpeg_queue_setup(struct vb2_queue *q,
-- 
2.18.0


