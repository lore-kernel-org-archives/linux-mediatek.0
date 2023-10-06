Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81F1E94135
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 22:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhO3ehWc1dLHvm/xZLr7SfH1xniT/+pUCjErhuF2vy4=; b=UjXpt66fGhpF4XyFS8bp+03QgY
	xVLZfvtZJadVPaIdKPyl8Dga4zQm84AZRRHTNqj49pXZQowUsgHNgEDwTBODRMhqsZ9w/IQ9D6K8X
	zPnjPabfA9rEwQGPKFoKgT7H+Wp63z94TwXfeVKpgDMMWQDHWaWWFBbXDf8cnNZDGJIpf8vqFXMP+
	ikUzr1/pxw9+FuZzI5pmUydtn+o//+XBLOkkYkNKc50iF/IJoRy8xDx9JnmNarCCjsxnObAl2Tjp3
	0RsOXZDCUEh62FxvuBtPY/BJzXAgs/o76tYmQI+ZBGX4j63xiThVU4dCameUS6PeelpAllLRQJWDK
	Uq3o2OGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qotFt-006aSf-1V;
	Fri, 06 Oct 2023 22:25:09 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qotFq-006aRJ-39
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Oct 2023 22:25:08 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9ad810be221so448808866b.2
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Oct 2023 15:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696631101; x=1697235901; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhO3ehWc1dLHvm/xZLr7SfH1xniT/+pUCjErhuF2vy4=;
        b=T2EKLUEX7RMnJ2mVJsyQF+PhkgMv74qSDXeAGpV+XRSofsUTtec/Teb8ZVAnBHvjcH
         NfkEUrNYUX2C8E8sqrysT7NopaCo6ABP57OXT2xPAVd/zHllUKgl+bCyDyCeU7yuC7xf
         6LVz46ttJQzmk83cQBHAYkAq7ZJlmq2KSeTOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696631101; x=1697235901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhO3ehWc1dLHvm/xZLr7SfH1xniT/+pUCjErhuF2vy4=;
        b=VmJAP/Zvxal7weqtisS8PewaRUpN8SkDrinmPbyaSkN0viNLkdjro2it6I9Np0a9wR
         m+4PkoPbVZqJ57rzGKJhpN4gpe6Kapk5jGVGlpROYa6U3Q5jRhJ9EBEuOr/UEXnvBdbd
         c3WEiYT3wIW9hXMi71MrkGYxzZBpNJcNGIVHi5rUSn6oSXNwYmp2el1PeUNHI2N9M0sG
         IZUVIqape4T6tXJ/ngmd1qzqZ3inR1RQNyNk6mttEDpjO6JGN06WRfcipcacRsmUVrXC
         2jnE/ptYycH/xfTivv56Ea/B5JQK0ryw9wKlhaKsRQw6g6AZShLd1xEJBQUaOY4k6M7K
         9Rog==
X-Gm-Message-State: AOJu0YxnDB8POJl0lFpzYCZ0q0qtfa0C+N6XOeqvGb3r+5dCh8WXqGMa
	hv5CruHri1y8Y9I3meH4qD9UZ39TjwP9PAEAaUAEdmOy
X-Google-Smtp-Source: AGHT+IFbir7Snn8YsVj5ud6JMIuFbSkCpl5dhN8wM6Ia936rZLXZiBtsw7F2bkhwjrsoBnjyrDvpew==
X-Received: by 2002:a17:906:104e:b0:99c:47a:8bcd with SMTP id j14-20020a170906104e00b0099c047a8bcdmr8359199ejj.67.1696631100784;
        Fri, 06 Oct 2023 15:25:00 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906059100b009929ab17be0sm3465032ejn.162.2023.10.06.15.25.00
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 15:25:00 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-405459d9a96so28185e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Oct 2023 15:25:00 -0700 (PDT)
X-Received: by 2002:a05:600c:2e11:b0:3fe:f32f:c57f with SMTP id
 o17-20020a05600c2e1100b003fef32fc57fmr226863wmf.0.1696630660734; Fri, 06 Oct
 2023 15:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231002094526.1.Ie8f760213053e3d11592f892b30912dbac6b8b48@changeid>
 <ZRr8r7XMoyDKaitd@FVFF77S0Q05N.cambridge.arm.com> <CAD=FV=UeeL9uycVeKpOm+eDm3xHrOnKi2frt6a1qFG1HX9yEUg@mail.gmail.com>
 <ZRwJKBZaYwF1rrur@FVFF77S0Q05N> <CAD=FV=WASz1uvTgwsu3H3cTr3smHk+E_XNUVnjoPpttwv095rQ@mail.gmail.com>
 <ZRxCCZxZWCG0NBur@FVFF77S0Q05N> <CAD=FV=Xk-OMKQPXxU9Z9HOcWwUxxrmLZ4vD0u5ouZRW_zDFDPg@mail.gmail.com>
 <ZR03liCodnTQWs7s@FVFF77S0Q05N> <86jzs2ofqs.wl-maz@kernel.org>
 <CAD=FV=XasZR6dhKBjpbYfby4F1Nu_bsq1m_HP+NpufjsJi0COg@mail.gmail.com>
 <ZR6Pjk_3gpx1K3pF@FVFF77S0Q05N> <864jj4njb7.wl-maz@kernel.org>
In-Reply-To: <864jj4njb7.wl-maz@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Oct 2023 15:17:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wdkm6uMMtSL0qWmciaNV33Q-OFw_ttPo3zUzpoguBjsg@mail.gmail.com>
Message-ID: <CAD=FV=Wdkm6uMMtSL0qWmciaNV33Q-OFw_ttPo3zUzpoguBjsg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: smp: Fix pseudo NMI issues w/ broken Mediatek FW
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
	Valentin Schneider <vschneid@redhat.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	D Scott Phillips <scott@os.amperecomputing.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Misono Tomohiro <misono.tomohiro@fujitsu.com>, 
	Peter Zijlstra <peterz@infradead.org>, Sumit Garg <sumit.garg@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_152507_038246_6306A89D 
X-CRM114-Status: GOOD (  13.24  )
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

Hi,

On Fri, Oct 6, 2023 at 3:20=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 05 Oct 2023 11:27:26 +0100,
> Mark Rutland <mark.rutland@arm.com> wrote:
>
> > 3) Partial fix: make the ARM64_HAS_GIC_PRIO_MASKING cpucap depend on th=
e
> >    absence of a "mediatek,broken-save-restore-fw" property in the DT. I=
 believe
> >    we can check that in early_enable_pseudo_nmi() or can_use_gic_priori=
ties().
> >
> >    That'll avoid potential issues if/when we change the priorities used=
 for
> >    pNMI (which is something I've been looking at).
> >
> > I'm happy with (3) if Marc is.
>
> Definitely worth investigating if you have the bandwidth.

I made an attempt at it. See:

https://lore.kernel.org/20231006151547.1.Ide945748593cffd8ff0feb9ae22b79593=
5b944d6@changeid

