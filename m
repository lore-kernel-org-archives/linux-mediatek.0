Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35816C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 03:45:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF624613B3
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 03:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF624613B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zXgEiCO4/sEAWRCrOYUeb5bmWjx6l4J9ThKQ82qijAY=; b=Jb+S2V8zJkk4mnw32vwY2evydz
	UHFsNI8BiCkHdZGP2RauovTmwth4PYGeaptiorfHyE+CDb0tLMugfncM/R+1PQWb3h+THqhXNZfcc
	JOheVUZ1XkFfPWB7pjenRIBGrySjDIQA7WXKhZmstlpuGohiPj+MqD4BJiRkrks1Bi3y/smqPYO98
	z+2fsQozBlTSiKii1NzcOpPrAugFPzQTUXMeMZWHF+37i6N/xK+ANtEwDyowHcK31iVR23Ccgvath
	mExFfxL2vt/HUIKiS8c2qLP1X1am76kNQ2VaQVRwMM3J0DsCTH7BjOAC5w3XU0tWFvl215Hd0y0ap
	fZYL+zlQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTceO-001MoX-Tp; Tue, 06 Apr 2021 03:45:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTceJ-001Mlk-BG; Tue, 06 Apr 2021 03:45:09 +0000
X-UUID: eed38e1e25b34b829f1e77b8ca1c9dd0-20210405
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=EQwQ6Z4blBEYvg9h/y6o/AL64GCKIEQ82lxlRAtWniA=; 
 b=o37n3v0NLZPXmijt8j+Xlt8V+dy0rZPVuaeYWfBcNpae94TDVzDreyRjmUYpylj1Z+4nx/Ki/TGu8nVLwvOgx+TgKPvzugahs6boxl3OMuRWDZ+xa6UZAdMqpKSk/9SOplQTIm7/wh7y6nR90VZt1lDxffOYIYSYzVy982eyGsQ=;
X-UUID: eed38e1e25b34b829f1e77b8ca1c9dd0-20210405
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2145405297; Mon, 05 Apr 2021 20:44:43 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Apr 2021 20:44:38 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Apr 2021 11:44:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 6 Apr 2021 11:44:23 +0800
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: <robh+dt@kernel.org>, <bhelgaas@google.com>, <matthias.bgg@gmail.com>
CC: <ryder.lee@mediatek.com>, <lorenzo.pieralisi@arm.com>,
 <jianjun.wang@mediatek.com>, <chuanjia.liu@mediatek.com>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <yong.wu@mediatek.com>, <frank-w@public-files.de>
Subject: [PATCH v9 0/4] PCI: mediatek: Spilt PCIe node to comply with hardware
 design 
Date: Tue, 6 Apr 2021 11:44:06 +0800
Message-ID: <20210406034410.24381-1-chuanjia.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_044508_241479_F3D665E3 
X-CRM114-Status: GOOD (  12.21  )
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

There are two independent PCIe controllers in MT2712 and MT7622 platform. Each of them should contain an independent MSI domain.

In old dts architecture, MSI domain will be inherited from the root bridge, and all of the devices will share the same MSI domain.
Hence that, the PCIe devices will not work properly if the irq number which required is more than 32.

Split the PCIe node for MT2712 and MT7622 platform to comply with the hardware design and fix MSI issue.

change note:
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
