Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA188C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 21:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cfqbLsjTXIklgUmkkjoKLX8BggWtVbPLmwMoI1aXoyk=; b=mlbgAZ7wl4WVE3QL4NBQLyMfN9
	xVbJJQOVO/in5a4KA1dKJI9CcJn6BIaQdxC17XurDN3WiA0w9NhdnTVi4ZUVhhQsJEbM6DgN24Z+n
	HJ8JymkAGBpGWiBQIbslrWNXs2DDseOCpW795w2ZjpCfF5taD2mwCLu5JFDyoFSsfTPAx8np304DG
	6saUqcuTC94nYOVOzScfUnCO8bsWfB1NX7sP0bzT22jB7lliRK/rN7/YESRuTJR47JibrlE2bCoH/
	J3bnHNi26fAB0JtlGyfoWKoYlRa4GZNY4p1gHEcFnBphiuyeITzUUYyrDN3H9fdq38rKG3mr/zUtd
	uMwQ8TrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otF0H-00ARVH-7A; Thu, 10 Nov 2022 21:22:29 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otF07-00ARSd-0q; Thu, 10 Nov 2022 21:22:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=cfqbLsjTXIklgUmkkjoKLX8BggWtVbPLmwMoI1aXoyk=; b=dZhXm+IpFFEJsfqN3xQJYJPbqD
	NY4f7k4zhNV2Dnq3yc+YxC14yeK7ijVX4FUijlgKLXf15B6kC9l9R7/8e+NPbPjrjs9Hve15xc0Io
	3zHnou/5lPpVCcC5zOasJdNMIYVuctKwSsb/icjbrmR7VzvmdQDKruWRvQTQMiUuGkCQ=;
Received: from p200300daa72ee10c199752172ce6dd7a.dip0.t-ipconnect.de ([2003:da:a72e:e10c:1997:5217:2ce6:dd7a] helo=Maecks.lan)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1otF03-0011Om-6K; Thu, 10 Nov 2022 22:22:15 +0100
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v3 0/4] mtk_eth_soc rx vlan offload improvement + dsa hardware untag support
Date: Thu, 10 Nov 2022 22:22:07 +0100
Message-Id: <20221110212212.96825-1-nbd@nbd.name>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_132219_183960_71D9B526 
X-CRM114-Status: UNSURE (   7.67  )
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

This series improves rx vlan offloading on mtk_eth_soc and extends it to
support hardware DSA untagging where possible.
This improves performance by avoiding calls into the DSA tag driver receive
function, including mangling of skb->data.

This is split out of a previous series, which added other fixes and
multiqueue support

Changes in v3:
 - fix netdev features sync
 - fix dsa_default_offload_fwd_mark call in dsa patch

Felix Fietkau (4):
  net: dsa: add support for DSA rx offloading via metadata dst
  net: ethernet: mtk_eth_soc: pass correct VLAN protocol ID to the
    network stack
  net: ethernet: mtk_eth_soc: add support for configuring vlan rx
    offload
  net: ethernet: mtk_eth_soc: enable hardware DSA untagging

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 93 ++++++++++++++++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  8 ++
 net/core/flow_dissector.c                   |  4 +-
 net/dsa/dsa.c                               | 19 ++++-
 4 files changed, 109 insertions(+), 15 deletions(-)

-- 
2.38.1


