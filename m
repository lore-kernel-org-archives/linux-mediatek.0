Return-Path: <SRS0=5OX0=OD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC551C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 13:32:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2D7561260
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 13:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B2D7561260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N5Arg/OeOFieVkoyjOoBIGTkaozGugUBkUQeUDx4PCY=; b=pSGOIBOhtWr4Cu
	YIbdKOoXDK2fqUTTcNNWaecb+0die+XiV+0x2UdbnK9S/vltUaOj+dshJ4QQLcrOgo5HxNUZWL71k
	tX6qHP6gnN38/vktB7h7cmeYxZgzgCUdbx9+VI3gDHNseZC4iSH8PQmRxUV8qzny+QCHgUHKizF0u
	ri6uJoVeSxE+Q5d9xxebjiWJ5WACOj07IYLVHRjI5CagoTgtRJVf7JAdTPVhCWPXs7JsvbufOH+nh
	7dgLmU9L38kKKk5G58Bw6BkYx+hBZ3htb4BNM7vtKz1xVuamx6HJ5f570uUJ6PKk8f+Q9wBqD9jgz
	nmKDVpF2uP1fySN+yPaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPm3q-001qRG-Ag; Mon, 13 Sep 2021 13:31:50 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPm3b-001qMt-2M; Mon, 13 Sep 2021 13:31:36 +0000
Received: by mail-ed1-x52c.google.com with SMTP id n10so14380149eda.10;
 Mon, 13 Sep 2021 06:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7Hugz/+OONUxuIBhoIuTQLQDjY595cqMrn5yj0K0lzM=;
 b=cR8wuHYosPSDj/uz3fuTLgksvjvk1j8FNRACyVsbGIySnNK7/+iV3qiKlleBUvIyuW
 QMcJGoao9TxQ0hZrcBwjAv0Scc+RA6IyK+fda8+/IpGogmboTd5ykH12mGHdWpvKQ+7v
 Gl5ORap11bejGGFuCZxlAPGItJ5Gy0h4l2owY+CRMKvrnVPL0WCaoEh5MYp3FPIxhezJ
 liOFdzY5s2EK5Z4xDooyxpIsTyFGRMT+Pu1SWaMVRIZLUit2X7YcIskokK5GgK+wtP4u
 oOALSyOTK7t6zOqLX8UakUGcrkPKlbVjx8lioL1/4lr4AAk1DZ5kD7LNUtXf7pMvy9qE
 w5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7Hugz/+OONUxuIBhoIuTQLQDjY595cqMrn5yj0K0lzM=;
 b=hay5JDQpGI7A+D0ysQNYW00stb3Sk/QRKXW95DS9iTdrLdlHSqCm/PRetPfX3YAA+M
 GBzCXaCjSI2XsH1Fb+lmI4HLax4zeDEB5UMNLoDG0gPoSDhgCpUdJ1hilUCNsE9oFoiy
 1qMR3HRprWfxiBQyn4UO2aSQ/7yyQCZgDc9+lkthUbhRB4WKzlah5Lr1+aF/nq+N70gc
 nnKNSxwiEbUmwv8ts5CzB23nPXT14eiX/nCrF0rQ31ZcDEC9pTxwsfvJA84pJQTM/whk
 gkih1mC62r4hBMygTuMqPMARXRz4SPlzcni3KNtQe3vw/LK+sLzcb+KBKuT0HvcB1kBr
 nGRw==
X-Gm-Message-State: AOAM5300d2+hGZw7B94FD8gmFO4gAMAbMLxrSmg7RHPoJRYaCL195e87
 ETHlv7dGqwNJnpkMy3WYO3c=
X-Google-Smtp-Source: ABdhPJxc8GQPCQx5zgnEkg+JeF6ykMUDFH6iyZOsu/L92kgCejBT/hWMx52SSd15euMtpiLvG9zRIg==
X-Received: by 2002:aa7:d1d3:: with SMTP id g19mr6012882edp.103.1631539892404; 
 Mon, 13 Sep 2021 06:31:32 -0700 (PDT)
Received: from skbuf ([82.78.148.104])
 by smtp.gmail.com with ESMTPSA id v13sm3458353ejh.62.2021.09.13.06.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:31:32 -0700 (PDT)
Date: Mon, 13 Sep 2021 16:31:30 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Kurt Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens <hauke@hauke-m.de>,
 Woojung Huh <woojung.huh@microchip.com>,
 UNGLinuxDriver@microchip.com, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 George McCollister <george.mccollister@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Lino Sanfilippo <LinoSanfilippo@gmx.de>
Subject: Re: [RFC PATCH net 2/5] net: dsa: be compatible with masters which
 unregister on shutdown
Message-ID: <20210913133130.ohk4co56v4mtljyk@skbuf>
References: <20210912120932.993440-1-vladimir.oltean@nxp.com>
 <20210912120932.993440-3-vladimir.oltean@nxp.com>
 <20210912131837.4i6pzwgn573xutmo@skbuf> <YT9QwOA2DxaXNsfw@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YT9QwOA2DxaXNsfw@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_063135_167358_48243788 
X-CRM114-Status: GOOD (  21.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Sep 13, 2021 at 03:23:12PM +0200, Andrew Lunn wrote:
> > I will fix this when I send the v2 patch, but I will not send that now,
> > as I would like to get some feedback on the approach first.
> 
> It would of been nice to have less boilerplate code, but the basic
> idea seems O.K.
> 
> Have you tested it with a D in DSA system?

To various degrees.

I cannot easily patch DSA masters to just implement ->shutdown as
->remove so as to reproduce Lino's case with the Raspberry Pi, but I did
perform basic regression-testing on:

- the Bluebox 3 board with the 2x SJA1110 switches in a "real" DSA multi
  switch tree setup, with dpaa2-eth as the master and drivers/spi/spi-sc18is602.c
  as the SPI controller

- the weird board with disjoint DSA trees comprised of 2x SJA1105
  switches hanging off of the internal Felix/Ocelot switch of the
  LS1028A which in itself has the fsl-enetc driver as its master. Here I
  could test the fsl-enetc driver with and without the ->shutdown method.
  I also tested with and without dspi_shutdown so as to walk through
  both the sja1105's shutdown and remove methods.

- the Turris MOX board where I did not notice any issues during
  regression testing. The only new message is that the link of the DSA
  interfaces goes down, this is because the net devices are actually
  unregistered on shutdown.

It would be possible to have less boilerplate code, by implementing the
DSA shutdown procedure as dsa_unregister_switch itself.

For buses where the ->remove and ->shutdown have the same prototype
(they both return void), like PCI, the code added is minimal (although
we still need to add the "if this then not that" scheme, to avoid the
function body getting executed twice). For the other buses, there would
still need to be a separate shutdown method, which calls the remove
method. Although in principle, this also has functional consequences
which I am not sure whether I like or not. To walk the full-blown unbind
code path or to do a shutdown with the minimal necessities?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
