Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B5DC38147
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 12:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T6qEGz+wFLRGCjTv0QCL7Er7vmiEF8WTOkjahyDdWmY=; b=nOviBKmIl/3nNyBIE2YgVZYQcZ
	msvoTZBQ/Ui3bS+Wimj1so7fy0o9fKBMZzCz1fI82H2obOmM5Zqnn/c8bYngzXQmWgzIB6OeM7m6q
	bzuswYvI0u6xzYfPMXrbl80b4m5XcyEaIuWE1fF68l48PNdjtt3U9McQmQAsgU8451PSLFSAQCMou
	Ke7sDDEP7IMxkjAqF7GE8gZY/p+A5Di2rDxdJ6eI9u57mQOZPaAQpet59DtnSLxs/fGsMHOQrgfR1
	ud1/Y7tP+VAyDc4nnws2ncL1TcZJffwotcqZoVakcufXL5bC81w0kwrhllyBThMY/6E05vlMHfV3Z
	AEe895vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI76f-000dwK-4f; Wed, 18 Jan 2023 11:59:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI76c-000duH-0S
	for linux-mediatek@lists.infradead.org; Wed, 18 Jan 2023 11:59:51 +0000
X-UUID: 99b7a826972711edbbe3f76fe852e059-20230118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=T6qEGz+wFLRGCjTv0QCL7Er7vmiEF8WTOkjahyDdWmY=;
	b=fmwZFw8q9Hd6vJahNHxUGjX2YOyILSCjAyhLKFRGhPXHDc1qhsTRqdZOjbauIelruLvyKamSvZ3bGhrGLdJ9TuR2ISMSJ7tfktBuOA1FvAVWCuaekqcjKM5ZPTtmHZKHitipNoMTLRroVs8NhoItXK62XPgfX8oXgf3t3NqbAy8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:4497092b-44bd-4f4f-be50-f34928bda49f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:3ca2d6b,CLOUDID:8ff50355-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 99b7a826972711edbbe3f76fe852e059-20230118
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yanchao.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 677633697; Wed, 18 Jan 2023 04:59:45 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 18 Jan 2023 19:39:08 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 19:39:06 +0800
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
Subject: [PATCH net-next v2 00/12] net: wwan: tmi: PCIe driver for MediaTek M.2 modem
Date: Wed, 18 Jan 2023 19:38:47 +0800
Message-ID: <20230118113859.175836-1-yanchao.yang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_035950_097178_4867303C 
X-CRM114-Status: GOOD (  13.69  )
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
     for bidirectional event notification such as handshake, exception,
     power management and port enumeration.
   * RGU (Reset General Unit) - Receives reset notification from device.

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
   * PM (Power Management) - Manages device states according to control/data
     transmission states and host power states (i.e., S0, S3, S4, Runtime
     Suspend, etc.).
   * Exception - Monitors exception events and tries to recover the device.

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

V2:
- Remove wrapper function, use kernel interfaces instead, ex, dma_map_single, dma_pool_zalloc, ...
- Refine comments to meet kerneldoc format specification.
- Use interfaces in bitfield.h to perform bitmask related operations.
- Remove unused functions from patch-1.
- Remove patch2 (net: wwan: tmi: Add buffer management).

Yanchao Yang (12):
  net: wwan: tmi: Add PCIe core
  net: wwan: tmi: Add control plane transaction layer
  net: wwan: tmi: Add control DMA interface
  net: wwan: tmi: Add control port
  net: wwan: tmi: Add FSM thread
  net: wwan: tmi: Add AT & MBIM WWAN ports
  net: wwan: tmi: Introduce data plane hardware interface
  net: wwan: tmi: Add data plane transaction layer
  net: wwan: tmi: Introduce WWAN interface
  net: wwan: tmi: Add exception handling service
  net: wwan: tmi: Add power management support
  net: wwan: tmi: Add maintainers and documentation

 .../networking/device_drivers/wwan/index.rst  |    1 +
 .../networking/device_drivers/wwan/tmi.rst    |   48 +
 MAINTAINERS                                   |   11 +
 drivers/net/wwan/Kconfig                      |   13 +
 drivers/net/wwan/Makefile                     |    1 +
 drivers/net/wwan/mediatek/Makefile            |   24 +
 drivers/net/wwan/mediatek/mtk_cldma.c         |  370 ++
 drivers/net/wwan/mediatek/mtk_cldma.h         |  163 +
 drivers/net/wwan/mediatek/mtk_common.h        |   30 +
 drivers/net/wwan/mediatek/mtk_ctrl_plane.c    |  521 ++
 drivers/net/wwan/mediatek/mtk_ctrl_plane.h    |  115 +
 drivers/net/wwan/mediatek/mtk_data_plane.h    |  124 +
 drivers/net/wwan/mediatek/mtk_dev.c           |   65 +
 drivers/net/wwan/mediatek/mtk_dev.h           |  687 +++
 drivers/net/wwan/mediatek/mtk_dpmaif.c        | 4191 +++++++++++++++++
 drivers/net/wwan/mediatek/mtk_dpmaif_drv.h    |  277 ++
 drivers/net/wwan/mediatek/mtk_ethtool.c       |  179 +
 drivers/net/wwan/mediatek/mtk_except.c        |  176 +
 drivers/net/wwan/mediatek/mtk_fsm.c           | 1318 ++++++
 drivers/net/wwan/mediatek/mtk_fsm.h           |  178 +
 drivers/net/wwan/mediatek/mtk_pm.c            | 1001 ++++
 drivers/net/wwan/mediatek/mtk_port.c          | 1358 ++++++
 drivers/net/wwan/mediatek/mtk_port.h          |  312 ++
 drivers/net/wwan/mediatek/mtk_port_io.c       |  777 +++
 drivers/net/wwan/mediatek/mtk_port_io.h       |   45 +
 drivers/net/wwan/mediatek/mtk_wwan.c          |  662 +++
 .../wwan/mediatek/pcie/mtk_cldma_drv_t800.c   | 1049 +++++
 .../wwan/mediatek/pcie/mtk_cldma_drv_t800.h   |   25 +
 .../wwan/mediatek/pcie/mtk_dpmaif_drv_t800.c  | 2115 +++++++++
 .../wwan/mediatek/pcie/mtk_dpmaif_reg_t800.h  |  368 ++
 drivers/net/wwan/mediatek/pcie/mtk_pci.c      | 1332 ++++++
 drivers/net/wwan/mediatek/pcie/mtk_pci.h      |  150 +
 drivers/net/wwan/mediatek/pcie/mtk_reg.h      |   84 +
 33 files changed, 17770 insertions(+)
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
 create mode 100644 drivers/net/wwan/mediatek/mtk_ethtool.c
 create mode 100644 drivers/net/wwan/mediatek/mtk_except.c
 create mode 100644 drivers/net/wwan/mediatek/mtk_fsm.c
 create mode 100644 drivers/net/wwan/mediatek/mtk_fsm.h
 create mode 100644 drivers/net/wwan/mediatek/mtk_pm.c
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


