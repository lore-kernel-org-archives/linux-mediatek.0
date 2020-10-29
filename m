Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9086CC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 08:15:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 066D12071A
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 08:15:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z2CVHdRz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IuMklBxh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 066D12071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NQ3kDzF/wF5ba3dKH2dKVxqvhcEWdo9uX0ZSun5TIHA=; b=z2CVHdRzewUYgLXVhmyQOUeLWE
	5ASvo+bjWaLYVZpwjC6t6s7IYTP6lkR3iap8LHGOx6soJaLUKK4X/Lfq3NEC6t+CBc6DDyNY1Sm5y
	0va5VgB2JLKkU8X9adDaEODQCXAYb0tFprNElwJIHwkoxSA/CQXZHV3DOQjZKgCUQrZcZlfDxNQY3
	ytkNGmDIj7CwSwaDbGWnjdXZ7QzXgGJ+E+MfulWPbgjPkdGRsSz5s8gIoGw/N7pT0Wkq6/uT4Q+md
	ed++Kp7VKQPSi+AVnXV4sOVS7AZSCsJax+OAB3th/6e6DnCbMDak+UYDTommrAwjc/bB/c/xfOT0l
	Wz7COwrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY35t-0006JO-Vz; Thu, 29 Oct 2020 08:15:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY35q-0006Id-GH; Thu, 29 Oct 2020 08:15:36 +0000
X-UUID: e1d3e0ecd2c5428aa4b06677f81781df-20201029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=o3Qv9OfYUwrK9tVE0LcM9g+mhJJ29QPAQxRIwyUon6o=; 
 b=IuMklBxh9jPBsM9YlHkwq4jQy6j1bA7Q5MPEIEeAVQ+YkuJ1Y/tJlYbYj+M3UkA/0EeByMs5dVqGkcPYRue7e48wUXq697rFoqGdSLhCDN0v4PkdolEsuaoIohxdvcHsTSSyc4P03IFuoQg+9eRhLLYA+VaCM3lBTyCrr/bCvB4=;
X-UUID: e1d3e0ecd2c5428aa4b06677f81781df-20201029
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1230872092; Thu, 29 Oct 2020 00:15:24 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 01:15:22 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 16:15:19 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Oct 2020 16:15:19 +0800
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>
Subject: [PATCH v7 0/4] PCI: mediatek: Spilt PCIe node to comply with hardware
 design
Date: Thu, 29 Oct 2020 16:15:09 +0800
Message-ID: <20201029081513.10562-1-chuanjia.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_041535_326540_6EC7DFED 
X-CRM114-Status: GOOD (  12.83  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Frank
 Wunderlich <frank-w@public-files.de>, linux-pci@vger.kernel.org,
 chuanjia.liu@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In current architecture, MSI domain will be inherited from the root
bridge, and all of the devices will share the same MSI domain.
Hence that, the PCIe devices will not work properly if the irq number
which required is more than 32.
Split the PCIe node for MT2712 and MT7622 platform to fix MSI issue
and comply with the hardware design.

change note:
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

Chuanjia Liu (4):
  dt-bindings: pci: mediatek: Modified the Device tree bindings
  PCI: mediatek: Add new method to get shared pcie-cfg base and irq
  arm64: dts: mediatek: Split PCIe node for MT2712 and MT7622
  ARM: dts: mediatek: Modified MT7629 PCIe node

  .../bindings/pci/mediatek-pcie-cfg.yaml       |  39 +++++
  .../devicetree/bindings/pci/mediatek-pcie.txt | 129 +++++++++++-------
  arch/arm/boot/dts/mt7629-rfb.dts              |   3 +-
  arch/arm/boot/dts/mt7629.dtsi                 |  22 +--
  arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |  75 ++++++----
  .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  |  16 +-
  arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts  |   6 +-
  arch/arm64/boot/dts/mediatek/mt7622.dtsi      |  66 ++++++---
  drivers/pci/controller/pcie-mediatek.c        |  23 ++-
  9 files changed, 248 insertions(+), 131 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml

 -- 
 2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
