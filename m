Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81EDC77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 May 2023 14:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/KV+Di6Ta48Z3epDbXpwwzm5dV8uJgv3AJwtxlWfCg=; b=DvVvWGXcq/K2EyzzNG/VyWYU7I
	6V+vj978046aD/qnwZwkjn25++e943rvJR0CauqrIBqdvj90BUy7zPqTMWFkcmF1UySPwXRGIPvjV
	xR/MLDoo5cA5B9+pIKjv6DzpgEOC2fle5g8FrttQW1Wiok4t1YpBShvoiQBJvD5OHVaomdfGhK5aa
	dKVw9cPuXmyMns5wjLkdkudf7S98BUvX/qfkttOspTZ2GuTJrkg8xhhRkEV2NwT25Hpa4JOCKgISh
	watRyHJM9x0kqKiVy2RfZgzpxTQff/8E5zLo6HN1RJttQcNP7zgzR7bHL3LXaXz8Hipz++txBS7sl
	+NRwryIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyvT2-00634X-1j;
	Tue, 16 May 2023 14:15:56 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyvSz-00633R-0h;
	Tue, 16 May 2023 14:15:54 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-30626f4d74aso9359415f8f.0;
        Tue, 16 May 2023 07:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684246549; x=1686838549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/KV+Di6Ta48Z3epDbXpwwzm5dV8uJgv3AJwtxlWfCg=;
        b=rrOfddcnfEZBwxzmGgMUvs0GaeImSK2XDlrisZWpbFOMOZHSlcxtTvHUUB4mQmH+eV
         g8jI0Ef4kkCZuWbyfGJJ+/531XMWhB7wS+Ke9EQgY1pWxR17c3V1ylgAMmrB62hUyVB/
         yIUSSzR1lkxya1024jRDl91LbJRXI8v7ZEoaXUe+dEvMz+F4vT8FCJyaN9pKO+rtxMsi
         DB12YZ4hx7n5iHT3wnV5h9Gym77Hx48P9SfEwrNhW5f7ucgUfniH5fmCwEEB4dCaC0qc
         E5voin6GVkmVTZ4ge3qvLwhFkc87KM7UM4qNJ9vbQ5iMQPlyakWVftf5o2OBlay7px8I
         ht+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684246549; x=1686838549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/KV+Di6Ta48Z3epDbXpwwzm5dV8uJgv3AJwtxlWfCg=;
        b=b631DI6vtpFQRx7dxNNy4Xjb1bcNWmDpjfGUXEj1SOhwxgsq9z0nlVkNOEbww6BQmv
         gucBCGF5I4k/tjSSItSQ0zFR0v+HNQuBX4MdhEF8D8XOizAPUlxd+giu6KcBG8OW1AmV
         +fhGCrKoZoZJZvWVpncbsUPz/CkM0tSS4QaWIGvgJIYUm08ej3b9TjQLrD/2+QqDq62t
         P0IgZuPjthVS3Cqe7RIgn/2ilzuwGxKUSSZhn5wDVQP2ygD0NjpMHFgJ4wuIASg6IIeG
         m2pkLhLK6f+B9nl+Nr2DJxlliy1TaeMqPgKh+8EyRZqeL2+6pf5tfLz7CNY3m9LuX1/D
         Tpxg==
X-Gm-Message-State: AC+VfDx3dyl+vixzKNJtU33166bFJQMVE9PnlHaZbHI5xcz1ggAfmJqY
	+Yo1sfZC5OgOfdW5W5uPIRY=
X-Google-Smtp-Source: ACHHUZ7gv5FIY5ANveCmNmgink+NyF7kPovM0wBIJjVCLnmRAVn93SUkOHiTagFj0xuY6thsjMMmuA==
X-Received: by 2002:a5d:4d0f:0:b0:307:c3bc:536 with SMTP id z15-20020a5d4d0f000000b00307c3bc0536mr14143099wrt.64.1684246548391;
        Tue, 16 May 2023 07:15:48 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id z3-20020adff1c3000000b003093a412310sm963509wro.92.2023.05.16.07.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 07:15:48 -0700 (PDT)
