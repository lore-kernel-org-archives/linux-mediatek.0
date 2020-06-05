Return-Path: <SRS0=fggR=7S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A4AC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 09:28:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8310A207D5
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 09:28:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tBJujZyy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="GWG19R4t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8310A207D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ak6xe12iQM6XD1wVsKKCrrqxhKQkw7vG2P7dcYQ+2gY=; b=tBJujZyy38JwMo
	bjjqbD/KfesFYJ5ngzO7F6RZ8DgWHpTdv0jPYsjq+l6on17fxwGFZUBeGKvYqHjqsos1dU27Q7tCa
	kGSjRMwi9zwBFkJoHdCFqKoMkjGKsb+Gdt/5tvNEcL5UHVpAO9PI04Mc3Kle3ZCeMiKtdIAgbXBoi
	rWMaIEKO3AliEEL3ST2EyambuGZkRU+J9D1MgZIwn8edkPhNHWYM9qPoG+MrOL2uyomK87mIqIKc3
	w7PJc+Ia56SnJhNbvYqLkHq4IqISkjtm8sq05DoeJgLCSs28QMnUjCfPmipd7l3ksdXcE07DivzVS
	u4UbM6Cr9OGwHOE2aelw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jh8e2-0005se-OC; Fri, 05 Jun 2020 09:28:10 +0000
Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jh8dz-0005rO-MW; Fri, 05 Jun 2020 09:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JD+f68C2xsdIda1o1WPqknMCkMS5OJ8axT7mWVbzTRo=; b=GWG19R4tIHcgtyxteX9uf10fE
 Z7WE2epE/MSItPTXR+xqspTQxH6YYeuyf77a9K8BzhLG1DnAAZcNcrtSQjXOoXrxOnxcz1mjFw40K
 nSHrepHcaoQaIO8hUwaFq3LV7fOPwfekVShU8hky0XpzRdL4JR35CYeaVsIeRIxQh+OhQOmzBtgjj
 JXUyZR1FY1SjUc+B5VpL5f96FdupwBcPTPSGW97+WWiTO0OD/KYX25FWsC82Jpmaj51svWJyJgK4h
 uRsnY2W0Pyr8ypDvkUme5dMS8gpKoiSGoAFv9PNjSB/7k1PvVIpQZZAh/eMLnMzcPbsvhP+Ah7akZ
 mbIqw9Ujw==;
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:49630)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1jh8dR-0001kC-TS; Fri, 05 Jun 2020 10:27:34 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1jh8dC-0007LF-Q0; Fri, 05 Jun 2020 10:27:18 +0100
Date: Fri, 5 Jun 2020 10:27:18 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Neal Liu <neal.liu@mediatek.com>
Subject: Re: Security Random Number Generator support
Message-ID: <20200605092718.GH1551@shell.armlinux.org.uk>
References: <1591085678-22764-1-git-send-email-neal.liu@mediatek.com>
 <CAMj1kXHjAdk5=-uSh_=S9j5cz42zr3h6t+YYGy+obevuQDp0fg@mail.gmail.com>
 <85dfc0142d3879d50c0ba18bcc71e199@misterjones.org>
 <1591169342.4878.9.camel@mtkswgap22>
 <fcbe37f6f9cbcde24f9c28bc504f1f0e@kernel.org>
 <20200603093416.GY1551@shell.armlinux.org.uk>
 <1591341543.19510.4.camel@mtkswgap22>
 <20200605080905.GF1551@shell.armlinux.org.uk>
 <1591347582.21704.9.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1591347582.21704.9.camel@mtkswgap22>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200605_022807_738268_4DDE41EC 
X-CRM114-Status: GOOD (  21.17  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Julius Werner <jwerner@google.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Marc Zyngier <maz@kernel.org>, Matt Mackall <mpm@selenic.com>,
 Sean Wang <sean.wang@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Crystal Guo =?utf-8?B?KOmDreaZtik=?= <Crystal.Guo@mediatek.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jun 05, 2020 at 04:59:42PM +0800, Neal Liu wrote:
> On Fri, 2020-06-05 at 09:09 +0100, Russell King - ARM Linux admin wrote:
> > On Fri, Jun 05, 2020 at 03:19:03PM +0800, Neal Liu wrote:
> > > On Wed, 2020-06-03 at 17:34 +0800, Russell King - ARM Linux admin wrote:
> > > > This kind of thing is something that ARM have seems to shy away from
> > > > doing - it's a point I brought up many years ago when the whole
> > > > trustzone thing first appeared with its SMC call.  Those around the
> > > > conference table were not interested - ARM seemed to prefer every
> > > > vendor to do off and do their own thing with the SMC interface.
> > > 
> > > Does that mean it make sense to model a sec-rng driver, and get each
> > > vendor's SMC function id by DT node?
> > 
> > _If_ vendors have already gone off and decided to use different SMC
> > function IDs for this, while keeping the rest of the SMC interface
> > the same, then the choice has already been made.
> > 
> > I know on 32-bit that some of the secure world implementations can't
> > be changed; they're burnt into the ROM. I believe on 64-bit that isn't
> > the case, which makes it easier to standardise.
> > 
> > Do you have visibility of how this SMC is implemented in the secure
> > side?  Is it in ATF, and is it done as a vendor hack or is there an
> > element of generic implementation to it?  Has it been submitted
> > upstream to the main ATF repository?
> > 
> 
> Take MediaTek as an example, some SoCs are implemented in ATF, some of
> them are implemented in TEE. We have no plan to make generic
> implementation in "secure world".

I think you have your answer right there - by _not_ making the API
generic and giving no motivation to use it, different vendors are
going to do different things (maybe even with a different API as well)
so there's no point the kernel driver pretending to be a generic
driver. If the driver isn't going to be generic, I see little point in
the SMC function number being in DT.

I think that as a _whole_ is a big mistake - there should be a generic
kernel driver for this, and there should be a standardised interface to
it through firmware.  So, I would encourage you to try to get it
accepted one way or another amongst vendors as a standardised
interface.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC for 0.8m (est. 1762m) line in suburbia: sync at 13.1Mbps down 424kbps up

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
