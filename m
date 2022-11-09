Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20644C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 16:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ry0LiQkgLqFgiobQwxhHIk2hWl8ItdmdnahI42NGz3o=; b=XEZz4TzMfNrZzmQiJL3+kCbwj5
	Tq/jzohTxYdz6GR3bI1MA/xZnY/PgAzmzj50BIJOOJ2OCHsBeUpjY15un0Vt/nOuBIVlaHGlEbbTU
	aT8eQl7uACwFFb2dStWKfaGIFiLvqP7lZ+QnpSCtY8ByuakmBXiBLhuABubaNscklmwmkZU/d5txo
	Bl0xkeXZUWUjJutSYsaaFzuUr1SvbaFsQksC2jgQU1nW5gCM0RAg8mYaPbiHhmkt7PgD45Wrfw+Vq
	/+zhsDaNCO7XG5nuZlPcL/8m6zU6CuZuqHKz6L5eV86ns9z+oGfokiDY0lBSHUyHEkRkaPVAlQunP
	5fupINvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oso2N-00F3Mm-IU; Wed, 09 Nov 2022 16:34:51 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oso2B-00F3I9-Pn; Wed, 09 Nov 2022 16:34:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Ry0LiQkgLqFgiobQwxhHIk2hWl8ItdmdnahI42NGz3o=; b=Byq9ghx5QT7+xx/Y74GDgxSCza
	tE43ecm/v+1sajlmzjb0V4ESFuzkj/eHCB0C3Z3H1wwvX5EsYHBJAiFQaloXz0GT/gA3loTcc2jDc
	A6Y3K1AASzF88q8ziHQ38BUGhlFWhJhVq0BGS/U9iUYgNrrUcCwwTyMnDSaV5J0WWLIQ=;
Received: from p200300daa72ee100054f3c61b16ef6e7.dip0.t-ipconnect.de ([2003:da:a72e:e100:54f:3c61:b16e:f6e7] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1oso22-000l4N-Cr; Wed, 09 Nov 2022 17:34:30 +0100
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v2 00/12] Multiqueue + DSA untag support + fixes for mtk_eth_soc
Date: Wed,  9 Nov 2022 17:34:14 +0100
Message-Id: <20221109163426.76164-1-nbd@nbd.name>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_083439_937837_29D10287 
X-CRM114-Status: GOOD (  11.76  )
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

This series contains multiple improvements for mtk_eth_soc:

On devices with QDMA (MT7621 and newer), multiqueue support is implemented
by using the SoC's traffic shaper function, which sits on the DMA engine.
The driver exposes traffic shaper queues as network stack queues and configures
them to the link speed limit. This fixes an issue where traffic to slower ports
would drown out traffic to faster ports. It also fixes packet drops and jitter
when running hardware offloaded traffic alongside traffic from the CPU.

On MT7622, the DSA tag for MT753x switches can be untagged by the DMA engine,
which removes the need for header mangling in the DSA tag driver.

This is implemented by letting DSA skip the tag receive function, if the port
is passed via metadata dst type METADATA_HW_PORT_MUX

Also part of this series are a number of fixes to TSO/SG support

Changes in v2:
- drop the use of skb vlan tags to pass the port information to the tag driver,
  use metadata_dst instead
- fix a small issue in enabling untag

Felix Fietkau (12):
  net: ethernet: mtk_eth_soc: account for vlan in rx header length
  net: ethernet: mtk_eth_soc: increase tx ring side for QDMA devices
  net: ethernet: mtk_eth_soc: avoid port_mg assignment on MT7622 and
    newer
  net: ethernet: mtk_eth_soc: implement multi-queue support for per-port
    queues
  net: dsa: tag_mtk: assign per-port queues
  net: ethernet: mediatek: ppe: assign per-port queues for offloaded
    traffic
  net: ethernet: mtk_eth_soc: compile out netsys v2 code on mt7621
  net: dsa: add support for DSA rx offloading via metadata dst
  net: ethernet: mtk_eth_soc: fix VLAN rx hardware acceleration
  net: ethernet: mtk_eth_soc: work around issue with sending small
    fragments
  net: ethernet: mtk_eth_soc: set NETIF_F_ALL_TSO
  net: ethernet: mtk_eth_soc: drop packets to WDMA if the ring is full

 drivers/net/ethernet/mediatek/mtk_eth_soc.c   | 461 ++++++++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   |  49 +-
 drivers/net/ethernet/mediatek/mtk_ppe.c       |  22 +-
 drivers/net/ethernet/mediatek/mtk_ppe.h       |   4 +
 .../net/ethernet/mediatek/mtk_ppe_offload.c   |  12 +-
 net/core/flow_dissector.c                     |   4 +-
 net/dsa/dsa.c                                 |  18 +-
 net/dsa/tag_mtk.c                             |   2 +
 8 files changed, 469 insertions(+), 103 deletions(-)

-- 
2.38.1


