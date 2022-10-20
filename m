Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0DBC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 08:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+1ef8CY4rNU4mQk37SBqFAMHnpg/IcaHQ4AFvuNoks=; b=wBLS+mleJBokcY2ET+OcShLYkF
	EG1VGsMgHczrdlVj5rrEEKeWTkPAd5jQkSOCopUrxSnhnvcM99LSR6xBRcdOAk0lOHDiseNS7rvO/
	XLiEsmZ211f0FCxXKiSrASIt0r0pXY4WERSfFq1Y1tdZeA94y40WpdShJlK7a09OQ2cdhbnik25DO
	lHzPcL5JKhrxXkfwUaD70TQiC/aPH6PguzHdzbfXSSmXkcHj6V7urBgRAML6qhk2EG5ppicfg4+j2
	aKnUoV/W2ZFbuOdGtdzkrVorbtkealu5URkF328UhEFAFw1ZuJOou/WaFK6ec5+XiHgkm9kGImd79
	kN128UTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olR1a-00CHsO-N2; Thu, 20 Oct 2022 08:35:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olR1X-00CFcr-I2; Thu, 20 Oct 2022 08:35:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=V+1ef8CY4rNU4mQk37SBqFAMHnpg/IcaHQ4AFvuNoks=; b=GIL9tOLjjdtmPdIM56MUg3cw+p
	q/vk9cqNJnqbmMS7KTOWoEWU83QMLOIuz74N0QNs5F4IdZEXwhpuQnnMnEg+kS1Vwj4ESaMeTsZ6v
	thzoxV6W6b7tBNawqRCx/aPDaRFAvnA4wZ6+9X3pWX9CHgN/qQJplDRGtQQVIAh/BTUOr1Tabszl8
	v4N2z+vPWDHo/wbwHxfbWgL46ZgPHJ47CWnDFgPn+DJPR5I+C57B6kHquYYsZdWhd6LUwhCXlbuOc
	VrecXyGNCXTUMtamT+vZRsTcwYVr9hH9ueUauV1KTejAlhZWpcUtupe2JxRTbZughvjkLuVLTU8t0
	q60AoVvQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34818)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1olQzP-0006j5-TT; Thu, 20 Oct 2022 09:33:19 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1olQzL-00031C-LG; Thu, 20 Oct 2022 09:33:15 +0100
Date: Thu, 20 Oct 2022 09:33:15 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
	Alexander Couzens <lynxis@fe80.eu>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: mtk_sgmii: implement mtk_pcs_ops
Message-ID: <Y1EHy0t5nXOF/3Mw@shell.armlinux.org.uk>
References: <20221018153506.60944-1-linux@fw-web.de>
 <Y07Wpd1A1xxLhIVc@shell.armlinux.org.uk>
 <949F5EE5-B22D-40E2-9783-0F75ACFE2C1F@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <949F5EE5-B22D-40E2-9783-0F75ACFE2C1F@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_013531_614526_46E8BC0A 
X-CRM114-Status: GOOD (  17.21  )
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

On Thu, Oct 20, 2022 at 07:54:49AM +0200, Frank Wunderlich wrote:
> Am 18. Oktober 2022 18:39:01 MESZ schrieb "Russell King (Oracle)" <linux@armlinux.org.uk>:
> >Hi,
> >
> >A couple of points:
> >
> >On Tue, Oct 18, 2022 at 05:35:06PM +0200, Frank Wunderlich wrote:
> 
> >> +	regmap_read(mpcs->regmap, SGMSYS_PCS_CONTROL_1, &val);
> >> +	state->an_complete = !!(val & SGMII_AN_COMPLETE);
> >> +	state->link = !!(val & SGMII_LINK_STATYS);
> >> +	state->pause = 0;
> >
> >Finally, something approaching a reasonable implementation for this!
> >Two points however:
> >1) There's no need to set state->pause if there is no way to get that
> >   state.
> >2) There should also be a setting for state->pause.
> 
> Currently it looks like pause cannot be controlled in sgmii-mode so we disabled it here to not leave it undefined. Should i drop assignment here?

Why do you think it would be undefined?

static void phylink_mac_pcs_get_state(struct phylink *pl,
                                      struct phylink_link_state *state)
{
...
        if  (state->an_enabled) {
...
                state->pause = MLO_PAUSE_NONE;
        } else {
,,,
                state->pause = pl->link_config.pause;
	}
...
        if (pl->pcs)
                pl->pcs->ops->pcs_get_state(pl->pcs, state);

So, phylink will call your pcs_get_state() function having initialised
it to something sensible.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

