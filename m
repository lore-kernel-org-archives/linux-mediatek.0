Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B23C54EBD
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 12:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGewXTLqSFz0s2fQ/uiqIpRGEfPE9NdhCOeAHQbwGQ4=; b=34eBTfxoun84SvEagZtm/0C1VN
	cUhXMKEtkW437GTmufkhleAS8bI97HhcgIPETjE9T5Vm3xxdhw8jE+/l/wbmpeq6nBQuiGwEemG+k
	ZLltHJZwmeUbt4Z8BCy9dl5uI50wThuRxlWd2DqgiQHTlavUV37cpA0rVZK1ViFcmRVBOaVd4h1Sd
	dd79eGVlfELS+bi5nSzE96dewCADOtP6RLtK9Fj3lHNBBAwMwQHKsHSz2NlCRjaNN1TiYcFG5tDTx
	hUzwD/rQA6r22xZMJyAlPDK792NQDfPhkaY4cBtLx5ez6iYrduPxdOwOTDokoIJMQIjCONyR8pzw9
	GVdHFRwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pErT3-001GYV-UE; Mon, 09 Jan 2023 12:41:33 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pErSr-001GVH-U5; Mon, 09 Jan 2023 12:41:23 +0000
Received: by mail-ed1-x534.google.com with SMTP id c34so12377811edf.0;
        Mon, 09 Jan 2023 04:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JGewXTLqSFz0s2fQ/uiqIpRGEfPE9NdhCOeAHQbwGQ4=;
        b=niw7LwOoXihZAh8slgQZqcziXoVi78Vi+LO4SGwAlxnMerGgKYyKrD7KNQ6i5NAmhM
         BGS4Z6cn31pJ6astgoj9Y3UwY0GdTwvwTBpNxSrW2N9UdXD+R/Sv1VTszs6TLG+q2gZd
         0S+vZSl0qR7C6vpZhXvDk9hWPJJLITkm6aA0U6S6wQnP03t0vYb5y2QPilAz18Sr5zZU
         5HEdF3cqTQ5SVv8GSqVb8TpcUw6KYbG8tUWh/aF52RGJ7gmHyAc1G3jpwlDTKQhHNkVt
         +GpGqybeJWI3IzbVIhdRfniC78iIe8dc2p5rNazLHzJfAuO0dkMJ+b1vBtbXAhHF/21g
         akiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGewXTLqSFz0s2fQ/uiqIpRGEfPE9NdhCOeAHQbwGQ4=;
        b=CN6GIJkgYL6E4iES4XGCQLizJuIOE01etZArMDsImXyRA34CMMoBHsRmWX+awHIN33
         Br3ENGvWXNt4X5LS4elHt+xIGDATmfIYcW7ROfcBh1bz2OOI5nMCPvTq2Uet7eTips8N
         cv3QeWkVbet+Fz0BZgzbUw+VXYFxzzMA3tHzud45Cz3u6gHVPeX24gaobOeIv+FhrnN8
         YPj97QTHoptwyCKCzd6O9hLIRjR/B33o93PdEGxBh2QQRZKfwCaamjA474GSl9QYLTd+
         ZCBubJYIN4vgZEIL1oDd7pe68BIymrvDCEw5Q+a6EcdTam/RCGxyLYj+cAlcnuplvG7x
         PJrQ==
X-Gm-Message-State: AFqh2krNdPbmNC9Qw5ceQbilMRxbeIuZ98I4NFio1LvAXgh3IXyoQhL6
	QLrMdKHgU2Hwz5o8csRiVco=
X-Google-Smtp-Source: AMrXdXtozY8/sv9/RZyH7AHeqkHau1dX6bYb3YdTbSW3LGoOzTXLWxtDsVajIZDFvgbgxNFh6NQyOA==
X-Received: by 2002:a05:6402:3ce:b0:481:f14d:fda5 with SMTP id t14-20020a05640203ce00b00481f14dfda5mr51894230edw.39.1673268079446;
        Mon, 09 Jan 2023 04:41:19 -0800 (PST)
Received: from skbuf ([188.27.185.38])
        by smtp.gmail.com with ESMTPSA id j17-20020a17090623f100b00770812e2394sm1668190ejg.160.2023.01.09.04.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 04:41:18 -0800 (PST)
Date: Mon, 9 Jan 2023 14:41:16 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Michael Walle <michael@walle.cc>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>, Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH RFC net-next v2 03/12] net: mdio: mdiobus_register:
 update validation test
Message-ID: <20230109124116.tqsnhh6xvg6e4m4l@skbuf>
References: <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
 <20221227-v6-2-rc1-c45-seperation-v2-3-ddb37710e5a7@walle.cc>
 <Y7P/45Owf2IezIpO@shell.armlinux.org.uk>
 <37247c17e5e555dddbc37c3c63a2cadb@walle.cc>
 <Y7SqCRkYkhQCLs8z@shell.armlinux.org.uk>
 <0584195b863b361a4f5c1e27e6c270b3@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0584195b863b361a4f5c1e27e6c270b3@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_044122_010405_4233C797 
X-CRM114-Status: GOOD (  25.54  )
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

On Mon, Jan 09, 2023 at 01:35:29PM +0100, Michael Walle wrote:
> Hi Russell,
> 
> Am 2023-01-03 23:19, schrieb Russell King (Oracle):
> > On Tue, Jan 03, 2023 at 11:21:08AM +0100, Michael Walle wrote:
> > > Am 2023-01-03 11:13, schrieb Russell King (Oracle):
> > > > On Wed, Dec 28, 2022 at 12:07:19AM +0100, Michael Walle wrote:
> > > > > +	if (!bus || !bus->name)
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	/* An access method always needs both read and write operations */
> > > > > +	if ((bus->read && !bus->write) ||
> > > > > +	    (!bus->read && bus->write) ||
> > > > > +	    (bus->read_c45 && !bus->write_c45) ||
> > > > > +	    (!bus->read_c45 && bus->write_c45))
> > > >
> > > > I wonder whether the following would be even more readable:
> > > >
> > > > 	if (!bus->read != !bus->write || !bus->read_c45 != !bus->write_c45)
> > > 
> > > That's what Andrew had originally. But there was a comment from
> > > Sergey [1]
> > > which I agree with. I had a hard time wrapping my head around that,
> > > so I
> > > just listed all the possible bad cases.
> > 
> > The only reason I suggested it was because when looked at your code,
> > it also took several reads to work out what it was trying to do!
> > 
> > Would using !!bus->read != !!bus->write would help or make it worse,
> > !!ptr being the more normal way to convert something to a boolean?
> 
> IMHO that makes it even harder. But I doubt we will find an expression
> that will work for everyone. I'll go with your suggestion/Andrew's first
> version in the next iteration.

I think the double negation conveys the intention better than the simple
one, actually (maybe even xor instead of != ?). In terms of readability
I think I prefer the way the patch is written right now, but if you keep
the comment, the double negation should be pretty easy to swallow too.

