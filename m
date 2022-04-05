Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18ABC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Apr 2022 19:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8zhyCc7anxdHB4moas+fMSNt/C7fyyOFLCRCIG5hRwE=; b=P5KOpe7OHcrOGI
	Vk1etoHUfg02guDn/OBL7gHysY3vYVIaKeGELpUFwDdNpmH3OWbxrzcjpOyFswjK7yoqkBAxbx8Bf
	znnmhoaPwGq9DfTAnxWeILyIGXWNYwkN9dUiFFXzXtOxKMASIeDtJ4IpVUGZPmnWqeIpjxnhtvOuI
	d47zUnnX/T5EXZynofi4x6E0zEwDJhh/LrYfjUM2dVDztmvW6KmezSJq6uYZ9yYtZz+SA5DiMbuHP
	DFD6eamIzmm5D0r1u6JTf0lmCuSBu5PWAJKsbFf/7J6F0jGyv0nxdw3zKm1LHhHvs0uV0vwtIkHJT
	vMH/jdbi7k3lMYYWRhpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbpJe-002Saz-AC; Tue, 05 Apr 2022 19:58:14 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbpJR-002SXM-O8; Tue, 05 Apr 2022 19:58:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6RThTrIjSD+KgHY57687QYQ6+eGEGiDbgQLuvpHLE3Y=; b=XKn3t7838gXXFeW0mLX4zKO3Po
 AEXPN995zU/JbTfakjHb6CLcJIV/4khPlfy2iXE4FiOwWxyY+pZ76eR0+uiFGgvWTDMl+0EP3JD/x
 hNS3GK5UPqOQmFXXmEwwz0D7EQuVhejooE3cKYwQjcJAttwIyl9BGmGR07BCKoV3F1QY=;
Received: from p200300daa70ef200456864e8b8d10029.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:4568:64e8:b8d1:29] helo=Maecks.lan)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nbpJO-00035V-E2; Tue, 05 Apr 2022 21:57:58 +0200
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 00/14] MediaTek SoC flow offload improvements + wireless
 support
Date: Tue,  5 Apr 2022 21:57:41 +0200
Message-Id: <20220405195755.10817-1-nbd@nbd.name>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_125801_985385_B3A8BEEC 
X-CRM114-Status: GOOD (  12.27  )
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

This series contains the following improvements to mediatek ethernet flow
offload support:

- support dma-coherent on ethernet to improve performance
- add ipv6 offload support
- rework hardware flow table entry handling to improve dealing with hash
  collisions and competing flows
- support creating offload entries from user space
- support creating offload entries with just source/destination mac address,
  vlan and output device information
- add driver changes for supporting the Wireless Ethernet Dispatch core,
  which can be used to offload flows from ethernet to MT7915 PCIe WLAN
  devices

Changes in v2:
- add missing dt-bindings patches

David Bentham (1):
  net: ethernet: mtk_eth_soc: add ipv6 flow offload support

Felix Fietkau (10):
  net: ethernet: mtk_eth_soc: add support for coherent DMA
  arm64: dts: mediatek: mt7622: add support for coherent DMA
  net: ethernet: mtk_eth_soc: add support for Wireless Ethernet Dispatch
    (WED)
  net: ethernet: mtk_eth_soc: implement flow offloading to WED devices
  arm64: dts: mediatek: mt7622: introduce nodes for Wireless Ethernet
    Dispatch
  net: ethernet: mtk_eth_soc: support TC_SETUP_BLOCK for PPE offload
  net: ethernet: mtk_eth_soc: allocate struct mtk_ppe separately
  net: ethernet: mtk_eth_soc: rework hardware flow table management
  net: ethernet: mtk_eth_soc: remove bridge flow offload type entry
    support
  net: ethernet: mtk_eth_soc: support creating mac address based offload
    entries

Lorenzo Bianconi (3):
  dt-bindings: net: mediatek: add optional properties for the SoC
    ethernet core
  dt-bindings: arm: mediatek: document WED binding for MT7622
  dt-bindings: arm: mediatek: document the pcie mirror node on MT7622

 .../mediatek/mediatek,mt7622-pcie-mirror.yaml |  42 +
 .../arm/mediatek/mediatek,mt7622-wed.yaml     |  50 +
 .../devicetree/bindings/net/mediatek-net.txt  |  10 +
 arch/arm64/boot/dts/mediatek/mt7622.dtsi      |  32 +-
 drivers/net/ethernet/mediatek/Kconfig         |   4 +
 drivers/net/ethernet/mediatek/Makefile        |   5 +
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   | 131 ++-
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   |  14 +-
 drivers/net/ethernet/mediatek/mtk_ppe.c       | 368 +++++++-
 drivers/net/ethernet/mediatek/mtk_ppe.h       |  89 +-
 .../net/ethernet/mediatek/mtk_ppe_debugfs.c   |   1 -
 .../net/ethernet/mediatek/mtk_ppe_offload.c   | 189 +++-
 drivers/net/ethernet/mediatek/mtk_wed.c       | 875 ++++++++++++++++++
 drivers/net/ethernet/mediatek/mtk_wed.h       | 135 +++
 .../net/ethernet/mediatek/mtk_wed_debugfs.c   | 175 ++++
 drivers/net/ethernet/mediatek/mtk_wed_ops.c   |   8 +
 drivers/net/ethernet/mediatek/mtk_wed_regs.h  | 251 +++++
 include/linux/netdevice.h                     |   7 +
 include/linux/soc/mediatek/mtk_wed.h          | 131 +++
 net/core/dev.c                                |   4 +
 20 files changed, 2396 insertions(+), 125 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pcie-mirror.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
 create mode 100644 drivers/net/ethernet/mediatek/mtk_wed.c
 create mode 100644 drivers/net/ethernet/mediatek/mtk_wed.h
 create mode 100644 drivers/net/ethernet/mediatek/mtk_wed_debugfs.c
 create mode 100644 drivers/net/ethernet/mediatek/mtk_wed_ops.c
 create mode 100644 drivers/net/ethernet/mediatek/mtk_wed_regs.h
 create mode 100644 include/linux/soc/mediatek/mtk_wed.h

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
