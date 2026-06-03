Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19384CD6E64
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2026 08:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfF4YK51SvhR+CheeaCqlUmQp6B+ie0palnZ+m853AI=; b=dA4m/lcWpZP8Imi/QgH0Q8r51m
	pjW7l/4Y5lGQ4FtxAGlrjNDuk6MUfQ4iN+WPNzByrZgIraWoOQJUECV+cAb+3U7rCFoujLEI3Zyma
	vmXN9fm+kGQF9FoDP18RuPiQpjHxDF/2iZ+PtSmj0vazZzBN8pWj/Cs9VbTYcNvtbz0us5n7B/5Ze
	tnbSPzCslU1Z+U++BJ7MtE8yI+0GYNLgOV6leit04gTK9l77eeln+unDIUFP2hFAonPWu6lmcD2Eq
	3EyT6WIbK2bTm6MKpVqdJO4276U/qt3ip2etgVNgjpGmYckaGijyqepepMQq3OlWB6lD64GNPVrUp
	zEzrOFhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhAQ-0000000EcWo-29iR;
	Wed, 03 Jun 2026 08:41:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhAN-0000000EcTM-2WJa
	for linux-mediatek@bombadil.infradead.org;
	Wed, 03 Jun 2026 08:41:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tfF4YK51SvhR+CheeaCqlUmQp6B+ie0palnZ+m853AI=; b=eDnQZz7xw41iWBrxGWc2CIIWgE
	jjQl3xth2B+0dgwYbZV2YrL/4D6KeIhJ6bQIWtJXmTGjde82mtW7Oj9mcv6RUDTrPjQfzKQ9rSCQv
	xAD0ZXf3B3Xo5+eVSj90o4VhpjnpAa7RLPNXdhvMF2nswKOh91znVX2Wjl+yAnF6MPO9W8fpUe8xm
	ZOzHU9TBCAnN7gnq6PSzENiQo5vjlkPjmQs8RHXz4DNYoifFOatw9d8NN8xdoWV0J108tp0erTXjV
	Ti83HFwWyc7cviUsWAlfDce1thw9sxRST/chqIbzOPhZjGeHXOXX+jHtjaZWB54lWMbfRqxIcbN1a
	74tV3cEg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUhAK-0000000BblF-0edd
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jun 2026 08:41:34 +0000
X-UUID: fdb9c9465f2711f1acbe4559397dec65-20260603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=tfF4YK51SvhR+CheeaCqlUmQp6B+ie0palnZ+m853AI=;
	b=itE9LoLw94vjoBsm/ZUdZ4EahLCiKL00gZqo+rlo77Lcro1+18fHci0vAYYq/da1RGcUGnlQOwRWH1LQUlJLJ5UnuuDU+qE728A7ipj/ieY6GQqR3bUiPepUMdtw4hZSsG2HKPEKmt0n3pNgbmTwhovgVbglsfZhAJMrMVF5WhI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:63657659-8b47-4999-969f-90b2172a9caa,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e276073,CLOUDID:56634f20-87a8-421b-982c-f5939dba7cba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|836|865|888|898,TC:-5,
	Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fdb9c9465f2711f1acbe4559397dec65-20260603
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2027434054; Wed, 03 Jun 2026 01:41:19 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Jun 2026 16:41:16 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 3 Jun 2026 16:41:14 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>,
	Kees Cook <kees@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	Haoxiang Li <haoxiang_li2024@163.com>, Fei Shao <fshao@chromium.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Irui Wang <irui.wang@mediatek.com>, Fan Wu
	<fanwu01@zju.edu.cn>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Kyrie Wu <kyrie.wu@mediatek.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Tzung-Bi Shih
	<tzungbi@kernel.org>, Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v5 07/14] media: mediatek: vcodec: support 36bit iova address
Date: Wed, 3 Jun 2026 16:40:37 +0800
Message-ID: <20260603084045.17488-8-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260603084045.17488-1-kyrie.wu@mediatek.com>
References: <20260603084045.17488-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_094132_640215_F32EA429 
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

From: Yunfei Dong <yunfei.dong@mediatek.com>

Need to set dma mask to support 36bit iova address for decoder
hardware can use 36bit address to decode for mt8196.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c  | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index ce17b649022f..68759db6f8d1 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -390,6 +390,13 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
+	if (dev->chip_name == MTK_VDEC_MT8196) {
+		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(36));
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to enable 36-bit DMA: %d\n", ret);
+			return ret;
+		}
+	}
 
 	dev->fw_handler = mtk_vcodec_fw_select(dev, fw_type, DECODER);
 	if (IS_ERR(dev->fw_handler))
-- 
2.45.2


