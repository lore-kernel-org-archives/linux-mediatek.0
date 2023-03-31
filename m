Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E501C76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 13:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4NP01s4yFld96qO/K0OxO4OkHRyI5z1oJBfFENZm38w=; b=W71OMpMG3CvErGfWKbUfJf+8h8
	8skiTy00VP1AJwT7C2U3O4G28fq7ppuxCTHwCAGA2TD8VmKhmL+TwPqqeBgc11LHaah6FOJ0WEaV4
	h7dDYD2SHzs3CLu/wj+Ks1tXie3wAzJ+G8xrr2n++rGbeucGnaGFDI1+Jtgu84yOtvvJ/Xu/rtkej
	MOWt0GviMZq7TcT1C+16OYykLP4t7weTCbzCDjeLnuCGr0uLU/oUco8Y0ydV1A0M/bSwXKyhNGa17
	nx43vCV9eMD99Yxp//yCkcs8041oWeQ/CVrH4AlkbEd3m88ioiurlU3QY0e4kuhlsZkWG93MxVW7N
	0ZX5w+nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piEZR-007URS-0H;
	Fri, 31 Mar 2023 13:13:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piEZN-007UQl-35
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 13:13:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B44A362904;
	Fri, 31 Mar 2023 13:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E90FC433D2;
	Fri, 31 Mar 2023 13:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680268408;
	bh=J0jYdD4GFbRNZgMq6swXWLS5Vv9lQ1S0Ja+zV3iG0pk=;
	h=From:To:Cc:Subject:Date:From;
	b=UYmcVABExLetFpnwTrefBjodSMN54HPtHQto4VdrAb1+3ykXSCDg9XYjwkFA2NUGH
	 1xiMdkY5q0lt3NP3MaUk9WET8c1LJb3RkrAbaAKrzRucCzxUKG+PIRF+GM03lvJf7N
	 FN2S2nM1kgKL2ApO0z2bkjvpGLTRjdU3MdYFV1ZtcM7HaZ0Tfiqgwgb9hZvWGQDmEc
	 8H/wrHW1nJZzvH5pSqDX5V4ZnXmt92K4FxpmXMkQdG9Re6rmcLb6dKc6T6/QNpvpce
	 4I71mzdjvuC38rcVV47G4PZXEuXaW7ZJJh0nLXV+MfAuKdKeKSDgIXzI0AZyO9c91k
	 reMa0OKh6ITzw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	kuba@kernel.org,
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
Subject: [PATCH v2 net-next 00/10] mtk: wed: move cpuboot, ilm and dlm in dedicated dts nodes
Date: Fri, 31 Mar 2023 15:12:36 +0200
Message-Id: <cover.1680268101.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_061330_053597_27962861 
X-CRM114-Status: UNSURE (   8.32  )
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
At the same time we keep backward-compatibility with older dts version where
cpuboot, ilm and dlm were defined as reserved-memory child nodes.

Changes since v1:
- fix dts schema compilation error
- rebase on top of net-next

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


