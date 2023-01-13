Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B68C54EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 06:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hdle5V7QXR2zTmjlt0LMbJJW0v+QKgrPewNuxqT7LDg=; b=mJaSudYi5583x1rPPlvAyOfrYn
	52qDWARUu+ZDGFVh8BIA1PFw+hZpyk4Lgy2YQWxWjUIe2ygNwijSNT8DCOenl8TKFR0xgJv9aHbqR
	tkwzlv0gqI5Uti3gcjhBjECcJ0+Y52SY8r40Ff56trswv0daP32o7xsxanGLcT73vK/Vt3DK0XvO0
	vqJtOLMK6MTOO91pJZZris4M02syJ8cPgq5PPRMc4YTUstQt7hIU8R7EhdeeI7ByjLTSbBKjPA4XD
	VD5nTyX/d2atT84ELeSYUAnQR3u7q+RD9PPKoSHV5jAGItzawn9/xl9QoXh8wz7iqbILrgXIvuSa7
	bc/A7Dsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGD9E-000eHj-Op; Fri, 13 Jan 2023 06:02:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGD92-000eE2-3y; Fri, 13 Jan 2023 06:02:29 +0000
X-UUID: d86cd48e930711edbbe3f76fe852e059-20230112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Hdle5V7QXR2zTmjlt0LMbJJW0v+QKgrPewNuxqT7LDg=;
	b=oljS6ef5LU/F4OnPUhsxmVjN1REtVbri739opsWDWcZuNy+rrCLi5sURR/KvoYE//nSgR7aWyV5VRV34cSghUvZjztmtxzn3ez7QMu46ksE1fLlKb94/4/LXISJvhNFgRlwz+xF1rtPN4E2UA32pAASy9xTo4d3TFawaQm9xAio=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:3a1792c4-8700-4117-be95-461b778b2712,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:36f1258c-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: d86cd48e930711edbbe3f76fe852e059-20230112
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 110749378; Thu, 12 Jan 2023 23:02:22 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 13 Jan 2023 14:01:50 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 13 Jan 2023 14:01:49 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil
	<hverkuil@xs4all.nl>, <nfraprado@collabora.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, <mingyuan.ma@mediatek.com>,
	<yf.wang@mediatek.com>, <libo.kang@mediatek.com>, Yunfei Dong
	<yunfei.dong@mediatek.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <chengci.xu@mediatek.com>,
	<youlin.pei@mediatek.com>, <anan.sun@mediatek.com>
Subject: [PATCH 00/10] Adjust the dma-ranges for MTK IOMMU
Date: Fri, 13 Jan 2023 14:01:23 +0800
Message-ID: <20230113060133.9394-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_220228_168179_FFC536CF 
X-CRM114-Status: GOOD (  11.34  )
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

After commit f1ad5338a4d5 ("of: Fix "dma-ranges" handling for bus
controllers"), the dma-ranges is not allowed for dts leaf node.
but we still would like to separate the different masters into
different iova regions. Thus we adjust the internal flow, separate
the 16GB iova range by the master HW larbid/portid and add the
dma-ranges property in the parent "soc" node. This also could avoid
the users forget/abuse the iova regions.

The commit f1ad5338a4d5 doesn't introduce the regression for us in
upstream, currently mt8195 vcodec/jpeg use the parent/child node.
thus I don't add "Fixes:" tag.

In this series, I add functions for mt8192/mt8195/mt8186, mt8188 will
be in its special patchset. and the previous mt8173/mt8183...support
0-4GB only, no need this function.

Base on v6.2-rc3.

Yong Wu (10):
  dt-bindings: media: mediatek,vcodec: Remove dma-ranges property
  dt-bindings: media: mediatek,jpeg: Remove dma-ranges property
  iommu/mediatek: Get regionid from larb/port id
  iommu/mediatek: mt8195: Add larb_region_msk
  iommu/mediatek: mt8186: add larb_region_msk
  iommu/mediatek: mt8192: add larb_region_msk
  iommu/mediatek: Add a gap for the iova regions
  arm64: dts: mt8195: Add dma-ranges for the parent "soc" node
  arm64: dts: mt8195: Remove the unnecessary dma-ranges
  arm64: dts: mt8186: Add dma-ranges for the parent "soc" node

 .../media/mediatek,mt8195-jpegdec.yaml        |  7 --
 .../media/mediatek,mt8195-jpegenc.yaml        |  7 --
 .../media/mediatek,vcodec-decoder.yaml        |  5 -
 .../media/mediatek,vcodec-encoder.yaml        |  5 -
 .../media/mediatek,vcodec-subdev-decoder.yaml |  7 --
 .../bindings/media/mediatek-jpeg-encoder.yaml |  5 -
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  1 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  2 +-
 drivers/iommu/mtk_iommu.c                     | 95 ++++++++++++++-----
 9 files changed, 72 insertions(+), 62 deletions(-)

-- 
2.18.0



