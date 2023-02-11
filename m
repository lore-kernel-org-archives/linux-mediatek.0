Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3EFC636CC
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Feb 2023 08:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=is5HxIGHiSBZmzvYR12/E0E9eNG1192q4XorVD2IRPE=; b=RD2ttL1b9s97eptNdq4ACH9q6C
	VMqRRd0vjpClaDo3h/ERSh+OlSXQmh7zOfxKmcn/ELWLBnJWE0qVb+yqRzrvdFg1I872fmdnyqEBW
	IdETH3EuS9oSzT/QPZk/xNFNsg5QyOF4UyWTxM0NdcMATwSe/XAoC/farXiSXhp/mm48kf/dftY5V
	Bt4u+2I0CO9c2bEPUuc2vJUijlZTyviCXsPJzYwb9yw1kQIcEBO/uKiaoLUDj7f9wxrW7IdSYBLvq
	rQU4TrvjI4suIsdZOeOW9ZU/flSLVufrYptFog6pgXPyd4lVUHNIwn0FwzoVpiAlTgv7QppmzNVqE
	bRmDEtCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQlOR-0092kX-Lf; Sat, 11 Feb 2023 08:37:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQlOO-0092jG-1P
	for linux-mediatek@lists.infradead.org; Sat, 11 Feb 2023 08:37:58 +0000
X-UUID: 5dea64bea9e711edbbe3f76fe852e059-20230211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=is5HxIGHiSBZmzvYR12/E0E9eNG1192q4XorVD2IRPE=;
	b=g2itCT+skil6ixswmiR/Nm9N+tRwGuDeH2dMS4lMnctdhjcJsIC4/pN9NPr9s8T3wJ1Rz6oeuL+uguJePzro8zVk0x2dI4vnbZ7Eo6mXabPFurud5eyQ47Nb9nSlGxqfrUPXQ5PgLEjPjZM2q9/v/dC7dMi3Q/zzranult4oF1Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:c11b78c4-5303-490a-bbf1-1056d6c2474a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:885ddb2,CLOUDID:9233928e-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 5dea64bea9e711edbbe3f76fe852e059-20230211
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yanchao.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1290269826; Sat, 11 Feb 2023 01:37:49 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 11 Feb 2023 16:37:46 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sat, 11 Feb 2023 16:37:44 +0800
From: Yanchao Yang <yanchao.yang@mediatek.com>
To: Loic Poulain <loic.poulain@linaro.org>, Sergey Ryazanov
	<ryazanov.s.a@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, "David S
 . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev ML
	<netdev@vger.kernel.org>, kernel ML <linux-kernel@vger.kernel.org>
CC: Intel experts <linuxwwan@intel.com>, Chetan <m.chetan.kumar@intel.com>,
	MTK ML <linux-mediatek@lists.infradead.org>, Liang Lu
	<liang.lu@mediatek.com>, Haijun Liu <haijun.liu@mediatek.com>, Hua Yang
	<hua.yang@mediatek.com>, Ting Wang <ting.wang@mediatek.com>, Felix Chen
	<felix.chen@mediatek.com>, Mingliang Xu <mingliang.xu@mediatek.com>, Min Dong
	<min.dong@mediatek.com>, Aiden Wang <aiden.wang@mediatek.com>, Guohao Zhang
	<guohao.zhang@mediatek.com>, Chris Feng <chris.feng@mediatek.com>, Yanchao
 Yang <yanchao.yang@mediatek.com>, Lambert Wang <lambert.wang@mediatek.com>,
	Mingchuang Qiao <mingchuang.qiao@mediatek.com>, Xiayu Zhang
	<xiayu.zhang@mediatek.com>, Haozhe Chang <haozhe.chang@mediatek.com>
