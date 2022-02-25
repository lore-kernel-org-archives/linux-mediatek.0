Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206D6C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 10:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DXmuWJ9wVf9r1txm6wtVLGrq0vv3FibbIMvB5zOjru4=; b=sB6z49OHW/U4FT
	Do3ToG4NjVQE0ysdqZyk8cf3TB8/ainEZCn3wqT3Z3JWmYYCVxWEdwUZH4rjH+DGBk9pmWT7YYAjc
	e9ElJHBnsz6VUVh9159ELZhtetoCHVo6opkkwqmu1tZOw5N5Bqo6tIZk5qglTDD8HVvDD6ubYSOQN
	CWChf7DP8iLkYyruxyXLVzDabw1efZAElQ7PG5gnJrG7KWcoARzJYES1ru7KcOugOt9rcJYXeu8H+
	SPIlphlEUlr8hD5B3bYopDHtu66BcNKxTTJMLRfHsQFl+SpLGWvqwVwUpoWZ2+i2F79/zLf4H2rpa
	/lR3/6PE9Y8uLBvgV4bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNXh1-004JwC-BE; Fri, 25 Feb 2022 10:19:19 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNXg2-004JUa-Fr; Fri, 25 Feb 2022 10:18:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=77a3jqevgZL1+oiS2NRmN4fBD0B+EDHsJf10YO0s0GM=; b=bsxsLDV5B1Hpj+pnD6DoqpUM5g
 IZivvUT8/s1GkQ/Aq5JvqbLqQQwAZpt+mGhcaoiTtjV4JV7W3uubc+duEQHx1ZPzdiMagA7aZEaa2
 cyjHAM8AS9/8BQI4+aSrHUcVs1z6r30xutkGGVdK3/oZMli9estX8Tvn0vGAj2j6tlbc=;
Received: from p200300daa7204f00f847964d075b2b3d.dip0.t-ipconnect.de
 ([2003:da:a720:4f00:f847:964d:75b:2b3d] helo=localhost.localdomain)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nNXfw-0007J1-Lh; Fri, 25 Feb 2022 11:18:12 +0100
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 00/11] MediaTek SoC flow offload improvements + wireless
 support
Date: Fri, 25 Feb 2022 11:17:59 +0100
Message-Id: <20220225101811.72103-1-nbd@nbd.name>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_021818_823261_DEF51DBC 
X-CRM114-Status: GOOD (  10.93  )
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
 17 files changed, 2294 insertions(+), 125 deletions(-)
 create mode 100644 drivers/net/ethernet/mediatek/mtk_wed.c
 create mode 100644 drivers/net/ethernet/mediatek/mtk_wed.h
 create mode 100644 drivers/net/ethernet/mediatek/mtk_wed_debugfs.c
 create mode 100644 drivers/net/ethernet/mediatek/mtk_wed_ops.c
 create mode 100644 drivers/net/ethernet/mediatek/mtk_wed_regs.h
 create mode 100644 include/linux/soc/mediatek/mtk_wed.h

-- 
2.32.0 (Apple Git-132)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
