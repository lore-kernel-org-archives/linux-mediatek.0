Return-Path: <SRS0=bzTf=AF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E3AC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 16:51:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C69F920738
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 16:51:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HOgiAuJZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="ZGlh5RxW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C69F920738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aYDCDUbJJq8vDpNVlY6TK4gyraoIR/Otc4EcXwZOqII=; b=HOgiAuJZouC0LTIdnFWTu6ELq
	Ui17Mpv6vX2vq7bm4WpNY/AoY7fQ+wlunT5EIS1i/BXlGeF8QogNBJpQsl7RbcXkzsWufoC3tQzMK
	nDvFR1EH6yQB4g3SFanQ7fapc6E5GhG0BeAZibeVy/yVWB1jELRBcOJHkTQhskFfT7CjwjZtNseFn
	Qve5oVhhUdHO5d8mSGIk23/rUWo146bgtwS2cpcrvFpJNfXMIg7dj4Pgm0Ddq6sel2ryhGIJY6V6R
	1bmAg1+o/OJGStL2/eec+EqB9og1fMsdQ1waXhy6/81cj9t2BWsqgQt/POBN79kcot/q67lOF7Bp8
	arfzZjOSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jo8bu-0002Iu-MS; Wed, 24 Jun 2020 16:50:54 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo8bp-0002GJ-15; Wed, 24 Jun 2020 16:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u1F8tzMKngdxJFt6gQRkq7xv28jRUmanHyUKEBsVcpo=; b=ZGlh5RxW4InxZ7Jr34mRSgpIP
 BC2ZXdwKmi/rqOnIyw8h6eqsHXyNX5FojKj6InS5slHvG3YMArCT54vpxpu/7MGSLfuaGmwGzbjv+
 z/F3ILATxpDuv6PPr5chSvFdCgfo4Pi+HjIZ9EfUnKQ4q5mLqCx8/LNBM3Tl8h28x2JUtDhFCi5hl
 xP9NWxSApDu96csu/sWRtzkhfjU7KWm5HOnwDz4bM8JRzCxtv2hAmeo9GTJ1biToCaETwYv2b+9h9
 Nb67L1V53qnsN8mxbjmrZqWHzVcqXEiI5d3te+Xn/oBrbQErI5XzcXyRpZ6S6nA1ckuLGZVIpMs+P
 fapGRzjCg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59220)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1jo8bQ-0003Ld-UJ; Wed, 24 Jun 2020 17:50:24 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1jo8bI-00027P-9n; Wed, 24 Jun 2020 17:50:16 +0100
Date: Wed, 24 Jun 2020 17:50:16 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 09/15] net: phy: delay PHY driver probe until PHY
 registration
Message-ID: <20200624165016.GA1551@shell.armlinux.org.uk>
References: <20200622093744.13685-1-brgl@bgdev.pl>
 <20200622093744.13685-10-brgl@bgdev.pl>
 <20200622133940.GL338481@lunn.ch>
 <20200622135106.GK4560@sirena.org.uk>
 <dca54c57-a3bd-1147-63b2-4631194963f0@gmail.com>
 <20200624094302.GA5472@sirena.org.uk>
 <CAMRc=McBxJdujCyjQF3NA=bCWHF1dx8xJ1Nc2snmqukvJ_VyoQ@mail.gmail.com>
 <f806586d-a6d7-99af-bba4-d1e7d28be192@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f806586d-a6d7-99af-bba4-d1e7d28be192@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 devicetree <devicetree@vger.kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Frank Rowand <frowand.list@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jakub Kicinski <kuba@kernel.org>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Salil Mehta <salil.mehta@huawei.com>, netdev <netdev@vger.kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Pedro Tsai <pedro.tsai@mediatek.com>, "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jun 24, 2020 at 09:06:28AM -0700, Florian Fainelli wrote:
> On 6/24/2020 6:48 AM, Bartosz Golaszewski wrote:
> > I didn't expect to open such a can of worms...
> > 
> > This has evolved into several new concepts being proposed vs my
> > use-case which is relatively simple. The former will probably take
> > several months of development, reviews and discussions and it will
> > block supporting the phy supply on pumpkin boards upstream. I would
> > prefer not to redo what other MAC drivers do (phy-supply property on
> > the MAC node, controlling it from the MAC driver itself) if we've
> > already established it's wrong.
> 
> You are not new to Linux development, so none of this should come as a
> surprise to you. Your proposed solution has clearly short comings and is
> a hack, especially around the PHY_ID_NONE business to get a phy_device
> only then to have the real PHY device ID. You should also now that "I
> need it now because my product deliverable depends on it" has never been
> received as a valid argument to coerce people into accepting a solution
> for which there are at review time known deficiencies to the proposed
> approach.

It /is/ a generic issue.  The same problem exists for AMBA Primecell
devices, and that code has an internal deferred device list that it
manages.  See drivers/amba/bus.c, amba_deferred_retry_func(),
amba_device_try_add(), and amba_device_add().

As we see more devices gain this property, it needs to be addressed
in a generic way, rather than coming up with multiple bus specific
implementations.

Maybe struct bus_type needs a method to do the preparation to add
a device (such as reading IDs etc), which is called by device_add().
If that method returns -EPROBE_DEFER, the device gets added to a
deferred list, which gets retried when drivers are successfully
probed.  Possible maybe?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
