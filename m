Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00EAFC433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 06:14:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D3C720795
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 06:14:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gd2iktuJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="feV0DEPi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D3C720795
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jtGbBtKJyaf15kSqPRGXI3CzMd3GqTxhuaVqMF6RZGY=; b=Gd2iktuJ3jky5mu1iYrPnlhpF9
	PowKgzhEky22R9vshE/vMwDoarJn2MNx/US5pkvXMwN1botGxYHTSCl6h9an1jY0qZz1t4ZN8Z/1K
	V1RUrZJ+FtI0ovJwVi1u2pQciCjhMrfCEMBmA+/EQ1d5JSocmbrzQxGmOb5tIjf6Gr9W4c653f/CC
	kQjAYnseK+jBp7OPmGhGzkB/pelSEWlE1jHL5v7kbpEKHgRr7d0ILI7o0iahLAkko/cCIskc5Puvg
	PWMzt1y55iyPzLQwzzVLKKIpzXGFMMT27FJYF0vqsDJUZAZXvQjX2oXdbfQS2X8rSdhva4/Xl1KU5
	UMsVIx8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGFq9-0001qF-Tr; Thu, 10 Sep 2020 06:13:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGFq7-0001pf-FM; Thu, 10 Sep 2020 06:13:48 +0000
X-UUID: ab33d16c02b741a18b9c44163914a016-20200909
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=zFcW3GcXd1P8FnAbyGNj9CaD7meMZ2kjh/WC5Wilqqw=; 
 b=feV0DEPi/Pu4f5Psg3pKMetQDcIc1AJgj9rs0e0nhdp+ZEDcYxEbCiTo8dusziEx/zknMwyJGFgkVQU781y6jElQ3WTOxBoXlt93wkA53ZT5yjf0+fgX+8LPuSRZyup+O8AjVcjqiq1im3dXX/bhc/lKZIGckWH54Y3oabuQJQY=;
X-UUID: ab33d16c02b741a18b9c44163914a016-20200909
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1004167286; Wed, 09 Sep 2020 22:13:39 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Sep 2020 23:13:37 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 14:13:28 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Sep 2020 14:13:28 +0800
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v5 0/4] Spilt PCIe node to comply with hardware design
Date: Thu, 10 Sep 2020 14:11:11 +0800
Message-ID: <20200910061115.909-1-chuanjia.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_021347_642105_3064E24C 
X-CRM114-Status: GOOD (  13.10  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 yong.wu@mediatek.com
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
  v5:rebase for 5.9-rc1, no code change. 
  v4:change commit message due to bayes statistical bogofilter
     considers this series patch SPAM.
  v3:rebase for 5.8-rc1. Only collect ack of Ryder, No code change.
  v2:change the allocation of MT2712 PCIe MMIO space due to the
     allocation size is not right in v1.

Chuanjia Liu (4):
 dt-bindings: pci: mediatek: Modified the Device tree bindings
 PCI: mediatek: Use regmap to get shared pcie-cfg base
 arm64: dts: mediatek: Split PCIe node for MT2712 and MT7622
 ARM: dts: mediatek: Modified MT7629 PCIe node

 .../bindings/pci/mediatek-pcie-cfg.yaml       |  38 +++++
 .../devicetree/bindings/pci/mediatek-pcie.txt | 144 +++++++++++-------
 arch/arm/boot/dts/mt7629-rfb.dts              |   3 +-
 arch/arm/boot/dts/mt7629.dtsi                 |  23 +--
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |  75 +++++----
 .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  |  16 +-
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts  |   6 +-
 arch/arm64/boot/dts/mediatek/mt7622.dtsi      |  68 ++++++---
 drivers/pci/controller/pcie-mediatek.c        |  25 ++-
 9 files changed, 258 insertions(+), 140 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml

-- 
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
