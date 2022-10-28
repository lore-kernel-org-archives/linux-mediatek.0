Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFD0ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 09:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yktn2X3Tu9fQS6qMm81/IkyxFTy0zWn5CAydvKl1vAs=; b=jQDzWs6ldh5gaoGkDiTB/f2MDJ
	gzxShSVCUXLBGC4qfIbTfPdvifd7lvoKtoiZE8vcG4tktdj9Vgw6Qc5+WirnGdz1jFaAM3krttNdJ
	y3LUCWTdI4uHNUfYg0eAzruH0l6NvMDYOkzFuKEAoQIj7x07rr+R7ZdbbXd+d/t3156JCDA7F/V/c
	6q62Yb5cS0/IRbyQtDprAqad6BkyEkGHzeHL/IpZO3Two+88n0ryMfC1myNKn1nZhOM7kQvpfUCjt
	E6PClChZukDjLRFa+GdoOKtetR6OYYLHG2TrBMYcEmuFcVyoR5HqtjdUEjwRfFIgq7yLMTiwi1IJv
	m9+aGHlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooLgJ-00GKXi-LQ; Fri, 28 Oct 2022 09:29:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooLfx-00GKMe-TN; Fri, 28 Oct 2022 09:29:19 +0000
X-UUID: 56f5c870fa3b49fd9df2c8930463639b-20221028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=yktn2X3Tu9fQS6qMm81/IkyxFTy0zWn5CAydvKl1vAs=;
	b=p8ngwYhHUUDBnLZXtE6sQq9hznGoAoCTkxTFBUNfriawUWJpvc97qIgNz4AL2TprHA1Uo97/zRvbbNF7EJvnLMqrTNz1PrWTnJc7a4MMlcgxx7YvYU0gBR7zcDwWQaZglGg3HIQa8W9Vu74ecwstt0eAWuMPIc93wfLpie+dXng=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:5f7fe789-8342-4183-b8d0-56d232fba000,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:95
X-CID-INFO: VERSION:1.1.12,REQID:5f7fe789-8342-4183-b8d0-56d232fba000,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:95
X-CID-META: VersionHash:62cd327,CLOUDID:892fbfea-84ac-4628-a416-bc50d5503da6,B
	ulkID:221028172841B01PFHWG,BulkQuantity:4,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 56f5c870fa3b49fd9df2c8930463639b-20221028
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1407609857; Fri, 28 Oct 2022 02:29:13 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 28 Oct 2022 17:28:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 28 Oct 2022 17:28:38 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
	<jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>
Subject: [PATCH v3 0/3] Add driver nodes for MT8195 SoC
Date: Fri, 28 Oct 2022 17:28:33 +0800
Message-ID: <20221028092836.29006-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_022917_989479_F23AD822 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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

Add pcie and venc nodes for MT8195 SoC.

This series is based on linux-next/next-20221028.
Depends on https://lore.kernel.org/all/20221001030752.14486-1-irui.wang@mediatek.com/ 

v2 -> v3:
- update pcie iommu-map-mask

v1 -> v2:
- remove 8195 example from pcie yaml
- update reset-names of pcie yaml
- add resets and reset-names to pcie node 
- rename venc node

---
Jianjun Wang (1):
  dt-bindings: PCI: mediatek-gen3: Support mt8195

Tinghan Shen (2):
  arm64: dts: mt8195: Add pcie and pcie phy nodes
  arm64: dts: mt8195: Add venc node

 .../bindings/pci/mediatek-pcie-gen3.yaml      |  16 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 174 ++++++++++++++++++
 2 files changed, 187 insertions(+), 3 deletions(-)

-- 
2.18.0


