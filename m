Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA56EEAA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 14:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9g5p79I+rx3G3uN4lHek0ZFTz99uCM1KK6/6PvRb8rM=; b=LyFdkLxcvcPGUMaXVyW6+jhh1Y
	Xq5IviDwNNYHcdecTps6utDyRBJKRJW2H1zgYlfTlxiw7J19iR0k3ksn5oFZDtVpmN1hnsbPIv2oC
	DqrDEP6Gf6Fhb4busxxm+sWp7TbBbMSQfmULG7okDMiv+4L78mk4TkEFestPSkfX4v8vGRHh9hpT8
	d9Be7UGDYpFf6LbiZa9YA95ftNgLFNQJCxzu1woPEfVcGUrZUv14rFNxHjYN3XY6lq47geogYQoN2
	/om/Q6wZ1jUk4K2FMVapquRlo0M4opbjDnyvTfPrTV0uW8yfx/DY1FQgoFK7tmcxtMcbzycyYOUfL
	hbpEkiIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnUv-008eb1-0U;
	Thu, 14 Sep 2023 14:39:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnUr-008eaZ-2m
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Sep 2023 14:39:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 08584B828FA;
	Thu, 14 Sep 2023 14:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4F3C433C8;
	Thu, 14 Sep 2023 14:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694702346;
	bh=Eo35jmyvF3teBS2RGYOdKRoExXrZoahSKETo7c9s0XU=;
	h=From:To:Cc:Subject:Date:From;
	b=fvRjuEPtg5WtYxpIO6oD5uS+wCRr8IQmLUBgcsG1vN0okkGNIga5YHnHUU7Ferebz
	 C8YrECMnA46LludxbR7ulMaTmzbOCZAHAld7xY/YhbS5h1/rkC8Fo5YAysIW6Iv5YZ
	 5hBNwkLD0LpmWFza3eOkqBVbWXyxAax7xOIYvF1NxTT3esjGXQBkG7Kbd425tcEvCF
	 ptiz1JG7wubsM/uh8KOzLy6Z7hyJplJAx2ijKBNJErgcgVvqYBej7ZUhR1bt+Fk1un
	 AjPYtgsuCL7ND0cyRsYMYzVL+trYp3cGinpoaM4r2ISrJQIVJdKjYPh5jObABueH/r
	 YwEv0ftR2v/7w==
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
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org
Subject: [PATCH net-next 00/15] Add WED support for MT7988 chipset
Date: Thu, 14 Sep 2023 16:38:05 +0200
Message-ID: <cover.1694701767.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_073910_187561_E273BD9D 
X-CRM114-Status: UNSURE (   8.82  )
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

Lorenzo Bianconi (11):
  dt-bindings: soc: mediatek: mt7986-wo-ccif: add binding for MT7988 SoC
  dt-bindings: arm: mediatek: mt7622-wed: add WED binding for MT7988 SoC
  net: ethernet: mtk_wed: introduce versioning utility routines
  net: ethernet: mtk_wed: introduce mtk_wed_wdma_get_desc_size utility
    routine
  net: ethernet: mtk_wed: do not configure rx offload if not supported
  net: ethernet: mtk_wed: rename mtk_rxbm_desc in mtk_wed_bm_desc
  net: ethernet: mtk_wed: introduce mtk_wed_buf structure
  net: ethernet: mtk_wed: move mem_region array out of
    mtk_wed_mcu_load_firmware
  net: ethernet: mtk_wed: make memory region optional
  net: ethernet: mtk_wed: refactor mtk_wed_check_wfdma_rx_fill routine
  net: ethernet: mtk_wed: debugfs: move wed_v2 specific regs out of regs
    array

Sujuan Chen (4):
  net: ethernet: mtk_wed: introduce WED support for MT7988
  net: ethernet: mtk_wed: introduce partial AMSDU offload support for
    MT7988
  net: ethernet: mtk_wed: introduce hw_rro support for MT7988
  net: ethernet: mtk_wed: debugfs: add WED 3.0 debugfs entries

 .../arm/mediatek/mediatek,mt7622-wed.yaml     |    1 +
 .../soc/mediatek/mediatek,mt7986-wo-ccif.yaml |    1 +
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   |    1 +
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   |    2 +-
 drivers/net/ethernet/mediatek/mtk_ppe.c       |    4 +-
 drivers/net/ethernet/mediatek/mtk_ppe.h       |   19 +-
 .../net/ethernet/mediatek/mtk_ppe_offload.c   |    6 +-
 drivers/net/ethernet/mediatek/mtk_wed.c       | 1081 +++++++++++++----
 drivers/net/ethernet/mediatek/mtk_wed.h       |   45 +
 .../net/ethernet/mediatek/mtk_wed_debugfs.c   |  400 +++++-
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c   |   95 +-
 drivers/net/ethernet/mediatek/mtk_wed_regs.h  |  304 ++++-
 drivers/net/ethernet/mediatek/mtk_wed_wo.h    |    3 +-
 .../net/wireless/mediatek/mt76/mt7915/mmio.c  |    2 +-
 include/linux/netdevice.h                     |    1 +
 include/linux/soc/mediatek/mtk_wed.h          |   76 +-
 16 files changed, 1748 insertions(+), 293 deletions(-)

-- 
2.41.0


