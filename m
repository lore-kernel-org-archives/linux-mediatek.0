Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEB6C2BB3F
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Nov 2023 14:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BWif9T1uf7HThDO5AN5Tn13q/oRG7kK3WKpLPyN52rk=; b=jC2VjWeuD3XmvRPLND3qIy7iJv
	6lOm03FfTRbXz8N0PHEVjM8nf9IyCvzE57wmKHKH/gcUG4HHucAetF14uvMhHAT579VA+VRhaI2Fv
	QhnmTJ1UoJEK6CsGybyxypDvS6AILmA+PJeXa/vKZViPNKIsS52VBcAchy+N3WYjfa3ydTh7NY98k
	scFWb+WxvS5lQrRINIFsC9MFpqzsFU3OwGlqJp+689b/JUj9Xa2apTT47Q9HwVc01ZLBmo1Y504EE
	GllDGDqrWg6t+8sK6XsqheESzhHW5UwdxpQkDfM1BGEW/ooGgAG3ZoCta4nSWCLdWiHJbuS32xyNt
	GWiqwqnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4MWI-008fJz-0d;
	Sat, 18 Nov 2023 14:42:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4MWE-008fJ0-2l;
	Sat, 18 Nov 2023 14:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BWif9T1uf7HThDO5AN5Tn13q/oRG7kK3WKpLPyN52rk=; b=WKmuJVew0chv9ZFu5D4yDig157
	GdzZINfc3nPhLcjC9vnRZ2Imq69zX8hLPkaumIdVh4gT/Af4Pc0+bDdUyMSolFYTnMfFtHegFpAeD
	G8uxxxPM1KCrCmXy3DFlK9zkz28c9WXXe2N7SU8o4OseUXX18PbQTeOdOllqGTg6N6ZGfqRVrL7Ql
	1jPL8PC3QrLg4Gfd3NFlEDIA7mpGLBKig8k792jvBI34NwbD/znoRRyIjTezPj2cpPq7Hh9ni1hyC
	BeFmfKPK034Awbfaq8bel4uNvJjqNixec7tkiNBSvH1M/NFNSPBuvY4iLP5R6KDZroLtnsqkjPLUB
	DN2DYQ6Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52758)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r4MVz-0003mj-2L;
	Sat, 18 Nov 2023 14:41:43 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r4MVz-0001Dw-Ap; Sat, 18 Nov 2023 14:41:43 +0000
Date: Sat, 18 Nov 2023 14:41:43 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 05/15] net: dsa: mt7530: improve code path for
 setting up port 5
Message-ID: <ZVjNJ0nf7Mp0kHzH@shell.armlinux.org.uk>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
 <20231118123205.266819-6-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231118123205.266819-6-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231118_064158_900590_23E48E5B 
X-CRM114-Status: GOOD (  15.18  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Nov 18, 2023 at 03:31:55PM +0300, Arınç ÜNAL wrote:
> There're two code paths for setting up port 5:
> 
> mt7530_setup()
> -> mt7530_setup_port5()
> 
> mt753x_phylink_mac_config()
> -> mt753x_mac_config()
>    -> mt7530_mac_config()
>       -> mt7530_setup_port5()
> 
> Currently mt7530_setup_port5() from mt7530_setup() always runs. If port 5
> is used as a CPU, DSA, or user port, mt7530_setup_port5() from
> mt753x_phylink_mac_config() won't run. That is because priv->p5_interface
> set on mt7530_setup_port5() will match state->interface on
> mt753x_phylink_mac_config() which will stop running mt7530_setup_port5()
> again.
> 
> Therefore, mt7530_setup_port5() will never run from
> mt753x_phylink_mac_config().
> 
> Address this by not running mt7530_setup_port5() from mt7530_setup() if
> port 5 is used as a CPU, DSA, or user port. This driver isn't in the
> dsa_switches_apply_workarounds[] array so phylink will always be present.
> 
> For the cases of PHY muxing or the port being disabled, call
> mt7530_setup_port5() from mt7530_setup(). mt7530_setup_port5() from
> mt753x_phylink_mac_config() won't run when port 5 is disabled or used for
> PHY muxing as port 5 won't be defined on the devicetree.

... and this should state why this needs to happen - in other words,
the commit message should state why is it critical that port 5 is
always setup.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

