Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7B7C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 12:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=su1M2ye5o0dILxMk9cyElIFBQ93oGry7ZL5GdcqEe5c=; b=q+rIdjUavfTRUUJdYhx70RAeSh
	wwsAlCybSL4/j+gSB8vGFRlZAa4LBCShJRY4z+przkEJpVktfCzq182LhAKDQWG1koSkD8dvSvti/
	I/diUvIVwFguM5h2NYaQS8w8z3x2XE9fWn2h155QBRiWRiR1xB3780uxVJUrDOGY9EyQnGVd09QaT
	/z2X1H5aOmHqA3kSv3yc0L0mR6FiFq60nwnBogPTo7NbuzsBV/1e3yq+O4HSHMVgcO+FFHBvA1q41
	Vc2yevxn3ljGQlWr9/kkgI8FNTtH5J4ou/TycXHWr3IMGL4YDt4Y17uFynFLNkh9X0ePl0SDXls/G
	N2uJnGYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKdb8-007wmZ-2d;
	Tue, 02 Jan 2024 12:10:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKdb4-007wlq-2y;
	Tue, 02 Jan 2024 12:10:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=su1M2ye5o0dILxMk9cyElIFBQ93oGry7ZL5GdcqEe5c=; b=A+4Q2ju+LRwnACQadXkh3mRDOd
	F4GjSEr48wc7/6dH+TGpdTTVy+yOEJMzKGAvhnKZ2WqDHdz9Yfil/pofBF9pG85v5bIxSor/ksZsw
	ddZ//ZQ5wpf3NIRoFjM40NZhQtTpM4xOu79dYkqpqxLp8Pr2+0QtDdOsOtXgPizonvaqIz69URts9
	xqAbqIzfjmCZM5bz2WMNDgi2ID8bVdj9kANgTkCzUzAcRqED1QIkl/AlAbg3erSCwYGSGfsh2HVEv
	T/QMUxFge9AJYEWnWJpHHRqApfDINJyCSZ0H2yU3nJjZLoaMSQyaaddYENww1KgSnn4H3pkebA0yO
	A7nW7RyQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46174)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rKdas-0006Wk-01;
	Tue, 02 Jan 2024 12:10:02 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rKdar-0005Hg-2n; Tue, 02 Jan 2024 12:10:01 +0000
Date: Tue, 2 Jan 2024 12:10:01 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Eric Woudstra <ericwouds@gmail.com>
Subject: Re: [PATCH RFC net-next] net: pcs: pcs-mtk-lynxi fix
 mtk_pcs_lynxi_get_state() for 2500base-x
Message-ID: <ZZP9GR15ufDbjGAJ@shell.armlinux.org.uk>
References: <20240102074408.1049203-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102074408.1049203-1-ericwouds@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_041014_982298_EDCAA171 
X-CRM114-Status: GOOD (  15.35  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Alexander Couzens <lynxis@fe80.eu>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 02, 2024 at 08:44:08AM +0100, Eric Woudstra wrote:
> From: Daniel Golle <daniel@makrotopia.org>
> 
> Need to fix mtk_pcs_lynxi_get_state() in order for the pcs to function
> correctly when the interface is set to 2500base-x, even when
> PHYLINK_PCS_NEG_INBAND_DISABLED is set.

Please describe your setup more fully. What is the link partner on this
2500base-X link?

In PHYLINK_PCS_NEG_INBAND_DISABLED mode, this means that phylink is
operating in inband mode, but Autoneg is clear in the advertisement
mask, meaning Autoneg is disabled and we are using a "fixed" setting.
state->speed and state->duplex should already be initialised.

> When the pcs is set to 2500base-x, the register values are not compatible
> with phylink_mii_c22_pcs_decode_state(). It results in parameters such as
> speed unknown and such. Then the mac/pcs are setup incorrectly and do not
> function.

Since Autoneg is clear, phylink_mii_c22_pcs_decode_state() won't
change state->speed and state->duplex, which should already be
correctly set.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

