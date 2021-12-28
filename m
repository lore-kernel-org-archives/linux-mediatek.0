Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B76BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Dec 2021 21:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jWiV4WlsG4D4kT1XG1AqfpItJWY6w2QbVGzP9Fwslec=; b=DSazdYfPqY3gPA
	XiihgQOoZjoTGgyjnFlhr0jGsJgbi/9jKEw7k30xLOhhOVLpZkLZ2i125wSiIuh0GLHyJdMfbzoni
	HkJ7D3KJnkS/1tOEEWbQfKZtJqsE511sIh4ex8f/X2Bhmztiw4bWzObo2Q1PbsW/hKM2WpjTJqpOk
	ERmKnGcnHj439/QZtVEqC6otaaIbhaxU87wP4fwAkPH/w0YSXGTwWENfhdYqYa6MHsfOEvPZ8RuDQ
	SJeyGOYHPlPiuzH5kCI/hx6QExEkcPGy3MMpB7+gyoGUvE9dDkajP6YkhYcuqMenhtxNUMLK8xB2D
	xaLdcA4B8cgEv8gLnFXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Jdh-001qDI-0G; Tue, 28 Dec 2021 21:04:09 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Jdd-001qCT-TI; Tue, 28 Dec 2021 21:04:07 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1n2JdX-0004I1-0i; Tue, 28 Dec 2021 22:03:59 +0100
Date: Tue, 28 Dec 2021 21:03:44 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Michael Lee <igvtee@gmail.com>
Subject: [PATCH v8 0/3] net: ethernet: mtk_eth_soc: refactoring and Clause 45
Message-ID: <Yct7Qje5faphdRBW@makrotopia.org>
References: <Ycr5Cna76eg2B0An@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ycr5Cna76eg2B0An@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_130405_975607_BE524248 
X-CRM114-Status: GOOD (  10.56  )
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

As it turned out some clean-up would be needed, first address return
value and type of mdio read and write functions in mtk_eth_soc and
generally clean up and unify both functions.
Also refactor IAC register definitions to use bitfield helper macros
to get rid of constants previously used as mask or shift values.
Then add support to access Clause 45 phy registers, using the newly
introcuced helper macros suggested by Russell King to access the
Clause 45 device and register address encoded in the 32-bit parameter.

This series is tested on MediaTek MT7622AV based Bananapi BPi-R64 board
having MediaTek MT7531BE DSA gigE switch using Clause 22 MDIO and
MediaTek MT7622BV based Ubiquiti UniFi 6 LR access point having
Aquantia AQR112C PHY using Clause 45 MDIO.

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
  net: ethernet: mtk_eth_soc: fix return value and refactor MDIO ops
  net: ethernet: mtk_eth_soc: implement Clause 45 MDIO access

Russell King (Oracle) (1):
  net: mdio: add helpers to extract clause 45 regad and devad fields

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 73 ++++++++++++++-------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 19 ++++--
 include/linux/mdio.h                        | 12 ++++
 3 files changed, 77 insertions(+), 27 deletions(-)

-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
