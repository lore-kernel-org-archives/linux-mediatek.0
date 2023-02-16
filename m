Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64507C636CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 01:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sbx1hW5VzBmek1B42kG2jNw+TNnTEb8gapatcR73rQ=; b=k718PGcd58AIh6fUBs89kO+DD5
	VP6Xadk/r+1hrIwY3xAVULqfbm76Haxt3C7RuEjU5ILB7caFRN/Si+NEr3BHzp806lHCxYSCNUqV9
	Vb8v0Ff6eVmnhAnWDpJQao3z83RFAAMRKlrZWVmIJGB/TfA8SSYmiwxw8LjSAirSKUwkrlmi+FRlv
	V2hwAjiaykDW5AnSt0ri+5o1R+08fdu2r3OHcl3q0cSbjJDBdZxdYz54YWjc4+WGeHF4BdsfArLuk
	6nBodKuNHMryWbz8oGY4Gk28N8jJ4iQ8Hm5oE56L+VrHFyF0bHOTsZUWslupwT3TKMQM+ktANetZ/
	Lr76hFRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSSgm-0089uc-Uz; Thu, 16 Feb 2023 01:03:56 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSSgc-0089ru-0f
	for linux-mediatek@lists.infradead.org; Thu, 16 Feb 2023 01:03:47 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-52ee632329dso4168997b3.6
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Feb 2023 17:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6sbx1hW5VzBmek1B42kG2jNw+TNnTEb8gapatcR73rQ=;
        b=IQdPhHQWN1Mt145dmwZHfSnqOTPplWy+0Uh7hqLuKSPHUyCNzYh9Ei5+6VQdLmwPUl
         W/P38BNiBRxJb1Kc6k5wIR8xvIP3ouuwAc1RfVjEoMBK0+GlSJtvkKJMzaX44waCvn8w
         sG7/gDMZlZmC5As20/72/ZFwMYmR5PY8no8ko6AfUnaso85NG2rC2VkMuvS2MbVKK/rv
         rgbp0vQ4C3b1/cP8Nra/1Wt+ll0E4EiJ/uML2YavzOwBrRIOhAcD882sC+f+WoxVAnBw
         d9OYLVFfkmsD2P+TJomOjLWQpKimJNdfKKaUnCql6eYdNOW93J6THqnQtH2lNJz8Eu5i
         tZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sbx1hW5VzBmek1B42kG2jNw+TNnTEb8gapatcR73rQ=;
        b=Wxzo0Fap86FDmYk3LBGHnJWNhAkwc4d0/tDEULZQgWl0QF9s6Bup8yLcbTxDJ/XEFz
         UjxatHCmSVfOxhSmtT9VJv+T0phQoJL4jZTQw12ojzbI14RfRE8rEPbVKsRBZjxSuLNb
         RXnvT3m6EMLCPsPxpsRnStKelKEQybpS6TIoQ4v4Z2gcuGf7rt4aQ6F+T2l4lHerKHCk
         V9dZD/DEF6cYQNIfGwiXzq5WDwyQ7Vn9a0/jEkbwLt973MyFwS4odMo3HFyHHx7vZjN1
         IWzEpEIMz4BweNLD2pxc3L93atNZMquY74ruYr9M+yQFcxBgHkFnfchd7vANjdCGVpn+
         ybUw==
X-Gm-Message-State: AO0yUKXlDhVTRXtZNNqQ9iCRBWmOG2AIbq6g3jfebNlHdVlsCBbhknTY
	HnjxPVGoUtUfNgFoE9cGhk+/kYh2tpX/B2XZT584
X-Google-Smtp-Source: AK7set/a3D76VIQ6uqfP8dSDpe3YyTWLZcyOkqHzXDV7Vwy5x0vpX70x8tNd4rZXaulxq3wMQpKOAhQ/ron9T2BhAaQ=
X-Received: by 2002:a0d:d346:0:b0:52e:fb6b:fd61 with SMTP id
 v67-20020a0dd346000000b0052efb6bfd61mr510219ywd.271.1676509422706; Wed, 15
 Feb 2023 17:03:42 -0800 (PST)
MIME-Version: 1.0
References: <20230214105412.5856-1-walter.chang@mediatek.com>
 <20230214105412.5856-5-walter.chang@mediatek.com> <20230214222021.k3tsfwezhnh7tdlx@bogus>
 <996b4e61-8486-d939-7367-1240b3c5c5fa@collabora.com> <20230215131849.mcgz53jf24atialp@bogus>
 <53f0e612-b5cc-262e-df98-add1e8a06573@collabora.com> <20230215144627.ddjc7x365qdnhymi@bogus>
In-Reply-To: <20230215144627.ddjc7x365qdnhymi@bogus>
From: John Stultz <jstultz@google.com>
Date: Wed, 15 Feb 2023 17:03:30 -0800
Message-ID: <CANDhNCrWh2=0758eObCKzHmAzqWMsn7EUV9FhEPXUSnCze_Kcw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clocksource/drivers/timer-mediatek: Make
 timer-mediatek become loadable module
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, walter.chang@mediatek.com, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, "Maciej W . Rozycki" <macro@orcam.me.uk>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, wsd_upstream@mediatek.com, 
	stanley.chu@mediatek.com, Chun-hung.Wu@mediatek.com, Freddy.Hsin@mediatek.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_170346_083157_DBF941BE 
X-CRM114-Status: GOOD (  25.17  )
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

On Wed, Feb 15, 2023 at 6:46 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Wed, Feb 15, 2023 at 02:30:51PM +0100, AngeloGioacchino Del Regno wrote:
> >
> > Both. I mean that these platforms do have architected timers, but they are stopped
> > before the bootloader jumps to the kernel, or they are never started at all.
> >
> > Please refer to:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/clocksource/timer-mediatek.c?h=next-20230215&id=327e93cf9a59b0d04eb3a31a7fdbf0f11cf13ecb
> >
> > For a nice explanation.
> >
>
> Thanks for that. Well then I see no point in making these modules if you
> can't have generic Image that boots on all the platform. I now tend to think
> that these are made modules just because GKI demands and it *might* work
> on one or 2 platforms. One we move this as modules, how will be know the
> Image without these timers or with them built as modules will boot or not
> on a given mediatek platform. Sorry, I initially saw some point in making
> these timers as modules but if they are required for boot on some systems
> then I see no point. So if that is the case, NACK for these as it just
> creates more confusion after these are merged as why some Images or
> even why defconfig image(if we push the config change as well) is not
> booting on these platforms.

Indeed, if some hardware does have a hard requirement then the
timer-mediatek driver probably isn't a good candidate for being a
module.

Though I wonder if it would make sense to "virtually" split the driver
in two? Have one config for hardware where it is safe to be modular,
and another for the problematic hardware that forces it to be built
in?
That way we can support the safe approach (ends up built in if both
options are selected), but for GKI devices where the hardware isn't
problematic we can still leave it as a module?

thanks
-john

