Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1B0C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jul 2022 12:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgD/pharyBaB7Z1X5RbNvF9c14viaV8XyTUNMz6EOCI=; b=QJxLRr7y6Vx4/IbbBCFBTi51tM
	4fSCs64W7oejX2t7N4UGWd39PAeKEPkQrxNkVtIqYA3FkytHxvns+naetV+u5PnWr0pA5f09I+CA1
	LcFeZcI3gDteVuO/AjB6sTkgq3pQoZmTc7Xcg/dCKx+e4xyj4BIz0x5jSBNdiiGXYvXjBnIn/LcvC
	+xes5Rru98rUUKqsdylA74ExE0b2WYKnxikNgL2GQr1AiBQltIDd5nZ0lQSYbhco/bkbdEzwzcIXJ
	7XfxH/oSPFtQyNlrBrY70nQHJK1KyVyHR2hiaxmRxArlGd/UaoyVlQ2a4xUGi6/Y+KI96ffeYRn2a
	Z3p8k9uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCh22-00G2YJ-1s; Sat, 16 Jul 2022 12:36:26 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCh1q-00G2UV-IN; Sat, 16 Jul 2022 12:36:16 +0000
Received: by mail-ej1-x629.google.com with SMTP id oy13so13271922ejb.1;
        Sat, 16 Jul 2022 05:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MgD/pharyBaB7Z1X5RbNvF9c14viaV8XyTUNMz6EOCI=;
        b=XZGwAjHFN4VB5fRzadMof5wVuADmccc2sugcyvK96Foy8EUYvCbjA4WszgY34vbMpT
         gtSHwJUjxXnhOgsp5zNnqDbeFoQoJdRpWU48rRZHnpWZYroR47gIGEPu3//Yuln7YSwd
         uHtjjNsCv3y7se6I9SuEKnXttT8wPJDmunZ4KnLZrUt/I8QzePl544PpBD/YMmYk/0iA
         5DwyptdT7Es9Adodr3EBktox0guqixD0vGAkP690m3TqD4pWMFhO8xtg4r4nI/lYjama
         nfLqSq4kcHfHDBfxnMPPOmUWsKm0/2cpiqawk90SRl7RnKNLaC4bmR9mpSLeWz9uM//4
         IijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MgD/pharyBaB7Z1X5RbNvF9c14viaV8XyTUNMz6EOCI=;
        b=kmah6zeReJhxBb8cz87ivxPnyObktiuv41sW7d7wLolp+TlKUXX4O00casV7jSOLi0
         NF/iUNJpI+vTpl4YYroWo8cHGUibK9qyWbFAobDpEhWsrdL7VXk4Go401eDIRqRr4glo
         536ZBKEGU/1/DXEdJYr38hOTJUqu8T1OxiulS2GzEAB61D8LTaovpc+q50hVLt3Nu8ST
         b+h1/C0bBvX2qcmRImizLD6pNRVarkdFSlMIwsKLpk0roUHxX+2aFU3Q1rwyAc80T22D
         s6kMrBXko9Vf2YYiLyh14En2/rDHuua5L4TJsfa00TJa30yN4c0XtNz10p4efvmRqpyT
         2Nuw==
X-Gm-Message-State: AJIora9DkLB5a3ZAZM11S4v2G92E/QadOMmqMT2Nhj7EKAIpsYta3Agq
	vOlT57UtoBqpwQkIIvWxN4w=
X-Google-Smtp-Source: AGRyM1sPp9naaeh9urEonWuKSlo8OhnpJ+4apJkp9jQcKK8WA0xONy5biQtGYBzHbMvk1Omr9stRTw==
X-Received: by 2002:a17:906:2086:b0:712:1257:77bf with SMTP id 6-20020a170906208600b00712125777bfmr18711319ejq.655.1657974972353;
        Sat, 16 Jul 2022 05:36:12 -0700 (PDT)
Received: from skbuf ([188.25.231.115])
        by smtp.gmail.com with ESMTPSA id s12-20020a1709064d8c00b006feec47dae9sm3169244eju.157.2022.07.16.05.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 05:36:11 -0700 (PDT)
Date: Sat, 16 Jul 2022 15:36:08 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin __ipraga <alsi@bang-olufsen.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Daniel Scally <djrscally@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	George McCollister <george.mccollister@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sean Wang <sean.wang@mediatek.com>, UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Subject: Re: [PATCH net-next 3/6] net: dsa: add support for retrieving the
 interface mode
