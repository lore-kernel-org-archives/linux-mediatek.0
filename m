Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366E7C48BC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Feb 2024 15:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mW8V17MsmL7VEwiMKsJzk5HQ8Z5PWc1CNNBk+B48w+A=; b=b/jsAyXHFChDZe/3McpiKlJIkQ
	mjApzKUh13wWMx6+xl4oUVRMox0NQ4M8pid1AbOByutEkQUk4xS0YM4tOFNqmqJyg6Zu5L8gAfNkA
	9gbpD/i3c/mSK6A7ZkeyeRTPYqQHQ9VWlsE4Ph9dSKsaWE940nCvwpxaoBGAcm+uxD4dZFduM5Dcn
	EM5/hXSEPJoJ3hlQ6TH2VjDXFtnFlB3H61yxNiXAqF+LONRjFLalLGKeU1EAMm7BGYqV64ozB/lhZ
	QbiqKDET2nkXjVG34vC7fgj865Glb/icIHLAi7zcT2f3EDjatFKnn3P6JkHlROwave8c5ZibS4GBv
	uenx7New==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb0Ni-00000002sdj-0Pcm;
	Fri, 16 Feb 2024 15:44:06 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb0Nd-00000002scZ-3mKO;
	Fri, 16 Feb 2024 15:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mW8V17MsmL7VEwiMKsJzk5HQ8Z5PWc1CNNBk+B48w+A=; b=i8bUIEw0N70QsZY2kDWJw1w4Tm
	6gzsJwmiUQN3C2NpHmyiXWkKt28KIwMPjgnx/9xrlHwCJES6JRmoQUaZD5nEIt36e+f5uo8g2HT+h
	H9kX4R3NSAGfSw30WE6TPGAnrQuOP6x4LSxQDqyzuQe/C0mnUkingYlhy9lGC5TMIaGaD2na7FwjS
	jjbeVQl9EJEasTrVJfdyFYsvW/WjFuOOD99gweBMdJUso+9N2a2jpUlnRvn9qyRUxdAgWkkNNnr6j
	B5GhiKYPFc28873AR+zyIPUs5iEmpUBKFzjpvnOEVolxujCmlSijC2qYYPmuU0ewkbcaE518+DQ5N
	r7G6PVoA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33656)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rb0NH-0005ns-1X;
	Fri, 16 Feb 2024 15:43:39 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rb0N8-0005jP-NS; Fri, 16 Feb 2024 15:43:30 +0000
Date: Fri, 16 Feb 2024 15:43:30 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: arinc.unal@arinc9.com
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH netnext 8/8] net: dsa: mt7530: simplify link operations
 and force link down on all ports
Message-ID: <Zc+ConfebmQdpCOF@shell.armlinux.org.uk>
References: <20240208-for-netnext-mt7530-improvements-3-v1-0-d7c1cfd502ca@arinc9.com>
 <20240208-for-netnext-mt7530-improvements-3-v1-8-d7c1cfd502ca@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240208-for-netnext-mt7530-improvements-3-v1-8-d7c1cfd502ca@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_074401_961467_7B3915FF 
X-CRM114-Status: GOOD (  11.98  )
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

On Thu, Feb 08, 2024 at 08:51:36AM +0300, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Currently, the link operations for switch MACs are scattered across
> port_enable, port_disable, phylink_mac_config, phylink_mac_link_up, and
> phylink_mac_link_down.
> 
> port_enable and port_disable clears the link settings. Move that to
> mt7530_setup() and mt7531_setup_common() which set up the switches. This
> way, the link settings are cleared on all ports at setup, and then only
> once with phylink_mac_link_down() when a link goes down.
> 
> Enable force mode at setup to apply the force part of the link settings.
> This ensures that only active ports will have their link up.

I think we may have a different interpretation of what phylink's
mac_link_down() and mac_link_up() are supposed to be doing here.
Of course, you have read the documentation of these methods so are
fully aware of what they're supposed to do. So you are aware that
when inband mode is being used, forcing the link down may be
counter-productive depending on how the hardware works.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

