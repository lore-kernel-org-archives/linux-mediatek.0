Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAD5C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 22:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ct/iLYoKm72/DfhaeEt2u4sR7x6ULpY5sDqkV7W4748=; b=dJl94YbcCAfoXHAhSssp0wlCZn
	QNpO3bRvexRNQm5FsDqtoKSBuGetNPrQFKROn9sIbEmdIBfC0jmsVYe1JFy/S6SblIZNaVAQos0Fp
	IxXAY0OVqLCOxyKQ9bjxlycVQrEmDIMc1ap1GICSH4NWrpvfJ6nxqf3ZYywgXf0PnqloEk3khjQ2Q
	8Wd1ZZfO2irIg2QNBzbRb68qfuWQr2EcAsmIVU3UETEWi+bw8Yd47qdqP5E8gSLT+vzu+qDjSb+zB
	uC92GmdJo1Mv3za5iziaUJJUy6q/C6+/pQTmmeuucwhmbNuQ0uST7KYbnu0ck1r40VP2lHwWuiEP/
	fM4mICTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEIRG-00Cbqp-6J; Wed, 20 Jul 2022 22:45:06 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEIR4-00Cblu-73; Wed, 20 Jul 2022 22:44:55 +0000
Received: by mail-ed1-x531.google.com with SMTP id t3so202249edd.0;
        Wed, 20 Jul 2022 15:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ct/iLYoKm72/DfhaeEt2u4sR7x6ULpY5sDqkV7W4748=;
        b=Wjuo1LA2j5Lvu+MusadB1CSwVuBZt99+k2xwxyR2ASPnHVJvFMStOqwxT+NT8krTVl
         /gu6jsPiF2wTqLapMOWvQkzv/E4da6ONG00nkWBbRfnOwPIibw3nI9ICJo8/oZILfFiY
         vGn3p//uU6q7Pk/nmELueDFrxul6Aao9gonq2gLcE86BxLGEXaJmPJ/HlOBEmXX2RvSW
         54XskEOFXmlIiogrueC5oZO481Gdyxej6DrZDRpOBL6OYRiWrHueaX0+JNQJ9+H4kS7c
         LbFebX7kOUecwZF7P1XRMWFWQryjZTX2SXeMGEWR2UGxmLUfZBjdKgid7e8UDB8Z/PRt
         PABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ct/iLYoKm72/DfhaeEt2u4sR7x6ULpY5sDqkV7W4748=;
        b=3Ay90gyuCvbo4skmamfwrF5hAPN+dQcRs2evp15U0KeRfNRK9ujiC4MX+Z77Iuvp5Q
         j/p05eDT15oxreWq5T0y6Exk+FA4JtCnRLWC1gA1u1KhtyiDKUwb1TQG+8NLFHfrA0d9
         LfzNvGKUeEGlRFiMVGnqwRe7bybasafv0Y1dOeLZmi6kvALMeZdnLgb6nhDGds3+1Gtk
         Tu33wWAKL7UZIpDW7pgLBs7hJUxbgSRsJICgUbLclntseefdBqFoBu88JsQWzlv8/jfb
         +THrBLJg+gVhXcU6NtU4zjB/kcYi2rQjkm8MCiCKjDhuAM2AN2iQ+JE0huA01hHcQI3C
         r3Aw==
X-Gm-Message-State: AJIora9IWdp8lCppj8GqgVGuJ6T3+0j10fL6z4VFVpLGUffVcqf9qw2I
	kB6t5qb+94004Hy7OM/Au/A=
X-Google-Smtp-Source: AGRyM1vMjLYa4KJBKuoZ3VrnudTHejnE3aEB/ZOYLPSzbKDr2CbtfeK5JoT+rtjtarlWmBfNIBXwXQ==
X-Received: by 2002:a05:6402:f2a:b0:43a:9d53:e0e6 with SMTP id i42-20020a0564020f2a00b0043a9d53e0e6mr54302800eda.394.1658357091241;
        Wed, 20 Jul 2022 15:44:51 -0700 (PDT)
Received: from skbuf ([188.25.231.115])
        by smtp.gmail.com with ESMTPSA id s17-20020aa7cb11000000b0043aa5c2ce17sm126831edt.35.2022.07.20.15.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 15:44:50 -0700 (PDT)
