Return-Path: <SRS0=RXgq=A4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4352C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 02:33:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83E5C2070E
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 02:33:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SZ0BZVCH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mP4CFlFt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83E5C2070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4ji68RaFaEcaqg2plzCVmGxs9WzWlzvytAshbtiqW+8=; b=SZ0BZVCHzkPNYJBs5J8Xzd8aGE
	dV8q0tNa8yr3lGlxPoe196xwQlWhFLLS1U+f3s0nQyb1H9frpw/flRMDbGMhzo+a5qykLZBV6tbYD
	KhVmLlNTVAeLGsT79Pe4T/vr6dvWVopvHfST2DGcEy7nPMpCKQDgwl6CkJazyaVg2n4zbYNe5aXZ5
	b8Ey+ZEYJ1gPXWU0LgfgNChGOik3HJ4povH3LUFHjwwaJn94AQjGd8cBJN4bnlrVl7EzrGBYPlDeI
	sNU6SDGb8rnxvbozISXUVsNKHCdFyh8PauTCcUfidkV5zi3jMvjm2C5WcG2Uc+VIQ0NcUniV+GWqW
	IOmBWGCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwGC1-0005BM-3B; Fri, 17 Jul 2020 02:33:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwGBu-000598-Ip; Fri, 17 Jul 2020 02:33:39 +0000
X-UUID: fb166ff677b24f679e1ce3426d9811c8-20200716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Ck3sKpk8p4f4/TOJbf/gg/voKPhUDfRj/uAbUdAGxzo=; 
 b=mP4CFlFt1QPU1wt4CZPAVpfEzNjtBPxMQA0gwtXiNPC9Bvl27PyeUalefEfoq3nmdnLB+sXinmLknP9wO2uBPgBHdxR0MJ9AiGZaPNGSX3GKbAQdm03picrnsFP9E8foVzkLYam0HN7wz/Bza6ZbnYy183QSf+IeK7KuFEIBGxk=;
X-UUID: fb166ff677b24f679e1ce3426d9811c8-20200716
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1386619953; Thu, 16 Jul 2020 18:33:44 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jul 2020 19:23:32 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Jul 2020 10:23:30 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Jul 2020 10:23:26 +0800
From: <chuanjia.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, <linux-pci@vger.kernel.org>
Subject: [PATCH v3 0/4] Split PCIe node to comply with hardware design
Date: Fri, 17 Jul 2020 10:22:19 +0800
Message-ID: <20200717022223.1437-1-chuanjia.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_223338_796549_B243EE0D 
X-CRM114-Status: GOOD (  11.15  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, jianjun.wang@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 yong.wu@mediatek.com, Bjorn Helgaas <bhelgaas@google.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There are two independent PCIe controllers in MT2712/MT7622 platform,
and each of them should contain an independent MSI domain.

In current architecture, MSI domain will be inherited from the root
bridge, and all of the devices will share the same MSI domain.
Hence that, the PCIe devices will not work properly if the irq number
which required is more than 32.

Split the PCIe node for MT2712/MT7622 platform to fix MSI issue and
comply with the hardware design.

change note:
  v3:rebase for 5.8-rc1. Only collect ack of Ryder, No code change.
  v2:change the allocation of mt2712 PCIe MMIO space due to the
     allocation size is not right in v1.

chuanjia.liu (4):
  dt-bindings: PCI: Mediatek: Update PCIe binding
  PCI: mediatek: Use regmap to get shared pcie-cfg base
  arm64: dts: mediatek: Split PCIe node for MT2712/MT7622
  ARM: dts: mediatek: Update mt7629 PCIe node

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
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
