Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AEFC43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 15:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRyQ6l+HRyXdzOqyBsn/dpYwUzVFGa0ZXhBusdg+nQo=; b=D7Zm/NcLDMQVjbBWfBiAx/D+Fy
	nZvCLnyMflaC1FtaY3cPlcNJ7K8I8NTzDg16rMPFPUNYZ6324zNwqRuH5iiDV/gOJyKjiW04nE8gB
	QJpeSV+UkeTQHMS7NWAmH0KGAfwfpoxCrKbzjkyP5BqnYdiiDubRC9Vw6IExbupWO1TSy2BYTxgE6
	F06C9+WkZlCRhuJM/yN2d+cefEG8DR6BSJEOvysH5Dg1BNK+HVyIpcTRcSNjpO0TF4P5vnQdD7h9Q
	k2IG5XikuE/rV8YxZEvB9WFr9argwnKse6Rvs/BT8pfklYPgijYMTKQkOBj4K7baVsMsVSUX+HWmm
	oyHrwJDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Tf0-00GoxQ-Lj; Thu, 07 Jul 2022 15:43:22 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Tep-00GotA-Os; Thu, 07 Jul 2022 15:43:13 +0000
Received: by mail-ej1-x62c.google.com with SMTP id ez10so2969661ejc.13;
        Thu, 07 Jul 2022 08:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eRyQ6l+HRyXdzOqyBsn/dpYwUzVFGa0ZXhBusdg+nQo=;
        b=h+1J5PxQdDHpVcPcs2s+yMc1NuhF3fnxWBG+wgM3rOaWtnpf+p85x806rNKDUGzv44
         LTbrkDfifvjl5ET2lDlezGuLWQpoYLQleLNRJZE08q5gVyUubwxf9WUaMkQpGc1ITEzW
         Fv/OCqNYE/EBXUstj2Jtr7ceNxc7Susfdfu9RBg6p9QfP9iUA386bkSP3pjthu2JaobM
         HoeA6HPZnwBRkMjaymKChC/zMY/r6aGh/JQbNykqW3p4wbA0v/+wBEhX3cA7/dI622J8
         Ia1Bvykj9BrfJiwWNPt0UYLOR57jz0i3/R03Q9v7heVgtH+KF/M2jrTlE3RkSJqSiSg5
         ptyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eRyQ6l+HRyXdzOqyBsn/dpYwUzVFGa0ZXhBusdg+nQo=;
        b=PwOrM3HHJO5dzt0SQvcGpsvkfcSmcvQyPVW2MEOCpBr/RT30ZnbbFbXvS0bbGFgiJd
         cYiQ9X4DKVV7V8k1i5OiXYTRnYhpplO+jWxd72VcCLsMTFlHqCx2eAWP+NcZenMfmJ+1
         XS0tMLN+z4j4oO4M1wH8wAQLk701pSjks0cUpRBe9eZKp1wGZiu74S1HQz65e5ry3m7Z
         Sqye2VTIaxCtEj8oDon+IbXOFV8FTas0H1onuzC1xFg1UN/GkBGzRyDBCggae8F2wFl3
         ImZOt7rg0o4y6loCZsmbPo6d2O1NVI2J8IFdKCo0OVI6V/zo+IAY47YcSxGs062z+sxR
         lZ4A==
X-Gm-Message-State: AJIora/wog+KnH3RGo1MaO1UhYoDm22zDHAbmEuK/TtjSCWd36HvK09q
	mxlR66CSKhIzDWqNdsovLZc=
X-Google-Smtp-Source: AGRyM1sEZtfA3ti3uPrw9IQHDMSqCngj2V6a8d3LI1tYlReReGFPyHs4RoO1Aa2GY+mRk60+Ya5F2g==
X-Received: by 2002:a17:907:7209:b0:72a:fcaf:2250 with SMTP id dr9-20020a170907720900b0072afcaf2250mr7983182ejc.468.1657208587175;
        Thu, 07 Jul 2022 08:43:07 -0700 (PDT)
Received: from skbuf ([188.25.231.143])
        by smtp.gmail.com with ESMTPSA id k14-20020aa7c04e000000b00431962fe5d4sm28681409edo.77.2022.07.07.08.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 08:43:06 -0700 (PDT)
Date: Thu, 7 Jul 2022 18:43:03 +0300
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
Message-ID: <20220707154303.236xaeape7isracw@skbuf>
References: <YsQIjC7UpcGWJovx@shell.armlinux.org.uk>
 <E1o8fA7-0059aO-K8@rmk-PC.armlinux.org.uk>
 <20220706102621.hfubvn3wa6wlw735@skbuf>
 <Ysa85mJIUfo5m4dJ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ysa85mJIUfo5m4dJ@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_084311_870180_001F156D 
X-CRM114-Status: GOOD (  18.30  )
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

On Thu, Jul 07, 2022 at 12:00:54PM +0100, Russell King (Oracle) wrote:
> More importantly, we need your input on Ocelot, which you are listed as
> a maintainer for, and Ocelot is the only DSA driver that does stuff
> differently (due to the rate adapting PCS). It doesn't set
> mac_capabilities, and therefore phylink_set_max_fixed_link() will not
> work here.
> 
> Has Ocelot ever made use of this DSA feature where, when nothing is
> specified for a CPU or DSA port, we use an effective fixed-link setup
> with an interface mode that gives the highest speed? Or does this not
> apply to this DSA driver?
> 
> Thanks.

I'm fine with both the ocelot and sja1105 drivers.

The ocelot driver has 3 users:

- felix_vsc9959 (arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi) on NXP
  LS1028A, where the CPU ports have and have always had a fixed-link
  node in the SoC dtsi. LS1028A based boards should include the SoC
  dtsi. If other board DT writers don't do that or if they delete the
  fixed-link node from the CPU ports, that's not my problem and I don't
  really want to help them.

- seville_vsc9953 (arch/powerpc/boot/dts/fsl/t1040si-post.dtsi) on NXP
  T1040. Same thing, embedded switch, not my fault if the fixed-link
  disappears from the SoC dtsi.

- Colin Foster's SPI-controlled VSC7512 (still downstream). He has an
  Ethernet cable connecting the CPU port to a Beaglebone Black, so he
  has a phy-handle on the CPU port, so definitely not nothing. I believe
  his work hasn't made it to production in any case, so enforcing
  validation now shouldn't bother him too much if at all.

As for sja1105, there is DT validation that checks for the presence of
all required properties in sja1105_parse_ports_node().

There is some DT validation in felix_parse_ports_node() too, but it
doesn't check that all specifiers that phylink might use are there.
I'd really like to add some validation before I gain any involuntary
users, but all open-coded constructs I can come up with are clumsy.
What would you suggest, if I explicitly don't want to rely on
context-specific phylink interpretation of empty OF nodes, and rather
error out?

