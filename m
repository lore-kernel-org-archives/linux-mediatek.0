Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02484C48291
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 10:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0hoRfGIvTGHgneayWfi5kk6Ut6Vdy9Hd25mPOPqEXY=; b=JHEp2neU1qnxTRS8K59pHg4+A8
	6lmiFny5wO0tU2LBtl/VLXgA3K5q4o6h4RQAY54upA11GPsr3GKwsG7qFZiJeieXnJf1x27w7mslV
	fTIvq/ob8uFDJOKtHuvIyxRTFTkJfnMjlmhwFYOsT0sgTHKhaz/bRj61XqY3dC3vuCl7bD2O/8hVC
	msZbvQwTJpBDVx5UrEb0xByid2wXT/3mflI9pEY2FkVz30ErPk0RQ+BaCCSWdrIftiB88WP1rkFVW
	5K6d6ZXJ236VGhRepnOPnXAsyT1POPBjRJ8m3BzIpw91lHldDlamqiCYPnaRDFq/T4lLog77ZQJqE
	VEXIZwsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWvm8-00000002ilP-2dSq;
	Mon, 05 Feb 2024 10:00:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWvm5-00000002ijW-0NfB;
	Mon, 05 Feb 2024 10:00:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=s0hoRfGIvTGHgneayWfi5kk6Ut6Vdy9Hd25mPOPqEXY=; b=lNdwvt5ORnapXlLrXwXC0cEbRx
	CuQXfZ+LW7Wq3MUBwK/NIWomquSJLeE1DWdh2k3dmdzcSXLJO3lRSTnmqxv9BPu/gvEPOrO7Fh9Es
	cPrVBA5Di2KOsNdls+mVh/hY+2AkiEhgwWGPJMvhdG2TPEwNv/vLAaFvxIVwYT3mHfSNOW7uHY2Yh
	gW0uq2TH/pub2i9bkSAz/3343ee7xbT7JwTsjcxipTNrEfEG49w7NDd+243vavX0Zr3K7Ec8BqKMO
	CFldWJYDOu8Ter0RTZDU9bEgKvjktPFWZ5nHX5xLp7QldaudUoGGNNr3uShcwFupLagZ+a7iKVtj2
	7TMF6z4Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54440)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rWvlh-0000LB-0T;
	Mon, 05 Feb 2024 10:00:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rWvlZ-0002bl-QE; Mon, 05 Feb 2024 09:59:53 +0000
Date: Mon, 5 Feb 2024 09:59:53 +0000
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
Subject: Re: [PATCH net-next v4 2/7] net: dsa: mt7530: move XTAL check to
 mt7530_setup()
Message-ID: <ZcCxmUwxfmKIXh/U@shell.armlinux.org.uk>
References: <20240204-for-netnext-mt7530-improvements-2-v4-0-02bf0abaadb8@arinc9.com>
 <20240204-for-netnext-mt7530-improvements-2-v4-2-02bf0abaadb8@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240204-for-netnext-mt7530-improvements-2-v4-2-02bf0abaadb8@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_020025_450804_88A56FB6 
X-CRM114-Status: GOOD (  11.03  )
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

On Sun, Feb 04, 2024 at 07:34:20PM +0300, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The crystal frequency concerns the switch core. The frequency should be
> checked when the switch is being set up so the driver can reject the
> unsupported hardware earlier and without requiring port 6 to be used.
> 
> Move it to mt7530_setup(). Drop the unnecessary function printing.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

