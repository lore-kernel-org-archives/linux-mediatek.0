Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1B6C12002
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 07:46:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A98AA61019
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 07:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A98AA61019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9E8GiJ0/UPQcGTSaqN30JObWLjwslCWeOq3vnjVz9Hw=; b=FGvzVMWCg2fXiU
	ecBzmQF20NCj4HYNaP/75JgoKO9hTq5vKkZ6Q8yKqal0pX131vuWZ4bxPKmw/TF22r29k4TRQnVwn
	+G/Lme0Zq4l5PgpjAQcbbK3rd7y315YZvr2cuim/NgiGZSbbFr5bswgVlxshiHoeF8OUGP9e9B34k
	ynZLD9rfXheKY8iNCcivCyFcFisOG0ezBLFZrsI/q083sI3+qbHVgj22vrXMgwh0F6qgggZwEqwDU
	kvHBm/9eqc9AqaOnklvG2d5S2P7DLx0K9o/GPY7BbpfRJ+Rz2BFdkyweihqRrugNI8mP9nIOw2PvS
	soqt4kU15lLsWuLVkQbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5Nye-008e1u-6k; Mon, 19 Jul 2021 07:46:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5NyM-008dya-MJ; Mon, 19 Jul 2021 07:45:56 +0000
X-UUID: 8a7a3bd7b25a49c48d860b7bb1093460-20210719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=8dszRBl71au1ywM1Inubjn+T8w7oI2xFjydYDkoA4+g=; 
 b=R7OytuqL9I4HU3tLR5f5Z7zWF8cNxJdgR5LXyageLh4S6mcWp9TJ76nCKjkN/0D+PaOQA+tPP4lETOfxS3tpwRDtYo5IVAbQeE1hrX7UKs54CRrHrRTJRzm8AYCiYYBmrfBiYKUbrSatZ0htpgDe1Eh2V+XaV3P2/1U2FFD+K6k=;
X-UUID: 8a7a3bd7b25a49c48d860b7bb1093460-20210719
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 25522870; Mon, 19 Jul 2021 00:45:48 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Jul 2021 00:35:48 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Jul 2021 15:35:46 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 19 Jul 2021 15:35:46 +0800
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: <robh+dt@kernel.org>, <bhelgaas@google.com>, <matthias.bgg@gmail.com>,
 <lorenzo.pieralisi@arm.com>
CC: <ryder.lee@mediatek.com>, <jianjun.wang@mediatek.com>,
 <yong.wu@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>,
 <chuanjia.liu@mediatek.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 0/4] PCI: mediatek: Spilt PCIe node to comply with
 hardware design 
Date: Mon, 19 Jul 2021 15:34:52 +0800
Message-ID: <20210719073456.28666-1-chuanjia.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_004554_784593_52372F0B 
X-CRM114-Status: GOOD (  12.85  )
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

In old dts architecture, MSI domain will be inherited from the root bridge,
and all of the devices will share the same MSI domain.Hence that,
the PCIe devices will not work properly if the irq number 
which required is more than 32.

Split the PCIe node for MT2712 and MT7622 platform to comply with 
the hardware design and fix MSI issue.

change note:
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

Chuanjia Liu (4):
  dt-bindings: PCI: mediatek: Update the Device tree bindings
  PCI: mediatek: Add new method to get shared pcie-cfg base address and parse node
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
