Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4472CC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 03:28:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E835D6135D
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 03:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E835D6135D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1cCJ50kYWsiCWYChYEfillv2hfs/DSs2h762G2BZ53E=; b=ZPMUae4DZIilIe
	smSk5mMd8Pn8gxQWhsClgWFLEEGU8S2AI3OiPvCeJHC9AkkTrswXpKxIRppUKDa7B5tqCkVw3zhW/
	bOC6J4++WGi4i91+y3PbR01efYiz6FqRTpDALlCaAALcuPazbchy9v2jPJJJxmf8JcEzSD1aVF94M
	+McLB8ZlRjV2+gZKETkTwPn7h3pJJh0WRgUk1tJhT2B6Jpy4p34frG6uyRfz8bAfqY27BhJW90+5J
	MRfqdoa820xeAgnT4ed8824aLaO6iqgHMr0Khs7s3uOjHrVECiITUmCcALK8o4ZRqnFw2zUfooncu
	fdf10tFqd35SaKh4S/VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI0dM-00FI67-US; Mon, 23 Aug 2021 03:28:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI0dG-00FI5L-O3; Mon, 23 Aug 2021 03:28:22 +0000
X-UUID: e46a204edd3045baa95213f2992a0bba-20210822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=JTG1wRRQgDdZ0nivAzXmE7Ixj6cE82AKK6+mNPiCN18=; 
 b=qF2k7oo34yNs8QPdtL71DYxpLmSTaoqnrjV0vtlvQsOt8uEZTwYn4g7TIDp0jQ6yyFkUgUx7Tr5PVDCPrQT8ff0++XfLHrylOou+Y0VVWeTPDL/Ol/tT46ZhBwjGpS4o3ItGhXzBT+96vJREj2f22jNNPgn70zoPTP74WO87/sM=;
X-UUID: e46a204edd3045baa95213f2992a0bba-20210822
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1944543390; Sun, 22 Aug 2021 20:28:14 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 Aug 2021 20:28:12 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 23 Aug 2021 11:28:11 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 Aug 2021 11:28:09 +0800
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: <robh+dt@kernel.org>, <bhelgaas@google.com>, <matthias.bgg@gmail.com>,
 <lorenzo.pieralisi@arm.com>
CC: <ryder.lee@mediatek.com>, <jianjun.wang@mediatek.com>,
 <yong.wu@mediatek.com>, <chuanjia.liu@mediatek.com>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 0/6] PCI: mediatek: Spilt PCIe node to comply with
 hardware design 
Date: Mon, 23 Aug 2021 11:27:54 +0800
Message-ID: <20210823032800.1660-1-chuanjia.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_202818_838521_B115C90E 
X-CRM114-Status: GOOD (  13.70  )
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

There are two independent PCIe controllers in MT2712 and MT7622 platform.
Each of them should contain an independent MSI domain.
 
In old dts architecture, MSI domain will be inherited from the root
bridge, and all of the devices will share the same MSI domain.Hence that,
the PCIe devices will not work properly if the irq number which required
is more than 32.
 
Split the PCIe node for MT2712 and MT7622 platform to comply with 
the hardware design and fix MSI issue.
 
change note:
 v12:Add Reviwe by Rob. According to Bjorn's suggestion, 
     split the driver patch into three parts and rewrite 
     the commit logs, there is no code change
 v11:Rebase for 5.14-rc1 and add "interrupt-names", "linux,pci-domain"
     description in binding file. No code change.
 v10:Rebase for 5.13-rc1, no code change.
 v9:fix kernel-ci bot warning. In the scene of using new dts format,
    when mtk_pcie_parse_port fails, of_node_put don't need to be called.
 v8:remove slot node and fix yaml warning.
 v7:dt-bindings file was modified as suggested by Rob, other file no
    change.
 v6:Fix yaml error. make sure driver compatible with old and
    new DTS format.
 v5:rebase for 5.9-rc1, no code change.
 v4:change commit message due to bayes statistical bogofilter
    considers this series patch SPAM.
 v3:rebase for 5.8-rc1. Only collect ack of Ryder, No code change.
 v2:change the allocation of MT2712 PCIe MMIO space due to the
    allocation size is not right in v1.
				      
Chuanjia Liu (6):
  dt-bindings: PCI: mediatek: Update the Device tree bindings
  PCI: mediatek: Add new method to get shared pcie-cfg base address
  PCI: mediatek: Add new method to get irq number
  PCI: mediatek: Get pci domain and decide how to parse node
  arm64: dts: mediatek: Split PCIe node for MT2712 and MT7622
  ARM: dts: mediatek: Update MT7629 PCIe node for new format

  .../bindings/pci/mediatek-pcie-cfg.yaml       |  39 ++++
  .../devicetree/bindings/pci/mediatek-pcie.txt | 206 ++++++++++--------
  arch/arm/boot/dts/mt7629-rfb.dts              |   3 +-
  arch/arm/boot/dts/mt7629.dtsi                 |  45 ++--
  arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |  97 +++++----
  .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  |  16 +-
  arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts  |   6 +-
  arch/arm64/boot/dts/mediatek/mt7622.dtsi      | 112 +++++-----
  drivers/pci/controller/pcie-mediatek.c        |  52 +++--
9 files changed, 330 insertions(+), 246 deletions(-)
create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml
 
--
2.18.0
	 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
