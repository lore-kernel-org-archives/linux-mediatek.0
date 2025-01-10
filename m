Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE53E77188
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2025 11:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXQQFvf77bchSnkndxN19Cawx7kLut+C4n4JPrH4k6I=; b=hFWSvvPGsEJdBThuVgrUeSxvPh
	4Zc2QWbSH+bw6UhAEyZBOHl7bDALiitfiPuI1UZJkCXl0neb6elTQaMJr5a72oOYj3DcQSp4MAJVQ
	SZBnKEgefWEi4e60+tPyJ+pYtKKqVVDGWQGIIQuPv9xc5VjPyL88QagFFM7mEgFow5QYZa7sXuPtU
	481RznZjTFGs4KhwIxrrKFpxS8QAHtY8UbmBctYDINIl50KCabvigZUTMdJnD8sULgl6me5SBgtr+
	xjkFCz4rMao7V5pBJ2WZza8Dq93EIILWU3hn03h/HmqCiGGtlvUke9kVhX55w3ocLZOH834LiUfIJ
	23mlqjPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD2M-0000000F5C3-0bHY;
	Fri, 10 Jan 2025 11:18:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD15-0000000F4yC-3cTF;
	Fri, 10 Jan 2025 11:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VXQQFvf77bchSnkndxN19Cawx7kLut+C4n4JPrH4k6I=; b=uBSSQKxaiw7OaZ+6k41YG14Ir1
	2KhCMN6MxDj0MStEYBLj7ZGmGw5OS7eKVr+0Ak9MQU867of5ryWX8nbkILrZ0fCbt8BJntZGSj++K
	b2Vhk0hVqoYT9Dmr3SUMdB3JyVFGvHV7tqU/jeekAi8HkOJZZPXUj9IqSfQHoyUTVD8HtXwP255MK
	QRoYynNJ2ba3Sx8PtjpAfejiB9Yk2JCYTJMF7RadrNl/koJXiifcvnBkzIV8OS0BQpSM9CoBo7Pwj
	XnomMeXTy56j5sFGK/jpTGmJ/C3FV9144VSYnhqzKnkT+7sk6H6A0CXqRdDJoWbj4wLbYuISGM8Qe
	EmBOA15A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53686)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tWCyg-0003KH-2L;
	Fri, 10 Jan 2025 11:14:58 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tWCyY-0008HW-1b;
	Fri, 10 Jan 2025 11:14:50 +0000
Date: Fri, 10 Jan 2025 11:14:50 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ar__n__ __NAL <arinc.unal@arinc9.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Golle <daniel@makrotopia.org>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>, kernel-team@meta.com,
	Lars Povlsen <lars.povlsen@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michal Simek <michal.simek@amd.com>, netdev@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Sean Anderson <sean.anderson@seco.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Taras Chornyi <taras.chornyi@plvision.eu>,
	UNGLinuxDriver@microchip.com, Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH net-next 5/5] net: phylink: provide fixed state for
 1000base-X and 2500base-X
Message-ID: <Z4EBKhGVwlVhxAxw@shell.armlinux.org.uk>
References: <Z3_n_5BXkxQR4zEG@shell.armlinux.org.uk>
 <E1tVuG1-000BXo-S7@rmk-PC.armlinux.org.uk>
 <a54b564b-4f88-4783-9e8a-72289ce11c04@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a54b564b-4f88-4783-9e8a-72289ce11c04@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_031727_935792_D78AC91A 
X-CRM114-Status: GOOD (  20.89  )
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

On Fri, Jan 10, 2025 at 09:04:56AM +0100, Eric Woudstra wrote:
> 
> On 1/9/25 4:15 PM, Russell King (Oracle) wrote:
> > When decoding clause 22 state, if in-band is disabled and using either
> > 1000base-X or 2500base-X, rather than reporting link-down, we know the
> > speed, and we only support full duplex. Pause modes taken from XPCS.
> > 
> > This fixes a problem reported by Eric Woudstra.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  drivers/net/phy/phylink.c | 29 +++++++++++++++++++----------
> >  1 file changed, 19 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> 
> After changing 'if (pcs->neg_mode)' to 'if (pcs && pcs->neg_mode)' in
> patch 1/5, I have tested this patch-set and I get link up.
> 
> Tested-by: Eric Woudstra <ericwouds@gmail.com>

Thanks Eric. Much appreciate your patience with this tangent to the
issue you have - your report highlighted that there was this other
bug that needed fixing in addition to the problem you were experiencing.
I've fixed that slightly differently (as below) and I'll post a v2
shortly.

+       if (!pcs || pcs->neg_mode)
+               autoneg = pl->pcs_neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
+       else
+               autoneg = linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
+                                           state->advertising);

there, since the "else" clause is the legacy case. I doubt that makes
any difference to your testing scenario, but please let me know if
you want to re-test with that before I add your t-b.

Next, we need to address your problem properly... I'll be looking at
that today.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

