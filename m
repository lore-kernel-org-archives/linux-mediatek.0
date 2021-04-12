Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01FD3C43460
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 12:52:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DF9761263
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 12:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DF9761263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iR4gP3q8Oki2uanlOGGLdqYXhGC+Vc10NZbe04ouT+0=; b=OugjbzM10Yic3HXvJtWC1rRqb
	b3eLZD9h2IsPn9oOeLdsf3X2Rr8BbHx3QVXOz6/256pcbvRRXw0kc9FMuCOLVzl2M57IUz//OEeg4
	L5JKqp1dxNmwYG9wYeonw2kNCYwkSLnuu8X9gjRz4AXSe01JRqKWZj6nWUf+jwUr2Ou5qC0yOOR4m
	2VCP4PVS3aBWpgcYWNj6IXmHEKCTYqkKRBt1iFYIYz3egNhVb22xMq8UG2Dd2zdp5tW0n353JUtPz
	VCchfe6BouW3UxjpIcH/I7c8BrkLYiChHd2XDhr9L8OD6bHqdVxhkjmkbp5CC6Hm9d5MiIc7WRu53
	1yEin9x/A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVw30-006l00-8c; Mon, 12 Apr 2021 12:52:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVw2u-006kyg-Ps; Mon, 12 Apr 2021 12:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=UdCfHuhcVQAmaNgdUEBKEwjL2Qzc+m4XCY/pLvDImmI=; b=OhQ7qaCfyDGoZsvRauiyEAmdqy
 w6hUgj0NyP4jWPCBm4fRQk1HrrFI5rI3fpXN9QWbP3cqp/YGMIHqbN6vYystF22rYgkcbVJtxgwqK
 j7jgqyGIYsE7shQ20lE5OnE5swpwvBU30YmJrBLKCGxgy4b890xGcSBBeo5+Jrb0zdZo8dtiNh7mT
 QuwBA8cQvboFps+tp0hxlN6WRrm2VqQusejNqCfCUq6kXVSeJHTF2q6vI0UGE8I4r6ykVOsK77hfy
 AC9KzvWD/INWyjxITsZqt6WJI8aCDGjoszElNci3HZO9Rb5r/f1f6XYtHVGkt8o1JfWbJxjhGry6k
 hNwBZSTw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVw2o-006ElJ-3e; Mon, 12 Apr 2021 12:52:03 +0000
X-UUID: 2e6862ba3fc84fe9a466e9d3396822b6-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UdCfHuhcVQAmaNgdUEBKEwjL2Qzc+m4XCY/pLvDImmI=; 
 b=WyTN4dFUkzKrPbg8WkmbDcyZjq+e4tKTn9e8dTA95W3x9G9ehd5oW7bM/gqxvWM5GTDKFQNGeZRZB6sCes49lOd+sjv/IgIAjA6VrYlPSbFOVXD2nxnYmw23t658AwfLqwWGUp1YvRsajMnT6dW7mLd8z8gBRsJZYzJ+mw8W+mU=;
X-UUID: 2e6862ba3fc84fe9a466e9d3396822b6-20210412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 234941160; Mon, 12 Apr 2021 05:51:56 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 05:46:13 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 20:46:11 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 20:46:10 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Tiffany Lin <tiffany.lin@mediatek.com>, Fritz Koenig
 <frkoenig@chromium.org>, Tzung-Bi Shih <tzungbi@chromium.org>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
 <yong.wu@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3,
 3/6] media: mtk-vcodec: Support 4GB~8GB range iova space for venc
Date: Mon, 12 Apr 2021 20:45:52 +0800
Message-ID: <20210412124555.26897-4-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210412124555.26897-1-irui.wang@mediatek.com>
References: <20210412124555.26897-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_055158_182288_329964F6 
X-CRM114-Status: GOOD (  11.85  )
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

Use the dma_set_mask_and_coherent helper to set venc
DMA bit mask to support 4GB~8GB range iova space.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 7d7b8cfc2cc5..26b089e81213 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -361,6 +361,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_event_workq;
 	}
 
+	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL))
+		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
+
 	ret = video_register_device(vfd_enc, VFL_TYPE_VIDEO, 1);
 	if (ret) {
 		mtk_v4l2_err("Failed to register video device");
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
