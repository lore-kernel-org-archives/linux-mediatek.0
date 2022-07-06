Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7708C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 22:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGO2KmAAzrpAl6kAYx9AdPAV8dUrIAcT8nRhDDK6jiI=; b=jFHAuD7oqH8/rQoAPG59zyrhII
	L8XSjrE+GsZy1dfHmJzSRm+J7GfqUDM9sXeIx1FngrA/v9sNtWVYF8n6t0ZliNDcsRMyvaW2hfsZD
	/ZP5wlEUeLe3ZgPVV9OtZl9/XGjmtmSRMB5stStQi1YG4Fh5mJAol04pKYsFAHBj5/iYUNOzczQgg
	E6HIbTH+KUL4mB/czZBBpP1YjuDHXRmNwZmcir5X/M8DEL6kpNVWw1xPwuxllIXL+22I/XeNJNakx
	2CpuK4nRtANfXfK0M0cVxNOt5+UORfP7WtskiPSBs1fGPd9DLlk+mbYXb93McJZ/1tRRIWdF4d5S/
	i7Dah4/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9DnQ-00Ce0i-6A; Wed, 06 Jul 2022 22:47:00 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9DnF-00CdxV-1o
	for linux-mediatek@lists.infradead.org; Wed, 06 Jul 2022 22:46:50 +0000
Received: by mail-yb1-xb30.google.com with SMTP id l11so29616030ybu.13
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Jul 2022 15:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sGO2KmAAzrpAl6kAYx9AdPAV8dUrIAcT8nRhDDK6jiI=;
        b=hn08DNIzFwal/bnJR5VKWwwjNmPgwr6n4bvoWroYyO2DpbHwRRYAcfW6/1ZTCyBZmi
         442HaMUNtNpyaruLX8iPwxcoiAyug/ARLFHstON9Q9TjfVvmUSePKhO6pNPUvK9mXYPm
         lMSmcQA5troeHy2OcvMiHoxIIoFGnZ91sySMhuLRMouwol2hgAJPAAneYSr2vs8gl1yy
         6bU9ohkXrSGklWzrrHSYdxQcmEoWiHMEzdKC5cNB6gMdZ0+w9NSgZ/0uirhMeRfNXoIm
         ZjCD9o/emfhBNGnfOb/w5O+3btJJGOfa4Y53th1jGuCeZAzGg6LEEMHG3PCe0nKPdnpf
         9CYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sGO2KmAAzrpAl6kAYx9AdPAV8dUrIAcT8nRhDDK6jiI=;
        b=0gD+O6lLMSBt5+AHucf8jnz8bvZaclgFn0TZXyLVVAflQEULX4UaPV4rZhkj3ZyaXf
         M9eby1BkYgxk9JmYV8X4cDVGw06vynOJ9JESB1f8UcIABmAxNsP1erwi8TH0gEahyXBo
         vqcjxFRCN+smbAYYqHhlaOjXdK0JK84FojCnPjr5K48Y0vHldCXC1u/lZ0HhVrGWbhFI
         CF8ubSTTzpaGUD6b9PyiC3kdp0fk/SoKug3nXBFb2dgiIRd1p7njRha8pfKipDEHP5IZ
         6E51o2Dv8jC5pryN0dQryL9i1/OY4BJJvPL0+JCLzoy9HTkrzqdbGMLAiC48EN+5TDfA
         D5wQ==
X-Gm-Message-State: AJIora8OOKMEk57r/0NOuZs9SLGX0nR0O8axFCi1D7yUbMnX+h9V5Xxg
	oJFbGWVf7wJaBzTS4lQ6rwNnKUnLQemfYfO+Kd68IQ==
X-Google-Smtp-Source: AGRyM1uaFc0IM4WHsDrwwCHO1Der3xWvlmlupuFTBmgrkJ0/QSm68C1x66tIxyPkwSNLJ8ORuxnDLKewZswBi93lxWA=
X-Received: by 2002:a25:6cc5:0:b0:66e:6606:74fe with SMTP id
 h188-20020a256cc5000000b0066e660674femr16268009ybc.291.1657147602658; Wed, 06
 Jul 2022 15:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <YsQIjC7UpcGWJovx@shell.armlinux.org.uk>
In-Reply-To: <YsQIjC7UpcGWJovx@shell.armlinux.org.uk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Jul 2022 00:46:30 +0200
Message-ID: <CACRpkda3tdo0q2xZGrAO2b6Pef-Pt2GV0VyVam1uFKotk4iXKA@mail.gmail.com>
Subject: Re: [PATCH RFC net-next v2 0/5] net: dsa: always use phylink
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Claudiu Manoil <claudiu.manoil@nxp.com>, "David S. Miller" <davem@davemloft.net>, 
	DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, George McCollister <george.mccollister@gmail.com>, 
	Hauke Mehrtens <hauke@hauke-m.de>, Jakub Kicinski <kuba@kernel.org>, Kurt Kanzenbach <kurt@linutronix.de>, 
	Landen Chao <Landen.Chao@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Sean Wang <sean.wang@mediatek.com>, UNGLinuxDriver@microchip.com, 
	Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Woojung Huh <woojung.huh@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_154649_124993_005AB942 
X-CRM114-Status: GOOD (  11.65  )
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

On Tue, Jul 5, 2022 at 11:47 AM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:

> A new revision of the series which incorporates changes that Marek
> suggested. Specifically, the changes are:
>
> 1. Patch 2 - use the phylink_get_caps method in mv88e6xxx to get the
>    default interface rather than re-using port_max_speed_mode()
>
> 2. Patch 4 - if no default interface is provided, use the supported
>    interface mask to search for the first interface that gives the
>    fastest speed.
>
> 3. Patch 5 - now also removes the port_max_speed_mode() method

Pulled in the patch set on top of net-next and tested on the
D-Link DIR-685 with the RTL8366RB switch with no
regressions, so:
Tested-by: Linus Walleij <linus.walleij@linaro.org>

The plan is to enhance the phylink handling in the RTL8366RB
on top of Russell's patch in some time.

Yours,
Linus Walleij

