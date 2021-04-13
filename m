Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B71C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 08:07:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C56AF60FE8
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 08:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C56AF60FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Subject:Cc:To:
	From:Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=liKQsrplFME3hBCiZQmIM8RCLWbfcI2w2Ak1ppFNVqk=; b=koNQfUq5Txyt0lDW8jNxW7WF2
	kzaBsB+r+/k60gulbugNCe3MjQzoBpowd8H+N8wXix6T4HAeRgpd7fKviYfgUIZUMgIJtFM6p1AP6
	HNWB5elN9MU3gT8D5JcZQ4fsH488B6b/6GObXaWDwX0EMnfHNw173S+Zry9CFYn7SFXYNhUStJGky
	uUSR6chBrh7NN48VMK5JJ6P1whFESAAM8tu9IVTZkNMV5cOu2UJsn82YF1EI4xNGX9VE+z/rFuVAO
	PNRp5lrh4z0vRAzv5XhyjEHLsG3pjU3qlhS6IoFKTDbU3MOvetvoql38b6tuBWi6GDIw/hRVoqhp8
	oiuAm8+wg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWE4a-008Yv0-Jf; Tue, 13 Apr 2021 08:07:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWE4X-008YuU-WC
 for linux-mediatek@desiato.infradead.org; Tue, 13 Apr 2021 08:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:References:
 In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=rnsICoOp3dSNru6uo6GdxnkGJAO409kCU43CpVnYVl0=; b=WDa4PnLA8n/itIGnU7AZOwHYX0
 1f1vwKzy6byIVf3K3EV8i7cFSOaq4CTY6c5hjMfI7/4Pgl8DS25XRjlM9++QnD59eF5mSLJSFFlh0
 IYY3Eo7eE594/1AJRvEJzCIY5ghffWfTfEaQae77zAc2zUABE7SdhHLtnUAkBb28cDnWB28EZKaMF
 gWS6MfeqesPdnssXj7b4AmIn3Gfl6a9l5AZSqo1m6CogxgvvtfBoR4icG4/wk69DHJ656kEejdPrC
 1bidBDAjT88bTDgp4pRFBfwGs5CY4HFsMseSFF9j3frijrp9ImPCgbisl1S8blnUcGMM9RGPFEE8B
 tycLq/rQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWE4V-006p24-Co
 for linux-mediatek@lists.infradead.org; Tue, 13 Apr 2021 08:06:56 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9CB6960FE8;
 Tue, 13 Apr 2021 08:06:54 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lWE4S-007BTF-H5; Tue, 13 Apr 2021 09:06:52 +0100
Date: Tue, 13 Apr 2021 09:06:51 +0100
Message-ID: <8735vuobfo.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: DENG Qingfang <dqfext@gmail.com>,	"David S. Miller"
 <davem@davemloft.net>,	Florian Fainelli <f.fainelli@gmail.com>,	Heiner
 Kallweit <hkallweit1@gmail.com>,	Jakub Kicinski <kuba@kernel.org>,	Landen
 Chao <Landen.Chao@mediatek.com>,	Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>,	Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,	Vladimir Oltean
 <olteanv@gmail.com>,	Rob Herring <robh+dt@kernel.org>,	Linus Walleij
 <linus.walleij@linaro.org>,	Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,	Sergio Paracuellos
 <sergio.paracuellos@gmail.com>,	linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,	linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org,	netdev@vger.kernel.org,	Weijie Gao
 <weijie.gao@mediatek.com>,	Chuanhong Guo <gch981213@gmail.com>,
 =?UTF-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,	Frank Wunderlich
 <frank-w@public-files.de>,	Thomas Gleixner <tglx@linutronix.de>,	Greg
 Ungerer <gerg@kernel.org>
Subject: Re: [RFC v4 net-next 2/4] net: dsa: mt7530: add interrupt support
In-Reply-To: <YHTgu1+6GZFdFgWJ@lunn.ch>
References: <20210412034237.2473017-1-dqfext@gmail.com>
 <20210412034237.2473017-3-dqfext@gmail.com>
 <87fszvoqvb.wl-maz@kernel.org>
 <20210412152210.929733-1-dqfext@gmail.com>
 <YHTgu1+6GZFdFgWJ@lunn.ch>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: andrew@lunn.ch, dqfext@gmail.com, davem@davemloft.net,
 f.fainelli@gmail.com, hkallweit1@gmail.com, kuba@kernel.org,
 Landen.Chao@mediatek.com, matthias.bgg@gmail.com, linux@armlinux.org.uk,
 sean.wang@mediatek.com, vivien.didelot@gmail.com, olteanv@gmail.com,
 robh+dt@kernel.org, linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 sergio.paracuellos@gmail.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, weijie.gao@mediatek.com,
 gch981213@gmail.com, opensource@vdorst.com, frank-w@public-files.de,
 tglx@linutronix.de, gerg@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_010655_586235_CF323861 
X-CRM114-Status: GOOD (  30.10  )
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

On Tue, 13 Apr 2021 01:07:23 +0100,
Andrew Lunn <andrew@lunn.ch> wrote:
> 
> > > > +static void
> > > > +mt7530_setup_mdio_irq(struct mt7530_priv *priv)
> > > > +{
> > > > +	struct dsa_switch *ds = priv->ds;
> > > > +	int p;
> > > > +
> > > > +	for (p = 0; p < MT7530_NUM_PHYS; p++) {
> > > > +		if (BIT(p) & ds->phys_mii_mask) {
> > > > +			unsigned int irq;
> > > > +
> > > > +			irq = irq_create_mapping(priv->irq_domain, p);
> > > 
> > > This seems odd. Why aren't the MDIO IRQs allocated on demand as
> > > endpoint attached to this interrupt controller are being probed
> > > individually? In general, doing this allocation upfront is an
> > > indication that there is some missing information in the DT to perform
> > > the discovery.
> > 
> > This is what Andrew's mv88e6xxx does, actually. In addition, I also check
> > the phys_mii_mask to avoid creating mappings for unused ports.
> 
> It can be done via DT, using the standard interrupt property, so long
> as you use of_mdiobus_register(np).
> 
> But when you have an 7 port switch, and a nice simple mapping, port 0
> PHY using interrupt 0, you can save a lot of device tree boilerplate
> by doing it in code. And when you have 4 of these switches, it gets
> very boring adding all the DT to just wire up the interrupts 28
> interrupts.

I guess this is depends whether the most usual case is to have all
these interrupts being actively in use or not. Most interrupts only
use a limited portion of their interrupt space at any given time.
Allocating all interrupts and creating mappings upfront is a waste of
memory.

If the use case here is that all these interrupts will be wired and
used in most cases, then upfront allocation is probably not a problem.

	M.

-- 
Without deviation from the norm, progress is not possible.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
