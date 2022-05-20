Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB26C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 18:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u9HwjbHviVYPQneHvSelHZ5+3qLUeIc4JJOel0ceRJM=; b=fTlw7RAPoT/bvH
	lkcz3Y2udSAcDqrcLpzs66qHXdD0RmGCiyB3N3nIntJF9UCptYuwCAYM3MW/JETnBSKkKxPHlLgAZ
	2LYVjPteiTk33ZV2iv9nRMkxBWEiXXiLbJEgaj17hHgEy6Z45pB8rwy0X6x9JLzH7iNd/4aLwVN3Z
	H616Gq6YYY/vABP6CaTNtF3J35YqTugeZzFsOW6mivX5NtQX5Yner9avJvhfNIPCbKdKBQ/BpDRZO
	R+Kt1862GVaWZCG0ISdj1ncS+47etWXgpUCyCCyuNWwzD9GedmABeZp7VtdMqY4N02Liz0fVOpQmM
	3GuSyf/yGbN1aye0RWNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns76m-00E0kw-A2; Fri, 20 May 2022 18:12:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns76k-00E0kF-En
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 18:12:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1BD9AB82D77;
 Fri, 20 May 2022 18:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25B0C385A9;
 Fri, 20 May 2022 18:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653070331;
 bh=XH5tR/ceOrMA3qoQoBm41vju6F5mQ+4rINaDTk1L2Lw=;
 h=From:To:Cc:Subject:Date:From;
 b=DCjxGgLpX5eb4k63KxSdtXSNIoGzheVdUukHoZ43p83DSb6T5Zlamxl2h5feiMVoR
 5kBwL03Yse+QLYtpdI3sLMx/DMaMjrGtICwmV6bOQRR5EsNcU3EzKq7CS6Qlnw+cD+
 x9fop2UXLr4kh/7RljZVjc2m7b4X61MnmdqJgZDCHP09CMIXkDx21R6VH8fqlJj9tV
 qtEd799ETKPS6cZ45V1FROeBehhNk5lWl5NopZqMpYqT3v/OcyfU6b67tihgtP04q9
 pI4a2sSzka8mu+eHJxcuAXHadJ7E+AsJuvgbrhdtjrlyKnSectvqphWafkgko17/IY
 peucm2OTMC30g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: [PATCH v3 net-next 00/16] introduce mt7986 ethernet support
Date: Fri, 20 May 2022 20:11:23 +0200
Message-Id: <cover.1653069056.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_111214_671087_05C80435 
X-CRM114-Status: UNSURE (   7.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for mt7986-eth driver available on mt7986 soc.

Changes since v2:
- rely on GFP_KERNEL whenever possible
- define mtk_reg_map struct to introduce soc register map and avoid macros
- improve comments

Changes since v1:
- drop SRAM option
- convert ring->dma to void
- convert scratch_ring to void
- enable port4
- fix irq dts bindings
- drop gmac1 support from mt7986a-rfb dts for the moment

Lorenzo Bianconi (16):
  arm64: dts: mediatek: mt7986: introduce ethernet nodes
  dt-bindings: net: mediatek,net: add mt7986-eth binding
  net: ethernet: mtk_eth_soc: rely on GFP_KERNEL for dma_alloc_coherent
    whenever possible
  net: ethernet: mtk_eth_soc: move tx dma desc configuration in
    mtk_tx_set_dma_desc
  net: ethernet: mtk_eth_soc: add txd_size to mtk_soc_data
  net: ethernet: mtk_eth_soc: rely on txd_size in
    mtk_tx_alloc/mtk_tx_clean
  net: ethernet: mtk_eth_soc: rely on txd_size in mtk_desc_to_tx_buf
  net: ethernet: mtk_eth_soc: rely on txd_size in txd_to_idx
  net: ethernet: mtk_eth_soc: add rxd_size to mtk_soc_data
  net: ethernet: mtk_eth_soc: rely on txd_size field in
    mtk_poll_tx/mtk_poll_rx
  net: ethernet: mtk_eth_soc: rely on rxd_size field in
    mtk_rx_alloc/mtk_rx_clean
  net: ethernet: mtk_eth_soc: introduce device register map
  net: ethernet: mtk_eth_soc: introduce MTK_NETSYS_V2 support
  net: ethernet: mtk_eth_soc: convert ring dma pointer to void
  net: ethernet: mtk_eth_soc: convert scratch_ring pointer to void
  net: ethernet: mtk_eth_soc: introduce support for mt7986 chipset

 .../devicetree/bindings/net/mediatek,net.yaml | 141 ++-
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts  |  74 ++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  39 +
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts  |  70 ++
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   | 834 +++++++++++++-----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   | 305 ++++---
 6 files changed, 1113 insertions(+), 350 deletions(-)

-- 
2.35.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
