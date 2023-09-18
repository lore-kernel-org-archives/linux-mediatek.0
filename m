Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A408CD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 10:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6hCxQQq4HpPN8DvRNqsUKKmTW+Lng2qL9GpBgdzgLNU=; b=tyKuQgkTYP7msVcfcgwAfu+SKv
	kubsdVp0OUun/W58wG6ilg6r9W8iUc0zDGYaoMGs9QT4rD2KyRfUaRpjwI96vDNxZCh7kWQDLL6zU
	/Xw5aeWscjPWwdS5ydiSAp0doWk2cZiA+ZA/iMAzLKad/7UC9iJ7n774mVZ6Odn5pYVBvCqQfiJPV
	PLYZRBg8MD1q22EFrSxmF99BxX/MoFYNcyrUaXYLg6//dvv34O9raiRwSt5ryfZKaQIU1Y+xglsRf
	DW8qPnGP0sljqXS3UBOxHX5pcjM0R6x/Zb7ERU1El/WUNTENj1g9u9k7aknNYcPBFiKj0KzBjCPl+
	fMsHtadw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBVz-00F7lw-0z;
	Mon, 18 Sep 2023 10:30:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBVv-00F7go-24
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 10:30:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 98211CE0B74;
	Mon, 18 Sep 2023 10:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F6CC433C8;
	Mon, 18 Sep 2023 10:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695032993;
	bh=g60gI4xhtjsT6YwgP3vmxbN65nqJ+g/9M7lfzuwDok8=;
	h=From:To:Cc:Subject:Date:From;
	b=QUC/PoqcQsEo9picGWT0JFvdo4BdCeaqcm8PI4spneVGRRSXZ3KSp0JiOqd5F0auQ
	 OP/e6YWg7nvOvHjcmKDROY4Lj+LcfJ1E85N+8mAQw1LCIqrW7yXQGJbU8pe49xrCxR
	 GAXbgd5haCQTTLr9o+8IEdfsHnL64DGfdLZ0Rudkjar6DZqJ8Wr9heXlp/I6k7Y3LL
	 WtBC8rmpcd9VN+fLnehdfBHRK03+Je2pKyTzRj6rzUcoFf8GDwDj0vKFsM6tKfu1Pv
	 tGwzTSXYrQjGUigmfn/Xp0nlWIyP54EISavWVH1ywuy12edR5p9FIYi+PfWacx4jWJ
	 uK2TCCH38zeBw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: lorenzo.bianconi@redhat.com,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	daniel@makrotopia.org,
	linux-mediatek@lists.infradead.org,
	sujuan.chen@mediatek.com,
	horms@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 net-next 00/17] Add WED support for MT7988 chipset
Date: Mon, 18 Sep 2023 12:29:02 +0200
Message-ID: <cover.1695032290.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_033000_032711_90045B30 
X-CRM114-Status: UNSURE (   9.99  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Similar to MT7622 and MT7986, introduce Wireless Ethernet Dispatcher (WED)
support for MT7988 chipset in order to offload to the hw packet engine traffic
received from LAN/WAN device to WLAN nic (MT7996E).
Add WED RX support in order to offload traffic received by WLAN nic to the
wired interfaces (LAN/WAN).

Changes since v1:
- introduce mtk_wed_soc_data data structure to contain per-SoC definitions
- get rid of buf pointer in mtk_wed_hwrro_buffer_alloc()
- rebase on top of net-next

Lorenzo Bianconi (12):
  dt-bindings: soc: mediatek: mt7986-wo-ccif: add binding for MT7988 SoC
  dt-bindings: arm: mediatek: mt7622-wed: add WED binding for MT7988 SoC
  net: ethernet: mtk_wed: introduce versioning utility routines
  net: ethernet: mtk_wed: do not configure rx offload if not supported
  net: ethernet: mtk_wed: rename mtk_rxbm_desc in mtk_wed_bm_desc
  net: ethernet: mtk_wed: introduce mtk_wed_buf structure
  net: ethernet: mtk_wed: move mem_region array out of
    mtk_wed_mcu_load_firmware
  net: ethernet: mtk_wed: make memory region optional
  net: ethernet: mtk_wed: fix EXT_INT_STATUS_RX_FBUF definitions for
    MT7986 SoC
  net: ethernet: mtk_wed: add mtk_wed_soc_data structure
  net: ethernet: mtk_wed: refactor mtk_wed_check_wfdma_rx_fill routine
  net: ethernet: mtk_wed: debugfs: move wed_v2 specific regs out of regs
    array

Sujuan Chen (5):
  net: ethernet: mtk_wed: introduce WED support for MT7988
  net: ethernet: mtk_wed: introduce partial AMSDU offload support for
    MT7988
  net: ethernet: mtk_wed: introduce hw_rro support for MT7988
  net: ethernet: mtk_wed: debugfs: add WED 3.0 debugfs entries
  net: ethernet: mtk_wed: add wed 3.0 reset support

 .../arm/mediatek/mediatek,mt7622-wed.yaml     |    1 +
 .../soc/mediatek/mediatek,mt7986-wo-ccif.yaml |    1 +
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   |    1 +
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   |    2 +-
 drivers/net/ethernet/mediatek/mtk_ppe.c       |    4 +-
 drivers/net/ethernet/mediatek/mtk_ppe.h       |   19 +-
 .../net/ethernet/mediatek/mtk_ppe_offload.c   |    6 +-
 drivers/net/ethernet/mediatek/mtk_wed.c       | 1400 ++++++++++++++---
 drivers/net/ethernet/mediatek/mtk_wed.h       |   57 +
 .../net/ethernet/mediatek/mtk_wed_debugfs.c   |  400 ++++-
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c   |   95 +-
 drivers/net/ethernet/mediatek/mtk_wed_regs.h  |  369 ++++-
 drivers/net/ethernet/mediatek/mtk_wed_wo.h    |    3 +-
 .../net/wireless/mediatek/mt76/mt7915/mmio.c  |    2 +-
 include/linux/netdevice.h                     |    1 +
 include/linux/soc/mediatek/mtk_wed.h          |   76 +-
 16 files changed, 2109 insertions(+), 328 deletions(-)

-- 
2.41.0


