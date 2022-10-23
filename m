Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C2CECAAA1
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Oct 2022 18:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yc5Yvccuiotv+zv4lCo1XgV5t+N05+/Ku8t6cON3GhM=; b=qrZhx4TpC1otJm4Y+QdNtWtCWX
	Y9ETypD/qJMACHWeJ5Rf6P4evR1pybIdG3rCBVCRwbdQjMpRg8J9VWPOf7xEagLh0gWES9us/AEs8
	s1dAsrhVD06GnUftedb/LnLcQq4wPh2wsNV1FXiCtdX4nYlXr4sY1oaocuXp/eOuDwuTi9jDe2fpx
	aMeid4gK0sV3PswZ1Xon5bVGjB7EGOk1u4Hsz0s5pObVNhgKUzJ4kvl4FiKoqicOjF1s/bIHvlC+p
	zGf6HoERU4tj3gaepEKHy3YrH+gSqSjRvAa/QpsPKHVFpXVBg81/KPIYofboW/76+J0CKUSdDoo6Z
	7aCoEPpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omfi1-00FxEt-AS; Sun, 23 Oct 2022 18:28:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omfhy-00FxCB-2y
	for linux-mediatek@lists.infradead.org; Sun, 23 Oct 2022 18:28:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9F61F60F16;
	Sun, 23 Oct 2022 18:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A1D4C433D6;
	Sun, 23 Oct 2022 18:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666549702;
	bh=wkdAvPA8Pnc0jF12FSsd05dlVyH8gvyil6OYR7WwYcU=;
	h=From:To:Cc:Subject:Date:From;
	b=f0Ds0AHZjDZcVPc3tT6C665O4qlBfFr1PCUOw2anA8I5yQzxi9hzhN5F75we7LfVi
	 ojAyCmPxenQA2aS6KFUPqU4a/UQQbsyWrGTAvAxESFXebRbO6qg2zSkSEitEwWTWKL
	 mlXzPoIilV5Ddxr7lJ6D3WSomaAQmOUMRNVChwZFy50UXtYNm+zVbpwf8Edn2tzqJY
	 ZPMSAuUzmp0aNR1ZL9NcKg4nzD6OFhckGGeeKdRegzKKgffgmr11Z5h2kR4CjU56no
	 /c83ic05+YGC6FmA5pUgfKQ0l4XUbNl1LrH9R+jzU5LcpjFdGGBWoP39luiNb4eC08
	 GT3KMla+apxMA==
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
Subject: [PATCH v2 net-next 0/6] introduce WED RX support to MT7986 SoC
Date: Sun, 23 Oct 2022 20:28:04 +0200
Message-Id: <cover.1666549145.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_112826_227177_659BF329 
X-CRM114-Status: GOOD (  10.12  )
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

Changes since v1:
- fix sparse warnings
- rely on memory-region property in mt7622-wed.yaml
- some more binding fixes

Lorenzo Bianconi (6):
  arm64: dts: mediatek: mt7986: add support for RX Wireless Ethernet
    Dispatch
  dt-bindings: net: mediatek: add WED RX binding for MT7986 eth driver
  net: ethernet: mtk_wed: introduce wed mcu support
  net: ethernet: mtk_wed: introduce wed wo support
  net: ethernet: mtk_wed: add configure wed wo support
  net: ethernet: mtk_wed: add rx mib counters

 .../arm/mediatek/mediatek,mt7622-wed.yaml     |  91 +++
 .../arm/mediatek/mediatek,mt7986-wo-boot.yaml |  46 ++
 .../arm/mediatek/mediatek,mt7986-wo-ccif.yaml |  49 ++
 .../arm/mediatek/mediatek,mt7986-wo-dlm.yaml  |  50 ++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  73 +++
 drivers/net/ethernet/mediatek/Makefile        |   2 +-
 drivers/net/ethernet/mediatek/mtk_wed.c       | 577 ++++++++++++++++--
 drivers/net/ethernet/mediatek/mtk_wed.h       |  21 +
 .../net/ethernet/mediatek/mtk_wed_debugfs.c   |  87 +++
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c   | 390 ++++++++++++
 drivers/net/ethernet/mediatek/mtk_wed_regs.h  | 129 +++-
 drivers/net/ethernet/mediatek/mtk_wed_wo.c    | 545 +++++++++++++++++
 drivers/net/ethernet/mediatek/mtk_wed_wo.h    | 287 +++++++++
 include/linux/soc/mediatek/mtk_wed.h          | 104 +++-
 14 files changed, 2407 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml
 create mode 100644 drivers/net/ethernet/mediatek/mtk_wed_mcu.c
 create mode 100644 drivers/net/ethernet/mediatek/mtk_wed_wo.c
 create mode 100644 drivers/net/ethernet/mediatek/mtk_wed_wo.h

-- 
2.37.3


