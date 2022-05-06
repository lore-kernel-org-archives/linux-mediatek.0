Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675BBC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 12:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E6iTyCkPG3cT9prWtK2DV8PyLWzbhOHCSQfq14vpOG8=; b=WxhdPz4ZaYoACM
	z8LD4TpLpZB65qVTH+Et07UW3FPEQ2x04D/Nv7RZByx1XdkdI5Q53nbg71rGR+DaCUbCBngQU21vA
	gygapdDraOIqQ+y5YmDUDQTQ4G6syPj1nPWemAY8m/noh6ybMMw5WAb3iqLrpTmaoQhUTGkOFHxEw
	waaA3YJ2onis+gsL67GtUC5cG9/3fdV29fzGgteVOA8EerDXFvcB5CBBguTvb5xMrcswiHnLh4E1P
	bJGGuTlBS0xCUgJPGSAv2eIAUO7cEDJb9SV3mYNTqFfebO19A6+AJtHHcOsPmtdAE/ObXXG1Z9Zt8
	pFA/V8fiKBJTXtc1MZCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmx76-003B6y-Ar; Fri, 06 May 2022 12:31:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmx72-003B58-Qw
 for linux-mediatek@lists.infradead.org; Fri, 06 May 2022 12:31:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 54623B8350D;
 Fri,  6 May 2022 12:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70896C385A9;
 Fri,  6 May 2022 12:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651840269;
 bh=NSQul1ApfnaW8wAQvzVcEwm5XDcRG4fs6JzoouRHRGc=;
 h=From:To:Cc:Subject:Date:From;
 b=JqVzKtWfh0ng6B0sSUND0n5XITQRVG47gHgY7/Gus6dmGClyshCPiTZh+exmgBaZR
 mPcUjXhj3wmOlhZJE0IBxYjGc5hE6q7i1RludB1oJJGm1zTPY9srOAEeVCbUTzS78Z
 LaaC/zA69QuagZ/2aaa1Wyao98CsZoKCzHsVzwZ1YZV5izKIha+NvXp/eOlKyMSJ00
 rG29hF0ArMvneTm944ciawWhV0lp/1uqdvZG4+s/PDypeb0EL1xCsTuc2mlkBEUwMU
 HEamlqrMkHgYlS47JqRLgOFR6LVIDh8OBvLxRA+EP84TqIe7x2cYqA05aVflN+/syC
 Vgky2ToaV10zg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org
Subject: [PATCH net-next 00/14] introduce mt7986 ethernet support
Date: Fri,  6 May 2022 14:30:17 +0200
Message-Id: <cover.1651839494.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_053113_048582_04CBD9E4 
X-CRM114-Status: UNSURE (   6.90  )
X-CRM114-Notice: Please train this message.
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

Add support for mt7986-eth driver available on mt7986 soc.

Lorenzo Bianconi (14):
  arm64: dts: mediatek: mt7986: introduce ethernet nodes
  dt-bindings: net: mediatek,net: add mt7986-eth binding
  net: ethernet: mtk_eth_soc: move tx dma desc configuration in
    mtk_tx_set_dma_desc
  net: ethernet: mtk_eth_soc: add txd_size to mtk_soc_data
  net: ethernet: mtk_eth_soc: rely on txd_size in
    mtk_tx_alloc/mtk_tx_clean
  net: ethernet: mtk_eth_soc: rely on txd_size in mtk_desc_to_tx_buf
  net: ethernet: mtk_eth_soc: rely on txd_size in txd_to_idx
  net: ethernet: mtk_eth_soc: add rxd_size to mtk_soc_data
  net: ethernet: mtk_eth_soc: rely on txd_size field in
    mtk_poll_tx/mtk_poll_rx
  net: ethernet: mtk_eth_soc: rely on rxd_size field in
    mtk_rx_alloc/mtk_rx_clean
  net: ethernet: mtk_eth_soc: add SRAM soc capability
  net: ethernet: mtk_eth_soc: introduce device register map
  net: ethernet: mtk_eth_soc: introduce MTK_NETSYS_V2 support
  net: ethernet: mtk_eth_soc: introduce support for mt7986 chipset

 .../devicetree/bindings/net/mediatek,net.yaml | 133 +++-
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts  |  95 +++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  39 +
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts  |  91 +++
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   | 727 +++++++++++++-----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   | 327 ++++++--
 6 files changed, 1146 insertions(+), 266 deletions(-)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
