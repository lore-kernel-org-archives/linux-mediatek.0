Return-Path: <SRS0=Ntwg=IW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB84C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 01:33:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E080619BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 01:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E080619BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n+A5z6o2zk/tOh3tMC3WXX06xNy387hrYRh0spEa58U=; b=oX775NpCihjrW9ckP0UsAfT/4
	Jk75Ds+PrfeB1Y9JoHMrckzhoEZGMwKHdT5GUVxPBNEugIQvdjH7j3hN602W6C+eDo1iV+skfV9xR
	kF55rd8Vz04fJQ96h0iNx9a4YJ1krtRiyH3lx5vQyd7HvG2ovrQiY+DyDT4bIr9M4m7yklV71Z/5f
	LofniBorsXLEMPmTd0vEPjDJV+3XG7mJnHWSQaxse1J1l0sZOmArTsdRsJVZXgq7jOt9pvX9WFLfi
	5EAM9G0/4hNTaxsopETDoTE3I+r4xIXlzoTMx/CgEKElt+8XXFfasS5pKZWBaQaQki1t0m0Y9NirR
	UCGlhnPXQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOsOq-00G5g9-PU; Wed, 24 Mar 2021 01:33:32 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOsOf-00G5et-La; Wed, 24 Mar 2021 01:33:23 +0000
Received: by mail-io1-xd30.google.com with SMTP id n198so19831888iod.0;
 Tue, 23 Mar 2021 18:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gCd/lcF9fZe1u74op7ACEyE0msKcZYPEEA0XtYL+crQ=;
 b=W7EsSvfrCp9parhWmvlf44nTmJGzGuFl95x81clgZsZR8GIox8cX/pzNBjSzwXO1Gh
 uYt42RXXLlTtzVhSFJWMiVRgzjlChnWbuxvsKsuF9GH4YS+fUl2xTZUbCr8L/puH+EDO
 OfPpcdq02HNeroKt6vZwws/EpGoaGSQnKczrqE0tWsH7Fk6KMryq2IvFvu1PhACXUXaJ
 CmHycGgJjR/bBSUfm84pPKjW+rFYLBE57a5qi5+vJkbMUi9AywOvIqg7GW2N0Zt4nJqR
 7vHFPr/AefCHLu/o4RLzep1ahwaX6augClvkO0rxQWRAVeJ3241nry4Xk1FBZh7Qga3s
 BRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gCd/lcF9fZe1u74op7ACEyE0msKcZYPEEA0XtYL+crQ=;
 b=uOp62I0tTKznMpqW3MkqIvAlhGGhZc4SeL9DiKU5GO7TfO/CbVZXFSjq51xrmSxLjB
 uk1A2Y9uw18leG3OXgGs8cjwKIYWbqzFbWKL2vskXyHL67MHM+B5IcK9LpU8oHBGGoyc
 z9/QplYqewhJR9TQIV4OAfDRUEsEGr4LEfyuK/jpbp23whneJt9Y4o8dxdHESp/lWPOT
 /95g8jYqX+V8TFRK2b3Vc7fvsUqSJPuX+vbRqZMe1gk2lycZdGstxhK7EgBOu2jQFi8b
 YHu9A4SIUtJDmtE0HiFb37CRiq3QBaeNZC1S3/dYzA+RtjpGIc6lYeCDTZnazziSwhQO
 xUyg==
X-Gm-Message-State: AOAM531DuaiKaPyWbY2P8QkXdKDW2lyphR6Jv8EQRGnPHXY5xP26vHSU
 NdJJYuYwmWYQi7oRhXZd/PzqZcgBNh0uHm4bRRw=
X-Google-Smtp-Source: ABdhPJyrV/FaA9Vw9cRKxPcdE0YDPrCXuKhGjPjEQBHOt+PjJQND2ibEPWI1v2BtGHoPOvTMLg22btNz1rwQelOXLL0=
X-Received: by 2002:a02:9645:: with SMTP id c63mr735828jai.84.1616549599613;
 Tue, 23 Mar 2021 18:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210311020954.842341-1-ilya.lipnitskiy@gmail.com>
 <YEpWVAnYLkytpIWB@lunn.ch>
In-Reply-To: <YEpWVAnYLkytpIWB@lunn.ch>
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date: Tue, 23 Mar 2021 18:33:08 -0700
Message-ID: <CALCv0x02RQ=TQDjRNwAN1FJVFEwAbFYiif6JGtV=V4b2u0beKw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210324_013322_092618_6A4A9771 
X-CRM114-Status: GOOD (  16.75  )
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

On Thu, Mar 11, 2021 at 9:41 AM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Mar 10, 2021 at 06:09:52PM -0800, Ilya Lipnitskiy wrote:
> > A recent change to MIPS ralink reset logic made it so mt7530 actually
> > resets the switch on platforms such as mt7621 (where bit 2 is the reset
> > line for the switch). That exposed an issue where the switch would not
> > function properly in TRGMII mode after a reset.
> >
> > Reconfigure core clock in TRGMII mode to fix the issue.
> >
> > Tested on Ubiquiti ER-X (MT7621) with TRGMII mode enabled.
>
> Please don't submit the same patch to net and net-next.  Anything
> which is accepted into net, will get merged into net-next about a week
> later. If your other two patches depend on this patch, you need to
> wait for the merge to happen, then submit them.
I don't mind waiting, but it's been more than a week now. When is the
next merge of net-next into net planned to happen?

Ilya

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
