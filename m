Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91715C41513
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 00:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GiRsZQ5dG6mfcGn+pLRJAZ3Ylsvfh7YDf+U40XTshMc=; b=yMN5DYYwra99rAwQ2aZVgQuvUH
	Dej0MMpmH/BqErqtr/okemp6lDtyDqAZaLp52/VS7O+JmV8PcNd5uTI84nBZjx2/y+PCfxGLTugbP
	jslKeo7fpMXsRCaJRzpmBC/pPyr8tdg11kIgW8CYGQlV1WwIEYrQmxonc/mX8U3YPYUNUa9VLMK7o
	zi/gGK/FsszDNhK9Eql+UT8wbzprWAOIN1kOWxs65usb3mDfSxkyFJbiA6xaupNIwGl4tna/uMxoN
	UOrt7FVW0Yk+2BjXVEqeUD8I5Y0A2VNIQ7azPgQktnKaG+NHNSPdZWDi1ReKFWiTPk6qGh6zR+2Zn
	+mVT4/Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO6H9-005m06-1h;
	Tue, 25 Jul 2023 00:51:43 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO6H6-005lyR-1w;
	Tue, 25 Jul 2023 00:51:42 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qO6Ga-0004SA-10;
	Tue, 25 Jul 2023 00:51:08 +0000
Date: Tue, 25 Jul 2023 01:51:00 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Greg Ungerer <gerg@kernel.org>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v6 0/8] net: ethernet: mtk_eth_soc: add basic
 support for MT7988 SoC
Message-ID: <cover.1690246066.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_175140_640548_3DFC708A 
X-CRM114-Status: GOOD (  14.58  )
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

The MediaTek MT7988 SoC introduces a new version (3) of the NETSYS
block and comes with three instead of two MACs.

The first MAC can be internally connected to a built-in Gigabit
Ethernet switch with four 1000M/100M/10M twisted pair user ports.

The second MAC can be internally connected to a built-in 2500Base-T
Ethernet PHY.

There are two SerDes units which can be operated in USXGMII, 10GBase-(K)R,
5GBase-R, 2500Base-X, 1000Base-X or SGMII interface mode.

This series adds initial support for NETSYS v3 and the first MAC of the
MT7988 SoC connecting the built-in DSA switch.

The switch is supported since commit 110c18bfed414 ("net: dsa: mt7530:
introduce driver for MT7988 built-in switch").

Basic support for the 1000M/100M/10M built-in PHYs connected to the
switch ports is present since commit ("98c485eaf509b net: phy: add
driver for MediaTek SoC built-in GE PHYs").

Changes since v5:
  * Rebase again on current net-next tree

Changes since v4:
  * Rebase on current net-next tree

Changes since v3:
  * Set 'mediatek,infracfg = false;' in dt-bindings for those chips
    which do not require infracfg phandle.

Changes since v2:
  * Use version number instead of feature bits for NETSYS version
  * Remove unneeded check for NULL when calling mtk_pcs_lynxi_destroy
  * Reduce dt-bindings to what is actually needed at this point for
    the driver to work.

Daniel Golle (3):
  dt-bindings: net: mediatek,net: add missing mediatek,mt7621-eth
  dt-bindings: net: mediatek,net: add mt7988-eth binding
  net: ethernet: mtk_eth_soc: convert clock bitmap to u64

Lorenzo Bianconi (5):
  net: ethernet: mtk_eth_soc: add version in mtk_soc_data
  net: ethernet: mtk_eth_soc: increase MAX_DEVS to 3
  net: ethernet: mtk_eth_soc: rely on MTK_MAX_DEVS and remove
    MTK_MAC_COUNT
  net: ethernet: mtk_eth_soc: add NETSYS_V3 version support
  net: ethernet: mtk_eth_soc: convert caps in mtk_soc_data struct to u64

 .../devicetree/bindings/net/mediatek,net.yaml | 109 +++++++-
 drivers/net/ethernet/mediatek/mtk_eth_path.c  |  22 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   | 205 +++++++++------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   | 241 ++++++++++--------
 drivers/net/ethernet/mediatek/mtk_ppe.c       |  18 +-
 .../net/ethernet/mediatek/mtk_ppe_offload.c   |   2 +-
 drivers/net/ethernet/mediatek/mtk_wed.c       |   4 +-
 7 files changed, 399 insertions(+), 202 deletions(-)

-- 
2.41.0

