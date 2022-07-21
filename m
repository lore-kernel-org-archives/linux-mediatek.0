Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9B3C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 18:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=telDdakKeqGHEY5wudZ4nwhx49SVQMwMuffymH63PGo=; b=nbbP7HjlS0yo8siXAMP2IspB2E
	LQV5fcZRbB0dydLwvYHs+s+AE56oTGUp5MHZxwSw1ctfeVAwkSIyBK/nrtO3c9pqj5OF7PfTJLLCM
	X66Digtrv1PEdOuQS1kjBXFoVeWsyyHavK0vU4auAbFfdnk8kb48Pc4P4e8ZMvk3FXJsV2wTX8mEI
	bTRAR/qVBDcvdH7VPxEVoBg+Ddmsi+VSrFZH0FF1RpKFxsNRQAT4UrrLeEw6WlT989XI5XN4v2UDE
	d7Qw4gWA+YG7EFa9L58MBktrjfcYM55U2nBCvKtqs+MGVM/ns4toa/WuzGY4WMrPI8tQGrkvY2RWa
	qx5QmLSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEaom-00BR7Q-R8; Thu, 21 Jul 2022 18:22:36 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEaob-00BQkK-0Y; Thu, 21 Jul 2022 18:22:26 +0000
Received: by mail-ej1-x631.google.com with SMTP id oy13so4603638ejb.1;
        Thu, 21 Jul 2022 11:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=telDdakKeqGHEY5wudZ4nwhx49SVQMwMuffymH63PGo=;
        b=XO6ulZkpjNDdBb/M6u2BJKg/17Y5IC8hQ1aMS3hURuUDmP74sjHYARYI3sm2/EIw9y
         y6/zJOAWEomlFQDiZZ0oQhDwNzkNHn3KGbrxSURAzRS5S40NtxKZpzFZPtUTmub53Xk3
         YdTVVZy29+H9cdRACJG6aaojCfnXp+8pHYwdQ8twWYFhDkmARKCc6yk067SlEkPPFPk6
         6EQVPPpy1GnBLIl82R69shy7+vn2NydHcaYPoiI1fBYgnsGznylXM+CP53w1t1ydxAxm
         6RkuhJ5sB77ojJa7vpQ3l85VvWAcpVby/+wTmp6imQfVD+ytp1DmZr0SLOrgzTBTNtCk
         mn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=telDdakKeqGHEY5wudZ4nwhx49SVQMwMuffymH63PGo=;
        b=gOCX7+XsM5iywqHSbGio50Xqs49wAkLCmLze3ELsqe1cwJl4Js9I3hBa88kZNwhLVX
         TU/qqUVlZekIxAePknEJP0d7h2B/5ralvOJ0cQoWkX83JkEbOoWlo/HEDWe0vntJ3F4L
         lIE9s547tyO3iH4vq8dEvqqDt1lKQDyzQkJhO0U/QpSdC5JzFkDySSCjCeSWsZ8qo1c9
         Fw6QPAAzQhstQzJviENEuE4QGi9KTlgxsw8tvJVqgRRz6M4VXBZQw2Hub+9108yRVWg5
         PpA+v0DL0hdcuGuGEzgeX4GRMv7LQMxBziNXvXujli2z6tvkmCyUwjCCtOOFHkFa1wnN
         Wm9g==
X-Gm-Message-State: AJIora/HiuDi0sXsQJwNvTLloa/2OWueMLrzGicU6gtfOxFJ2x75DUyX
	3m94WEr8KebChUqQxsDesfI=
X-Google-Smtp-Source: AGRyM1sJrvIzufk8Q3F7TTBGAnC3qPeej57/OshreWEcvuibGnkDJO/s88ycWFKIoC5dVGW5WRGiPQ==
X-Received: by 2002:a17:907:1b25:b0:6da:8206:fc56 with SMTP id mp37-20020a1709071b2500b006da8206fc56mr41001511ejc.81.1658427741328;
        Thu, 21 Jul 2022 11:22:21 -0700 (PDT)
Received: from skbuf ([188.25.231.115])
        by smtp.gmail.com with ESMTPSA id t6-20020a170906608600b0072ecef772acsm1107193ejj.2.2022.07.21.11.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 11:22:20 -0700 (PDT)
Date: Thu, 21 Jul 2022 21:22:16 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
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
Message-ID: <20220721182216.z4vdaj4zfb6w3emo@skbuf>
References: <20220716105711.bjsh763smf6bfjy2@skbuf>
 <YtKdcxupT+INVAhR@shell.armlinux.org.uk>
 <20220716123608.chdzbvpinso546oh@skbuf>
 <YtUec3GTWTC59sky@shell.armlinux.org.uk>
 <20220720224447.ygoto4av7odsy2tj@skbuf>
 <20220721134618.axq3hmtckrumpoy6@skbuf>
 <Ytlol8ApI6O2wy99@shell.armlinux.org.uk>
 <20220721151533.3zomvnfogshk5ze3@skbuf>
 <20220721192145.1f327b2a@dellmb>
 <20220721192145.1f327b2a@dellmb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220721192145.1f327b2a@dellmb>
 <20220721192145.1f327b2a@dellmb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_112225_075607_9C04629D 
X-CRM114-Status: GOOD (  27.77  )
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

On Thu, Jul 21, 2022 at 07:21:45PM +0200, Marek Behún wrote:
> Marvell documentation says that 2500base-x does not implement inband
> AN.

Does Marvell documentation actually call it 2500base-x when it says it
doesn't support in-band autoneg?

> But when it was first implemented, for some reason it was thought that
> 2500base-x is just 1000base-x at 2.5x speed, and 1000base-x does
> support inband AN. Also it worked during tests for both switches and
> SOC NICs, so it was enabled.
> 
> At the time 2500base-x was not standardized. Now 2500base-x is
> stanradrized, and the standard says that 2500base-x does not support
> clause 37 AN. I guess this is because where it is used, it is intended
> to work with clause 73 AN somehow.

When you say 2500base-x is standardized, do you mean there is a document
somewhere which I could use to read more about this?

> And then came 6373X switch, which didn't support clause 37 inband AN in
> 2500base-x mode (the AN reigster returned 0xffff or something when
> 2500base-x CMODE was set). Maybe 6373X finally supports clause 73 AN
> (I don't know, but I don't think so) and that is the reason they now
> forbid clause 37 AN in HW in 2500base-x.
> 
> But the problem is that by this time there is software out there then
> expects 2500base-x to have clause 37 AN enabled. Indeed a passive SFP
> cable did not work between MOX' SFP port and CN9130-CRB's SFP port
> when used with Peridot (6190), if C37 AN was disabled on 6393x and left
> enabled on Peridot.
> 
> I managed to work out how to enable C37 AN on 6393x:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=163000dbc772c1eae9bdfe7c8fe30155db1efd74
> 
> So currently we try to enable C37 AN in 2500base-x mode, although
> the standard says that it shouldn't be there, and it shouldn't be there
> presumably because they want it to work with C73 AN.
> 
> I don't know how to solve this issue. Maybe declare a new PHY interface
> mode constant, 2500base-x-no-c37-an ?

So this is essentially what I'm asking, and you didn't necessarily fully
answer. I take it that there exist Marvell switches which enable in-band
autoneg for 2500base-x and switches which don't, and managed = "in-band-status"
has nothing to do with that decision. Right?

Is this by design of the 'managed' property, or is it an interpretation
quirk of Marvell drivers? Some other drivers enable in-band autoneg only
when manage = "in-band-status", and no one really said anything about
that during review, so I came to believe that this is the expectation.
I'm confused now, I was hoping Russell could clarify.