Message-ID: <20220716123608.chdzbvpinso546oh@skbuf>
References: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
 <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
 <E1oCNl3-006e3n-PT@rmk-PC.armlinux.org.uk>
 <E1oCNl3-006e3n-PT@rmk-PC.armlinux.org.uk>
 <20220715172444.yins4kb2b6b35aql@skbuf>
 <YtHcpf4otJQS9hTO@shell.armlinux.org.uk>
 <20220715222348.okmeyd55o5u3gkyi@skbuf>
 <YtHw0O5NB6kGkdwV@shell.armlinux.org.uk>
 <20220716105711.bjsh763smf6bfjy2@skbuf>
 <YtKdcxupT+INVAhR@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtKdcxupT+INVAhR@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_053614_636903_E4F25808 
X-CRM114-Status: GOOD (  47.52  )
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

On Sat, Jul 16, 2022 at 12:13:55PM +0100, Russell King (Oracle) wrote:
> > > and is exactly what I'm trying to get rid of, so we have _consistency_
> > > in the implementation, to prevent fuckups like I've created by
> > > converting many DSA drivers to use phylink_pcs. Any DSA driver that
> > > used a PCS for the DSA or CPu port and has been converted to
> > > phylink_pcs support has been broken in the last few kernel cycles. I'm
> > > trying to address that breakage before converting the Marvell DSA
> > > driver - which is the driver that highlighted the problem.
> > 
> > You are essentially saying that it's of no use to keep in DSA the
> > fallback logic of not registering with phylink, because the phylink_pcs
> > conversions have broken the defaulting functionality already in all
> > other drivers.
> 
> Correct, and I don't want these exceptions precisely because it creates
> stupid mistakes like the one I've highlighted. If we have one way of
> doing something, then development becomes much easier. When we have
> multiple different ways, mistakes happen, stuff breaks.

Agree that when we have multiple different ways, mistakes happen and
stuff breaks. This is also why I want to avoid the proliferation of the
default_interface reporting when most of the drivers were just fine
without it. It needs to be opt-in, and checking for the presence of a
dedicated function is an easy way to check for that opt-in.

> > I may have missed something, but this is new information to me.
> > Specifically, before you've said that it is *this* patch set which would
> > risk introducing breakage (by forcing a link down + a phylink creation).
> > https://lore.kernel.org/netdev/YsCqFM8qM1h1MKu%2F@shell.armlinux.org.uk/
> > What you're saying now directly contradicts that.
> 
> No, it is not contradictory at all.
> 
> There is previous breakage caused by converting DSA drivers to
> phylink_pcs - because the PCS code will *not* be called where a driver
> makes use of the "default-to-fastest-speed" mechanism, so is likely
> broken. Some drivers work around this by doing things manually.

Marvell conversion to phylink_pcs doesn't count as "previous" breakage
if it's not in net-next.

> This series *also* risks breakage, because it means phylink gets used
> in more situations which could confuse drivers - such as those which
> have manually brought stuff up and are not expecting phylink to also
> do it. Or those which do not fill in the mac_capabilities but do
> default to this "fastest-speed" mechanism. Or some other unforseen
> scenario.

I don't exactly understand the mechanics through which a phylink_pcs
conversion would break a driver that used defaulting behavior,
but I can only imagine it involves moving code that didn't depend on
phylink, to phylink callbacks. It's hard to say whether that happened
for any of the phylink_pcs conversions in net-next.

But drivers could also have their CPU port working simply because those
are internal to an SoC and don't need any software configuration to pass
traffic. In their case, there is no breakage caused by the phylink_pcs
conversion, but breakage caused by sudden registration of phylink is
plausible, if phylink doesn't get the link parameters right.

And that breakage is preventable. Gradually more drivers could be
converted to create a fixed-link software node by printing a warning
that they should, and still keep the logic to avoid phylink registration
and putting the respective port down. Driver authors might not be very
responsive to RFC patch sets, but they do look at new warnings in dmesg
and try to see what they're about.

What I'm missing is the proof that the phylink_pcs conversion has broken
those kinds of switches, and that it's therefore pointless to keep the
existing logic for them. Sorry, but you didn't provide it.

> So there's known breakage - which we know because we've tripped over
> the issue with mv88e6xxx pcs conversion which isn't in net-next yet,
> but illustrates the issue, and there's unknown breakage through
> applying this patch and not having had test feedback from all the
> DSA driver authors.
> 
> There are no contradiction there what so ever.
> 
> > Do you have concrete evidence that there is actually any regression of
> > this kind introduced by prior phylink_pcs conversions? Because if there
> > is, I retract the proposal to keep the fallback logic.
> 
> Since we have no idea which DSA drivers make use of this "default-to-
> fastest-speed", and Andrew who has been promoting this doesn't seem to
> know which drivers make use of this, I do not, but we know that the
> breakage does occur if someone does make use of this with one of the
> converted DSA drivers through the behaviour of mv88e6xxx. Just because
> no one has reported it yet does not mean it doesn't exist. Not everyone
> updates their kernels each time Linus releases a final kernel version,
> especially in the embedded world. Sometimes it can take until a LTS
> release until people move forward, which we think will be 5.21.

