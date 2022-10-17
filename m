Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E23C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 07:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6wSeMUN6joaIjXkd06WMrNVSEQQ4OFvA/3GtXd+WLio=; b=MY9vn7puG/v2bpZGBEMIJuQwMr
	Yzp7G4yegbIvkLx5Fl7V3X66nNDUqm8OCi6U9ovWHeL3uPI2l26suBuBK2y/ncOv8KY1C/NEr4gR8
	Zn3QyTbMWzA85p9kK+Fs68JeEGtQd32r1T64QDMwWva1JtH5dpKZ3CemQecOuNex+b/Mva0QjBGiT
	Ygyp+rtTavLXdDRtsRAxnKjfvqn/RSr1l3S3Q8M/ewHMfLKAjn4TMuDMofP1avO+9i0oBN6+xOf3T
	mt6VC5pS/wc6jUvKRKgKevOvtfH5Yd2sLQygsgg/DFbed/nzcIMvUk2HpmP/EpgchUIRtBqAEAmfQ
	ndnDBCUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okKso-008cQg-8M; Mon, 17 Oct 2022 07:49:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okKsd-008c6s-0l; Mon, 17 Oct 2022 07:49:48 +0000
X-UUID: 18ae52afc4404314bcc885f24595ebe6-20221017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6wSeMUN6joaIjXkd06WMrNVSEQQ4OFvA/3GtXd+WLio=;
	b=oMgtt+B1l37neC0V3q9NikoOej2zFIp3Jcnem/gbfrQ5BlqtjxYt/hWitSBGt682R+EO68U+aUM8/TnVwEa7yF5OSZ8tT9RG6DIGkdtnfHBQqAPOiqR+c4OgqenZxym+j9qyhnwmQzFlQs3+zmBH3aXrTizSAnCp3Mp28XsJtHg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:4f3809ec-5748-4496-8c89-b5b499f55641,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:c80300a4-ebb2-41a8-a87c-97702aaf2e20,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 18ae52afc4404314bcc885f24595ebe6-20221017
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1271983093; Mon, 17 Oct 2022 00:49:38 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 17 Oct 2022 15:09:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 17 Oct 2022 15:09:00 +0800
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
Subject: [PATCH v1 0/3] Add driver nodes for MT8195 SoC
Date: Mon, 17 Oct 2022 15:08:55 +0800
Message-ID: <20221017070858.13902-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_004947_084825_A569EF32 
X-CRM114-Status: UNSURE (   6.95  )
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

This series is based on linux-next/next-20221014.
Depends on https://lore.kernel.org/all/20221001030752.14486-1-irui.wang@mediatek.com/ 

---

Jianjun Wang (1):
  dt-bindings: PCI: mediatek-gen3: Add iommu and power-domain support

Tinghan Shen (2):
  arm64: dts: mt8195: Add pcie and pcie phy nodes
  arm64: dts: mt8195: Add venc node

 .../bindings/pci/mediatek-pcie-gen3.yaml      | 115 ++++++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 167 ++++++++++++++++++
 2 files changed, 282 insertions(+)

-- 
2.18.0


