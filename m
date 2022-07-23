Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F19C43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jul 2022 13:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49amiazncfe+YGfCcsE1Umxq5UaZUxFQiGQFBx6ze1c=; b=cFv246OXvANpa8aL7VHpmHVTAn
	HjloYQnWFgmeznRO5nmhoedISPRULUHhROOu2Yml04IcGirgCgGHjTKUOcuCPV4G8VTMU8F3fTEJ7
	UvR1yTwdrbAiNgP/tD317J0lc2xtZlAx5Y5uQxbD1ODLSBzCHyhmwFFY4ZiL8XWSdch1TBDGPRX1E
	f3bxeeK2Ch06uLHOHFNM0q6YxnrYm+M5+ST+2A40se9TMOGh51tBmzKpJmimNv0M0LRMkutkh0oKi
	pIsW4ACxMfigNJakIPdOXmSHctK8FueJGbXsFFRMhwxLUOENPwBgmEuNig9+bx/OuDncabyz5I1/W
	SrSD8F1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFFRJ-003TxP-EM; Sat, 23 Jul 2022 13:45:05 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFFR5-003Tp0-Kq; Sat, 23 Jul 2022 13:44:53 +0000
Received: by mail-ej1-x62b.google.com with SMTP id mf4so13019026ejc.3;
        Sat, 23 Jul 2022 06:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=49amiazncfe+YGfCcsE1Umxq5UaZUxFQiGQFBx6ze1c=;
        b=GLIzSCflcbjXQKRTFNrUPUCwiNVLFsPGiGJTuboZnWUsmIuIflEZO+CT6K5TmH7rbn
         RCzLCwDXGvlTP9QmVPo3bhZjTFjnw/SlnMR3uqYCjusfuTisFXtgjvYyt2ZGulp8HT2Y
         d9fa7k1valp+ReEH69JJtiBLmn5fDHE1Ik89gedHUzegG2JyLzkrpHQ9bFP6j9qrukPy
         CoJMS8qw+MSB9+LSt20cGAS9do5ANXxYx47Y9pXZq3dQrE5YnNCBi0gLefo7XJTpTTm+
         QXCMZ7J1bsXPgvFdumg8YVyJAJEPNqeKR8e54kAhIAuZPjBEzyz+Qb318dbcFAsChVL7
         wEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=49amiazncfe+YGfCcsE1Umxq5UaZUxFQiGQFBx6ze1c=;
        b=ruVkMTAQlah/RbmPY+4xRyawfPocoPSdVSFRY56SFi1xk9V5e0UYUWwhLfnKYrMOFg
         EuQ3mtMM3OC0e0mNkErTQceIVLibNteZNPHf1po1ZZ7ksv2CkqjK2BHXSWSfLtJdPQGg
         N1odL92OfWtxcdkmcJW8ceOSzzapu+5OTBFbNiIEMScruC5RDahqaH73b9DxfFm81t1V
         kWMaNx6abLwtofypiBfsBo6vMb0BJoTwG1ZlxhUaM7yEe7UzOoPLYK4cvm0zdOt1sQnX
         VEVWl0cravQIBKAR5TD3Lgdmd6x0vToCrz8xfmumDLQMYaLp1s3m71WNLEPrZj8rjMrA
         loYg==
X-Gm-Message-State: AJIora8b/DkMr0YlIO1+9zJ1BjHkQ+7lBgojzp4i34cSIrhAWyIEG3FV
	hspyhuGe0oyKOLma1PxHWu0=
X-Google-Smtp-Source: AGRyM1uVkPV5hLTPJLLcAQ9tlPKSclPGRO6ACvn74IDvvQ5HKYpLnh7Bs/psd8uUthI973Mvf4L3mQ==
X-Received: by 2002:a17:907:9608:b0:72f:4b13:c66c with SMTP id gb8-20020a170907960800b0072f4b13c66cmr3445161ejc.531.1658583888669;
        Sat, 23 Jul 2022 06:44:48 -0700 (PDT)
Received: from skbuf ([188.25.231.115])
        by smtp.gmail.com with ESMTPSA id 16-20020a170906301000b0072efb6c9697sm3171067ejz.101.2022.07.23.06.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 06:44:47 -0700 (PDT)
