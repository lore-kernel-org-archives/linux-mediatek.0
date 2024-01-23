Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9488C47258
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 21:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oC+Xzu8aSBBLxTeOfbPxmslOua7SUo4gfiXATYXwkfg=; b=clBKG6sDALnpxK8YF8Ixg/CqHQ
	7MyjFACZlfrHOcnvI+0Evt8LzeOWUxXExLdjlb3OA5vNvpbR+zxrtlue9kfeoffugAQ8nJp+hTs6R
	n3ij1iLAWn4/qEL/cb3f4TVl8riweajzG99KUuW1uI6B+zq15u2tgk9WltDFd0Aha/23dtzFMW6QT
	h5x2AS/HcyorFcB0MHHD6XTAteWxDLJ+hU8mQVQ2ksNTMkDz0Buwe38L8ONqHSaPOrPZgUSQbvIbU
	KMt4b2aUSDGCEmJhVZpD4SXzhl8hufZdVuqUqwzFcHquvTidCwqTIudo6viZWv8LB/aJDxTm+Ww4o
	TRnwx3HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSNyB-000Tf3-1U;
	Tue, 23 Jan 2024 21:06:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSNy8-000Tdx-0N;
	Tue, 23 Jan 2024 21:06:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oC+Xzu8aSBBLxTeOfbPxmslOua7SUo4gfiXATYXwkfg=; b=J45UVL1of3oS15/wI5Kdmn28wP
	7NPwZmDwM3ad0TQT+R6Kl9P6QMirgtMipu5fPDa6WhT2/UwIxx1ne/KkfmlSKDirr4Hd8WuTmok/y
	FMw4Q3uBOcg8QIoVKE8OzqN9r2whlaugsZJme1hEZSobD0kFllk/tmRuVVCUd3QyKoZhjx7d9rxyt
	Z5ShI6oUM7qT5YIGi8U1JcpH8BQ7eJBr6osb3Hzb1YneVqu746PUAsQ9kay+HAcICWTBM9GhJ5Gn0
	4x30bjcoNaX8RJ2CIwr/zI1Rt52PufU+PMTRmN1jdYXkmWxwe4NlGq0QTWfnHnBftRxNSIhd16w8y
	7KsPIptw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43142)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rSNxu-00035u-1i;
	Tue, 23 Jan 2024 21:05:50 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rSNxr-0002Fu-Qa; Tue, 23 Jan 2024 21:05:47 +0000
Date: Tue, 23 Jan 2024 21:05:47 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sean Anderson <sean.anderson@seco.com>
Cc: Landen.Chao@mediatek.com, UNGLinuxDriver@microchip.com,
	alexandre.belloni@bootlin.com, andrew@lunn.ch,
	angelogioacchino.delregno@collabora.com, arinc.unal@arinc9.com,
	claudiu.manoil@nxp.com, daniel@makrotopia.org, davem@davemloft.net,
	dqfext@gmail.com, edumazet@google.com, f.fainelli@gmail.com,
	hkallweit1@gmail.com, kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
	netdev@vger.kernel.org, olteanv@gmail.com, pabeni@redhat.com,
	sean.wang@mediatek.com
Subject: Re: [PATCH RFC net-next 03/14] net: phylink: add support for PCS
 link change notifications
Message-ID: <ZbAqK+RbuJZ6d4tK@shell.armlinux.org.uk>
References: <E1qChay-00Fmrf-9Y@rmk-PC.armlinux.org.uk>
 <75773076-39a2-49dd-9eb2-15a10955a60d@seco.com>
 <ZbAch9ZlbDrZqzpw@shell.armlinux.org.uk>
 <e3647618-b896-47a2-b9b9-c75b56813293@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3647618-b896-47a2-b9b9-c75b56813293@seco.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_130604_150943_91EB4064 
X-CRM114-Status: GOOD (  30.21  )
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

On Tue, Jan 23, 2024 at 03:33:57PM -0500, Sean Anderson wrote:
> On 1/23/24 15:07, Russell King (Oracle) wrote:
> > On Tue, Jan 23, 2024 at 02:46:15PM -0500, Sean Anderson wrote:
> >> Hi Russell,
> >> 
> >> Does there need to be any locking when calling phylink_pcs_change? I
> >> noticed that you call it from threaded IRQ context in [1]. Can that race
> >> with phylink_major_config?
> > 
> > What kind of scenario are you thinking may require locking?
> 
> Can't we at least get a spurious bounce? E.g.
> 
> pcs_major_config()
>   pcs_disable(old_pcs) /* masks IRQ */
>   old_pcs->phylink = NULL;
>   new_pcs->phylink = pl;
>   ...
>   pcs_enable(new_pcs) /* unmasks IRQ */
>   ...
> 
> pcs_handle_irq(new_pcs) /* Link up IRQ */
>   phylink_pcs_change(new_pcs, true)
>     phylink_run_resolve(pl)
> 
> phylink_resolve(pl)
>   /* Link up */

By this time, old_pcs->phylink has been set to NULL as you mentioned
above.

> pcs_handle_irq(old_pcs) /* Link down IRQ (pending from before pcs_disable) */
>   phylink_pcs_change(old_pcs, false)
>     phylink_run_resolve(pl) /* Doesn't see the NULL */

So here, phylink_pcs_change(old_pcs, ...) will read old_pcs->phylink and
find that it's NULL, and do nothing.

> > I guess the possibility would be if pcs->phylink changes and the
> > compiler reads it multiple times - READ_ONCE() should solve that.
> > 
> > However, in terms of the mechanics, there's no race.
> > 
> > During the initial bringup, the resolve worker isn't started until
> > after phylink_major_config() has completed (it's started at
> > phylink_enable_and_run_resolve().) So, if phylink_pcs_change()
> > gets called while in phylink_major_config() there, it'll see
> > that pl->phylink_disable_state is non-zero, and won't queue the
> > work.
> > 
> > The next one is within the worker itself - and there can only
> > be one instance of the worker running in totality. So, if
> > phylink_pcs_change() gets called while phylink_major_config() is
> > running from this path, the only thing it'll do is re-schedule
> > the resolve worker to run another iteration which is harmless
> > (whether or not the PCS is still current.)
> > 
> > The last case is phylink_ethtool_ksettings_set(). This runs under
> > the state_mutex, which locks out the resolve worker (since it also
> > takes that mutex).
> > 
> > So calling phylink_pcs_change() should be pretty harmless _unless_
> > the compiler re-reads pcs->phylink multiple times inside
> > phylink_pcs_change(), which I suppose with modern compilers is
> > possible. Hence my suggestion above about READ_ONCE() for that.
> > 
> > Have you encountered an OOPS because pcs->phylink has become NULL?
> > Or have you spotted another issue?
> 
> I was looking at extending this code, and I was wondering if I needed
> to e.g. take RTNL first. Thanks for the quick response.

Note that phylink_mac_change() gets called in irq context, so this
stuff can't take any mutexes or the rtnl. It is also intended that
phylink_pcs_change() is similarly callable in irq context.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

