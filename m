Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC185606A33D
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 11:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2qDtBDTO;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=lPucZqKA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=CZ27xK6IHcnAGaEHdGwRWZS9iObODCSj/ll8dw4bp3g=; b=2qDtBDTOpvJZw3/OHYr/fMO7W8
	mIrLBt3C9Uxx2xYuVRZ2wrBLyO/JMT1RXR/gqjBYLGcLqTcel4GU6NobCnwnDJC8se+9Gog1D5iT6
	n0W4eiZbsSQygVUpeiVVfSzoXl7fjU4AVFOB73bJLwd/v4hSuSsC3k6STTCHQw2twF5Wfse/b5ylz
	AnVcZPVA+b4fRHQy8HHBHreJ1tFMZmQjcfbeTT5ajNxpNKu1gm+/NZHNtyuLG7ytLkpmPclrnfa3Z
	AcxFFJNKIzvdgS7729iICLlzFgVeHEblVKzcnNjzup18kYWVuYDAYYzRMXJdFVuDZL66JUDlhZY0p
	NdXtY2VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkMJ-00000003gcL-1fGW;
	Tue, 10 Nov 2026 11:49:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkMH-00000003gaG-0f0u;
	Tue, 10 Nov 2026 11:49:50 +0000
X-UUID: d16c4c76dcfc11f1afed4741b24580c9-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=CZ27xK6IHcnAGaEHdGwRWZS9iObODCSj/ll8dw4bp3g=;
	b=lPucZqKA38DBAKjXCwSkuvUDU74rHZ9lwl+/f8s4V8oTxkWroqZv/iRqSi6Hm3DoQKxETHNuVZdvgSlIPVergtr0aMokt5Mejp1Xs/SLNV0PxzYAn36A1NW9ZfawKlxXBHPrDWDh/gJiST6aktAKKAIZ9HHQdtgpUIlJyYe3Xfo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:9cd0976c-7ee2-4af2-ba98-a2982f511931,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:fd211966-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d16c4c76dcfc11f1afed4741b24580c9-20261110
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1687015090; Tue, 10 Nov 2026 04:49:42 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 19:49:40 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 19:49:39 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mika Westerberg <westeri@kernel.org>
CC: Andreas Noever <andreas.noever@gmail.com>, Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>, Sven Peter <sven@kernel.org>, Yehezkel
 Bernat <YehezkelShB@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>
