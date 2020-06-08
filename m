Return-Path: <SRS0=8MsW=7V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3063EC433E1
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 07:49:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06543206A4
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 07:49:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W6Hmry3R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uLi1Rmjh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06543206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ktQq7yL7Q//LghJ/HVQszflei3D2JyIuheF162As2Y=; b=W6Hmry3RWyatTu
	UPhBOovEbiqSWal9yXN7VbG+7fiM431y+R7JXMwjYH6xTsbWwqCodeb0E+JjX4It9whX7FhsBtDos
	ii58QHZlDo6aMZUNCUxz8iJS3hyhdX1/GhbaQbAi3foe0XGy44W/Kds4M6fwXXvP4D+QuqWiY2TN6
	PUEcZE9itVZT8DqLsL8Jxe12IqH9k9WjOY/MXaBc3X5uBc0hQo7YhoYqqW4dOhPYzGCr+7GNUzC02
	tVre6vDBxD/SxJZLZrZSEfYN/IN6So92BdNdETgBsb2p8o8Iyxb2Dcu3ODDczKSz/9HVmVYy9xs5w
	dhtDIoqp1fyZpwIp84NA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiCXE-00014R-B7; Mon, 08 Jun 2020 07:49:32 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiCXC-00013q-7O
 for linux-mediatek@lists.infradead.org; Mon, 08 Jun 2020 07:49:31 +0000
Received: by mail-lf1-x143.google.com with SMTP id c21so9600152lfb.3
 for <linux-mediatek@lists.infradead.org>; Mon, 08 Jun 2020 00:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=37K4gneCiuRGulLCKf4ynFvMW4e68flpa0GiDzEnHyg=;
 b=uLi1RmjhtH1FlDsw82tNk1UEqMah3505zWAqYW0iJnhsR3ofTEhFjqgg0bqVnddqZT
 wAxQu3f3tLu0IjoYRj/q5xCx5ttN12X/9cS1LPWtvPhLhxvS2znXsVPeT1APIbqa6lNe
 A4/si6/ECFxjTPLdooQi+BUYuS9FxroIrzWRnwuzUiDLj5axLDtmFK/fgmAKdII++gN0
 8H+slUd3WPMJbncGutqkddXFKaG9mJrXn4b9AcUYLERHHIRVN1uuOFicsU96UPRjItfA
 1eA5C+72CB02PbahRX0V2G87TOjsr01aUEtMLxh5bPLhc8KL2wa6RaC1xoAyU4lcJ6mb
 7heQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=37K4gneCiuRGulLCKf4ynFvMW4e68flpa0GiDzEnHyg=;
 b=C/UJB1qP3St5ePfizQFthaWLxP2gWqy65mMgXMXE6wEdTVd+q3rFulQxwqns8c5w7n
 Mbjr5ZK0mQ2aV5jkwp4kmQg7h0G7SqFYD3JZQ6+u1qEKTmig8WOzCOXIOu4XZZOPJNqy
 ZGg9BS+spAiXD4+WHY9VLRG79lITD5Iq5pSRQ+EngTX/3yJ62cdeR+xvbXJ0rIe6Zh7T
 OAM1guKoHnpXw9K6+5rTis+tWc51kuCErsCmFI+I6l2yZXwzs9RJwqp0e8p13Gp2viuv
 h70TdvOQ/44BCNtrPR3irNG+HlozTJO39k3qifDRvqUD3xCPQRZOBwR6D9VjiX80+y91
 ismg==
X-Gm-Message-State: AOAM532QPBWq5tBaaDG/45l9IUXKrqMtsRQQQb6Mlm7Jrd7Ry3oxvIPt
 fMzJ85yL1UThxzQHNEQK+rIkatARp3esAzGW/tMJIQ==
