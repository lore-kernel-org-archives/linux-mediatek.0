Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18F6C64EC4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 02:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lf+PVZFQWI6nZ5SzPH7f9NR7S7VT6l6jo9uDdU0cP8s=; b=Hiz/bNUTR2AKayYX2OA5iJ3bKG
	w7Nl7HKoEhN8vgbEJekZh3WFG+YGemou21SQlWQ4kZdDWW0Jeo5YI2MIOkSkz9Z8cGcDRdKEMifFc
	gCVLL7yQc7YTvJdHHN1HcWTzy3YyY7yCvZBOqp3qIvAjtslxXtSzZMw6EoFiBYbouK0KIrmLRfTJW
	BXIRXJgtEi+ckK2lbT1Moqed4/bsPcRkB4GuinfuxKA8yikHliFl4pUBommkynKA5M8v47Y7H51/x
	teReEQGcSyCGCI8II9NcM7MzonYtX5PhNdPhmM1Hp+EcGBrXTOVC/0GcJDMEwC2feCpPr0cCDATg4
	BSS17MYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZNBY-00Ft6Q-95; Tue, 07 Mar 2023 02:36:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZNBC-00Ft1u-SW; Tue, 07 Mar 2023 02:35:56 +0000
X-UUID: c33ebebcbc9011eda08d4d6090ec5a5c-20230306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=lf+PVZFQWI6nZ5SzPH7f9NR7S7VT6l6jo9uDdU0cP8s=;
	b=g79rJyjY0eVzaAu8pmLSfTEP05X9A4Q3QqasstR7ysm5COiozcrvNwReJvkc1hrq+KURkFkVyITC53BfAc7dzdDkwG2tq6NQ+1hZtLuABX1Qs1KnKpF7xIgs9UkXeZ4/tmfABxh40XuGFYjutcQSIScBwFGqXoFyO8/YMlvmY5U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:37a47bc6-2fa8-406e-9849-bec708e867ba,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:25b5999,CLOUDID:557469b2-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: c33ebebcbc9011eda08d4d6090ec5a5c-20230306
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1550952749; Mon, 06 Mar 2023 19:35:45 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 7 Mar 2023 10:35:26 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 7 Mar 2023 10:35:25 +0800
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
	<yf.wang@mediatek.com>, <jianjiao.zeng@mediatek.com>, Yunfei Dong
	<yunfei.dong@mediatek.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <chengci.xu@mediatek.com>,
	<youlin.pei@mediatek.com>, <anan.sun@mediatek.com>
Subject: [PATCH v5 00/11] Adjust the dma-ranges for MTK IOMMU
Date: Tue, 7 Mar 2023 10:34:56 +0800
Message-ID: <20230307023507.13306-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_183554_954300_9F813D69 
X-CRM114-Status: GOOD (  13.24  )
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
v5: Nothing change. Just rebase on v6.3-rc1.

v4: https://lore.kernel.org/linux-mediatek/20230215062544.8677-1-yong.wu@mediatek.com/
    Improve the comment in the code from AngeloGioacchino.

v3: https://lore.kernel.org/linux-mediatek/20230214031114.926-1-yong.wu@mediatek.com/
   Add a new patch only for comment more in the code.

v2: https://lore.kernel.org/linux-mediatek/20230208053643.28249-1-yong.wu@mediatek.com/
   a) Base on next-20230206 since mt8195 jpeg node is applied which affect
      this patch.
   b) Reword the commit message [1/10][2/10] to explain effect.

v1: https://lore.kernel.org/linux-mediatek/20230113060133.9394-1-yong.wu@mediatek.com/
   Base on v6.2-rc3.

Yong Wu (11):
  dt-bindings: media: mediatek,vcodec: Remove dma-ranges property
  dt-bindings: media: mediatek,jpeg: Remove dma-ranges property
  iommu/mediatek: Improve comment for the current region/bank
  iommu/mediatek: Get regionid from larb/port id
  iommu/mediatek: mt8192: Add iova_region_larb_msk
  iommu/mediatek: mt8195: Add iova_region_larb_msk
  iommu/mediatek: mt8186: Add iova_region_larb_msk
  iommu/mediatek: Add a gap for the iova regions
  arm64: dts: mt8195: Add dma-ranges for the parent "soc" node
  arm64: dts: mt8195: Remove the unnecessary dma-ranges
  arm64: dts: mt8186: Add dma-ranges for the parent "soc" node

 .../media/mediatek,mt8195-jpegdec.yaml        |   7 -
 .../media/mediatek,mt8195-jpegenc.yaml        |   7 -
 .../media/mediatek,vcodec-decoder.yaml        |   5 -
 .../media/mediatek,vcodec-encoder.yaml        |   5 -
 .../media/mediatek,vcodec-subdev-decoder.yaml |   7 -
 .../bindings/media/mediatek-jpeg-encoder.yaml |   5 -
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      |   1 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |   4 +-
 drivers/iommu/mtk_iommu.c                     | 143 ++++++++++++++----
 9 files changed, 114 insertions(+), 70 deletions(-)

-- 
2.18.0



