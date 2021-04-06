Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA443C43460
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 15:39:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D5F1613A3
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 15:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D5F1613A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eF9juW4izLS79fC1SFl2FjQoEzDq6vQBsGU83JbJndc=; b=VV2svELEGM2UoCRp63YN4hUIO
	hRK2Fkh6YJOt8ONj1XPEBhxOC+ZarQ7Fcw1/UlBqQwDxYLXSBpnFOl3gMyzqeouimUtBjv0XEceO+
	dIeNbNix8Ai6YsgNUOnQ82aGXQS80vJozBrYViflhawMZ2nWNh2QhzDoSa328OMwDhi+xL8/XMniQ
	Y67YAVxd1M8PaiutH+HgWLxzOrhPuBpSrF5FDGy3NPd3oZepyUHGw7axlSweds21594U4BKD0HN0W
	cAqCWUcPwMjszuxjE14UP0IODigejW/8lM5KCqwj/ZXioL/qGBLw1+IBGN10AOfz6Z+6Ft+1Vf9Mt
	ruBjf7WbA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTnnU-002wX4-AM; Tue, 06 Apr 2021 15:39:20 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTnnQ-002wWT-Db
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 15:39:18 +0000
Received: by mail-io1-xd31.google.com with SMTP id z3so13277574ioc.8
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Apr 2021 08:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dWxFzfKKOt+ryNUGtIA7HKn1wCE+QFswqU/+uqCUAzo=;
 b=G9jof8Q6D3iqyUddjnM66ZIpqBpTUSY4OWVPX8B4ht0B5FcM9cGnncIhteSSSAr0gg
 W5rBCFvuOHQrzdf+5g6y5T32ts5lLZbBdZgH9c0rnnMQvC0id5owFpSPczcltIl8ey7i
 ajQkhLrsn5aEschOSp66HTvuDLnCd68+crEVnaqLn3ZT/BXRoXbVJHk2EuxwnGTgks8z
 sg/rqazXZPXiGDrOEgW1PO+Aa256W77paqMIfiabrszEDIxpC5eMTVaT4z85klx1Wg7t
 5zZdVf4ZcsCsBrXVwZwd4JNTGdVaTTFM0ixQK000QhzlxbUv1Kv/bvwsezy0Yg9nwk4k
 tERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dWxFzfKKOt+ryNUGtIA7HKn1wCE+QFswqU/+uqCUAzo=;
 b=sMIJDemTsLLnHMkkpHXy+seWSVDOqzRvOMj41iS0c6fr/4gWuhwUf6M6yK/w/tZsFQ
 xctE58nfvEVfh3KbBBHPGjbH06gs+oQVJe5fHdvNGyzq7bdGViS1YtoSkrZT5XDksDu2
 n5uMcihhArWPmCA6kT6Z3rliSTvfvWiS2AQ/cIhtAeWWMV+2xC9QnXJWgfW5xnMe5HgR
 YBLe+2DmhVJ7A0dQlt1FgH8bqejAu5PFl6N07N7QhI+oMhjydMXAhR47sykBsyg3UrY/
 n1azyKuGZeGE6QezhSUFrZLKHdLosF0Yh0dxHbCWUB35Ajor1pTzLaU51sySG1vo3cVy
 yZBA==
X-Gm-Message-State: AOAM530Qipw2ArerYW6XtxL2oewBknJHZAkR3C9AqojT9euL087DkzN+
 vMNkxuKytOfYRlLQ4gqyueXZJ5Fj45f2q5zeDYs=
X-Google-Smtp-Source: ABdhPJy3YG+5BM+JKU8AQNUYeKtb+jJMAndWgE0jQ+keqRMn1E2k/TmrjG0/9fN38Ubih2KJL/q8MeujGEdUnK9jZgo=
X-Received: by 2002:a02:ccda:: with SMTP id k26mr2514289jaq.136.1617723555190; 
 Tue, 06 Apr 2021 08:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210406141819.1025864-1-dqfext@gmail.com>
 <20210406141819.1025864-3-dqfext@gmail.com>
 <YGx+nyYkSY3Xu0Za@lunn.ch>
In-Reply-To: <YGx+nyYkSY3Xu0Za@lunn.ch>
From: DENG Qingfang <dqfext@gmail.com>
Date: Tue, 6 Apr 2021 23:39:12 +0800
Message-ID: <CALW65jYhBGmz8dy+9C_YCpJU5wa-KAwgrGjCSpa3nqUNT+xU+g@mail.gmail.com>
Subject: Re: [RFC net-next 2/4] net: dsa: mt7530: add interrupt support
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
 Florian Fainelli <f.fainelli@gmail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>, 
 Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-kernel@vger.kernel.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-staging@lists.linux.dev, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
 Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>, 
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_163916_670314_583F83D4 
X-CRM114-Status: GOOD (  11.28  )
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

On Tue, Apr 6, 2021 at 11:30 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Apr 06, 2021 at 10:18:17PM +0800, DENG Qingfang wrote:
> > Add support for MT7530 interrupt controller to handle internal PHYs.
>
> Are the interrupts purely PHY interrupts? Or are there some switch
> operation interrupts, which are currently not used?

There are other switch operations interrupts as well, such as VLAN
member violation, switch ACL hit.

>
> I'm just wondering if it is correct to so closely tie interrupts and
> MDIO together.
>
>      Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