X-Google-Smtp-Source: ABdhPJwxrOl8NL4ByK/Pfp55vHI3T08O8KOMm+uol36pOuMBluSdlFqIghiVrQxdlv6OnTL4mJMgM/2GivNrvUhScRE=
X-Received: by 2002:ac2:5473:: with SMTP id e19mr11864445lfn.21.1591602567899; 
 Mon, 08 Jun 2020 00:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <1591085678-22764-1-git-send-email-neal.liu@mediatek.com>
 <CAMj1kXHjAdk5=-uSh_=S9j5cz42zr3h6t+YYGy+obevuQDp0fg@mail.gmail.com>
 <85dfc0142d3879d50c0ba18bcc71e199@misterjones.org>
 <1591169342.4878.9.camel@mtkswgap22>
 <fcbe37f6f9cbcde24f9c28bc504f1f0e@kernel.org>
 <20200603093416.GY1551@shell.armlinux.org.uk>
 <1591341543.19510.4.camel@mtkswgap22>
 <20200605080905.GF1551@shell.armlinux.org.uk>
 <1591347582.21704.9.camel@mtkswgap22>
In-Reply-To: <1591347582.21704.9.camel@mtkswgap22>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 8 Jun 2020 13:19:16 +0530
Message-ID: <CAFA6WYNqWmhiz=wvCTt1ubMtrhf+RtFSC2GiQQeteEbmrF1EnQ@mail.gmail.com>
Subject: Re: Security Random Number Generator support
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_004930_269370_06F7CC66 
X-CRM114-Status: GOOD (  20.12  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Julius Werner <jwerner@google.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marc Zyngier <maz@kernel.org>,
 Sean Wang <sean.wang@kernel.org>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 wsd_upstream <wsd_upstream@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Matt Mackall <mpm@selenic.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?B?Q3J5c3RhbCBHdW8gKOmDreaZtik=?= <Crystal.Guo@mediatek.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Neal,

On Fri, 5 Jun 2020 at 14:40, Neal Liu <neal.liu@mediatek.com> wrote:
>
> On Fri, 2020-06-05 at 09:09 +0100, Russell King - ARM Linux admin wrote:
> > On Fri, Jun 05, 2020 at 03:19:03PM +0800, Neal Liu wrote:
> > > On Wed, 2020-06-03 at 17:34 +0800, Russell King - ARM Linux admin wrote:
> > > > This kind of thing is something that ARM have seems to shy away from
> > > > doing - it's a point I brought up many years ago when the whole
> > > > trustzone thing first appeared with its SMC call.  Those around the
> > > > conference table were not interested - ARM seemed to prefer every
> > > > vendor to do off and do their own thing with the SMC interface.
> > >
> > > Does that mean it make sense to model a sec-rng driver, and get each
> > > vendor's SMC function id by DT node?
> >
> > _If_ vendors have already gone off and decided to use different SMC
> > function IDs for this, while keeping the rest of the SMC interface
> > the same, then the choice has already been made.
> >
> > I know on 32-bit that some of the secure world implementations can't
> > be changed; they're burnt into the ROM. I believe on 64-bit that isn't
> > the case, which makes it easier to standardise.
> >
> > Do you have visibility of how this SMC is implemented in the secure
> > side?  Is it in ATF, and is it done as a vendor hack or is there an
> > element of generic implementation to it?  Has it been submitted
> > upstream to the main ATF repository?
> >
>
> Take MediaTek as an example, some SoCs are implemented in ATF, some of
> them are implemented in TEE.

In case your TEE implementation is derived from OP-TEE, then I will
suggest you to re-use OP-TEE based RNG driver [1]. With that, you just
need to implement an OP-TEE based pseudo trusted application (similar
to this [2]) specific to your platform and need to extend driver UUID
config table [3] with UUID of your platform specific pseudo TA. This
way you can avoid using hardcoded DT based SMC approach and rather use
auto RNG device detection provided by TEE bus.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/char/hw_random/optee-rng.c
[2] https://github.com/OP-TEE/optee_os/blob/master/core/arch/arm/plat-synquacer/rng_pta.c
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/char/hw_random/optee-rng.c#n273

-Sumit

> We have no plan to make generic
> implementation in "secure world".
>
> Due to there must have different implementation in secure world for
> vendors, we plan to provide a generic SMC interface in secure rng kernel
> driver for more flexibility.
>
> Vendors can decide which "secure world" they want (HYP/ATF/TEE) by
> different smc/hvc and different SMC function IDs in DT node.
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
