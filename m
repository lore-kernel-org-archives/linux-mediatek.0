Return-Path: <SRS0=Ntwg=IW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7C6C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 01:35:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D894619E9
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 01:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D894619E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=54nZ8UbsUGZXulCXblxJdcYBVeqnypckm8SrR+d1NGE=; b=lNBqH5/4N/0ccoYZzR2wmmLEe
	A2Yb7Y2gET+5thtPWwipOu/Vt2z+yWcFUJsEnt4QcxIgQFdYo8qmWZu9SqajMyp73WLkayr+/y7vA
	Zf4qbHqpkQR8s09vAQy6kVwFfPfQY3r5XS/9PcIUhRIi5X1+AZRSDW08ICCR7blQAcY2+IWmSWnHm
	X8J4MWI+JDp0SQTHwx1HNeFQvWD36M2hz1B0xr8s3J+Fc1zzYvfRXs/hEy/1IJOHjGHkYL2pWqWKe
	0uX4pGY3ZrCthH4VoGv5hv5a6AopnnBa3wgbc/0EljQgyiH58JW/1A4FL8W8YNT4/KJ4FHO6wpdGN
	9udi217cw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOsQe-00G5v7-FQ; Wed, 24 Mar 2021 01:35:27 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOsQQ-00G5t7-07; Wed, 24 Mar 2021 01:35:12 +0000
Received: by mail-il1-x12d.google.com with SMTP id d2so19956713ilm.10;
 Tue, 23 Mar 2021 18:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WnbdkW31AZCP279wJrfi61OFtaM3U9OB5n7/54JuxrY=;
 b=PYRfhkFTr4vk6INv4PYQuWF+RqvtGa5xvbf1Fn/PAg9dHoKUylnWVdVYFim2HQOwEA
 Uw50j7qBVIwWgSd51qKqlt9lOSsJPWsot9chCQYr9QH/u+xl+E43Dr/+21AFnF5MlaA4
 d/91gX33AAneBrz3TTKDVGpYgZluc3DWfTUctbqkku5tuceYsUacreyRs18QrxlKsHxT
 QY8KVHJi10M3zQfefYEjQKluan1uqVeLp5N0mU2uPb0jGKI3rvvj7xEUzD1+PeoQM3XA
 DgZtKZ7WroIJsB1CgMJwciErr3o9IZX75nfLDRVUQ7OuGMwsNt0yPdiC9i4K5Uv3S+jg
 Wk+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WnbdkW31AZCP279wJrfi61OFtaM3U9OB5n7/54JuxrY=;
 b=PjI/nJAf1BC+zo+glxWIk0AZld3wcsvoTtdLoNBqWjT+Y6onruLCwfIx6vrd1A7MlG
 OUOusSdzwcH8Bkj8Qyc01/Y+K9CbjddypNxFTE26662MSCdfC8noVfZMmIP2l0z5dRap
 kS6O9cM8gXRKtnq5IVlxGKsCJC2lkpdsmQQsJGGlV896nTJ6aCsNdTVnRJuwPXd20wN6
 caY0OVaTaEVQ6DuXCzLrPmO83WF7vfZ+BV+2rkZ8KG0ssl2PRP47JzTUuyOIEqFujvPT
 wBUEbO1p7p82ptkIMnIK5G6u67Y+oqT1J9P0RKPIxCOz4gQolUN8/k1Kh+ETbg++CV63
 V4Kg==
X-Gm-Message-State: AOAM530zIbjtwXCb3zAHhRBURKL+ylcq5p5U9TGine8p75Ee9HttXH6w
 2zwqZ8AJ7znTr1ALNX1FOgwyIMSTXNUSg8F+1Jg=
X-Google-Smtp-Source: ABdhPJwvHx8t8NX/6uo4TYe98DKgtwFdK2RsZmCxfsEUuBy1GCEM51qGHAmiKarmLEfYwHTimvtO7gw8YSrn392MbVc=
X-Received: by 2002:a92:c842:: with SMTP id b2mr785236ilq.179.1616549708783;
 Tue, 23 Mar 2021 18:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210311020954.842341-1-ilya.lipnitskiy@gmail.com>
 <YEpWVAnYLkytpIWB@lunn.ch>
 <CALCv0x02RQ=TQDjRNwAN1FJVFEwAbFYiif6JGtV=V4b2u0beKw@mail.gmail.com>
In-Reply-To: <CALCv0x02RQ=TQDjRNwAN1FJVFEwAbFYiif6JGtV=V4b2u0beKw@mail.gmail.com>
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date: Tue, 23 Mar 2021 18:34:57 -0700
Message-ID: <CALCv0x33Pc6vbzzzQ2kv3JR6Yaz_sru_4dp=JptDS5dKSV5nUw@mail.gmail.com>
Subject: Re: [PATCH net-next,v2 1/3] net: dsa: mt7530: setup core clock even
 in TRGMII mode
To: Andrew Lunn <andrew@lunn.ch>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_013510_149141_823A96BE 
X-CRM114-Status: GOOD (  19.15  )
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

On Tue, Mar 23, 2021 at 6:33 PM Ilya Lipnitskiy
<ilya.lipnitskiy@gmail.com> wrote:
>
> On Thu, Mar 11, 2021 at 9:41 AM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Wed, Mar 10, 2021 at 06:09:52PM -0800, Ilya Lipnitskiy wrote:
> > > A recent change to MIPS ralink reset logic made it so mt7530 actually
> > > resets the switch on platforms such as mt7621 (where bit 2 is the reset
> > > line for the switch). That exposed an issue where the switch would not
> > > function properly in TRGMII mode after a reset.
> > >
> > > Reconfigure core clock in TRGMII mode to fix the issue.
> > >
> > > Tested on Ubiquiti ER-X (MT7621) with TRGMII mode enabled.
> >
> > Please don't submit the same patch to net and net-next.  Anything
> > which is accepted into net, will get merged into net-next about a week
> > later. If your other two patches depend on this patch, you need to
> > wait for the merge to happen, then submit them.
> I don't mind waiting, but it's been more than a week now. When is the
> next merge of net-next into net planned to happen?
Oops, I meant net into net-next...

Ilya

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
