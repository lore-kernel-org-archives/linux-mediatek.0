Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0521DC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 16:02:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D374613CA
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 16:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D374613CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n9X6em0bqhuKi/FjAvVhQ+TXkcn4EFqQrHTlfv6pgRY=; b=Edc7EsSkkj59UxFXborpb6oqu
	cOFtQ7kNnXkbHWthudOQFx8fYoHsEdAfbIuPdr9OasHiaXSdJFcJDB6/xtYhVv10o9Fmye2UebXWH
	x/m8RUHqzCc4oFZ5n7ftsrtG0cI8NsXmESntG9DgoB7wmZr/VHPp6+YjHAl18/Z2jo0+vLfsmEUoz
	Oiyg29BT6K5UxID0I7qhdZ5pUSia9Y4h7+hGxqNFekClwzl2aM/UIPdefYBXlSlFFIoUddkFbdkqM
	aB+6mc941dAx19iRjxcT3BVh8ZN64a7yJUsogMRQSmZ+wcvZCaWXIJog59BUVMFdKOoGRJqC4a6WR
	kflj/yJPA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTo9Z-002yJa-08; Tue, 06 Apr 2021 16:02:09 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTo9V-002yJ2-8I
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 16:02:06 +0000
Received: by mail-io1-xd2a.google.com with SMTP id j26so10928934iog.13
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Apr 2021 09:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y6td6U/wgXJy1PKxkTx+qADiVVwnBDVWbevDjru0nls=;
 b=XvPpCjYxNmJmPbhWQwWWLjNrOfwWJekG5FGqReCq3HR7smTKgok8w/+146+n12sXYh
 g1SrBLJkHm6800/a8NRq/X+CMSiz6G/JNNS8hv/BXu44w47pWOn4xjF227zQ2lkprOIh
 eGWepOCNQdmUWzQmHnj7HDx92mhDsbhqkmNXhEA/G8FyxFn6hoH1IVrtQ7PnvK8DwgzB
 PpYChXnoMFzZkwxfV3WUOwaNcPHs1chU+ro8WE+MMTT1XaElw/fgi6L1oS8RhBNtOjdF
 OYxHMqvZRgAwps12+XvU/yKiF+SLtPa48N5qxjKKm0GQe2t7kykpeRwCrm/FaC3hYWj6
 A/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y6td6U/wgXJy1PKxkTx+qADiVVwnBDVWbevDjru0nls=;
 b=D+PXponJCg2E5gNfz2WBkrMAN4/HwHPYuf2LeviiPWVtVk5wNFR7nj89AxHnm7QFS6
 OwcDb8pgyMhEWjz0c7fS1kguDwFoHrZsQxdis4eRE849tRh3qw4xDq9WBrxkJKd4ikuO
 q+nM28oRml4IYs+3UnI0EA8MhTz1sjHRljDGKvnaRLosU799ICNiAMR8vX2dH9MDsPYL
 fjGBOr8mzMvctm6iHr+YOIzG0wxZq99yTPpmF+dT1HiOBXsdwUQ+/ihoz8tfeeiNi7Y5
 uwM7aiEvCC4WUndl4qAJvjHkqHTT+Ez/Ue8BFSsYS3NsrFzStI455IRl+BLWEuFCW3U7
 KBzQ==
X-Gm-Message-State: AOAM533TkaljeJT/rU3Da8BmtbS8R7XbW11a6v+vAVbCsWBQSVctZ+64
 mDB5Cj6jph6Wrf1Nj0zapsBbpWmgz0QNKhAgFZs=
X-Google-Smtp-Source: ABdhPJzrupn5Tqo/qGYiJFhgY4pom3bPfOsFnrJ4YLA/PGWrDxckk5HncixtyDHTPC1rXWyNlr2qX0SRG+OFMzNoklo=
X-Received: by 2002:a05:6638:144e:: with SMTP id
 l14mr29148356jad.76.1617724924002; 
 Tue, 06 Apr 2021 09:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210406141819.1025864-1-dqfext@gmail.com>
 <20210406141819.1025864-3-dqfext@gmail.com>
 <YGx+nyYkSY3Xu0Za@lunn.ch>
 <CALW65jYhBGmz8dy+9C_YCpJU5wa-KAwgrGjCSpa3nqUNT+xU+g@mail.gmail.com>
 <YGyC9liu9v+DFSHA@lunn.ch>
In-Reply-To: <YGyC9liu9v+DFSHA@lunn.ch>
From: DENG Qingfang <dqfext@gmail.com>
Date: Wed, 7 Apr 2021 00:02:00 +0800
Message-ID: <CALW65jaTfcJoMqZPfLjbYXd+JWvG8CciUiGRmQwc_bf2538kog@mail.gmail.com>
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
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-staging@lists.linux.dev, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
 Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>, 
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_170205_388145_ED651C8D 
X-CRM114-Status: GOOD (  10.90  )
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

On Tue, Apr 6, 2021 at 11:49 PM Andrew Lunn <andrew@lunn.ch> wrote:
> O.K. So that makes it similar to the mv88e6xxx. With that driver, i
> kept interrupt setup and mdio setup separate. I add the interrupt
> controller first, and then do mdio setup, calling a helper to map the
> PHY interrupts and assign them to bus->irq[].
>
> That gives you a cleaner structure when you start using the other
> interrupts.

Okay. Will split the function in v2. Thanks.

>
>         Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
