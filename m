Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74F9C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 21:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5XOo443fdG2r9vIFuhWNwgNadDYwuAtZkD38lSSYgM=; b=utVAkzrBBTFi0N92x7m6XFJsWz
	w3uOx4/oSBlghHWjX4bloutC1L+ltkzY324zTUbNQZyCfi71CnmyqL44MqnKnSDxOx8X/LYPtmmZS
	eHWQG2Ddk7l1pEX13gBSHHmqVJx4C2lj55UebkfxbwGeCuNDVsAg1GkYg/O6/f9WiQdBNLXNN8sH6
	USP1N/3cUcCP9DioC+uRD4FeAB+z33rP28EDa72C8K+iuvr6eX7E7pY+Z1xkX7xgB0WtY/Z0/lOtB
	1UH3vT/XqQOWIqCiwfrsYDoZ7USkxHfKZn+sR4j+3a8TlRuQW7Jdsoj/zGX/lc1vtnfzFpRkXhan9
	adpWikQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ZN0-000OhT-QK; Thu, 07 Jul 2022 21:49:10 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ZMq-000Ofg-EH; Thu, 07 Jul 2022 21:49:01 +0000
Received: by mail-ed1-x533.google.com with SMTP id r6so13343372edd.7;
        Thu, 07 Jul 2022 14:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/5XOo443fdG2r9vIFuhWNwgNadDYwuAtZkD38lSSYgM=;
        b=XHChHwfiRysKOLDGMw5YWBoawDhJKqzbIhB+sBOifSzmsWuFfJge7mU4bff9V6EeVy
         usCdhQ3S8JonXCI1GpL1eERdtzP7Oql4TkpQzrg9+hPZ27KKXj+tbZs3TZQH1i6fQgF2
         MRSBjEFGq0PN3exCY7EJnPZhWHCyBAsND/sD15BewmPOYC+M0RoiSETSgwY1oP5BNDkM
         UXar2K+UrRqwBgOd8IqVW24IlNPrOrKYE7W2a+JgYAMCX+Po2JDONK47kNwYPxICoHFM
         PBOHBTbbkueXX7eVn61yiuNzAb8u0TkjCTZXpFbA2r7K/Awg67GnBRPv/cgMvR1HQl74
         lNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/5XOo443fdG2r9vIFuhWNwgNadDYwuAtZkD38lSSYgM=;
        b=pBxGWIZIXqARBgZEr7hUMgFprXv2KYFVZItktn4YuO7U3r5iTLThkEdCjjhHuHU/7A
         ms0vhaatJC6bi9ZfvDh8wCrS2jk1eneHnKyz7gscolrrI7L9tBBKE7JZ7a089WBURwzz
         9NlUtvHqMsAxAYuxFSpeIRIZnaSXpLdWFSz9psxjNF5R6g25aUmVA+g0YNOqwY6wc9yZ
         9K4tZ1pjAQ9bdeKjG6ZzxxTd0/kOzuvVm5/36bFcl8+GtjRMs8bljYNLxsm8csvfb+g8
         bE+rWH1T/p54P8YHo6KsJwV4IeiotAGtamddzBJmq2knjpBeeTwetyIkLv1jvx3EFg22
         v7GQ==
X-Gm-Message-State: AJIora9cSyfh9QWhXrr7kqjJ3jRy2cpnE7nHbtxV+wkFJLNFDIdiWZkR
	vcdHDECwSkiahby5YZPlaTs=
X-Google-Smtp-Source: AGRyM1sxrHAgTBk1n9lxvYqVtjilIRy9LJx6b5rnBe89LCuUvdwpr/ODuQ4kjGmJWc3uG8zLiFxCfg==
X-Received: by 2002:a05:6402:5508:b0:43a:896e:8edd with SMTP id fi8-20020a056402550800b0043a896e8eddmr265487edb.203.1657230535246;
        Thu, 07 Jul 2022 14:48:55 -0700 (PDT)
Received: from skbuf ([188.25.231.143])
        by smtp.gmail.com with ESMTPSA id r9-20020a17090609c900b006fecf74395bsm924956eje.8.2022.07.07.14.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 14:48:54 -0700 (PDT)
