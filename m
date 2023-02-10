Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2652C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 19:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vXCMZ6WE4tODcRGvNdx2XuDr0IcOSxL6CFkaFwIQevc=; b=vLyFJWtCyG/N6u2DxwWUvBbq0q
	KXRwapg5HQfksV2pEtr9OP3ScwR5oOIx4OevbTncDhwZ6FHVbL+ZQZNF3wO3AVos6g+R/l5JCNirZ
	AxD5yAw4AB5xpWHUQoHzGnXpck0Tjcl+D1AC19Z5/U5YQyh5OQrvD+NMr3gsBYQ0xoDXZS3Rw+zcM
	M+6pg/WExaM7LnazlHYPXChdpIoQvXgu1x+DORuagFy12Zzp7zB4shjibtF3BMuNBvElCEnwVqBpJ
	gxIFUzhde8woyQ9uj6uZnzL2bGDmrG7lnn6g7Lqx5AhSWcFsYz8Cg4eeEG76TFiOeUyz/YBE5LMmA
	OUYZuFDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQZXi-007FMf-DM; Fri, 10 Feb 2023 19:58:46 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQZXU-007FFu-EI
	for linux-mediatek@lists.infradead.org; Fri, 10 Feb 2023 19:58:34 +0000
Received: by mail-yb1-xb31.google.com with SMTP id o66so1769087ybc.0
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Feb 2023 11:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vXCMZ6WE4tODcRGvNdx2XuDr0IcOSxL6CFkaFwIQevc=;
        b=ZQ46cNexOgxmst8qwplIpGLZi3s5+TLLjrxjfsLv1Euw/lZxWc9rvbuME8m36XlM4/
         ReEdeEkn1o1I4sAYe7y0JZqKaLLJUDw3BBQrA5hAslKcNN6TlTTOotRs1YQS3csQO6tL
         juCCxWuVaVtGTLRm3XMq5FmwwC8CUqytXhjor0gW8UJ3V0/+wEfr6IxHCtqiFqbZ4Mr0
         Y5PRkivce6SwZ313APl30PZWoYMn/4IK2waQeYACaVdMANMAJ5rzrFd0af3eDWDg+37o
         hQsFbslCspXWzrKt1h1RP+4isED0Anj8DP6uwNQhNDm5t6O1KNa7fGq5sQqhGaFq3/0n
         KomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXCMZ6WE4tODcRGvNdx2XuDr0IcOSxL6CFkaFwIQevc=;
        b=0MlYjowztEaXVJYj+zffb48u1IQ4ZvmfZ2f48nDrMEtsV80uq1k/AZeVPlX9abZksp
         ALZe7dTArgdCAypOexMThLe9ftU+7984yOPL5HGoN8ciG83TxJPulxIXNwVsf2uHUgkO
         nH7Fh6AduL3DlIMILwKIBXGGGtUPDEleyOLI2VW5gn78K+OYMgRqrisWy6yOjY773ZKr
         eF0CnvGb971VfP7ee/57NM4CgBDUdRcnTbPaeA1iWzCRoRUOwHZZE0qFOFnRamFyhfEA
         tma0UkMvf4nrk/KGixdc65QsHBx2Xd5mDMduX0u6sm06j8yzuNvfRqg3tD2wMI9kuh+i
         IWNQ==
X-Gm-Message-State: AO0yUKUuuaACLK4e6Urc0VZCQjRXvcylFEU85YYcmUvVXIim2cJceNFu
	SjfNx0BY/UWtwV9pod8D4jHDZ3jLtGF6kcI8jtnc
X-Google-Smtp-Source: AK7set9sFtmBqjvWy/xtSPdnpAgsT+2iHaHfmnAhgNvfJ7huuMcTol/DQdbfonvGO1dJekNppYaxUxDEJkdHIW5Z7yQ=
X-Received: by 2002:a05:6902:503:b0:8bd:87c6:d7bc with SMTP id
 x3-20020a056902050300b008bd87c6d7bcmr1127817ybs.49.1676059107373; Fri, 10 Feb
 2023 11:58:27 -0800 (PST)
MIME-Version: 1.0
References: <20230208094813.20874-1-walter.chang@mediatek.com>
 <fdcea75c-1ddf-c4f4-5d46-f32a6619b66d@linaro.org> <CANDhNCp6esdor4kDDTDowkKRfRN9QW8Au7uJMhsxyw0eAG4i8A@mail.gmail.com>
 <20230210085157.GA175687@linaro.org>
