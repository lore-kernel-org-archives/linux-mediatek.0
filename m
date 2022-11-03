Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3CAC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 02:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B0ypRIAyBeXMSvb0l7UowvJTfhEVeBMR45ZyeATiyEc=; b=mBhmoavEUqcpfLc6snh9Yef563
	UnL7F2v1G1hQux4HzabDndvN21pMlqTLur0aOB3SH2vDcsXNS6MQUkPG120QpURATOucnZa6E/dGJ
	LXMf1c3YIiVkCNNdZPcpsoIx95ZlEAB2Kjn1vNFiv+WLeb5XK9KDUAfzjk9QZp8Eh4Ue7J79rTSu2
	/zahA/LXuw7ykj9z1wiaPvT633voB2IilTAKXipvO6QzSwnnouK1q+yJ46yEbWfWY/ryektXLGfnm
	PeAYQBGui372cUgLNyys0cIrGG5hZajK6zblBkFYq0AQspO/ybTPH/3H00x/m9yeOI1Q6QzXQDY1H
	1aSESIsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqQQj-00FhkJ-7J; Thu, 03 Nov 2022 02:58:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqQQJ-00FhcP-KJ; Thu, 03 Nov 2022 02:57:45 +0000
X-UUID: e5fe7204c09042c386f1dc172c14135f-20221102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=B0ypRIAyBeXMSvb0l7UowvJTfhEVeBMR45ZyeATiyEc=;
	b=rQ6WKelqcIrNZp68OnrvRXIWOidb9wCCGnOVkLaR6QWXnn/9vVcFH2VjNUx0qussaCiPph9x4FBCWO7ayeI2Trp+X9XbcwgzlLG/toOmXGUPFGGb2/lcTuh9uptzrHqy1mqFzF6VOHYB55Iz9lHs9l2xedYADd5KlMQaKfvFfrA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:af44650e-76ce-458e-a354-3b8eccef51d0,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:d4b96c90-1a78-4832-bd08-74b1519dcfbf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e5fe7204c09042c386f1dc172c14135f-20221102
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1711600428; Wed, 02 Nov 2022 19:57:40 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 3 Nov 2022 10:57:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 3 Nov 2022 10:57:04 +0800
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
Subject: [PATCH v5 0/3] Add driver nodes for MT8195 SoC
Date: Thu, 3 Nov 2022 10:56:53 +0800
Message-ID: <20221103025656.8714-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_195743_686775_AD5EE949 
X-CRM114-Status: UNSURE (   8.89  )
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

v4 -> v5:
- update reset-names of pcie yaml

v3 -> v4:
- update resets of pcie node

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

 .../bindings/pci/mediatek-pcie-gen3.yaml      |  13 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 174 ++++++++++++++++++
 2 files changed, 185 insertions(+), 2 deletions(-)

-- 
2.18.0


