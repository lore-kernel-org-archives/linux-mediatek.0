Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B91C4BA0E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 10:13:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AF5A20838
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 10:13:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pDuqp54N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="v6DlCO/O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AF5A20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZsYNH9sVVdR94W7/VyReuXWVB2NzGCcMvChIjdZ490w=; b=pDuqp54NcX7+FK
	AcgJQdPZOlKU6Mov+ggSAkp6BkxuIO1xboKDqfaGmlpNXViklflFyR78cj6VgqxQuX26hUXRAAid5
	uodEShNmXWg6qmVIO5SA+McBpf4+OPmP/xEv01aoyz5GkD5/F5I93IC5ypSn0BiCJXB9elRJ71CHg
	VKuvyGutoySRdenudB3IJW2XuRRVUXOiWxof8W/zTPiERhfNt8mLfV3LSMpOMIEe5Lniav+eyq2fn
	7y094htTgShdw02/pB0+bUJShF56L+Q1GMYVatYLMp/HMJPzq6z5iCxlEwba/3TWZ5FjxBRb8ySzH
	bcxdbSnObwZBxa+XSUnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6tgi-0000XM-KB; Wed, 26 Feb 2020 10:13:08 +0000
Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6tgV-0000Oe-2l; Wed, 26 Feb 2020 10:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CAamW1A7wSi+dl1kSJ3MLj0iB7qeqpYQKI22daCCGM8=; b=v6DlCO/OJmb9kQvoiXW+Zr432
 8BvCAsk7BQEZrQZMpP9iJSc7ZzWQ1beEXWg6f1rkJar2gHLh0bO6C6g55IjbliVm8GG4wOPoJ5Ua6
 vdY5znpf7BdEkxFYx1esKe7H+3s72RVuWJei0owKFkgQfwQhq1p1LxnrcjjwuMtgy8iRnkfHSDWCU
 ppAdE2TIyan/4aiw8Za37GFy7p9KLPAfuhtItrM+Jis7E9Z6EPwm8rGSfhBsW5F9DrRXs0k6PUwkh
 r9XT5Ir1bufpF5nVPFO5gkuAhgxd3lpmT5fPbnsxbBNoWcWXG+AklBbInbQTfslvbHfTUtRdAfMqJ
 fNfXuKgBA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57116)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1j6tfp-0006nj-Vd; Wed, 26 Feb 2020 10:12:14 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1j6tfh-0008KB-0V; Wed, 26 Feb 2020 10:12:05 +0000
Date: Wed, 26 Feb 2020 10:12:04 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH net-next 5/8] net: dpaa2-mac: use resolved link config in
 mac_link_up()
Message-ID: <20200226101204.GW25745@shell.armlinux.org.uk>
References: <20200225093703.GS25745@shell.armlinux.org.uk>
 <E1j6WgG-0000TJ-CC@rmk-PC.armlinux.org.uk>
 <DB8PR04MB68282F710FB598B977C36F99E0ED0@DB8PR04MB6828.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DB8PR04MB68282F710FB598B977C36F99E0ED0@DB8PR04MB6828.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_021255_122901_51C50A80 
X-CRM114-Status: GOOD (  15.80  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Vladimir Oltean <olteanv@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 25, 2020 at 04:36:32PM +0000, Ioana Ciornei wrote:
> > Subject: [PATCH net-next 5/8] net: dpaa2-mac: use resolved link config in
> > mac_link_up()
> > 
> > Convert the DPAA2 ethernet driver to use the finalised link parameters in
> > mac_link_up() rather than the parameters in mac_config(), which are more
> > suited to the needs of the DPAA2 MC firmware than those available via
> > mac_config().
> > 
> > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> 
> Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com>

Thanks.

> > +
> > +		/* This is lossy; the firmware really should take the pause
> > +		 * enablement status rather than pause/asym pause status.
> > +		 */
> 
> In what sense it's lossy? I cannot see how information can be lost by translating the rx/tx pause state to pause/asym.
> If it's just about the unnecessary double translation, then I agree.. this could have been done in an easier manner.

If you're just translating rx/tx to pause/asym and then doing the
reverse, then it isn't lossy, but if the firmware is resolving
pause/asym according to the table in IEEE 802.3, then it will be
lossy.

If the firmware doesn't interpret the bits, then why not do the
sensible thing and just pass the enablement status rather than
trying to confusingly encode it back to pause/asym?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