Date: Tue, 16 May 2023 17:15:44 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Felix Fietkau <nbd@nbd.name>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>, John Crispin <john@phrozen.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Marcin Wojtas <mw@semihalf.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Taras Chornyi <taras.chornyi@plvision.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	UNGLinuxDriver@microchip.com, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH RFC] Providing a helper for PCS inband negotiation
Message-ID: <20230516141544.t2e3ll3snrbi3oqq@skbuf>
References: <ZGIkGmyL8yL1q1zp@shell.armlinux.org.uk>
 <20230515195616.uwg62f7hw47mktfu@skbuf>
 <ZGKn8c2W1SI2CPq4@shell.armlinux.org.uk>
 <20230515220833.up43pd76zne2suy2@skbuf>
 <ZGLCAfbUjexCJ2+v@shell.armlinux.org.uk>
 <20230516090009.ssq3uedjl53kzsjr@skbuf>
 <ZGNt2MFeRolKGFck@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZGNt2MFeRolKGFck@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_071553_258012_E1ECC800 
X-CRM114-Status: GOOD (  27.88  )
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

On Tue, May 16, 2023 at 12:49:44PM +0100, Russell King (Oracle) wrote:
> What I'm getting at is if the interface mode is
> PHY_INTERFACE_MODE_USXGMII, then... okay... we _may_ wish to do
> clause 73 negotiation advertising 10GBASE-KR and then do clause 73
                                                                  ~~
                                                                  37

> for the USXGMII control word - but the driver doesn't do this as far
> as I can see. If C73 AN is being used, it merely reads the C73
> state and returns the resolution from that. Any speed information that
> a USXGMII PHY passes back over the C37 inband signalling would be
> ignored because there seems to be no provision for the USXGMII
> inband signalling.
> 
> So I'm confused what the xpcs driver _actually_ does when USXGMII
> mode is selected by PHY_INTERFACE_MODE_USXGMII, because looking at
> the driver, it doesn't look like it's USXGMII at all.

If what you're looking for is strictly the USXGMII in-band autoneg code
word derived from C37, then the short answer is that you won't find it,
even when going back to the initial commit fcb26bd2b6ca ("net: phy: Add
Synopsys DesignWare XPCS MDIO module").

To the larger question 'what does XPCS actually do in phy-mode "usxgmii"',
I guess the simple answer looking at the aforementioned initial commit
is 'it violates the advertised coding scheme by using BASE-R instead of
BASE-X for speeds lower than 10G', and 'if you don't want the USXGMII
replicator just use phy-mode "10gbase-kr" which behaves basically the
same except it doesn't advertise the rate-adapted speeds'. Disclaimer:
I'm saying this based solely on the code and documentation.

> If we want to change that back to the old behaviour, that needs to
> be:
> 		if (test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, advertising)) {
> 			...
> 		}
> 		break;

Ok. I should send a patch fixing this, since I introduced the behavior
change. I'll add your suggested tag.

> but that wouldn't ever have been sufficient, even when the code was
> using an_enabled, because both of these reflect the user configuration.
> (an_enabled was just a proxy for this Autoneg bit). I'm going to call
> both of these an "AN indicator" in the question below.
> 
> Isn't it rather perverse that the driver configures AN if this AN
> indicator is set, but then does nothing if it isn't?

Maybe. My copy of the databook is parameterized based on
instantiation-dependent variables, and I can't really tell what are the
out-of-reset register values for hardware I don't have, so it is hard
for me to infer what is the behavior when AN is not enabled.

> As this is the only phylink-using implementation that involves clause
> 73 at present, I would like to ensure that there's a clear resolution
> of the expected behaviour before we get further implementations, and
> preferably document what's expected.

+1
that's where I would like this to go, too.

