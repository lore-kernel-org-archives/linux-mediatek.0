Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105C9C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 22:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=en2tF9VelHIj+TkvKeo+ZmnM8j5icWjtj14byNflA1o=; b=Gth37Tt+x5Vl6qRvwFGUFGz6yv
	MOQGfb+BaWSDx/CiRv5jIfJy1EZNIMq9nrBE2hISwYDxQDd83aEYlx51q1d6LlXCi1HZ0fjLHffUv
	qtmBANbKYzHi8EbMJa3a5TuBVd4LNsDteVoiUwaVeWtZBRacHk8WSRP48mz0QZhKLve4xgMx506LO
	4ZbFXkIXgm8+sI++BqaVAwW7UqtBEJ2ODF4PzoMZotDTb7nuTQrB/1emhEujHncSwx6QM6REEYDKV
	0W8GRgJPKREPr0BbUkMU7ShdAeYvEic7QB/cOI447q1a/aC1JuSLGQnyK9JDS3f1pn1GXwjjkW2pb
	rbMayVQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiMha-00GRgB-2B;
	Mon, 18 Sep 2023 22:26:46 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiMhX-00GRev-0h;
	Mon, 18 Sep 2023 22:26:44 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qiMhA-0002wG-1F;
	Mon, 18 Sep 2023 22:26:20 +0000
Date: Mon, 18 Sep 2023 23:26:01 +0100
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
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v2 0/2] net: ethernet: mtk_eth_soc: add paths and
 SerDes modes
Message-ID: <cover.1695058909.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_152643_257326_3ED84FA7 
X-CRM114-Status: GOOD (  16.97  )
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

The series brings support for SerDes interface modes up to 10 Gb/s for
the MediaTek MT7988 SoC.

As the Ethernet driver now requires a few more phandles in device tree
referencing various other parts of the SoC also add corresponding
dt-binding changes.

It may be argued that instead of referencing those units as syscon and
access them as regmap one may want to implement propper clk or reset
drivers. However, only a single register write is require to the
otherwise completely undocumented pextp_pll unit which will not make a
nice clk driver...

The toprgu/watchdog reset controller is used to synchronously
assert/deassert multiple resets as the same time which is not
supported by Linux reset controller API which always asserts/deasserts
resets sequentially. It is not known whether asserting/deasserting
pextp, sgmii, xfi and usxgii resets simultanously is stricly required
for the hardware to work reliably, however, it's what the vendor
implementation is doing as well and there are no other drivers needing
to access the toprgu reset controller.

This series has been tested with the MT7988 reference board as well as
pre-mass-production BananaPi BPi-R4 board also featuring MT7988.
Various SFP(+) modules have been successfully tested on both boards and
also the on-board AQR133 10GE PHY found on the MT7988 reference board
works nicely.

To make sure no existing older SoCs have been broken run-time tests
have also been carried out on various MT7981, MT7986, MT7622 and
MT7623 boards. The patch is also present in OpenWrt for some months
now already and hence supposedly hundreds of users also on older
MT7621 systems should have tested it while I didn't hear about any
complaints so far.

For the interfaces modes covered by the existing LynxI PCS driver
(Cisco SGMII, 1000Base-X, 2500Base-X) to work on MT7988 this series
depends on commit 90308679c297f ("net: pcs: lynxi: implement pcs_disable op").

Changes since v1:
 * add missing macro defines (v1 didn't build for that reason)
 * add dt-bindings changes

Daniel Golle (2):
  dt-bindings: net: mediatek,net: add phandles for SerDes on MT7988
  net: ethernet: mtk_eth_soc: add paths and SerDes modes for MT7988

 .../devicetree/bindings/net/mediatek,net.yaml |  28 +
 drivers/net/ethernet/mediatek/Kconfig         |  16 +
 drivers/net/ethernet/mediatek/Makefile        |   1 +
 drivers/net/ethernet/mediatek/mtk_eth_path.c  | 123 ++-
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   | 182 ++++-
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   | 237 +++++-
 drivers/net/ethernet/mediatek/mtk_usxgmii.c   | 698 ++++++++++++++++++
 7 files changed, 1254 insertions(+), 31 deletions(-)
 create mode 100644 drivers/net/ethernet/mediatek/mtk_usxgmii.c

-- 
2.42.0

