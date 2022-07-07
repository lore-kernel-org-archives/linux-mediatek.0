Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D4BC43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 16:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oyhk8tIY7VGBnadaucveAmlAMN+zMbqVtzp3azgS8qw=; b=WAM8cCOFdX9cQ68f1BDlZVI9eM
	shEBUmHl/ELWiW45shs38e42Zcy3nzSspXPSKny7Fonu/AholsWqnNz757e8gRjCdajWXGr/gEjrF
	fs95zG3ZQ68U6uQyBTjoEy/nq4s/JEX6ONUiWehsGFAlmmAUYvv8JowSmQmgaBTkvAcIqM+GS5S5Q
	Kfi5uURbEe2MzoVW0U+WDSVME4ZGgx51XlsAJs9w5PU/DwAVJmKlB2EFNaqGNVooyxskyt7EhCPSa
	8/W2pte9pdPmaByMaCq24e4i4r5PL8ENBDwcdpAN6WayNjePTu+33kgEbJBwZPAHewnsazIhxBFMU
	R0DlXvtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Ui0-00H4bd-Bt; Thu, 07 Jul 2022 16:50:32 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Uhi-00H4Wa-KI; Thu, 07 Jul 2022 16:50:16 +0000
Received: by mail-ej1-x62e.google.com with SMTP id sb34so33394979ejc.11;
        Thu, 07 Jul 2022 09:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Oyhk8tIY7VGBnadaucveAmlAMN+zMbqVtzp3azgS8qw=;
        b=AGPCA+0zjSmHDSc9g6fcsG673Fk0HU9pCS3mTt/JmQtJZYLVnVqMwBO/Xw+92cq5OX
         uijLnvbn9Jrdp3Z5bchkpO8oQ86E54fS5SJ6mfjiGqfeUR8SGuk3zV5ASb5EXmNret3w
         +Zo3+EheYkCT+ouprk32VTfVMWlZ5tbgP800jhl4yUdxo829n/bAbA7yNxYxqJVf4zP4
         56WklCNdUSZcYWL0AZ0vKQsxdUBywcH1LtZhpugWxM4j5VQxFQextAAFFQv5bUaCEIz3
         I4Z0fgifKbZnFiXlvSWWTprp01t7dDvWQDGQc+hxo5Z8qThjODWSDnompAwCpIatqXrF
         Ccug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Oyhk8tIY7VGBnadaucveAmlAMN+zMbqVtzp3azgS8qw=;
        b=RwciBRX1THfQtr24Ul0MN9RvGKR528CXPWq+dyD6wKP/yWQ+zPSzzIV/agVSF2P3w+
         sbJGzDlyKP8SAl8/FyPHp9mCNx2Z2F9Kvize0toK8rZ5Fj8OwlCxIeU5ZaBMtAaKhU7K
         8yeEqS9D3mAEHO6rF/W9RV2LqkjoPlHhzU8IMc++lMxcGvTiKeRzLJoPwc3lnm41KVfD
         WoJyyZM0rOqd2p4UtcsWO0qpGNb6YujTWxvn5zem9hJqTMTeTpYn7NKMNCb93XQb8yh1
         IlxkCic30TlAaJ4iPVyFaPxSO0qYvRm6u9aBjf9w+MKRhDgVFR05QZY7W8+GLCZntSdp
         pHbg==
X-Gm-Message-State: AJIora/LPajZ0Y41oDtMQkZzkKpel9X+f9N4SQUW+6iycOBWJY3GNEHt
	o11Mz7TbBBHHMQrXaOMFK8A=
X-Google-Smtp-Source: AGRyM1sN/zswdqJ6efPyjyralPctskh3tvhtSg5OT/CB8HR+fIubQAi30GYPgQAN2QGz5Ru8BH/EvQ==
X-Received: by 2002:a17:906:84f0:b0:72b:2157:f8fe with SMTP id zp16-20020a17090684f000b0072b2157f8femr342862ejb.462.1657212610836;
        Thu, 07 Jul 2022 09:50:10 -0700 (PDT)
