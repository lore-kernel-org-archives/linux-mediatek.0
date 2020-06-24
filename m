Return-Path: <SRS0=bzTf=AF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C302C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 16:36:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A0B72073E
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 16:36:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JDWem7pw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="Gs5a8ysD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A0B72073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kTxHqiqKecdDVBap5yquoXGRvnbcOkGyB8YPriXDgvg=; b=JDWem7pwuIPNnfJmF9tbHAEYD
	EcFMKE1ubI/B8hf/bfr4lD++Kppxjmk2UuIYXX9e8acOYnFN7cqXHncH7y0cBG6kFgCb9N6cU5SKM
	SbZ66XzzdCav/abYXFtBzN5D2TJ3nu0DAHQU63+vXM4McefkPOQTGoIFGKImqQCEKtufeH3UdJuZn
	BXIoTWlerFGOsLBpP9kVRplOuCIO+hgy4GCJCk1ETllj8sEnwXzXPZ3Bzsu+73ra8TRcBHqMT2zq4
	vMXF8PQAZ13Cufckzgw2xynUkKAeg02t5jhvhnIAU65vBn6j2ep5c9dJEfuAjWbLq8kScEBADR3KO
	en9rcyXPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jo8NP-0004Sj-RE; Wed, 24 Jun 2020 16:35:56 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo8NM-0004PW-5g
 for linux-mediatek@lists.infradead.org; Wed, 24 Jun 2020 16:35:53 +0000
Received: by mail-io1-xd41.google.com with SMTP id c16so2834498ioi.9
 for <linux-mediatek@lists.infradead.org>; Wed, 24 Jun 2020 09:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sp0WLMHGJPSAAMQoilN1mZe9srYQKmzrBKtnNiwXpVs=;
 b=Gs5a8ysDongBqjpVPsiQWEdpD5YRNoaq5AdJr4nWs/zYkTf9M+ghwGa2A+vl53WV6M
 JRhhJVQhyuX8Tjd445UrEkqaFeRBOHvtFUzLBeMPO0HX9mrLGqK4lDzsj6o3kvYnXAtP
 U9yDgHUDz7mk9brV9quovHVYMfYdpE1wplg8iEBwg4dESo1GeYGKG147fTWViUWPXVaS
 FR6tX7MIy3c334Uz8RjbHxPZg9QBgw0WiGsyG1tVXNjq2ij/nw+U3r3cmvFLDwDYK1qw
 EoXeQw+M9J5xE1EYWjQsHsb+8MY6uK1Y0nyljUOAVmAheLR3MwqkhUPIAU1EoVLOMvau
 PLIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sp0WLMHGJPSAAMQoilN1mZe9srYQKmzrBKtnNiwXpVs=;
 b=Hn20E83F7RqxXGxujWaEF3z3C17MYJXLPK3xa0uZ3pluA8OHMHjBlHJb8UnNK+BqX1
 uMHI1D4Ui08mo4GKnwhWGLwZmwA1wwFC4Jfb2QnM2hP+Wfd03da/MKgK3SRZIEjBCfpX
 qzIlKO1E6l3qeuScRn7BsB5uU6DoIJKQvGaoOCMpUD7mLCYc0JHiQvRQ9tqUFB9TDLQ3
 wo8lMSJwH/Ht93UXDSECSkFLwb77bE0Gwc+Db+B17WY3u+oi5Dv0m2Y7oYGZZJLueBEh
 BRFPmsZf6uw7Bj6AYds47J4aZ/dXY+i4Trtd/iRpMQVLpwX6nX2Xvj8YVRA6Q788xd8N
 cHng==
X-Gm-Message-State: AOAM531ecHjtN2eMD7e7URHuwhq22f+7Alqiu4kfcvYH/ifdH6pvqfoX
 mBX4PdhvjKkF6qLDDCeUs3BQr1XEmH3hCoaIpbzYag==
X-Google-Smtp-Source: ABdhPJxqogL8HjW0xO8Djm9BN68/4TRrqeL4aSvgA3Rvp4v39IWyLfFQicLhQQMp3WEw0MNQuACTa3lGvzsxsAPhLOs=
X-Received: by 2002:a6b:b252:: with SMTP id b79mr32690628iof.31.1593016548397; 
 Wed, 24 Jun 2020 09:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200622093744.13685-1-brgl@bgdev.pl>
 <20200622093744.13685-10-brgl@bgdev.pl>
 <20200622133940.GL338481@lunn.ch> <20200622135106.GK4560@sirena.org.uk>
 <dca54c57-a3bd-1147-63b2-4631194963f0@gmail.com>
 <20200624094302.GA5472@sirena.org.uk>
 <CAMRc=McBxJdujCyjQF3NA=bCWHF1dx8xJ1Nc2snmqukvJ_VyoQ@mail.gmail.com>
 <f806586d-a6d7-99af-bba4-d1e7d28be192@gmail.com>
In-Reply-To: <f806586d-a6d7-99af-bba4-d1e7d28be192@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Jun 2020 18:35:37 +0200
Message-ID: <CAMRc=MfQFgrJC3nvuJgZobixa6MLeMw-tdg_3e1yNDityU5XSw@mail.gmail.com>
Subject: Re: [PATCH 09/15] net: phy: delay PHY driver probe until PHY
 registration
To: Florian Fainelli <f.fainelli@gmail.com>
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
 Frank Rowand <frowand.list@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 netdev <netdev@vger.kernel.org>,
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

On Wed, Jun 24, 2020 at 6:06 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>

[snip!]

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
>

Don't get me wrong, I understand that full well. On the other hand a
couple years ago I put a significant amount of work into the concept
of early platform device drivers for linux clocksource, clock and
interrupt drivers. Every reviewer had his own preferred approach and
after something like three completely different submissions and
several conversations at conferences I simply gave up due to all the
bikeshedding. It just wasn't moving forward and frankly: I expect any
changes to the core driver model to follow a similar path of most
resistance.

I will give it a shot but at some point getting the job done is better
than not getting it done just because the solution isn't perfect. IMO
this approach is still slightly more correct than controlling the
PHY's supply from the MAC driver.

Bartosz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
