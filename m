Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD7AC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 09:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4T3ceWB6j+uy3tYtKQZ1wl1SRf3uGWUi/BHp1Np2wrY=; b=Gip5BEjeh9OYf0rovqMjfG/iTB
	hD5i6hPuHUOVG55EAaL588/JlBGF4PY76aTIdSVrGBZe0eSSyvSWo8ItAw0KEWB2GJaF3xQv7YHxX
	2ZAuF+SToO23BjKKLAw7Nrj6wvlSnojNadqw+TbC+NV3c6AiT/ITFDoWe1MyLaerqm94dfLx3bXiA
	BKNghdvawrM0w7dXMTplYMNBQSHWjLsXAVDuzGBppwl/Lc2xy7BGA0oEEHdx5NCkQOLIloQF8sx0Z
	G66M4ZJnWTRtvkbfD16lLW5+kL6bVipI4Lfx83aCLGw2WuH7nVrhwMHVx1MKfshxKZ/G+naO9TOW+
	R7XnzW+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqWZ3-00GwYl-3x; Thu, 03 Nov 2022 09:31:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqWWe-00Gvb4-EB
	for linux-mediatek@lists.infradead.org; Thu, 03 Nov 2022 09:28:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6708C61D17;
	Thu,  3 Nov 2022 09:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF3CC433C1;
	Thu,  3 Nov 2022 09:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667467718;
	bh=S/F8Xv1K2g426RUX/9UHQYE4rfAx8qVSyI51yE7iV6k=;
	h=From:To:Cc:Subject:Date:From;
	b=SqCSdZcJuEOc4qeMi3Hspx4fiaEzeIqa9FJ++XSyVVNQE/wfiYBqeUjDONbXo7Mqm
	 9FwJdcHUcWsjGditUGL3HKwZhdgkY2X2WdZYxO3bZ7znv8huK232/gFKYb85qtqrkj
	 Nqh/ivuGh2PTfKhSObHehx2nwR0ex3BykLR4nhbwpqE65VepPIDWjQUsj1tPbK0KT8
	 uOIvO1sUT0m5wGqWTNWL5z5wCfdd/4z4XDwY19PBIJQ/6EstUVK23lU66kPthuNSKB
	 ANN+YrH4ZG0p+YKhGlF2qMueWR+unsPjcgvgEu6FfjGGWbt6xAh8pUN8sl06wZBVLt
	 8GC23EdQ6vWVw==
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
	robh+dt@kernel.org,
	daniel@makrotopia.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v3 net-next 0/8] introduce WED RX support to MT7986 SoC
Date: Thu,  3 Nov 2022 10:27:59 +0100
Message-Id: <cover.1667466887.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_022840_628140_A365BD2C 
X-CRM114-Status: GOOD (  11.70  )
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

Similar to TX counterpart available on MT7622 and MT7986, introduce
RX Wireless Ethernet Dispatch available on MT7986 SoC in order to
offload traffic received by wlan nic to the wired interfaces (lan/wan).

Changes since v2:
- rely on of_reserved_mem APIs in mcu code
- add some dts fixes
- rename {tx,rx}_wdma in {rx,tx}_wdma
- update entry in maintainers file

Changes since v1:
- fix sparse warnings
- rely on memory-region property in mt7622-wed.yaml
- some more binding fixes

Lorenzo Bianconi (7):
  arm64: dts: mediatek: mt7986: add support for RX Wireless Ethernet
    Dispatch
  dt-bindings: net: mediatek: add WED RX binding for MT7986 eth driver
  net: ethernet: mtk_wed: introduce wed wo support
  net: ethernet: mtk_wed: rename tx_wdma array in rx_wdma
  net: ethernet: mtk_wed: add configure wed wo support
  net: ethernet: mtk_wed: add rx mib counters
  MAINTAINERS: update MEDIATEK ETHERNET entry

Sujuan Chen (1):
  net: ethernet: mtk_wed: introduce wed mcu support

 .../arm/mediatek/mediatek,mt7622-wed.yaml     |  62 +-
 .../arm/mediatek/mediatek,mt7986-wo-boot.yaml |  47 ++
 .../arm/mediatek/mediatek,mt7986-wo-ccif.yaml |  50 ++
 .../arm/mediatek/mediatek,mt7986-wo-dlm.yaml  |  50 ++
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  75 +++
 drivers/net/ethernet/mediatek/Makefile        |   2 +-
 drivers/net/ethernet/mediatek/mtk_wed.c       | 609 ++++++++++++++++--
 drivers/net/ethernet/mediatek/mtk_wed.h       |  21 +
 .../net/ethernet/mediatek/mtk_wed_debugfs.c   |  87 +++
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c   | 392 +++++++++++
 drivers/net/ethernet/mediatek/mtk_wed_regs.h  | 129 +++-
 drivers/net/ethernet/mediatek/mtk_wed_wo.c    | 508 +++++++++++++++
 drivers/net/ethernet/mediatek/mtk_wed_wo.h    | 284 ++++++++
 include/linux/soc/mediatek/mtk_wed.h          | 106 ++-
 15 files changed, 2366 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml
 create mode 100644 drivers/net/ethernet/mediatek/mtk_wed_mcu.c
 create mode 100644 drivers/net/ethernet/mediatek/mtk_wed_wo.c
 create mode 100644 drivers/net/ethernet/mediatek/mtk_wed_wo.h

-- 
2.38.1