In-Reply-To: <20230210085157.GA175687@linaro.org>
From: John Stultz <jstultz@google.com>
Date: Fri, 10 Feb 2023 11:58:16 -0800
Message-ID: <CANDhNComgUF+7UhG-MDjjm97AZRQb__4-1u++45UKfirdAMp+Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] Support timer drivers as loadable modules
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: walter.chang@mediatek.com, Thomas Gleixner <tglx@linutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Maciej W . Rozycki" <macro@orcam.me.uk>, wsd_upstream@mediatek.com, stanley.chu@mediatek.com, 
	Chun-hung.Wu@mediatek.com, Freddy.Hsin@mediatek.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Todd Kjos <tkjos@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_115832_500582_D7E562E9 
X-CRM114-Status: GOOD (  37.12  )
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

On Fri, Feb 10, 2023 at 12:52 AM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
> On Thu, Feb 09, 2023 at 11:50:49AM -0800, John Stultz wrote:
> > On Thu, Feb 9, 2023 at 7:36 AM Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> > > What for ?
> >
> > In general, it's the same reason why modules exist: We want to be able
> > to support a wide array of devices with a single kernel, but we don't
> > want all devices to pay the memory cost of code that will never be
> > used there. So being able to support loading device-specific bits like
> > clocksources (along with other device specific logic) helps.
>
> Agree, that is why modules are for.
>
> > Obviously it still has to make sense, and others have raised concerns
> > of stability issues if the hardware support is needed before we can
> > get to module loading, but I think if this allows drivers (such as
> > timer-mediatek) to be loadable safely, I see it as beneficial.
>
> From a technical point of view, it is arguable.
>
> But my main concern is the real reason of changing this to the module
> format. I see that as a way to overcome the effort to upstream the
> drivers. And the GKI is an alibi to justify the module conversion.

[Putting on my Android Antennae for a moment]

I can promise the GKI is no alibi - it is a real thing. Part of
convincing vendors to ship the same kernel is that we have to be able
to bring the security benefits of being able to update the unified
kernel without major impact to memory. Utilizing modules (all over -
as a lot of small cuts add up) is crucial for that.

Some vendors haven't historically been great about upstreaming device
support, and I understand the concern that allowing modules might
enable vendors to keep modules out of tree. But vendors inclined to do
that will find a way regardless (and because at a practical level,
because the need to keep the GKI size down the android tree will have
to carry a similar change to the one submitted here), so I don't think
rejecting such patches is a real disincentive.

Instead it just creates further needless fragmentation between
upstream and android kernels, which makes it further difficult to
justify and motivate upstream-hesitant vendors to submit their code to
lkml.

And again, there *has* to be upstream users, as we should not have any
maintenance burden for out of tree code! But in this case the upstream
timer-mediatek driver was named as a candidate module (obviously those
patches are needed when this series is re-sent).

Additionally, while I understand the concern and skepticism, for folks
who are working on upstreaming (Mediatek along with folks at Collabora
have done some great work!), having to deal with this meta-issue of
questioning of one's purity-of-intent, when one is actually submitting
patches I think makes the process of dealing with the community seem
even more difficult (making some folks question why bother).

The upstream kernel community is an amazing thing! And I understand
why we want to be protective of it. But I also worry that if we get
too wrapped up in suspicions of ill intent, we aren't going to be able
to bring folks into the fold and grow the community.  The license
doesn't require one to work with the community, so we should probably
be using more carrots and fewer sticks.

> Given the timers is a base brick of the core subsystems, without
> proper support of the timer (eg. bug fixes), the platform support will
> be wobbly.

As for bug-fixes, it should be noted that with the GKI, not all
modules are vendor modules!  There are GKI-modules, which are common
drivers/subsystem-infrastructure used by many devices (such as NFC,
Bluetooth, etc), and these in-tree drivers are updated with the GKI
kernel as modules. So there is motivation to ensure bug fixes to those
upstream drivers land upstream so they can be included when the GKI
and GKI modules are updated.

And to your point about it being a base-brick - Yes, obviously not
everything can be loaded from a module safely, and that's fine. But in
cases where devices can boot with a built in architected timer, then
are able to switch to more device specific clocksources, we'd really
like those device specific clocksources to be modules.

thanks
-john

