Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3933C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Nov 2022 08:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OdZ8AwChaDF14axSXBpypGBs6g6mLcCrCi38LgTnupQ=; b=Pwh7NYO7qJxXX4j/izEYQhiHSm
	ttr+lTuOJkEn5AyyuHhdmJrwBWs8sOnEpGjavfYtU/aufa1NXzKKIM5sThQ8x0w6SspUy6rc4aPTv
	HvlIE6ph2GlWf39sLBVSZQrteGXVRAjVS8064bdkDwAoB9VqS17gNvLasu9zdVT29ENZms6o3a8si
	IznpUqxiK9UBh+TVdehsbeptjhb/ZgKpJbF0y1Gz48zf4gSrXtgI3DZ6wxUm5Kp8FDjHye6POdeUK
	N+vsjy8fdw3yNk2oLtbIuQb1ayrGy28VFa7Eg84onLJ6raN+07cDHdu62wREbwzuPjvtu+eJKnTan
	HF7asSXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovDT5-0014ez-BZ; Wed, 16 Nov 2022 08:08:23 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovDSR-0014Lu-Nn; Wed, 16 Nov 2022 08:07:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=OdZ8AwChaDF14axSXBpypGBs6g6mLcCrCi38LgTnupQ=; b=SvSuoBBX2S1kePhXOKAI3g9Muw
	QwC7xmN2fdqkcWXu6EmlXn8duP0YrsEWIDGZWBqZEIRuEXftIWRi6QqCFJJMzJEXxH8LMx/hgYoBr
	QH7Hw0iHmsOSyNKW+s1RNjUsyR62txMRm3qOwjuMf9BsrfYbkTauC8f38BOfLXEizDZI=;
Received: from p200300daa72ee10015f07c5633889601.dip0.t-ipconnect.de ([2003:da:a72e:e100:15f0:7c56:3388:9601] helo=Maecks.lan)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1ovDSI-002Xoe-Ud; Wed, 16 Nov 2022 09:07:35 +0100
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Multiqueue support for mtk_eth_soc
Date: Wed, 16 Nov 2022 09:07:28 +0100
Message-Id: <20221116080734.44013-1-nbd@nbd.name>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_000743_871786_C9EA1819 
X-CRM114-Status: UNSURE (   7.40  )
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

This series implements multiqueue support on devices with QDMA (MT7621 and newer)
by using the SoC's traffic shaper function, which is part of the QDMA engine.

The driver exposes traffic shaper queues as network stack queues and configures
them to the link speed limit.
This fixes an issue where traffic to slower ports would drown out traffic to
faster ports. It also fixes packet drops and jitter when running hardware
offloaded traffic alongside traffic from the CPU.

Felix Fietkau (6):
  net: ethernet: mtk_eth_soc: increase tx ring size for QDMA devices
  net: ethernet: mtk_eth_soc: drop packets to WDMA if the ring is full
  net: ethernet: mtk_eth_soc: avoid port_mg assignment on MT7622 and
    newer
  net: ethernet: mtk_eth_soc: implement multi-queue support for per-port
    queues
  net: dsa: tag_mtk: assign per-port queues
  net: ethernet: mediatek: ppe: assign per-port queues for offloaded
    traffic

 drivers/net/ethernet/mediatek/mtk_eth_soc.c   | 328 ++++++++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   |  28 +-
 drivers/net/ethernet/mediatek/mtk_ppe.c       |  22 +-
 drivers/net/ethernet/mediatek/mtk_ppe.h       |   4 +
 .../net/ethernet/mediatek/mtk_ppe_offload.c   |  12 +-
 net/dsa/tag_mtk.c                             |   2 +
 6 files changed, 324 insertions(+), 72 deletions(-)

-- 
2.38.1