Date: Sat, 23 Jul 2022 16:44:44 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
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
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH net-next 3/6] net: dsa: add support for retrieving the
 interface mode
Message-ID: <20220723134444.e65w3zq6pg43fcm4@skbuf>
References: <YtpfmF37FmfY6BV5@shell.armlinux.org.uk>
 <20220722105238.qhfq5myqa4ixkvy4@skbuf>
 <YtqNkSDLRDtuooy/@shell.armlinux.org.uk>
 <20220722124629.7y3p7nt6jmm5hecq@skbuf>
 <YtqjFKUTsH4CK0L+@shell.armlinux.org.uk>
 <20220722165600.lldukpdflv7cjp4j@skbuf>
 <YtsUhdg3a2rT3NJC@shell.armlinux.org.uk>
 <YtsUhdg3a2rT3NJC@shell.armlinux.org.uk>
 <20220722223932.poxim3sxz62lhcuf@skbuf>
 <YtufRO+oeQgmQi57@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtufRO+oeQgmQi57@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_064451_747167_EA5E0F19 
X-CRM114-Status: GOOD (  27.19  )
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

On Sat, Jul 23, 2022 at 08:12:04AM +0100, Russell King (Oracle) wrote:
> > > > Thanks for this explanation, if nothing else, it seems to support the
> > > > way in which I was interpreting managed = "in-band-status" to mean
> > > > "enable in-band autoneg", but to be clear, I wasn't debating something
> > > > about the way in which mvneta was doing things. But rather, I was
> > > > debating why would *other* drivers do things differently such as to come
> > > > to expect that a fixed-link master + an in-band-status CPU port, or the
> > > > other way around, may be compatible with each other.
> > > 
> > > Please note that phylink makes a DT specification including both a
> > > fixed-link descriptor and a managed in-band-status property illegal
> > > because these are two different modes of operating the link, and they
> > > conflict with each other.
> > 
> > Ok, thank you for this information which I already knew, what is the context?
> 
> FFS. You're the one who's writing emails to me that include *both*
> "fixed-link" and "in-band-status" together. I'm pointing out that
> specifying that in DT for a port together is not permitted.
> 
> And here I give up reading this email. Sorry, I'm too frustrated
> with this nitpicking, and too frustrated with spending hours writing a
> reply only to have it torn apart.

This is becoming toxic. You've imagined that when I was talking about
mixing fixed-link and managed = "in-band-status" I was referring to this
kind of DSA port OF node:

	port@N {
		managed = "in-band-status";

		fixed-link {
			speed = <1000>;
			full-duplex;
		};
	};

Now you're thinking I'm retarded because you've politely told me the above
is invalid, and you're wondering why I'm still talking despite of that.

Well guess what, I've never once mentioned this kind of invalid OF node,
I'm not the one who's writing emails to you that include
"both fixed-link and in-band-status together", yet in your mind the fact
that you may have misunderstood isn't even a possibility. What I'm
talking about is TWO OF nodes, one like this:

	master: ethernet@N: {
		managed = "in-band-status";
	};

	switch_cpu_port: port@N: {
		ethernet = <&master>;

		fixed-link {
			speed = <1000>;
			full-duplex;
		};
	};

It is *these* two that need to agree on in-band autoneg, when the "fixed-link"
of switch_cpu_port was created using software nodes, damn it. Andrew
said that it isn't specified whether in-band autoneg is used or not.
It was even repeated for the millionth time in the continuation of my
email, which you should have read instead of frustrating yourself for a
stupid reason again.

If you think I'm making this up and I *was* talking about in-band-status
and fixed-link together in the same node, go ahead and search back where
I've said that, or even implied that. But don't blame me when you'll get
frustrated again that you won't find it. I re-read what I said once
yesterday and once today.

That's where our communication problem is, you're politely trying to
tell your conversation partner that he's an idiot and he JUST DOESN'T
WANT TO UNDERSTAND, DAMN IT.

In any case, it looks like it's time to remove myself from this conversation.
I am going to propose a patch shortly which adds validation in DSA for
the OF nodes of DSA and CPU ports, and opts some drivers out of it.
I'm going to opt into validation as many drivers as reasonably possible.
You'll then have to work with the driver maintainers who opted out of
it. I'm not one of them, so you won't have to work with me. Beyond that,
I just don't care and I had enough. I have other things to do too.