Subject: [PATCH 0/7] thunderbolt: Add support platform NHI driver
Date: Tue, 10 Nov 2026 19:48:48 +0800
Message-ID: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_034949_233219_DC4C0DB8 
X-CRM114-Status: GOOD (  16.65  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Historically, the USB4 / Thunderbolt subsystem has had a hard dependency
on PCI, bundling the core framework, the PCIe-attached Native Host
Interface (NHI) driver (pci.c), and the Intel Connection Manager (icm.c)
into a single module (thunderbolt.ko).

Modern ARM64 SoCs (such as MediaTek MT8901 / MT8992) integrate the USB4
host router / NHI directly as an MMIO platform device rather than sitting
on an external PCIe bus. Furthermore, embedded and SoC-based platforms
often do not include PCIe-attached host routers or require Intel ICM
support, making a mandatory PCI dependency and bundled PCIe code
undesirable.

This series decouples PCIe NHI and Intel ICM support from the Thunderbolt
core framework, introduces a generic platform NHI driver supporting DT and
ACPI bindings, and addresses link training timing and race condition issues
observed during suspend/resume and authorization.

Overview of Changes
===================

1. Modularization & Namespace Cleanups (Patches 1-3)
   - Patches 1 & 2 clean up internal interfaces before exporting. Core NHI
     functions are prefixed with standard tb_/tb_ring_ namespace prefixes.
     Intel ICM mailbox helpers (nhi_mailbox_cmd/mode) are moved into icm.c
     and made static, and interrupt work initialization is internalized in
     tb_nhi_probe().
   - Patch 3 drops the hard "depends on PCI" from CONFIG_USB4, introduces
     CONFIG_USB4_PCI to build PCIe NHI and ICM as an opt-in module
     (thunderbolt_pci.ko), and adds a .select_cm() hook in tb_nhi_ops to
     allow connection manager selection without core hardcoding.

2. Platform NHI Driver (Patch 4)
   - Introduces CONFIG_USB4_PLATFORM (thunderbolt_platform.ko), adding
     support for memory-mapped USB4 NHIs via Device Tree ("usb4-nhi-platform")
     and ACPI ("ACPI0015").
   - Implements platform-specific tb_nhi_ops hooks and runtime PM.
   - Adds support for an optional dedicated wakeup interrupt from an
     always-on power domain, necessary for SoCs where the primary NHI MAC/PHY
     power domain is gated during suspend.

3. Link Training and Disconnect Improvements (Patches 5-6)
   - Patch 5 increases the port link training timeout in tb_wait_for_port()
     from 1s to 2s. According to the USB4 specification, Phase 5 (Link
     Equalization) alone may take up to 1000 ms. When combined with Phases 2-4
     (~200 ms) and retimer command transaction delays across dual-retimer
     topologies, physical link establishment can legitimately exceed 1.2s–1.5s,
     which previously led to spurious disconnects during wakeups.
   - Patch 6 decouples the TB_PORT_UNPLUGGED wait time from the overall 2s
     link-up timeout. Under normal link training, the port enters
     TB_PORT_CONNECTING within ~200 ms. Capping TB_PORT_UNPLUGGED retries to
     400 ms allows genuine device disconnect wakeups to be handled promptly
     without waiting the full 2s.

4. Prevent Authorization/Teardown Race Warnings (Patch 7)
   - Prevents WARNING splats in tb_path_activate() and tb_disconnect_pci()
     when sysfs 'authorized' is modified while a downstream router is lost or
     unplugged during suspend/resume. Checking sw->is_unplugged avoids
     redundant lookups and activation attempts on already-freed tunnels.

Testing
=======
This series has been tested on MediaTek ARM64 SoC platforms with an
integrated platform USB4 NHI, verifying:
- Cold boot, device discovery, and tunnel allocation (PCIe, USB3).
- System/runtime Suspend and wake-on-connect/disconnect/remote wakeup.
- Concurrent sysfs authorization changes during disconnect events.
- Verification of modular builds with CONFIG_USB4_PCI=m and
  CONFIG_USB4_PLATFORM=m.

Chunfeng Yun (6):
  thunderbolt: Prefix NHI core functions with tb_ and tb_ring_
  thunderbolt: Move ICM mailbox functions to icm.c and internalize
    interrupt work
  thunderbolt: add platform NHI driver
  thunderbolt: increase the lane adapter link-up timeout value
  thunderbolt: decouple the waiting time of TB_PORT_UNPLUGGED and
    TB_PORT_UP
  thunderbolt: prevent pcie tunnel activation/teardown warnings

Konrad Dybcio (1):
  thunderbolt: Make PCIe NHI support opt-in

 drivers/thunderbolt/Kconfig    |  20 +++-
 drivers/thunderbolt/Makefile   |  10 +-
 drivers/thunderbolt/ctl.c      |   6 +-
 drivers/thunderbolt/domain.c   |  14 ++-
 drivers/thunderbolt/icm.c      |  59 +++++++++++
 drivers/thunderbolt/nhi.c      |  92 ++++--------------
 drivers/thunderbolt/nhi.h      |  16 ++-
 drivers/thunderbolt/pci.c      |  50 ++++------
 drivers/thunderbolt/platform.c | 172 +++++++++++++++++++++++++++++++++
 drivers/thunderbolt/switch.c   |  26 ++++-
 drivers/thunderbolt/tb.c       |   7 ++
 drivers/thunderbolt/tb.h       |   2 -
 drivers/thunderbolt/tunnel.c   |   1 +
 drivers/thunderbolt/xdomain.c  |   5 +
 include/linux/thunderbolt.h    |   4 +
 15 files changed, 356 insertions(+), 128 deletions(-)
 create mode 100644 drivers/thunderbolt/platform.c

-- 
2.45.2


