Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AFCECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 17:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wNseolwChrsFkcnESddv4A1zaR7du4cSp2Hc//LpCMM=; b=IxDF1rL7bPqqtyO2oBny3iBmm1
	po1K+K1qyMTvBAQ0ekaiCSOPCDmLQ3xB+q6VfyhnhhY5Oiq4JMp0LPQtKqdl2YvBLrSY6edqS86ch
	kYZaggsrlEJm4c4WdaL3iUHf1CXx/xWIkzLs+9/898JdhWjjMCfmAOyU7rrtZNTo3QsMSYW3znOw6
	FSSzQZXSLiP/Di8Hep8kUtbiBBFmLsJNxywEuSCowsFjFKxOmDtZB2FDUrOnXkLugy0OzRrIb7WZy
	2ky3D6my8q+zh4YKojV1MHJOXKmdcvopo9CqdXsDknn0MEBxgQ9MqyVq++s2uLxNj23Hzmn7+vMLv
	eCCrnCZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY9I8-00Dig5-8C; Tue, 13 Sep 2022 17:01:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY9I4-00DidV-QM
	for linux-mediatek@lists.infradead.org; Tue, 13 Sep 2022 17:01:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 367B561521;
	Tue, 13 Sep 2022 17:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2F6C43141;
	Tue, 13 Sep 2022 17:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663088500;
	bh=YSN7KrVC6f0TmUoKp3H49EC0rXQ3ViO2eJhR8EljM1A=;
	h=From:To:Cc:Subject:Date:From;
	b=vP5D/vJOX7xz0ayxIILzSvRiaHZb01N5em5Oll0OvmZ+RvaRqr5NGSigY2s4ux59G
	 a/Sxl0Y1dwF3r6yN3DTmsTScYD8NCXu+CMMnfEaIBMKbuPVbWEKazN7h7h8S+6XbeZ
	 czSUGyQ4IEl0aZeyE8wSME+y94fSiIqGgM+CKTIFxn762rmyEi/OXY4ddK1Y+bPHtp
	 3lkCfpb/Ft1ZprBSB2W5xaVcgc6z7ZOKsmRShPgJFBu7mboKlCPy2T8kN7JkRQdWaz
	 M6R+Ys2pXmrYGnYqjz0EArEBzien1+TgLhZ60Uwl+ZrTu71SEO+7BcMIsfQ4mvodoK
	 aPvnxhvLNGK1g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi@redhat.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	ryder.Lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	daniel@makrotopia.org
Subject: [PATCH v2 net-next 00/11] Add WED support for MT7986 chipset
Date: Tue, 13 Sep 2022 19:00:50 +0200
Message-Id: <cover.1663087836.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_100140_968656_8C44E824 
X-CRM114-Status: GOOD (  12.43  )
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

Similar to MT7622, introduce Wireless Ethernet Dispatch (WED) support
for MT7986 chipset in order to offload to the hw packet engine traffic
received from LAN/WAN device to WLAN nic (MT7915E).

Changes since v1:
- drop foe structure in mtk_soc_data structure and fix compilation error
  on ARMv7 (e.g. MT7623)
- add missing dt bindings
- rely on syscon_regmap_lookup_by_phandle to read/write into wed-pcie
  controller

Lorenzo Bianconi (11):
  arm64: dts: mediatek: mt7986: add support for Wireless Ethernet
    Dispatch
  dt-bindings: net: mediatek: add WED binding for MT7986 eth driver
  net: ethernet: mtk_eth_soc: move gdma_to_ppe and ppe_base definitions
    in mtk register map
  net: ethernet: mtk_eth_soc: move ppe table hash offset to mtk_soc_data
    structure
  net: ethernet: mtk_eth_soc: add the capability to run multiple ppe
  net: ethernet: mtk_eth_soc: move wdma_base definitions in mtk register
    map
  net: ethernet: mtk_eth_soc: add foe_entry_size to mtk_eth_soc
  net: ethernet: mtk_eth_wed: add mtk_wed_configure_irq and
    mtk_wed_dma_{enable/disable}
  net: ethernet: mtk_eth_wed: add wed support for mt7986 chipset
  net: ethernet: mtk_eth_wed: add axi bus support
  net: ethernet: mtk_eth_soc: introduce flow offloading support for
    mt7986

 .../arm/mediatek/mediatek,mt7622-wed.yaml     |   1 +
 .../mediatek/mediatek,mt7986-wed-pcie.yaml    |  43 ++
 .../devicetree/bindings/net/mediatek,net.yaml |  27 +-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  24 +
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   |  98 +++-
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   |  93 +++-
 drivers/net/ethernet/mediatek/mtk_ppe.c       | 302 +++++++----
 drivers/net/ethernet/mediatek/mtk_ppe.h       |  67 ++-
 .../net/ethernet/mediatek/mtk_ppe_debugfs.c   |  10 +-
 .../net/ethernet/mediatek/mtk_ppe_offload.c   |  62 ++-
 drivers/net/ethernet/mediatek/mtk_ppe_regs.h  |   8 +
 drivers/net/ethernet/mediatek/mtk_wed.c       | 486 ++++++++++++++----
 drivers/net/ethernet/mediatek/mtk_wed.h       |   8 +-
 .../net/ethernet/mediatek/mtk_wed_debugfs.c   |   3 +
 drivers/net/ethernet/mediatek/mtk_wed_regs.h  |  89 +++-
 include/linux/soc/mediatek/mtk_wed.h          |  19 +-
 16 files changed, 1027 insertions(+), 313 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wed-pcie.yaml

-- 
2.37.3


