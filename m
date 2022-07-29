Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC74C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 07:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=++SPaaqYV6wW2HC3itRJh/UlFS22JoV99S3LXbyMmTY=; b=OZ78gmiIW08zP1AmBT2VulSPNZ
	AFwgye7kuMsKpJ9JdVy3NbStJTEVk7TaVeip5iW31NfBKES2Y9wdX5TXtOVzfta9SSLvJNe6PjPfC
	DSBhkDzIjLhcrdb6H1HmPuPHYxUugzFsDNxGoEtaWIpsNC6ppjwupCy5ezgI7t56KNGWJVJM73q5D
	+M83FElUFmVPkEY+Lc6ktSB5XKDnZI4MGT00FOkXpYiwb5XVTcB75AZgVu8FvnZqKKbZotjQVGodz
	R0OM5nzehJmnwm0Afk2TBPRTgyxQ2YYFtwkMPFyHZi3oAFVpVs9jqtLzpXsyBEnPe/2SZFPv60WJ6
	ITnDlgvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHK21-002Jak-OM; Fri, 29 Jul 2022 07:03:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHK1K-002JAn-Dg; Fri, 29 Jul 2022 07:02:52 +0000
X-UUID: 09012ae8f7704bf59579c3c73e74db7a-20220729
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:4b9e44cd-08dd-4d04-8e7e-df94045f606c,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:1436abd0-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 09012ae8f7704bf59579c3c73e74db7a-20220729
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1127691421; Fri, 29 Jul 2022 00:02:46 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 29 Jul 2022 14:32:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 29 Jul 2022 14:32:12 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will
 Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, MandyJH
 Liu <mandyjh.liu@mediatek.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 00/20] Add driver nodes for MT8195 SoC
Date: Fri, 29 Jul 2022 14:31:48 +0800
Message-ID: <20220729063208.16799-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_000250_490333_D9688C93 
X-CRM114-Status: GOOD (  11.63  )
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

Patchset 16 "arm64: dts: mt8195: Add adsp node and adsp mailbox" depends on 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?id=009b21f392759ca7be91bc4be9d9534f6cee2878
---
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

 .../bindings/iommu/mediatek,iommu.yaml        |   18 +-
 .../mediatek,smi-common.yaml                  |   11 +-
 .../bindings/mfd/mediatek,mt8195-scpsys.yaml  |   67 ++
 .../power/mediatek,power-controller.yaml      |  137 +--
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      |    3 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |    3 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |    3 +-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |    3 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 1056 ++++++++++++++++-
 9 files changed, 1173 insertions(+), 128 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml

-- 
2.18.0


