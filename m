Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AECCC76195
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 08:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wPNZGq9769g/pZ0c8S3aTcBp9/DvHhBujsNsv2apsPk=; b=Kyaj42qsGzBpoLhTg/P9D9vdQE
	+dLThzuKM8WZktJwUFbVq3IAZoLlKEkXDrQgYzDDbharkxV5ZkT3sxWTq6Bw6syiY/H4WtF9Euc1e
	T3V0nJIyoASGW9pDSIdlc/9InY/g2SmlnrcaL0GsTgVgau+VJ6SnLPwV1QG8a7q7moB7AHazqJq0E
	KjfVMrAOl5s+Pi6h4eH3RXe97WFcF/1Pl6ZS3EcMsLNo3rzozYUKuy/6vKAi4NGgZg/gFubfaRe+t
	HlXzFOIseBD82h1XBEuBAE4aA6QChwhMYOSerCvam8r4WFDbYHwiNVKu7ey5MjAyOc/nKi7/jTGdk
	IVzPKQ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5Aw-001PM4-29;
	Fri, 17 Mar 2023 08:10:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5At-001PLL-2r
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Mar 2023 08:10:57 +0000
X-UUID: 3ab55a5cc49b11ed86fbcd8805c7ac66-20230317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=wPNZGq9769g/pZ0c8S3aTcBp9/DvHhBujsNsv2apsPk=;
	b=tL6hIKqfHIsamWZu+NwEcsUAph3Hiw7epn2vw5yeKxPGXQnSxQNU612rn/0ulDEZNWd6piIdEPdOD7/4KUw+2mh3eP4owybFnBj2hxmGRIJkhQWzzUCf5g5rdH0J24s/rp+h7T/WF5R1ixLBJY5LTXSzIkB9kvDLnnZ/Kj+p9Uo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.21,REQID:9082cdd2-4144-40e2-b908-246b28a43463,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:83295aa,CLOUDID:aab11af6-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 3ab55a5cc49b11ed86fbcd8805c7ac66-20230317
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <yanchao.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 717263725; Fri, 17 Mar 2023 01:10:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 17 Mar 2023 16:10:13 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 17 Mar 2023 16:10:11 +0800
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
Subject: [PATCH net-next v4 00/10] net: wwan: tmi: PCIe driver for MediaTek M.2 modem
Date: Fri, 17 Mar 2023 16:09:32 +0800
Message-ID: <20230317080942.183514-1-yanchao.yang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_011055_933739_CC8C7884 
X-CRM114-Status: GOOD (  13.12  )
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

V4:
- Refine the naming of labels paired with goto statements.
- Avoid defensive programming, and remove some redundant input parameter checks.
- Remove include path declaration from the module Makefile.

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
 drivers/net/wwan/mediatek/Makefile            |   18 +
 drivers/net/wwan/mediatek/mtk_cldma.c         |  280 ++
 drivers/net/wwan/mediatek/mtk_cldma.h         |  160 +
 drivers/net/wwan/mediatek/mtk_common.h        |   30 +
 drivers/net/wwan/mediatek/mtk_ctrl_plane.c    |  418 +++
 drivers/net/wwan/mediatek/mtk_ctrl_plane.h    |  111 +
 drivers/net/wwan/mediatek/mtk_data_plane.h    |  101 +
 drivers/net/wwan/mediatek/mtk_dev.c           |   50 +
 drivers/net/wwan/mediatek/mtk_dev.h           |  217 ++
 drivers/net/wwan/mediatek/mtk_dpmaif.c        | 2864 +++++++++++++++++
 drivers/net/wwan/mediatek/mtk_dpmaif_drv.h    |  201 ++
 drivers/net/wwan/mediatek/mtk_fsm.c           |  844 +++++
 drivers/net/wwan/mediatek/mtk_fsm.h           |  145 +
 drivers/net/wwan/mediatek/mtk_port.c          | 1066 ++++++
 drivers/net/wwan/mediatek/mtk_port.h          |  231 ++
 drivers/net/wwan/mediatek/mtk_port_io.c       |  547 ++++
 drivers/net/wwan/mediatek/mtk_port_io.h       |   45 +
 drivers/net/wwan/mediatek/mtk_wwan.c          |  511 +++
 .../wwan/mediatek/pcie/mtk_cldma_drv_t800.c   |  930 ++++++
 .../wwan/mediatek/pcie/mtk_cldma_drv_t800.h   |   22 +
 .../wwan/mediatek/pcie/mtk_dpmaif_drv_t800.c  | 1545 +++++++++
 .../wwan/mediatek/pcie/mtk_dpmaif_reg_t800.h  |  319 ++
 drivers/net/wwan/mediatek/pcie/mtk_pci.c      |  982 ++++++
 drivers/net/wwan/mediatek/pcie/mtk_pci.h      |  144 +
 drivers/net/wwan/mediatek/pcie/mtk_reg.h      |   80 +
 30 files changed, 11936 insertions(+)
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


