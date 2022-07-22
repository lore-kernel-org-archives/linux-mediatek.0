Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59765C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 07:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qu2+RnhtcItyyrpjSRL6gjnZt/wrv3P8BzkPSTHUGDs=; b=j47VIMXHF/onOBUFf/g2QU5GvG
	x/7wzus4AAFYGWT0TXEFDRTIfbLeYnlJjWPmYSzTyIAF3oBRsOOiMmFq0EyJn2gO4edPpJ0SwDTT6
	FXJHwjLwnfukBcg+qsBPLT/vzj0xD5HDitcVmNO5eLo7PH72ltAzod+fd2txzLCAFszDjRaTLLXfC
	XF12B5tV0N3kxe+VaFJ9JBCuRjfbr8by+6vHTR2kyWE/3eTWeuEXkEwavpqrmYKf9QaYe4q8YaDV/
	Lirs7CR0whl26iUDIPLqAJsCBPAbGiCxdvB6ZXVPvc6DriJVWwCaMSYq8wXke/hdtsEOX5CACjMRP
	aVuIvxfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEmxF-000als-J1; Fri, 22 Jul 2022 07:20:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEmxC-000akA-Lq
	for linux-mediatek@lists.infradead.org; Fri, 22 Jul 2022 07:20:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0D2A2621C1;
	Fri, 22 Jul 2022 07:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31E4C341C6;
	Fri, 22 Jul 2022 07:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658474405;
	bh=yqRNzyJg+fSV//vMTnzmP5OyPzyg8nL3aMeh38VyGNs=;
	h=From:To:Cc:Subject:Date:From;
	b=n42sZhAX59RqdAnxtGdo3HAacZfIJ35RTuCR6Z8ef5/vrc4WkOfms5gkzdLsrh7Jf
	 z4swg2ZtYL6SXbO6blfFi7NyA9Yjb5cauB6cjVfVIKAC07PppzTqlwDFDLiOasfzeR
	 bib9bB0C1t3dcBd95ESHEoqy1cjBhcAWW9Wo8q7u+ef4m0U30CxO3HwrxMxN8hSfPo
	 cChmHicutcj/xzvwJni1PJP9Vj1Tl7V1Vp6DV9K4qKREXaY3lakjy1881izsyd1gq8
	 YyDsFoWJEpCQWN4AI4gcbF0P0FqVEZlqKnAiEuiHo/8dMK5042mXUlGMjVu1q1IwmK
	 HXTnZjwpDtn6g==
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
	ilias.apalodimas@linaro.org,
	lorenzo.bianconi@redhat.com,
	jbrouer@redhat.com
Subject: [PATCH v4 net-next 0/5] mtk_eth_soc: add xdp support
Date: Fri, 22 Jul 2022 09:19:35 +0200
Message-Id: <cover.1658474059.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_002006_769279_A7FA1B66 
X-CRM114-Status: UNSURE (   9.60  )
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

Introduce XDP support for mtk_eth_soc driver if rx hwlro is not
enabled in the chipset (e.g. mt7986).
Supported XDP verdicts:
- XDP_PASS
- XDP_DROP
- XDP_REDIRECT
- XDP_TX
- ndo_xdp_xmit
Rely on page_pool allocator for single page buffers in order to keep
them dma mapped and add skb recycling support.

Changes since v3:
- add missing rcu_read_lock()/rcu_read_unlock()
- introduce mtk_page_pool_enabled() utility routine

Changes since v2:
- fix leftover sparse warning
- add page_pool ethtool stats

Changes since v1:
- do not allocate mtk_xdp_stats array on the stack in mtk_rx_poll
- add rcu annotation to bpf program

Lorenzo Bianconi (5):
  net: ethernet: mtk_eth_soc: rely on page_pool for single page buffers
  net: ethernet: mtk_eth_soc: add basic XDP support
  net: ethernet: mtk_eth_soc: introduce xdp ethtool counters
  net: ethernet: mtk_eth_soc: add xmit XDP support
  net: ethernet: mtk_eth_soc: add support for page_pool_get_stats

 drivers/net/ethernet/mediatek/Kconfig       |   2 +
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 572 +++++++++++++++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  34 +-
 3 files changed, 537 insertions(+), 71 deletions(-)

-- 
2.36.1