Subject: [PATCH net-next v3 00/10] net: wwan: tmi: PCIe driver for MediaTek M.2 modem
Date: Sat, 11 Feb 2023 16:37:22 +0800
Message-ID: <20230211083732.193650-1-yanchao.yang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_003756_251309_6D9CE38A 
X-CRM114-Status: GOOD (  12.15  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TMI(T-series Modem Interface) is the PCIe host device driver for MediaTek's
modem. The driver uses the WWAN framework infrastructure to create the
following control ports and network interfaces for data transactions.
* /dev/wwan0at0 - Interface that supports AT commands.
* /dev/wwan0mbim0 - Interface conforming to the MBIM protocol.
* wwan0-X - Primary network interface for IP traffic.

The main blocks in the TMI driver are:
* HW layer - Abstracts the hardware bus operations for the device, and
   provides generic interfaces for the transaction layer to get the device's
   information and control the device's behavior. It includes:

   * PCIe - Implements probe, removal and interrupt handling.
   * MHCCIF (Modem Host Cross-Core Interface) - Provides interrupt channels
     for bidirectional event notification such as handshake and port enumeration.

* Transaction layer - Implements data transactions for the control plane
   and the data plane. It includes:

   * DPMAIF (Data Plane Modem AP Interface) - Controls the hardware that
     provides uplink and downlink queues for the data path. The data exchange
     takes place using circular buffers to share data buffer addresses and
     metadata to describe the packets.
   * CLDMA (Cross Layer DMA) - Manages the hardware used by the port layer
     to send control messages to the device using MediaTek's CCCI (Cross-Core
     Communication Interface) protocol.
   * TX Services - Dispatch packets from the port layer to the device.
   * RX Services - Dispatch packets to the port layer when receiving packets
     from the device.

* Port layer - Provides control plane and data plane interfaces to userspace.
   It includes:

   * Control Plane - Provides device node interfaces for controlling data
     transactions.
   * Data Plane - Provides network link interfaces wwanX (0, 1, 2...) for IP
     data transactions.

* Core logic - Contains the core logic to keep the device working.
   It includes:

   * FSM (Finite State Machine) - Monitors the state of the device, and
     notifies each module when the state changes.

The compilation of the TMI driver is enabled by the CONFIG_MTK_TMI config
option which depends on CONFIG_WWAN.

List of contributors:
Min Dong <min.dong@mediatek.com>
Ting Wang <ting.wang@mediatek.com>
Hua Yang <hua.yang@mediatek.com>
Mingliang Xu <mingliang.xu@mediatek.com>
Felix Chen <felix.chen@mediatek.com>
Aiden Wang <aiden.wang@mediatek.com>
Guohao Zhang <guohao.zhang@mediatek.com>
Chris Feng <chris.feng@mediatek.com>
Yanchao Yang <yanchao.yang@mediatek.com>
Michael Cai <michael.cai@mediatek.com>
Lambert Wang <lambert.wang@mediatek.com>
Mingchuang Qiao <mingchuang.qiao@mediatek.com>
Xiayu Zhang <xiayu.zhang@mediatek.com>
Haozhe Chang <haozhe.chang@mediatek.com>

V3:
- Remove exception handling and power management modules, and reduce data plane's features, etc.

V2:
- Remove wrapper function, use kernel interfaces instead, ex, dma_map_single, dma_pool_zalloc, ...
- Refine comments to meet kerneldoc format specification.
- Use interfaces in bitfield.h to perform bitmask related operations.
- Remove unused functions from patch-1.
- Remove patch2 (net: wwan: tmi: Add buffer management).

