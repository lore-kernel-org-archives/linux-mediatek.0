Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04288C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 03:49:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A3EA6197F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 03:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A3EA6197F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=clt6udS3lnyBBjcWXktxxXP0oSCMFzsNgp+kaYsr0ms=; b=LYxcIj+JIZ2xkE7B6N3hFv6Gil
	tGe+s77slTKZxnF/7l2PaFz8Lh9niAzlUxPUrcIPD4WUTnukxgSCD6eXIRNuZSE1IPcj+kFsDVoj3
	Hz6hgH8BcgpDWw7qlCwFKaiv1q6Uw767+dSx+k2X4nauabDONpVjtJbnKw6igozn+kCrc9xtaJ4z8
	ICWBEP69fXrjAhOP7sY+C5vn009/KwSSQ1c0Ww2P91IjMwC6h8SoUTIEde3Lqm0cS9f4bkFk1hp53
	EU9w7mUF+agY7byS8i+VWNDcmzBAwT63nXylDf2zPxee4o7UO4V1m1850jmkAeUUIXRWXT7mR7LAa
	4QSOTxCA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOY2W-00Ddsw-1W; Tue, 23 Mar 2021 03:49:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOY2P-00Ddqn-IQ; Tue, 23 Mar 2021 03:49:06 +0000
X-UUID: f416fefd9f9249989e659db4740fc4a6-20210322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=lk0nW3+jHaFJWNgX9i22Bj0kFko93qxiiSZD1vMFs+U=; 
 b=hrEiHbDgsBq6olVeAcKsJZR88H/nY+pIbO98/z8n27pTa8fYiS1Xfx51VgAkiE5YI2dQJRtqJHmdYDajy4ALGiSQoLofTwG+Rl0reTFm3TyJrI7e+s9BFhZq2lr8+xR0N9utwCN8iw2U5ydLWqCH+splD77SZ5csMNwASGOkXyM=;
X-UUID: f416fefd9f9249989e659db4740fc4a6-20210322
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1159666916; Mon, 22 Mar 2021 19:48:57 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Mar 2021 20:38:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 11:38:48 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Mar 2021 11:38:47 +0800
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: <robh+dt@kernel.org>, <bhelgaas@google.com>, <matthias.bgg@gmail.com>
CC: <ryder.lee@mediatek.com>, <lorenzo.pieralisi@arm.com>,
 <jianjun.wang@mediatek.com>, <chuanjia.liu@mediatek.com>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <yong.wu@mediatek.com>, <frank-w@public-files.de>
Subject: [PATCH v8 0/4] PCI: mediatek: Spilt PCIe node to comply with hardware
 design
Date: Tue, 23 Mar 2021 11:38:29 +0800
Message-ID: <20210323033833.14954-1-chuanjia.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_034902_847700_098FA9CE 
X-CRM114-Status: GOOD (  12.60  )
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

There are two independent PCIe controllers in MT2712 and MT7622
platform. Each of them should contain an independent MSI domain.

In old dts architecture, MSI domain will be inherited from the root
bridge, and all of the devices will share the same MSI domain.
Hence that, the PCIe devices will not work properly if the irq number
which required is more than 32.

Split the PCIe node for MT2712 and MT7622 platform to comply with
the hardware design and fix MSI issue.

change note:
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

Chuanjia Liu (4):
  dt-bindings: PCI: mediatek: Update the Device tree bindings
  PCI: mediatek: Add new method to get shared pcie-cfg base address and
       parse node
  arm64: dts: mediatek: Split PCIe node for MT2712 and MT7622
  ARM: dts: mediatek: Update MT7629 PCIe node for new format

 .../bindings/pci/mediatek-pcie-cfg.yaml       |  39 ++++
 .../devicetree/bindings/pci/mediatek-pcie.txt | 201 ++++++++++--------
 arch/arm/boot/dts/mt7629-rfb.dts              |   3 +-
 arch/arm/boot/dts/mt7629.dtsi                 |  45 ++--
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |  97 +++++----
 .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  |  16 +-
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts  |   6 +-
 arch/arm64/boot/dts/mediatek/mt7622.dtsi      | 112 +++++-----
 drivers/pci/controller/pcie-mediatek.c        |  50 +++--
 9 files changed, 325 insertions(+), 244 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml

-- 
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
