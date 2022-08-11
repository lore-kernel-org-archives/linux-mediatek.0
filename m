Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57362C25B07
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 02:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e5yTUFYEnBr3npJrCXzl+sChLO/A0Il8k7OnI7Xpsxk=; b=x5M9s8ZujW2Ax1layHZqjddCpo
	vZGX6L9f0v8KKEx3F8cRjQIGPWI4fj/pIdQnSS2PlBCWTiPHf4M9Ap4rQzsay/Wf3aLWWiovTTfWm
	bOURtWSCKiOydn69H88pfa3ibLseRR75GGQJQY4fj29NB2KBzrgfmEhzRjN98mv1g5YAeaad7kr72
	eiEDrTcRE0704m4/UFA8ItHZfZMnG+aGl9PDp92g1dEd+mtiyoHnUwH6txIxARtpRKxW9xrPocAx7
	PgVkhfaYD79HTNa7HX0+wj6E0yGkR8X3MPk4Oy7yiwjS0ik0f8SzM3OCNpn9Xn4KhfozoI6lKBvIZ
	lEKa0S6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLyQA-004RQN-8G; Thu, 11 Aug 2022 02:59:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLyPR-004QO4-8O; Thu, 11 Aug 2022 02:58:58 +0000
X-UUID: 4ccff2f4d3294f83a71281a7d49968da-20220810
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:b7c6026f-c955-4c0d-bca2-d9a42c7073da,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:aea5559c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4ccff2f4d3294f83a71281a7d49968da-20220810
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1620834049; Wed, 10 Aug 2022 19:58:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 11 Aug 2022 10:58:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 11 Aug 2022 10:58:14 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will
 Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>, MandyJH Liu <mandyjh.liu@mediatek.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6 00/20] Add driver nodes for MT8195 SoC
Date: Thu, 11 Aug 2022 10:57:53 +0800
Message-ID: <20220811025813.21492-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_195857_317304_83157CBB 
X-CRM114-Status: GOOD (  13.53  )
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

Add driver nodes for MT8195 SoC.

---
v5 -> v6:
  - rebased on linux-next/next-20220809
  - update the if/else condition comment in iommu.yaml
  - some v5 patches are corrupted caused by extra line wrapping

v4 -> v5:
  - rebased on linux-next/next-20220802
  - fix indentation in scpsys.yaml
  - rewrite if/else condition for infra iommu in iommu.yaml
  - remove unused clock from infra iommu node

v3 -> v4:
  - remove unit address of power-controller node name from v3 scpsys bindings
  - v3 patchset 7 and v3 patchset 6 are combined as v4 patchset 6
  - add more commit descriptions for updating mt81xx scpsys node 

v2 -> v3:
  - fix dsp node name
  - add descriptions for iommu interrupts
  - limit the levels of power domain nodes
  - update maintainer list of power controller yaml
  - support naming power controller node with unit address
  - add SoC specific compatible string to scpsys yaml

v1 -> v2:
  - add new dt-bindings: mfd/mediatek,scpsys.yaml
    - update compatible string for mt81xx scpsys nodes
  - apply comments for yaml files: iommu, smi-common, and power-controller
  - apply comments for dts nodes: power domain, vdosys0. 
  - apply comments for commit message of watchdog, i2c, and smi-common. 
  - add review-by tags

---
Jason-JH.Lin (2):
  arm64: dts: mt8195: Add gce node
  arm64: dts: mt8195: Add display node for vdosys0

Tinghan Shen (14):
  dt-bindings: iommu: mediatek: Increase max interrupt number
  dt-bindings: memory: mediatek: Update condition for mt8195 smi node
  dt-bindings: power: mediatek: Refine multiple level power domain nodes
  dt-bindings: power: mediatek: Support naming power controller node
    with unit address
  dt-bindings: power: mediatek: Update maintainer list
  dt-bindings: power: mediatek: Add bindings for MediaTek SCPSYS
  arm64: dts: mediatek: Update mt81xx scpsys node to align with
    dt-bindings
  arm64: dts: mt8195: Disable watchdog external reset signal
  arm64: dts: mt8195: Add vdosys and vppsys clock nodes
  arm64: dts: mt8195: Add power domains controller
  arm64: dts: mt8195: Add spmi node
  arm64: dts: mt8195: Add scp node
  arm64: dts: mt8195: Add audio related nodes
  arm64: dts: mt8195: Add iommu and smi nodes

Trevor Wu (1):
  arm64: dts: mt8195: Specify audio reset controller

Tzung-Bi Shih (1):
  arm64: dts: mt8195: Disable I2C0 node

YC Hung (1):
  arm64: dts: mt8195: Add adsp node and adsp mailbox nodes

YT Lee (1):
  arm64: dts: mt8195: Add cpufreq node

 .../bindings/iommu/mediatek,iommu.yaml        |   29 +-
 .../mediatek,smi-common.yaml                  |   11 +-
 .../bindings/mfd/mediatek,mt8195-scpsys.yaml  |   67 ++
 .../power/mediatek,power-controller.yaml      |  137 +--
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      |    3 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |    3 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |    3 +-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |    3 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 1054 ++++++++++++++++-
 9 files changed, 1176 insertions(+), 134 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml

-- 
2.18.0