Yanchao Yang (10):
  net: wwan: tmi: Add PCIe core
  net: wwan: tmi: Add control plane transaction layer
  net: wwan: tmi: Add control DMA interface
  net: wwan: tmi: Add control port
  net: wwan: tmi: Add FSM thread
  net: wwan: tmi: Add AT & MBIM WWAN ports
  net: wwan: tmi: Introduce data plane hardware interface
  net: wwan: tmi: Add data plane transaction layer
  net: wwan: tmi: Introduce WWAN interface
  net: wwan: tmi: Add maintainers and documentation

 .../networking/device_drivers/wwan/index.rst  |    1 +
 .../networking/device_drivers/wwan/tmi.rst    |   48 +
 MAINTAINERS                                   |   11 +
 drivers/net/wwan/Kconfig                      |   14 +
 drivers/net/wwan/Makefile                     |    1 +
 drivers/net/wwan/mediatek/Makefile            |   21 +
 drivers/net/wwan/mediatek/mtk_cldma.c         |  280 ++
 drivers/net/wwan/mediatek/mtk_cldma.h         |  160 +
 drivers/net/wwan/mediatek/mtk_common.h        |   30 +
 drivers/net/wwan/mediatek/mtk_ctrl_plane.c    |  441 +++
 drivers/net/wwan/mediatek/mtk_ctrl_plane.h    |  111 +
 drivers/net/wwan/mediatek/mtk_data_plane.h    |  103 +
 drivers/net/wwan/mediatek/mtk_dev.c           |   50 +
 drivers/net/wwan/mediatek/mtk_dev.h           |  382 ++
 drivers/net/wwan/mediatek/mtk_dpmaif.c        | 3093 +++++++++++++++++
 drivers/net/wwan/mediatek/mtk_dpmaif_drv.h    |  201 ++
 drivers/net/wwan/mediatek/mtk_fsm.c           |  998 ++++++
 drivers/net/wwan/mediatek/mtk_fsm.h           |  153 +
 drivers/net/wwan/mediatek/mtk_port.c          | 1256 +++++++
 drivers/net/wwan/mediatek/mtk_port.h          |  299 ++
 drivers/net/wwan/mediatek/mtk_port_io.c       |  625 ++++
 drivers/net/wwan/mediatek/mtk_port_io.h       |   45 +
 drivers/net/wwan/mediatek/mtk_wwan.c          |  589 ++++
 .../wwan/mediatek/pcie/mtk_cldma_drv_t800.c   |  939 +++++
 .../wwan/mediatek/pcie/mtk_cldma_drv_t800.h   |   22 +
 .../wwan/mediatek/pcie/mtk_dpmaif_drv_t800.c  | 1622 +++++++++
 .../wwan/mediatek/pcie/mtk_dpmaif_reg_t800.h  |  357 ++
 drivers/net/wwan/mediatek/pcie/mtk_pci.c      | 1020 ++++++
 drivers/net/wwan/mediatek/pcie/mtk_pci.h      |  148 +
 drivers/net/wwan/mediatek/pcie/mtk_reg.h      |   80 +
 30 files changed, 13100 insertions(+)
 create mode 100644 Documentation/networking/device_drivers/wwan/tmi.rst
 create mode 100644 drivers/net/wwan/mediatek/Makefile
 create mode 100644 drivers/net/wwan/mediatek/mtk_cldma.c
 create mode 100644 drivers/net/wwan/mediatek/mtk_cldma.h
 create mode 100644 drivers/net/wwan/mediatek/mtk_common.h
 create mode 100644 drivers/net/wwan/mediatek/mtk_ctrl_plane.c
 create mode 100644 drivers/net/wwan/mediatek/mtk_ctrl_plane.h
 create mode 100644 drivers/net/wwan/mediatek/mtk_data_plane.h
 create mode 100644 drivers/net/wwan/mediatek/mtk_dev.c
 create mode 100644 drivers/net/wwan/mediatek/mtk_dev.h
 create mode 100644 drivers/net/wwan/mediatek/mtk_dpmaif.c
 create mode 100644 drivers/net/wwan/mediatek/mtk_dpmaif_drv.h
 create mode 100644 drivers/net/wwan/mediatek/mtk_fsm.c
 create mode 100644 drivers/net/wwan/mediatek/mtk_fsm.h
 create mode 100644 drivers/net/wwan/mediatek/mtk_port.c
 create mode 100644 drivers/net/wwan/mediatek/mtk_port.h
 create mode 100644 drivers/net/wwan/mediatek/mtk_port_io.c
 create mode 100644 drivers/net/wwan/mediatek/mtk_port_io.h
 create mode 100644 drivers/net/wwan/mediatek/mtk_wwan.c
 create mode 100644 drivers/net/wwan/mediatek/pcie/mtk_cldma_drv_t800.c
 create mode 100644 drivers/net/wwan/mediatek/pcie/mtk_cldma_drv_t800.h
 create mode 100644 drivers/net/wwan/mediatek/pcie/mtk_dpmaif_drv_t800.c
 create mode 100644 drivers/net/wwan/mediatek/pcie/mtk_dpmaif_reg_t800.h
 create mode 100644 drivers/net/wwan/mediatek/pcie/mtk_pci.c
 create mode 100644 drivers/net/wwan/mediatek/pcie/mtk_pci.h
 create mode 100644 drivers/net/wwan/mediatek/pcie/mtk_reg.h

-- 
2.32.0


