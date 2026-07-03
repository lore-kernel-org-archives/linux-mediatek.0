Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9A9C43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 12:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKIP/2g7MTxmMgVnWjjRdFjs9hik6bQNvbKXHobNWdc=; b=tcDcKJHDc+/NZ9oBbOpL9ryR9v
	q5aKtgNgJ5s0Atec6qmthENUtKnhO9CeJ406fIQnZu9rgT/ga/MZHyQuEtqHXby2uS9BI+LXqJ3Tf
	Ax0m4qetip6AGYpk7BG82EnG8ckIFBPZBK2rdmv31dX6NIPe4ia1fCymiOPT4/4K9fK85avI7IoGB
	uATnD8tdS/6frUAdCNHxiIqWubYoiTqbM0t8PF4pRuARp8eTkMYfzkVEU8rXBvy9Q2p+Txqi7+cNG
	YGsRbae+9u3deqhLRgmyUW9pnE/bPVxJTc0sTGUpd2Qd929uMwb3eV2FEvFuahuOxyvgSQIuyHCpQ
	p691vqpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcpq-00000006v6j-2V1w;
	Fri, 03 Jul 2026 12:17:34 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcpo-00000006v5S-0XM4
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 12:17:33 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-664cb440f9eso588906d50.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 05:17:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783081051; cv=none;
        d=google.com; s=arc-20260327;
        b=P7bfUJF2BaAt8vPVal0fBATE/V6lRUo87ztVek1M6KUx+vsFAlsE2kJRfz5In6Beqs
         MgtesP/aePmOSITOQDKOgLZFQvwsDe/RtBfhr0jgc/CcDmHbGABSug4GyI0NRynZKjGn
         QbV7ea0i4AynEVvw6RrPJFYeY9pFYKk9rG6Luqd4hxdUUEucS6erdMC2MHJEufoiACDG
         n9KFNzXufRuDxlvkRVsGgKedTeWjpjNSPbZcU2PVuSYUUcvtPtyL8tCKCldVdGOsRnJa
         slJDqcSuma+7qsw65SWu6xBifIP3sLoidqYewp5yDtx63XEjbc0Gl0ZnJIGI3PjZQIUG
         mo6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wKIP/2g7MTxmMgVnWjjRdFjs9hik6bQNvbKXHobNWdc=;
        fh=TisYjrmorpjHRIBl+XFTtzEFzuD8OP1cug7lahRViMU=;
        b=s+f7iiZxrWapa1ZRm40JmVe4eoilAyzzvWYAcZlMaghc6nVQ36i9+f16/+wbITbxYN
         k1QL1oQSIbTdqrpjNKlL2YhVF/jMtyjzlKhYXlaKD5in3UD8123kCWbpP0qVrwERJza/
         IpAxHjhOiM3HLuisHvne3oSaOsTGEjzpOYzhYUqmbWpmGtWvkVDJU8aFdm9O2E7dHhQx
         PxAt5mGNfJ8nBpZ9lfuMbDObBHZ/jmAuOsgcZ8wXU3SU+swTOslw+RdRGbrj/+W9JiwL
         HcNbbGZqmmPK38XRjiLtGeonbyjkQ+0nDdqOWEwt6fonaB/Q4Jjx9M+9YZw5Pjyo1+7y
         XRBA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783081051; x=1783685851; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKIP/2g7MTxmMgVnWjjRdFjs9hik6bQNvbKXHobNWdc=;
        b=GGLF3Ff826WuhnvJq7HyvDodoPomrcCUjQ9cUhIQlD7OjDl7gjO4oWYc6zlB+Qd9MU
         9J2tlrZaQ+RnU6YtPDdiqY08Aev/Cr7wSIfUzwQ9/zArb3b0BqCdRtScmLDhFWbPOtlM
         fuuRPWtkgACNX14sVo4A4q6IwGUFyrF7WFivI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783081051; x=1783685851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wKIP/2g7MTxmMgVnWjjRdFjs9hik6bQNvbKXHobNWdc=;
        b=oq53OjAKKu3wS8STbn/7bGkRVIpdJFEEKE6P1B2tDwfJmZ2C02pEryIem5Q+wDEnmn
         kbXKcSPWj+oIjB1vy8N0f5/3G5Pa0mADOgElTtnZ/nfbc6gpwS3f/V+hralPvF1CkZFb
         f5YAKaPndn6qyHKch56GSylVslaWGPekspXt12+jhEDIDYixrPjAp43J/YV5OKH3eBHp
         cu9pYcqJR/cmrt414ZliBxV/cn1ZbhH/prEor9ozM+KnkatBgWzYzImzdypBunWkfq5n
         fVPJtZW5LhNjtqHU9nh5ZHgSvFMPOc2bLWR3iAYCcmaMHNEwHjff5hJ+WmT3/K9JADdI
         4bqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrll7NZjAtKm6BFGDuHDAHowSSuPhMHFdfNbnM41CyhJqZdTKIJjXECnsHJZW/baWkKR3L1/UdaY5BD0owMng==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6a8B3KzVZdyqhrC88IQZUjSkcdJv51L6rb6Zsk60JxPU+zib2
	+nx3iCQuuDW8aZuJs0UFjSebx+QSPZAIm+ZE5zz+/Kfh8q7X7SoKc2cypqC4HPc88Yz+otjXe98
	7kk05Ok//SVk9K04gQu3aofu/lEMA+JjfaJ+5CXab
