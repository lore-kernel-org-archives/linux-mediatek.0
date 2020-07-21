Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D08C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 07:58:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D97D208E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 07:58:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p0GBhCj7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="koRhD6Ne"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D97D208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gtZi0m2AQaTOiKzszm2ILyFz8EIK+NoXoSIQGXKQfv4=; b=p0GBhCj7acPgLE2Ee5598XNo5/
	Wu3oWP5iMceeTVxpCa88qEJ0sqEFFNvQ+lnrJlJN9YvyuaB502blgL4D6zTLYePP7t6zxkVFLVOUd
	IwJ4OzeRmFN9hay1n60920vyIxv3v5zLXyFEur8t71mb41i1E/OEcbXKZtGdoYvDVCjngy6yNtSJb
	iP+6wOqxB5utDzxPUfXwY9PnCTJ9b7RD9a/osUfLKRB4c2yLhD3l98TVkHSuRpzLVZ0dzHZuhHlIq
	pmc0bhkorA5AShkO3wj/Ivfd5PZI0pUv6+QUUM3fa6s56iWLwHQ67/0jSDsibGIOj4uXaL5aefOTE
	uKdx91FQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxnA9-0006SP-Bo; Tue, 21 Jul 2020 07:58:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxnA6-0006Qk-Or; Tue, 21 Jul 2020 07:58:07 +0000
X-UUID: 0c0ffee529ed4c7fa61e9e45120a4b51-20200720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=vr8FkXlkAreaPZ3GuRWo40Xs9vhbrlKfvLDvE6FsB7g=; 
 b=koRhD6NeVDDplDNIi/OsKRaXK2ITrGtqXWbRwAiacdL3kmWrJizGpmMt65vPyZV3DaRyiwmj9ntDQbghwN+QErjW01k0LGa8oVF7uqgOrIB19ZW4eGn9/XuLKN0kSks0V5m3gJdmrztBUzkpAB2Su+xVx70ao38cPMxeLwTTwfU=;
X-UUID: 0c0ffee529ed4c7fa61e9e45120a4b51-20200720
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 567761964; Mon, 20 Jul 2020 23:57:58 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 00:50:31 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 15:50:22 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 21 Jul 2020 15:50:22 +0800
From: chuanjia.liu <Chuanjia.Liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>
Subject: [PATCH v4 0/4] Split PCIe node to comply with hardware design
Date: Tue, 21 Jul 2020 15:49:11 +0800
Message-ID: <20200721074915.14516-1-Chuanjia.Liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 758788BF0DEEBCB8D615ED15913EAAE9465D6CB875B47041FB68A8865ADE58712000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_035807_011528_09B99F9D 
X-CRM114-Status: GOOD (  11.04  )
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
 chuanjia.liu@mediatek.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, jianjun.wang@mediatek.com,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There are two independent PCIe controllers in MT2712 and MT7622
platform, and each of them should contain an independent MSI
domain.

In current architecture, MSI domain will be inherited from the
root bridge, and all of the devices will share the same MSI domain.
Hence that, the PCIe devices will not work properly if the irq
number which required is more than 32.

Split the PCIe node for MT2712 and MT7622 platform to fix MSI
issue and comply with the hardware design.

change note:
  v4:change commit message due to bayes statistical bogofilter
     considers this series patch SPAM.
  v3:rebase for 5.8-rc1. Only collect ack of Ryder, No code change.
  v2:change the allocation of MT2712 PCIe MMIO space due to the
     allocation size is not right in v1.

chuanjia.liu (4):
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
 create mode 100644 .../bindings/pci/mediatek-pcie-cfg.yaml

-- 
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
