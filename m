Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41718C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 12:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5+0tHIU6eevgZEkVFlYrV57IWT3i4o1fSmMoHHtAofE=; b=GRGoZo86hOqOn6
	q3pXrAZ/G11jqD4tUWQG3xy24i4cTc/AcZVSMg4tIK2Cb9RfwijxHdg78MtiLi0/Q1y7JJWLfSe8a
	ayDUDa/rAjsv2hMxbCyoJCDLzacFC6AQLZ0ioy/EYsk5qVhL+0r6JOsjdItXomDxWhFvMFHTLwK8s
	ggaNKhXalu/M/WJd97zqa/Mo0vYPuk50eCp0/RPkllYwyyaG2nXUgZiTl0CxJcf/0xsAddLOM1tft
	ViLG5949cZiGX6N2RMoxow+6ahp35EMsvZ0nDPFppnvuAfD80K9e7NrqHVhGaV/VDpl7EuXYlP0Jv
	maJQ57QM5Z700ndXQmhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4iZq-00BOPq-MZ; Tue, 04 Jan 2022 12:06:06 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4iZn-00BOPA-9m; Tue, 04 Jan 2022 12:06:05 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1n4iZj-0000Jo-E7; Tue, 04 Jan 2022 13:05:59 +0100
Date: Tue, 4 Jan 2022 12:05:51 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v12 0/3] net: ethernet: mtk_eth_soc: refactoring and Clause 45
Message-ID: <YdQ4HzLjpuVW4YFi@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_040603_368060_243C7383 
X-CRM114-Status: GOOD (  11.85  )
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

Rework value and type of mdio read and write functions in mtk_eth_soc
and generally clean up and unify both functions.
Then add support to access Clause 45 phy registers, using newly
introduced helper macros added by a patch Russell King has suggested
in a reply to an earlier version of this series [1].

All three commits are tested on the Bananapi BPi-R64 board having
MediaTek MT7531BE DSA gigE switch using clause 22 MDIO and
Ubiquiti UniFi 6 LR access point having Aquantia AQR112C PHY using
clause 45 MDIO.

[1]: https://lore.kernel.org/netdev/Ycr5Cna76eg2B0An@shell.armlinux.org.uk/

v12: replace 'ret != 0' forgotten from an earlier iteration with
     'ret < 0' checks of mtk_mdio_busy_wait return value (purely
     cosmetical as anyway either 0 or -ETIMEDOUT is returned, sorry
     for the noise)
v11: also address return value of mtk_mdio_busy_wait
v10: correct order of SoB lines in 2/3, change patch order in series
v9: improved formatting and Cc missing maintainer
v8: add patch from Russel King, switch to bitfield helper macros
v7: remove unneeded variables and order OR-ed call parameters
v6: further clean up functions and more cleanly separate patches
v5: fix wrong variable name in first patch covered by follow-up patch
v4: clean-up return values and types, split into two commits
v3: return -1 instead of 0xffff on error in _mtk_mdio_write
v2: use MII_DEVADDR_C45_SHIFT and MII_REGADDR_C45_MASK to extract
    device id and register address. Unify read and write functions to
    have identical types and parameter names where possible as we are
    anyway already replacing both function bodies.

Daniel Golle (2):
  net: ethernet: mtk_eth_soc: fix return values and refactor MDIO ops
  net: ethernet: mtk_eth_soc: implement Clause 45 MDIO access

Russell King (Oracle) (1):
  net: mdio: add helpers to extract clause 45 regad and devad fields

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 101 +++++++++++++++-----
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  19 +++-
 include/linux/mdio.h                        |  12 +++
 3 files changed, 102 insertions(+), 30 deletions(-)

-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
