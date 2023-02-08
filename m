Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14E3C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 05:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X3cBszW/NxbtABNnIy79YxFnHPtmZaYNwTC7ihSL/WU=; b=UBGO8Gf98R/A7hXYOwTsYGrYC4
	B029hVpz5d6QYehqZl02mUVO/IPDcYMXvZHD5oGAQKh2YkTkJbFAafFfyikEZwEzF1ml+HFJxobef
	t2O2QrAz424Ewp9Dhzx6xqYb4RAavvLijs4qTrFNS63btpuqCyqGMz/sgu7PoYbgbBHQT0Lgmw8Dp
	/Jv0nDpSmjdX7OMiH9iUpkcx10vBWCaCMj18EK8m8hFfFsj0F6ccnLHUmVwWQvQewdcvECXnBO50k
	wg1455gXklzM6QwXctqGveg2adxQBrxz5RhCUNG1cM7qvpCUfNiRSvFUTItkhWZ7WaeH2HYdGACe/
	mrH6Fc1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPdSG-00EFBy-EV; Wed, 08 Feb 2023 05:57:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPdS2-00EF6H-VV; Wed, 08 Feb 2023 05:57:04 +0000
X-UUID: 65a48ee2a77511edbbe3f76fe852e059-20230207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=X3cBszW/NxbtABNnIy79YxFnHPtmZaYNwTC7ihSL/WU=;
	b=rpWyBQqTOG6hLXSVFRs0rYMmHaAm9xONxK2jeV4Yp+WdKNjb8gyMMhHV32CTc7dcvVbCbfUJy8ji9mdrsxb0r6VJxESzKo2tmi5XfgvZTOxyYG3iKPqAezwhNMVb2Iv0xA+OAxs8cQuCnRnjHUZCAMgXcjHUt6oenREYx62l/BI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:353cb9e4-f0df-43ca-919d-a446fce8640f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:885ddb2,CLOUDID:20e2cdf7-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 65a48ee2a77511edbbe3f76fe852e059-20230207
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 712791422; Tue, 07 Feb 2023 22:56:57 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 8 Feb 2023 13:36:54 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 8 Feb 2023 13:36:53 +0800
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
Subject: [PATCH v2 00/10] Adjust the dma-ranges for MTK IOMMU
Date: Wed, 8 Feb 2023 13:36:33 +0800
Message-ID: <20230208053643.28249-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_215703_030221_120DC9D5 
X-CRM114-Status: GOOD (  13.25  )
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

The commit f1ad5338a4d5 did affect the mt8195 venc, But it is not
a fatal issue, it could also work well at 0-4GB iova. thus I don't
add "Fixes:" tag.

In this series, I add functions for mt8192/mt8195/mt8186, mt8188 will
be in its special patchset. and the previous mt8173/mt8183...support
0-4GB only, no need this function.

Change note:
v2:
   a) Base on next-20230206 since mt8195 jpeg node was applied which
      affect this patchset.
   b) Reword the commit message [1/10][2/10] to explain effect.

v1: https://lore.kernel.org/linux-mediatek/20230113060133.9394-1-yong.wu@mediatek.com/
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
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  4 +-
 drivers/iommu/mtk_iommu.c                     | 95 ++++++++++++++-----
 9 files changed, 72 insertions(+), 64 deletions(-)

-- 
2.18.0