X-Gm-Gg: AfdE7cklhVOL99Z4BY4DH2vyZCYaCKK8jXswu9n0apZxbcQhyvlHSlECuTfAaxC/qjM
	1Vi7KbMQCT3AWgrW+NKjPyMWY3xCNhgjEyS8iGKx8e28RJhntlnY9zzLdIHTyMroc8cvSKJQ+/j
	eD9p1gY1hUb917z6oof4tb/MpFIQZex1X6D4+cKcJpZJZhV710OnFRmCdLTsbv8XT3Eh92vo+IZ
	WzdkXfOPbJmQVW3fDe3ILTuurtsKUqEwDD0pK1h027Jx6gLiHFTAyIfGNwCCfgw1yBZYcfaJ/5O
	MTVhqZS6uCTkK+zr8MAhKxGt7ZU=
X-Received: by 2002:a05:690e:bcd:b0:664:ae03:524e with SMTP id
 956f58d0204a3-6652195244emr9486423d50.6.1783081050982; Fri, 03 Jul 2026
 05:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-4-wenst@chromium.org>
 <CAMRc=MfPC=Jm6RFkCYG6vsYQiWHxBeNq0L59rwahF_6Fu2Ledw@mail.gmail.com>
In-Reply-To: <CAMRc=MfPC=Jm6RFkCYG6vsYQiWHxBeNq0L59rwahF_6Fu2Ledw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Jul 2026 20:17:19 +0800
X-Gm-Features: AVVi8CdRG77FVnl6YqrCOnoh5pU554e35My8Xh7iayyOJ32J-OMwjYcWxPxxPu4
Message-ID: <CAGXv+5HMVaERvte8YJDJ0fq0zoMvO7-7caAGQhsAB-9sUHoGtQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/13] power: sequencing: Add pwrseq_power_is_on()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_051732_225015_AF468805 
X-CRM114-Status: GOOD (  12.09  )
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

On Fri, Jul 3, 2026 at 8:07=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Fri, 3 Jul 2026 13:03:04 +0200, Chen-Yu Tsai <wenst@chromium.org> said=
:
> > The power sequencing consumer API already does power on state tracking
> > internally. Expose the state to consumers through pwrseq_power_is_on()
> > so that they don't have to reimplement it locally.
> >
>
> They wouldn't be able to do it as the field is private to pwrseq core any=
way.

Which is why a helper is added? Note this is returning the requested state
on the consumer side, not the actual state.

> In what situation would consumers need this? Typically you know what stat=
e the
> handle is in if you control it.

Mostly just to avoid extra tracking in the USB port device. For the hub's
port power feature flag, the hub driver actually queries the hub for the
current state; no in-kernel tracking is involved, i.e. the consumer doesn't
actually know what state it is currently in.


ChenYu

