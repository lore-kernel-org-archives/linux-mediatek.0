Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74044C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 06:20:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41275207BC
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 06:20:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bo5Ww2af";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hIAZb1pu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41275207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zvtmR0qu7TPW51UWZEGA04aXr96JapZn3D36jpw4F0k=; b=bo5Ww2afBKCcYc
	GU87v7yt9I4M/nVFXFVudVHOgrD/vXbLvyxOysJ/XPaYchjpE+Je7gLPW0gGYuSd6Eo1wNRe56LXE
	31hrMHQB1e+vlC/gS6Cs48uxMy5XV0wH8jjNPUMjWzW2Lr+ykb/dPB9P97XoEdLJvYHjaBzdg/+uR
	/ueSXhakMFPZeh+VGzVKOVquvZ1gv2RUXeS2G/PvfoN1XHkcTT2vS49TPxTpeyYTaw6puDOoWpp7I
	hK8FSoUHGpFSioXId4tHQqH1+COY2OubCOF6zygN449TBwEXr/qZUTzIFR7Ge7kkaUo+o77/wO3mz
	XTg+oGSMayWnt/E4cIQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeBtZ-0002g1-Q8; Thu, 28 May 2020 06:20:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeBtV-0002el-6z; Thu, 28 May 2020 06:20:00 +0000
X-UUID: abe8ee43cbb54151adc3f1a45abe82dd-20200527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=k9n3h0/X69wAHhYT1nFTsKcL3wy3KEtSe7PgG0o+trw=; 
 b=hIAZb1puZnLEPVjq5jDmEkjVsbzUDIAt6MA0YBUDYkSkrXCtKWMYhOx7bqxk1MEBjozlQmX9srmcs67BfeqDYGT+EMtoEOAVnv9cvBYun9/Na6JQsNKGjFxIRNUB+2P0SSEGwb7wViOOFuUdFPTj7vHeJskAeY0zxtmq/2qBYrE=;
X-UUID: abe8ee43cbb54151adc3f1a45abe82dd-20200527
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1831692941; Wed, 27 May 2020 22:20:16 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 May 2020 23:18:52 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 May 2020 14:18:47 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 May 2020 14:18:46 +0800
From: <chuanjia.liu@mediatek.com>
To: <robh+dt@kernel.org>, <ryder.lee@mediatek.com>, <matthias.bgg@gmail.com>
Subject: [PATCH v2 0/4] Spilt PCIe node to comply with hardware design
Date: Thu, 28 May 2020 14:16:44 +0800
Message-ID: <20200528061648.32078-1-chuanjia.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8CF1375321BD3043410D80C9D460D099090CF36CFC4DCB666F3A8866FC761E1E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_231957_251604_10BBF186 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com,
 srv_heupstream@mediatek.com, chuanjia.liu@mediatek.com,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 jianjun.wang@mediatek.com, linux-mediatek@lists.infradead.org,
 yong.wu@mediatek.com, bhelgaas@google.com,
 linux-arm-kernel@lists.infradead.org, amurray@thegoodpenguin.co.uk
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
v2: change the allocation of mt2712 PCIe MMIO space due to the allcation
size is not right in v1.

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
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
