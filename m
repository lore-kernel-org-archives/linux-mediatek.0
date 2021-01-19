Return-Path: <SRS0=YRwc=GW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806FEC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 03:21:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06C6B2184D
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 03:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06C6B2184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MdyxJ4Y3317fzyBGoHZh3/3Lchybcv8r+JuFAazyz7s=; b=qiTREgKKrgB+2iHhTrw682IGy
	T4YxtOgOczQdgG3CgY0/z/sp/cER/W/K1Mf7EhwnxQ+l24LdfXCoLyMAj5qdKfp7S6j+OSRc49Y4H
	/1J57dCfy/eAUfjaHOKJxgijttyIAxvPPypHJAbOCWR66Wq4qlSB74LVvt5d/UTiGgdcWV8X6tRS8
	MaxLijNcgQFRukkaHmLdrZj3XYX91jFZVeeMdjZwflAJnciVk53Dz+h7BrcCxos9baM01BFCNtqMR
	tO+qxjI92+dqa2GCR75XwpWKbuEv00CwhryLQKRBj8EF2iS9WJFAQh3/Vj7BMQNuQvOnRUcjDHTwM
	2+nPOy9eQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1hZm-0008Fn-6f; Tue, 19 Jan 2021 03:21:02 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1hZh-0008FE-RZ; Tue, 19 Jan 2021 03:20:58 +0000
Received: by mail-io1-xd31.google.com with SMTP id p72so12141809iod.12;
 Mon, 18 Jan 2021 19:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7MVhaKG7Tn8dwOvNkpJZ6mk5gJu3V7+tsTKQ2lqUNQE=;
 b=HD4yG7uJzVIXhW4l5LOOY2Wtb78VGKVvgrBOKpEg8/e3WTdk/g2b3OD5zky4NY7qNP
 0qlAkuB3YWZQtvgm0E4njzDLwumPfzddC5mGulQB28NbWUPw+fPt32WMgONtkQergNDr
 hWeu0gHhFCSUcKSQ1XncMb1xgIC4NwsBxa1dbqAXJP8fv/+3Kzg3h1kxtVFJR2m0duxn
 5kXzMgWqSjS6POeLMRCi2OGi6kxSqkkXzjSBxRul3ZKyTclzcthyiN3RJbUCowWibEAZ
 NT1i5Yo7Ee9UXgpB8jaNZHyfWUNWaM2DMKTezjdSYJnD2Q3fY/igFFyHboIpu/M68fPl
 KEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7MVhaKG7Tn8dwOvNkpJZ6mk5gJu3V7+tsTKQ2lqUNQE=;
 b=UCUkHZ0VM1+EzPM3VxuEZpzQgzrUnJDmQd6FEaXx90WNeL44KWpTcQl41IFdBRBlfE
 CMwEJHL0CxrjGINgWj6d4Lz8j3wGqWSicDhAe7CzPN4c/ht/wFT8lA8O16PSeoKOYOEo
 snylWU8/eyS5O5R+7uofqvQ5uip3GSM37a4w7WHkwUdjCO6c8p/hal0ctHLvostICPWm
 27/WsbGVd/ljz+qq83aX2dR23Y2NWX/kKMw++4iRNn8zhLHZA0JWc4zqXa1LFZIecHyl
 ufQtn8lRRh3Fra+WZU/vK7I7vGkuRhffJNPkougElxfneEzUUX9PqEnOACCTDfOd6fV3
 5qpA==
X-Gm-Message-State: AOAM532d2CW+RPTNXIIvRi0gP5665FBH/HJhhrmsDVkVWmWkPhFlkArR
 BCqCWZ62Ngw4OxEixhk9qDXnT21f2FgQXVMox40=
X-Google-Smtp-Source: ABdhPJzXnPvDBsNuLIJ/wPJ3uimKTNwNlnlHCUgeghHJPjwTzbvrIJD6a+WMcDB8AkkPzw0EUhbbpeUYS71kvSYdUJw=
X-Received: by 2002:a6b:c7c5:: with SMTP id x188mr1480858iof.39.1611026455198; 
 Mon, 18 Jan 2021 19:20:55 -0800 (PST)
MIME-Version: 1.0
References: <20210111054428.3273-1-dqfext@gmail.com>
 <20210111054428.3273-3-dqfext@gmail.com>
 <CACRpkdYA2fWF_1K+2aYoZnBAsm9H3=VHpeT4ZDU5sCdrOUWx=w@mail.gmail.com>
In-Reply-To: <CACRpkdYA2fWF_1K+2aYoZnBAsm9H3=VHpeT4ZDU5sCdrOUWx=w@mail.gmail.com>
From: DENG Qingfang <dqfext@gmail.com>
Date: Tue, 19 Jan 2021 11:20:48 +0800
Message-ID: <CALW65jbJ2DFqLw-i91y7oRfRhcukHSAS3A0XMuy4kA+1AtLtLQ@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] drivers: net: dsa: mt7530: MT7530 optional
 GPIO support
To: Linus Walleij <linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_222057_934910_80809364 
X-CRM114-Status: GOOD (  13.22  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Linus,

On Mon, Jan 18, 2021 at 10:55 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> So for offset 0..14 this becomes bits
> 0, 1, 2, 4, 5, 6, 8, 9, 10, 12  ... 18
>
> What is the logic in this and is it what you intend?

Yes. Bit 0..2 are phy 0's LED 0..2, bit 4..6 are phy 1's LED 0..2, etc.

> Please add a comment explaining what the offset is supposed
> to become for offsets 0..14 and why.

I already added to mt7530.h, perhaps I should copy it here?

>
> > +       gc->ngpio = 15;
>
> And it really IS 15 not 16? Not that I know network equipment
> very well...

Yes, 3 LEDs for each phy.

>
> Yours,
> Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
