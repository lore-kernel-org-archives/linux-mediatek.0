Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874A6C369CB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Apr 2025 13:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GRXWV3EqF4OGfPClc9MjszNJHA7scoZyknzPOLSe4Nc=; b=eiK14nqNviHRRl56vOGGrRywty
	Gm/vixiuljB3dQO5JAaTug52wRFtV5PlqQk2XdcwNG/yo+6ZiaadcgxnakPOSmE/uHQwnKQAUUDmY
	plAcMFPXqi/uxK7KtBYtp7vz+sVKTl+Vtz1JeF1BhbQeoP+0x13Sje1l1XlF4KBHaIeJ2UrdTrAcJ
	3mCIQlTBdzlDCUgk2z2xBK1nr7M+M9zKfRAnmA/IREnJmwC/qEalsmN90VRs/Y5JEkoGXmlyImgzB
	M6q5j96ez0GEErFPSzaXBeaw38kDhk1585MmdzDZ3r6tn84+1hEEp5e4MslEGUPYpqTII4lVceBle
	3mDMykrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Zmv-0000000AWu8-1gVm;
	Wed, 23 Apr 2025 13:05:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thRBz-0000000H2fy-1k5O;
	Mon, 10 Feb 2025 10:39:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GRXWV3EqF4OGfPClc9MjszNJHA7scoZyknzPOLSe4Nc=; b=QGV6UZRm+YXnJHn/ddiKz4T6CD
	Z/Cbk8QB8HpeAWoPOzJ7CqbRGv0/4jRkW2jTmLfbMYibxJknhgRJCvna/r19ubxWtjF8CEn6nK9K2
	kyQhzBO5QUWXU8Gtd+iWFj6sqj81Y3+49hYOskt2AtvOqnL/VkQuTUh3so43c35kKRmuJfUPjcAOg
	P/ttUzGQ11jxUpFG86mqaQgh/hLS7u+IXDza4jXgBLZJrfNoUwZhM2k7m3FNSddnsWCOVb//RRST2
	hsVFgRzErrAzbIRclEONtug2BaePTvr4MvwD0I/53owWKGI8jypGs8CR3nPIlvbZdCE50Og8n0spy
	srgkDvFA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58250)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1thR9k-0006Qq-1B;
	Mon, 10 Feb 2025 10:36:48 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1thR9e-0007Pr-22;
	Mon, 10 Feb 2025 10:36:42 +0000
Date: Mon, 10 Feb 2025 10:36:42 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH net-next v3 0/3] net: dsa: add support for phylink
 managed EEE
Message-ID: <Z6nWujbjxlkzK_3P@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_023907_452734_A9EE9E85 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 23 Apr 2025 04:24:59 -0700
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

Hi,

This series adds support for phylink managed EEE to DSA, and converts
mt753x to make use of this feature.

Patch 1 implements a helper to indicate whether the MAC LPI operations
are populated (suggested by Vladimir)

Patch 2 makes the necessary changes to the core code - we retain calling
set_mac_eee(), but this method now becomes a way to merely validate the
arguments when using phylink managed EEE rather than performing any
configuration.

Patch 3 converts the mt7530 driver to use phylink managed EEE.

v2: fix mt7530 build error
v3: send correct patch 2

 drivers/net/dsa/mt7530.c  | 68 ++++++++++++++++++++++++++++++++---------------
 drivers/net/phy/phylink.c |  3 +--
 include/linux/phylink.h   | 12 +++++++++
 net/dsa/user.c            | 21 +++++++++------
 4 files changed, 73 insertions(+), 31 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

