Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55826FA373D
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 16:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eKtRJ5MDoLUtuRvkDEBIxej16kIE13gkEyUSehFTESg=; b=3/OeUnmdiqvEiAULvvN5voolIr
	6Zw6bE0HrjQkSIhJr9ZPKSQWe7OUX0vlezauYgw2nN5UxkQKRkuN2PTjVEyQpBMZqDen5j3PR2N8A
	k4QsQM02dphwz49mLvUMmLF01qfuoz375fQWJoF7ImYu7NPzbecr58Y+43es9cP01Nc6piL4gaede
	8rvlSrt50HsRsWLzP+ojmbmXy0cHxEaUZMj0mq/Td+1/BEMCCkN+0kB3QDqej9EvTrcKxJdxrpgWh
	Q2H4KrmcugdOxoAll6pM8SKZZDaSSGuiaeO/ryG+RPZZzmjqdNN3fYVHX4tN72KIxg//X8Kd9qzbW
	WLESAwxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olujl-008uHr-PO; Fri, 21 Oct 2022 16:19:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olujh-008uH7-Nu
	for linux-mediatek@lists.infradead.org; Fri, 21 Oct 2022 16:19:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 590D0B82CA0;
	Fri, 21 Oct 2022 16:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97818C433D6;
	Fri, 21 Oct 2022 16:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666369142;
	bh=le7nhlny4QyaewWADZKPXPcShW1nbYI5/3w0MM5Nc/8=;
	h=From:To:Cc:Subject:Date:From;
	b=Jm7csGbyLeQewgAnwmZoF1/7GEJ1agj3uLy4bSJRwaGv92qS3x6RFGgb9oH372gOG
	 llTdzeeTsE6pRZ8sH+SuGKez/C92CgiWxu5R+POzek6LyvGHyww20DnRRm4ZG3GKaA
	 4nzvJRfUXR6Xa7LuY35OlFFsi/t+eZjXrPe2wza+oefPnW9QRaWOKSoi4Ok6JhJmGs
	 j4m+REdExvlUN54z+98oUCkkNkry4N/ipzPWEWYZYbg60SaCNWPD2FdLiJQAEy26P8
	 xFxvWGuwZkgKVvMuh2kpaJGnQr1ysCFG6Kiidzrd845+mrO7cfWpdURx6H6b7YCZFV
	 tc3IlWNlBRlFw==
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
Subject: [PATCH net-next 0/6] introduce WED RX support to MT7986 SoC
Date: Fri, 21 Oct 2022 18:18:30 +0200
Message-Id: <cover.1666368566.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_091905_964410_608A7D88 
X-CRM114-Status: UNSURE (   9.87  )
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

Similar to TX counterpart available on MT7622 and MT7986, introduce
RX Wireless Ethernet Dispatch available on MT7986 SoC in order to
offload traffic received by wlan nic to the wired interfaces (lan/wan).

Lorenzo Bianconi (6):
  arm64: dts: mediatek: mt7986: add support for RX Wireless Ethernet
    Dispatch
  dt-bindings: net: mediatek: add WED RX binding for MT7986 eth driver
  net: ethernet: mtk_wed: introduce wed mcu support
  net: ethernet: mtk_wed: introduce wed wo support
  net: ethernet: mtk_wed: add configure wed wo support
  net: ethernet: mtk_wed: add rx mib counters

 .../arm/mediatek/mediatek,mt7622-wed.yaml     | 126 ++++
 .../arm/mediatek/mediatek,mt7986-wo-boot.yaml |  45 ++
 .../arm/mediatek/mediatek,mt7986-wo-ccif.yaml |  49 ++
 .../arm/mediatek/mediatek,mt7986-wo-dlm.yaml  |  66 ++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  79 +++
 drivers/net/ethernet/mediatek/Makefile        |   2 +-
 drivers/net/ethernet/mediatek/mtk_wed.c       | 577 ++++++++++++++++--
 drivers/net/ethernet/mediatek/mtk_wed.h       |  21 +
 .../net/ethernet/mediatek/mtk_wed_debugfs.c   |  87 +++
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c   | 375 ++++++++++++
 drivers/net/ethernet/mediatek/mtk_wed_regs.h  | 129 +++-
 drivers/net/ethernet/mediatek/mtk_wed_wo.c    | 545 +++++++++++++++++
 drivers/net/ethernet/mediatek/mtk_wed_wo.h    | 287 +++++++++
 include/linux/soc/mediatek/mtk_wed.h          | 104 +++-
 14 files changed, 2448 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml
 create mode 100644 drivers/net/ethernet/mediatek/mtk_wed_mcu.c
 create mode 100644 drivers/net/ethernet/mediatek/mtk_wed_wo.c
 create mode 100644 drivers/net/ethernet/mediatek/mtk_wed_wo.h

-- 
2.37.3


