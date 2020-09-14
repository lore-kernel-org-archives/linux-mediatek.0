Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5494C433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 11:33:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F5AA208DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 11:33:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3Sv7RDYM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="onUVFc4N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F5AA208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IwtHnj7jexik8V82DIfz+MfwjyQRUQsJPSapmLny9Mg=; b=3Sv7RDYMkRQNqv4Xe118cbEAEg
	XgTthaFcApbgXW4br/aFaYAXJ3hmXcEWBfTN+l+4o25QTAHa2vxd2AiM30+V+qh0bHpnH3gZFUSI/
	4PbQfHLima9xsPT2LHYQw8COvj1PiGUWuyLcsKMDs0bONx51X1Hr+cGGhmg6b6wULLEAsG9gVYvyp
	D5ddEOqOCoN203Y4kV5kmZEp2ZW5miF6ERsaPY8mHmD1Bl4c7+VSIzsGIWEltLAd9MuqJD6Wz89KC
	/Swi7yILSfXb7ODtMF0g8xRA3U8JpanHtzV5YtSZuBuawAJtztBqBymqanfmkL2QK/Rnnz2pZsA99
	SVYbqC0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHmjy-0005OH-6s; Mon, 14 Sep 2020 11:33:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHmjv-0005NI-Ps; Mon, 14 Sep 2020 11:33:45 +0000
X-UUID: 767fbf590fa3477e97bdf8be9dfa17c5-20200914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=PEhItO3FI00zCynCyOZJCO9f+PedrDX9uq/sSJ/84Ro=; 
 b=onUVFc4NthU2+EZ2n+lZcbeZ+kx2rmR6KPF7NZiLOAdHGoRutQU5+BTEWVDBsbwmz4/ddLJpIuTv4Hbdksma2yUtEOysAKhG9MlAk+7rKhtR5mvP03aUPYgh2qUeXmlBd62eG8GwHnFvF/cAJYkKjdP05Ywm/w/2WDVGdYvXy2E=;
X-UUID: 767fbf590fa3477e97bdf8be9dfa17c5-20200914
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 27854134; Mon, 14 Sep 2020 03:29:29 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 04:29:27 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 19:29:23 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Sep 2020 19:29:23 +0800
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH v6 0/4] Spilt PCIe node to comply with hardware design
Date: Mon, 14 Sep 2020 19:26:55 +0800
Message-ID: <20200914112659.7091-1-chuanjia.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8543CC27B5C0BF586E95D1EAE5D1FED90A5EEA9E793042D1C11942EA46B8D07E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_073343_983241_294A08E3 
X-CRM114-Status: GOOD (  10.45  )
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

Split the PCIe node for MT2712 and MT7622 platform to fix MSI issue
and comply with the hardware design.

change note:
  v6:Fix yaml error. Make sure driver compatible with old and 
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

 .../bindings/pci/mediatek-pcie-cfg.yaml       |  37 +++++
 .../devicetree/bindings/pci/mediatek-pcie.txt | 139 +++++++++++-------
 arch/arm/boot/dts/mt7629-rfb.dts              |   3 +-
 arch/arm/boot/dts/mt7629.dtsi                 |  22 +--
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |  75 ++++++----
 .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  |  16 +-
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts  |   6 +-
 arch/arm64/boot/dts/mediatek/mt7622.dtsi      |  66 ++++++---
 drivers/pci/controller/pcie-mediatek.c        |  23 ++-
 9 files changed, 253 insertions(+), 134 deletions(-)

-- 
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
