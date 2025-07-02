Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8290FC7EE30
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jul 2025 02:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hxToIVuCniGIEBG1PZcFVLEC+pBYhl2udG7Rqz25+wk=; b=GuFzSvWiiQ7ecNJSk0lo5+luwk
	NhPnJAlVXSUyGg4Zo1HoyGsgHfYLq6HuPaJBqxm2HiPYytJJd5ZVEItwWAKU4x/pnMO/ygYjfryXy
	fqDviyBxj9EuZGG33APCkfVdj22vJveIHIe6r8WH7FEOqjzfpcc9W7A4CN0n2UwzMaw4NbRpaq8Pb
	ifu8WWzuhH+z4culSJyLjQ3awzILXKmMg/wTK247KKse/ab8cTAl1TAkevKuRAyCr5PIC+YTBYg6W
	d415nONNttDBkIH+kT8nRSc0D4uhVLzYkv1K6Ca0djw1DDKX/c8y9gLVFq0kgbbrBf7nEytlkcYRb
	JjEl9MJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWnTq-000000074sD-2Hg2;
	Wed, 02 Jul 2025 02:45:50 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWnMF-000000073sj-1vIk;
	Wed, 02 Jul 2025 02:38:00 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uWnM0-000000005DE-34JB;
	Wed, 02 Jul 2025 02:37:44 +0000
Date: Wed, 2 Jul 2025 03:37:40 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>,
	Frank Wunderlich <frank-w@public-files.de>,
	Eric Woudstra <ericwouds@gmail.com>, Elad Yifee <eladwf@gmail.com>,
	Bo-Cun Chen <bc-bocun.chen@mediatek.com>,
	Sky Huang <skylake.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v4 0/3] net: ethernet: mtk_eth_soc: improve device
 tree handling
Message-ID: <cover.1751421358.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_193759_497109_20B0E043 
X-CRM114-Status: GOOD (  13.79  )
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

This series further improves the mtk_eth_soc driver in preparation to
complete upstream support for the MediaTek MT7988 SoC family.

Frank Wunderlich's previous attempt to have the ethernet node included
in mt7988a.dtsi and cover support for MT7988 in the device tree bindings
was criticized for the way mtk_eth_soc references SRAM in device tree[1].

Having a 2nd 'reg' property, like introduced by commit ebb1e4f9cf38
("net: ethernet: mtk_eth_soc: add support for in-SoC SRAM") isn't
acceptable and a dedicated "mmio-sram" node should be used instead.

In order to make the code more clean and readable, the existing
hardcoded offsets for the scratch ring, RX and TX rings are dropped in
favor of using the generic allocator. In this way support for the
hard-coded offset and including the SRAM region as part of the
Ethernet's "reg" MMIO space is kept as it will still be required in
order to support existing legacy device trees of the MT7986 SoC family.

While at it also replace confusing error messages when using legacy
device trees without "interrupt-names" with a warning informing users
that they are using a legacy device tree.

[1]: https://patchwork.ozlabs.org/comment/3533543/

Daniel Golle (3):
  net: ethernet: mtk_eth_soc: improve support for named interrupts
  net: ethernet: mtk_eth_soc: fix kernel-doc comment
  net: ethernet: mtk_eth_soc: use generic allocator for SRAM

 drivers/net/ethernet/mediatek/Kconfig       |   1 +
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 155 +++++++++++---------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  11 +-
 3 files changed, 95 insertions(+), 72 deletions(-)

-- 
2.50.0

