Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BD7C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6cmUVc69zNPHwaLLtoLSFSk2LCFjFPyy6EAR13vuGkY=; b=YWwvgR+Hgm1ong8et0hOS77A55
	8Uy8VixU1oUBhpGxVl0brZ5DvE22FKNLsGw3j+9zfhzen+ZxrQecfC+4QjHRyKF7aca+I5HegJWOH
	rvPsnKQRtHN5IIOMRWoCKSGWQnKs2U0tGL9ocbz5G+tsv5PMvVGlZYvXn9bEfku/dylvPPdsaFjyN
	zyWKf7fFObvBOuJCabVStFsl0wCkXryOLuxfg8EddvRaIcg+W0lxGPxsiUP677AdAqhSruYQqWaMb
	TpG+IcXlGwRgUFugDzLUfXt0bInmt+axCspwzsiWgObRmUlY4aCVmkgTK618PFZPWL+llFP0Wms2z
	X9W/Gc7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peIqW-009tvD-1k;
	Mon, 20 Mar 2023 16:58:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peIqU-009ttj-1a
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Mar 2023 16:58:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BE0F561700;
	Mon, 20 Mar 2023 16:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18A6C433EF;
	Mon, 20 Mar 2023 16:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679331530;
	bh=Y6Q/iyRpxsM6GbYW4pCc03xs1NL2o4Kl7pnVJaab2SE=;
	h=From:To:Cc:Subject:Date:From;
	b=AklPzVp74sE6Evcat2CmPbGAuFhktDsu2dFYccO1BOxaF+kQdtbGn+d/yN/Hjxl0S
	 b9oGXFuHfFXO0wYRA6vw7jSGCpQ0+yVWXTl/XYgVmQ0Hl2cgpwl/Li8QU/KA75nURo
	 YHExw7t8JBj83eS8n6IxexP4zyemYJz6Gs1t5ONFeO4p9cSRIv6N6jtTDWbry7rueB
	 mhZi+6m68Z48JIPGtn5WU0cp0iRqYiEjXL5esWcr4M7IhzQs2psE40Dn9noA0qB78I
	 u3+nu/RPy7JfybbZsoTJJ2rXQuvvyZACKeU/mkyjF3elAtY+VuDl1mZhy54Be95Lr8
	 sSnYun4lpylAQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	lorenzo.bianconi@redhat.com,
	daniel@makrotopia.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH net-next 00/10] mtk: wed: move cpuboot, ilm and dlm in dedicated dts nodes
Date: Mon, 20 Mar 2023 17:57:54 +0100
Message-Id: <cover.1679330630.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_095854_586553_AA7BF496 
X-CRM114-Status: UNSURE (   8.79  )
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

Since cpuboot, ilm and dlm memory region are not part of MT7986 SoC RAM,
move them in dedicated mt7986a syscon dts nodes.
This series helps to keep backward-compatibility with older version of uboot
codebase where we have a limit of 8 reserved-memory dts child nodes.
At the same time we keep backward-compatibility with older dts version where
cpuboot, ilm and dlm were defined as reserved-memory child nodes.

Lorenzo Bianconi (10):
  net: ethernet: mtk_wed: rename mtk_wed_get_memory_region in
    mtk_wed_get_reserved_memory_region
  net: ethernet: mtk_wed: move cpuboot in a dedicated dts node
  dt-bindings: soc: mediatek: move cpuboot in a dedicated dts node
  arm64: dts: mt7986: move cpuboot in a dedicated node
  net: ethernet: mtk_wed: move ilm a dedicated dts node
  dt-bindings: soc: mediatek: move ilm in a dedicated dts node
  arm64: dts: mt7986: move ilm in a dedicated node
  net: ethernet: mtk_wed: move dlm a dedicated dts node
  dt-bindings: soc: mediatek: move dlm in a dedicated dts node
  arm64: dts: mt7986: move dlm in a dedicated node

 .../arm/mediatek/mediatek,mt7622-wed.yaml     | 30 ++++---
 .../mediatek/mediatek,mt7986-wo-cpuboot.yaml  | 45 ++++++++++
 .../soc/mediatek/mediatek,mt7986-wo-dlm.yaml  | 46 ++++++++++
 .../soc/mediatek/mediatek,mt7986-wo-ilm.yaml  | 45 ++++++++++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     | 69 +++++++-------
 drivers/net/ethernet/mediatek/mtk_wed.c       | 19 ++++
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c   | 89 ++++++++++++++++---
 drivers/net/ethernet/mediatek/mtk_wed_wo.h    |  3 +-
 8 files changed, 289 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-cpuboot.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-dlm.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-ilm.yaml

-- 
2.39.2


