Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93577C4743D
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 06:10:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 508966124C
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 06:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 508966124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K3PLotLXkowGtPDLv1kmo5EhxhsS8v1spXRv/+k91o4=; b=RuwhJ7u9ex5caX
	QAOT9ylTKMNUzVai0U8sQt8iImvFw38g7dCNMGEIcgF2+VcnprHFOQu12EjmI2Xu5Zr2oE9MB7ea0
	bkY5gqYNKa/pyfNaWCs2a/RsPMkutKIpwCRicrdjWsPvNm6Zj4jK1eSe5UgeZC9Kyc8OJXHjomQS2
	Jy+9n3qg/NkVmZgerxF1IbIJBVHbcGrTMMkaj56G7eL96/OAmKlXE1g1ce/5F4ylwcJQl0Pz6N9FS
	HNOmPZA3pILF6O4bgUgVsNJEoRiROFRyiiGKsEX3G2pHVOGvtwnpPBJoUShg6X3fUSHT9xxEMVvEK
	j/iaw25cpUHs2d3dSwCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lraNH-003lK0-Dg; Fri, 11 Jun 2021 06:10:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lraNC-003lHw-DW; Fri, 11 Jun 2021 06:10:34 +0000
X-UUID: d64262801344477ab2b3f2b9c5def629-20210610
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Oa9e+p5GUHaVPeQn6K3pMhotqAlUEOx3jH2dt5yjiO4=; 
 b=OZg2wjWNAaYytiQWUzrJk8bIwo9MQWIBzvnKPLuIG5l/fYJbIBpnzFiTJxlgabdRH5YULYMfbsX8FolLACGAzOJXskFcSzBGeoP/VeuMP7lsyk413PLYll2BWsOPtwybHp6OoiPnJy/9g5e5uJOiDYXlm/QtELOmf9rTptIstng=;
X-UUID: d64262801344477ab2b3f2b9c5def629-20210610
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 496547245; Thu, 10 Jun 2021 23:10:24 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Jun 2021 23:10:11 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Jun 2021 14:10:08 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Jun 2021 14:10:07 +0800
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: <lorenzo.pieralisi@arm.com>, <robh+dt@kernel.org>, <bhelgaas@google.com>, 
 <matthias.bgg@gmail.com>
CC: <ryder.lee@mediatek.com>, <jianjun.wang@mediatek.com>,
 <yong.wu@mediatek.com>, <chuanjia.liu@mediatek.com>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 0/4] PCI: mediatek: Spilt PCIe node to comply with
 hardware design
Date: Fri, 11 Jun 2021 14:08:58 +0800
Message-ID: <20210611060902.12418-1-chuanjia.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_231032_551762_5F534CEB 
X-CRM114-Status: GOOD (  12.98  )
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
  v10:Rebase for 5.13-rc1, no code change. 
  v9:Add reviewed-by Rob and fix kernel-ci bot warning.
     In the scene of using new dts format,when mtk_pcie_parse_port fails,
     of_node_put don't need to be called.
  v8:Remove slot node and fix yaml warning.
  v7:dt-bindings file was modified as suggested by Rob, other file no change.
  v6:Fix yaml error. make sure driver compatible with old and new DTS format.
  v5:Rebase for 5.9-rc1, no code change. 
  v4:Change commit message due to bayes statistical bogofilter
     considers this series patch SPAM.
  v3:Rebase for 5.8-rc1. Only collect ack of Ryder, No code change.
  v2:Change the allocation of MT2712 PCIe MMIO space due to the
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
  drivers/pci/controller/pcie-mediatek.c        |  52 +++--
  9 files changed, 326 insertions(+), 245 deletions(-)
  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
