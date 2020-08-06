Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65640C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 14:58:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 754D7204FD
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 14:58:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J3/xrYOg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="RU0tPU8b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 754D7204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MHNhWEfXeTCka/o7mXhZALYnX/rKBl7tnq7flJhUBt8=; b=J3/xrYOgQG+0FM2FKSYn95qXP
	nSSryUeIung4JKrwwGwoFg4/yGNV1OSqrDnYOoP9hZYq4j+SpJ7qBUs05WTH/jsTzmrKWDR0g08EC
	dy3o9/p/JbanVclzUsTBW21jk7hY8yTW86BHIAZpTOf9jok0exXw/hptQA39E2Vfz52ZbzZXWb3Pk
	57Xzuh4F/nMieo2CpOdxqW4dODuOIidYtAV7PRkvceDW/4juFNfJXyUOzNyNWZUEHOvyNO9P2AKo7
	mjWHTeEZQXBTWlbrToTjJDaw/lnTfwmuqmfICpBxhi8rnRU4nlyasiKOhmhWGBzyDpu8se3Rk6YxI
	K0kUkl/mQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3hLl-0007FQ-OJ; Thu, 06 Aug 2020 14:58:33 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3hLh-0007E1-Mn
 for linux-mediatek@lists.infradead.org; Thu, 06 Aug 2020 14:58:30 +0000
Received: by mail-wr1-x441.google.com with SMTP id p20so9408580wrf.0
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2020 07:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I2QgUmIlO6maUIvLNmFMIgB6tFghLiGYEgxkf43Wx9U=;
 b=RU0tPU8bAxRiOuvHY7DJRlCCP2+QRbiYTaM0EYG5OIICce80n/byLWVwV7uLOp8vjb
 zWbCdW/3rPa2b9W3bVCAqFeyee6Kk5YIEQGfReqtSa12vcltpB6yZj0yIp6dXYe+ZXTA
 uj1D2Zs5Yu49k1Pzvv5W7vUodcbxEQk3yvggE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I2QgUmIlO6maUIvLNmFMIgB6tFghLiGYEgxkf43Wx9U=;
 b=GwoGdRO+Iqe2gYIW7Zs5DNtWE1zNtI/hb4uUDRplrfqDh0d26j3Iz2RxlE4pT+1adn
 +cKpc0Rl/AK6XdYph2YGXgCRwpW0ROp/u2hSP6vIJAAa4i2yZljnc65xQiihJ9yM4sk9
 MxC/43Z0alyl0EqZZ8ytuKJGPM9ziTIPF3RdZ7h2ZGyTnM1hmeZux1brM37jeQAVwyKv
 XR2njCUvRwMiJzAqIApJC/mcSEJwEeXBUyX7E9/wEY9TXuvWIIVK/ORo8KeZH1Ca1XJB
 WjmTM9NPNGgVa9boI8PFctNBcndeXC6IwaWpUUnAVxzEBCXLd5jIQwvpk/+NkRWqsmYf
 Ejxg==
X-Gm-Message-State: AOAM531DVJJNzbuH+vrDnSwR3gq7eY/2uE+EZNka9w/Novtd1suRPWz0
 LdB+Ca7JXC9+9WU3ETDDNmyd7+EtSUhwqCB7rAbg8Q==
X-Google-Smtp-Source: ABdhPJxei3fOQSc5RtFiRdeqUA8wYj3HA5L3OtFNsjWOwMSmZXT0JK+Zw+6cm6ro6Yk62WFzA6yS7yy5PVLA37ZNW0U=
X-Received: by 2002:adf:ed85:: with SMTP id c5mr7800963wro.307.1596725908629; 
 Thu, 06 Aug 2020 07:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAFr9PX=Gk9h6ASi6saBLhoZ45g-WqCzDQo2XWT033fJykFSY_g@mail.gmail.com>
 <20200806140739.31501-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20200806140739.31501-1-mark-pk.tsai@mediatek.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 6 Aug 2020 23:58:33 +0900
Message-ID: <CAFr9PXkFJJKnqVkPBXgh1kqL_serK4DmrmJ73xU+ZMA+NuF-bA@mail.gmail.com>
Subject: Re: [PATCH 0/2] irqchip: irq-mt58xx: Add mt58xx series interrupt
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_105829_801380_E1663025 
X-CRM114-Status: GOOD (  24.90  )
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
Cc: DTML <devicetree@vger.kernel.org>, alix.wu@mediatek.com,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>,
 yj.chiang@mediatek.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Mark-PK,

On Thu, 6 Aug 2020 at 23:08, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> > Do you know if it would be possible to confirm if they are
> > the
> > same thing? MediaTek bought MStar a few years ago so it seems likely
> > but I have no hard information.
> >
>
> Yes, it's for the same interrupt controller IP.

That's good news. :)

> > If they are the same thing could we work on making one series that
> > supports both use cases?
>
> Sure, and I think the irq controller driver should support both use cases.
> So how about keep the MTK version driver?

I'm fine with that. Maybe you can push the MTK version and I can send
a small patch after that to add the small bits I need?

> I'll send patch v2 after -rc1 as I mentioned in the previous mail,
> and keep you posted.
> And any suggestion is welcome. :)

I think Marc's comments on my series apply to your driver and I think
maybe answer some of the questions you had. For example what
to do about the read-modify-write sequence for updating the registers.

> > It's also possible that if the interrupt controller is the same some
> > other things like the SPI NOR controller etc are also common and
> > working
> > on a single driver for those would save us both time.
>
> I'm not sure about that.
> I'll check the patches you contributed and confirm with our driver owners.

I have a very messy tree with support for the SPI NOR controller, SPI, i2c etc
that were used in MStar chips. If any of those are shared it'd be great to know.

Thanks,

Daniel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