Received: from skbuf ([188.25.231.143])
        by smtp.gmail.com with ESMTPSA id s2-20020a170906454200b006fe9ec4ba9esm19227543ejq.52.2022.07.07.09.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 09:50:10 -0700 (PDT)
Date: Thu, 7 Jul 2022 19:50:08 +0300
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
Message-ID: <20220707165008.2zumavc4wrvwtcel@skbuf>
References: <YsQIjC7UpcGWJovx@shell.armlinux.org.uk>
 <E1o8fA7-0059aO-K8@rmk-PC.armlinux.org.uk>
 <20220706102621.hfubvn3wa6wlw735@skbuf>
 <Ysa85mJIUfo5m4dJ@shell.armlinux.org.uk>
 <20220707154303.236xaeape7isracw@skbuf>
 <YscKuTXeXFX0tCap@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YscKuTXeXFX0tCap@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_095014_736522_0C3D9D5D 
X-CRM114-Status: GOOD (  34.22  )
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

On Thu, Jul 07, 2022 at 05:32:57PM +0100, Russell King (Oracle) wrote:
> Great, so I'll mark ocelot is safe.

Yes, please.

> > As for sja1105, there is DT validation that checks for the presence of
> > all required properties in sja1105_parse_ports_node().
> 
> Looking at those, it requires all of:
> 
> - a phy mode to be specified (as determined by of_get_phy_mode())
> - a phy-handle or of_phy_is_fixed_link() to return true
> 
> otherwise it errors out.

I know. The problem with this ad-hoc validation is that it doesn't cover
the pure MLO_AN_INBAND:

	managed = "in-band-status";

so it is more restrictive than it needs to be. Also it doesn't recognize
the presence of an SFP bus in MLO_AN_PHY mode.

That is part 1 of my problem. I want to have validation that I'm
providing phylink with all the right things it may need, but I don't
want to make the driver code super clunky. By checking just the presence of
either phy-handle or fixed-link I am rejecting valid phylink configurations.
What I need is a validation function that is actually in sync with
phylink, not just ad-hoc.

> > There is some DT validation in felix_parse_ports_node() too, but it
> > doesn't check that all specifiers that phylink might use are there.
> 
> Phylink (correction, fwnode_get_phy_node() which is not part of phylink
> anymore) will look for phy-handle, phy, or phy-device. This is I don't
> see that there's any incompatibility between what the driver is doing
> and what phylink does.
> 
> If there's a fixed-link property, then sja1105_parse_ports_node() is
> happy, and so will phylink. If there's a phy-handle, the same is true.
> If there's a "phy" or "phy-device" then sja1105_parse_ports_node()
> errors out. That's completely fine.
> 
> "phy" and "phy-device" are the backwards compatibility for DT - I
> believe one of them is the ePAPR specified property that we in Linux
> have decided to only fall back on if there's not our more modern
> "phy-handle" property.
> 
> It seems We have a lot of users of "phy" in DT today, so we can't drop
> that from generic code such as phylink, but I haven't found any users
> of "phy-device".
> 
> > I'd really like to add some validation before I gain any involuntary
> > users, but all open-coded constructs I can come up with are clumsy.
> > What would you suggest, if I explicitly don't want to rely on
> > context-specific phylink interpretation of empty OF nodes, and rather
> > error out?
> 
> So I also don't see a problem - sja1105 rejects DTs that fail to
> describe a port using at least one of a phy-handle, a fixed-link, or
> a managed in-band link, and I don't think it needs to do further
> validation, certainly not for the phy describing properties that
> the kernel has chosen to deprecate for new implementations.

And this is part 2 of my problem, ocelot/felix doesn't have validation
at all except for phy-mode, because if it were to simply copy the
phy-handle/fixed-link either/or logic from sja1105, it would break some
customer boards with SFP cages. But without that validation, I am
exposing this driver to configurations I don't want it to support (CPU
ports with empty OF nodes, i.o.w. what this patch set is about).

