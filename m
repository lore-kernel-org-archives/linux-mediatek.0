Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3FBECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 10:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c1/sJkTKfN+ZwzPsN0QwbKLrGlK6wceKai71DaOy5dE=; b=tx0pWJOK4iMEsS4Q4lybL92ZjD
	1bQ3s4NttmnAWsTFpw+Eai1D/idUqhK5zsdiDxbWEc0nAc3JpwqkoTKSpKfF0Xz2Uqd5btFlgrJMb
	ors1KlS+i6t1zlrOwg6YHAMJxVZsez10aNHQpy34WKRv0+1SyJQgfCwWb1L3cSKYB4fogQegmGwqT
	V9cIjGbnWX79BHu8ymk/EMbhGjGzz6IhU2wnp8w2cceNNH6OBozJ4MMX8xIVjcZaLfuwMAfHstz/0
	E9P3UmJFSUSwvIa+QlaniBfl24NfPSe6Em9f4CR/nZ96bKk5HeNXpFp05mRABkNpV9C0xbGnWKP8v
	lar/vC+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaaEf-002p7s-C3; Tue, 20 Sep 2022 10:12:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaaET-002p0l-B7
	for linux-mediatek@lists.infradead.org; Tue, 20 Sep 2022 10:12:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0149461EB7;
	Tue, 20 Sep 2022 10:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F9C6C433C1;
	Tue, 20 Sep 2022 10:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663668713;
	bh=4gPkczGymKJaBF3DT++ttgjn8GG9PYQ7gXbLGMUwnF4=;
	h=From:To:Cc:Subject:Date:From;
	b=DilD3foYhtlg4fZYnqnF2nAOmLab62/u4XFXSB31t8l+W6+L0ygIT+omw78oAXv0M
	 Y9tXb7t56CHiemXym717EgmDKP/rgdGUkzWm74Th68IWd4fUGNg22/jRS+nAn0CfxH
	 Aq8JEFokpk/Gfahw0I4/QP0uD/z1oLef2AMSx2/aGcio1pmaYCCk64gQJE0mFnnGC8
	 TZ42/gdraBOJs5kZPA7f/l75/b7Q1OJZ9ofoVv//mRghePgirSdWci0ixeZHRYkrMA
	 +wDCyVykejuBO2LQhMpE1kWb2GcgcL6mh2MNKcbcdT4sDaIU/Gn4YjJm9a/xft675F
	 l6g5fkctzSFYw==
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
Subject: [PATCH v3 net-next 00/11] Add WED support for MT7986 chipset
Date: Tue, 20 Sep 2022 12:11:12 +0200
Message-Id: <cover.1663668203.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_031208_770201_4EBF3F1D 
X-CRM114-Status: GOOD (  12.83  )
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

Changes since v2:
- fix build warnings in patch 9/11

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
 drivers/net/ethernet/mediatek/mtk_ppe.c       | 302 ++++++-----
 drivers/net/ethernet/mediatek/mtk_ppe.h       |  67 ++-
 .../net/ethernet/mediatek/mtk_ppe_debugfs.c   |  10 +-
 .../net/ethernet/mediatek/mtk_ppe_offload.c   |  62 ++-
 drivers/net/ethernet/mediatek/mtk_ppe_regs.h  |   8 +
 drivers/net/ethernet/mediatek/mtk_wed.c       | 479 ++++++++++++++----
 drivers/net/ethernet/mediatek/mtk_wed.h       |   8 +-
 .../net/ethernet/mediatek/mtk_wed_debugfs.c   |   3 +
 drivers/net/ethernet/mediatek/mtk_wed_regs.h  |  89 +++-
 include/linux/soc/mediatek/mtk_wed.h          |  19 +-
 16 files changed, 1020 insertions(+), 313 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wed-pcie.yaml

-- 
2.37.3