Date: Fri, 8 Jul 2022 00:48:52 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin __ipraga <alsi@bang-olufsen.dk>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	George McCollister <george.mccollister@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>, Jakub Kicinski <kuba@kernel.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Subject: Re: [PATCH RFC net-next 5/5] net: dsa: always use phylink for CPU
 and DSA ports
Message-ID: <20220707214852.jbfpww5ynkuunc5d@skbuf>
References: <E1o8fA7-0059aO-K8@rmk-PC.armlinux.org.uk>
 <20220706102621.hfubvn3wa6wlw735@skbuf>
 <YsW3KSeeQBiWQOz/@shell.armlinux.org.uk>
 <Ysaw56lKTtKMh84b@shell.armlinux.org.uk>
 <20220707152727.foxrd4gvqg3zb6il@skbuf>
 <YscAPP7mF3KEE1/p@shell.armlinux.org.uk>
 <20220707163831.cjj54a6ys5bceb22@skbuf>
 <YscUwrPnBZ3dzpQ/@shell.armlinux.org.uk>
 <20220707193753.2j67ni3or3bfkt6k@skbuf>
 <YsdA0jcRCzR0c728@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsdA0jcRCzR0c728@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_144900_525783_04D15186 
X-CRM114-Status: GOOD (  30.66  )
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

On Thu, Jul 07, 2022 at 09:23:46PM +0100, Russell King (Oracle) wrote:
> > > I'm not sure how practical that is when we have both DT and ACPI to deal
> > > with, and ACPI is certainly out of my knowledge area to be able to
> > > construct a software node to specify a fixed-link. Maybe it can be done
> > > at the fwnode layer? I don't know.
> > 
> > I don't want to be misunderstood. I brought up software nodes because
> > I'm sure you must have thought about this too, before proposing what you
> > did here. And unless there's a technical reason against software nodes
> > (which there doesn't appear to be, but I don't want to get ahead of
> > myself), I figured you must be OK with phylink absorbing the logic, case
> > in which I just don't understand why you are pushing back on a proposal
> > how to make phylink absorb the logic completely.
> 
> The reason I hadn't is because switching DSA to fwnode brings with it
> issues for ACPI, and Andrew wants to be very careful about ACPI in
> networking - and I think quite rightly. As soon as one switches from
> DT APIs to fwnode APIs, you basically permit people an easy path to
> re-use DT properties in ACPI-land without the ACPI issues being first
> considered.
> Yep - there's at least one other property we need to carry over from the
> DT node, which is the "ethernet" property.

I've cropped only these segments because there is something I apparently
need to highlight. What my patch does is _not_ at the device fwnode
level (in fact, DSA ports do not have a struct device, only the switch does),
but indeed at the most crude fwnode_handle level. And the fwnode_handles
I'm creating using the software_node API are not connected in any way
with the device. I'm not replacing the device's fwnodes with prosthetic
ones. The fact that I wrote "dn->fwnode.secondary = new_port_fwnode;" is
just a cheap hack to minimize the patch delta so I wouldn't have to
transport the software fwnode_handle from one place to another within
dsa_port_link_register_of(). This should definitely dissapear in the
final solution. In fact, as long as phylink doesn't keep a reference on
the fwnode after phylink_create() or phylink_fwnode_phy_connect(), I'm
pretty sure that the software node can even be deallocated during the
probing stage, no need to keep it for the entire lifetime of the device.

Therefore, no, we don't need the "ethernet" phandle in the software node
we create, because we just use that to pass it to phylink. We still keep
our original OF node for the rest of the activities. We don't even need
the "reg" u32 property, I just added that for no reason (I wasn't
completely sure what the API offers, then I didn't remove it).

So the concern that this software node can be abused for a transition to
ACPI is quite overestimated. Nothing in DSA is "switched to fwnode" per se,
and the creation of a fwnode is just part of "speaking the software node
language", which phylink already happily understands and so, needs no
change. Just my 2 cents.