Date: Thu, 21 Jul 2022 01:44:47 +0300
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
Message-ID: <20220720224447.ygoto4av7odsy2tj@skbuf>
References: <E1oCNl3-006e3n-PT@rmk-PC.armlinux.org.uk>
 <E1oCNl3-006e3n-PT@rmk-PC.armlinux.org.uk>
 <20220715172444.yins4kb2b6b35aql@skbuf>
 <YtHcpf4otJQS9hTO@shell.armlinux.org.uk>
 <20220715222348.okmeyd55o5u3gkyi@skbuf>
 <YtHw0O5NB6kGkdwV@shell.armlinux.org.uk>
 <20220716105711.bjsh763smf6bfjy2@skbuf>
 <YtKdcxupT+INVAhR@shell.armlinux.org.uk>
 <20220716123608.chdzbvpinso546oh@skbuf>
 <YtUec3GTWTC59sky@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtUec3GTWTC59sky@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_154454_302080_FF4AF593 
X-CRM114-Status: GOOD (  40.61  )
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

On Mon, Jul 18, 2022 at 09:48:51AM +0100, Russell King (Oracle) wrote:
> > But drivers could also have their CPU port working simply because those
> > are internal to an SoC and don't need any software configuration to pass
> > traffic. In their case, there is no breakage caused by the phylink_pcs
> > conversion, but breakage caused by sudden registration of phylink is
> > plausible, if phylink doesn't get the link parameters right.
> > 
> > And that breakage is preventable. Gradually more drivers could be
> > converted to create a fixed-link software node by printing a warning
> > that they should, and still keep the logic to avoid phylink registration
> > and putting the respective port down. Driver authors might not be very
> > responsive to RFC patch sets, but they do look at new warnings in dmesg
> > and try to see what they're about.
> 
> Are you going to do that conversion then? Good luck trying to find all
> the drivers, sending out series of patches, trying to get people to test
> the changes.

Not sure if that's a rhetorical question and if it is, what it's trying
to prove. Of course I'm not going to do any conversion, that's literally
my whole point, I'd rather err on the side of letting sleeping dogs cry
than force-converting everyone at once.

If there is a breakage report and the driver maintainer won't respond,
then yeah, maybe I'll consider looking at that particular issue and
converting if it helps, but that's kind of why I'm here.

Otherwise, we may end up pushing phylink to drivers which have some
wacky link speeds on the CPU port (like 2000, see b53_force_port_config),
which the software node auto-creation logic absolutely won't get right.
I know Florian said that "we won't see a regression since we do not use
the NATP accelerator which would be the reason to run the port at
2Gbits/sec", but frankly I'm not entirely sure what that even means or
what Florian counts as "regression". Lower overall termination throughput
counts or not? Still not worth risking if this isn't the only instance
of a non-standard speed.

> > What I'm missing is the proof that the phylink_pcs conversion has broken
> > those kinds of switches, and that it's therefore pointless to keep the
> > existing logic for them. Sorry, but you didn't provide it.
> 
> I don't have evidence that existing drivers have broken because I don't
> have the hardware to test. I only have Marvell DSA switch hardware and
> that is it.
> 
> Everything else has to be based on theory because no one bothers to
> respond to my patches, so for 99% of the DSA drivers I'm working in the
> dark - and that makes development an utter shitpile of poo in hell.
> 
> As I've said many times, we have NO CLUE which DSA drivers make use of
> this defaulting behaviour - the only one I'm aware of that does is
> mv88e6xxx. It all depends on the firmware description, driver behaviour
> and hardware behaviour. There is not enough information in the kernel 
> to be able to derive this.
> 
> If there was a reported regression, then I would be looking to get this
> into the NET tree not the NET-NEXT tree.

I think there are authors who weren't even aware they were opting into
this interesting DSA feature when they wrote their driver, but didn't
have the inspiration at the time to validate strict DT bindings either.

We have no proof that they don't have DT blobs using the defaulting
feature somewhere out there, but we don't have any proof that they do,
either. The whole problem could become more manageable if we would let
maintainers say to a user "hey, for my driver this feature was never
intended to work, so sorry if by accident it did, it was a marginal and
undocumented condition and now it's broken, so please use something that
was documented".

The ocelot driver is in this exact state, in fact. I really wish there
was a ready-made helper for validating phylink's OF node; I mentioned this
already, it needs to cater for all of fixed-link/phy-handle/managed/sfp.
The more drivers would be calling this (I think the vast majority of
post-phylink drivers would do it), the more we'd minimize the spectrum
of unforeseen breakage. In turn this would make the issue more tractable.

