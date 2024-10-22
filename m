Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B405DD1715D
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 03:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/cn0iNCyYAWaqDPrWymeoJ6QjtEh5iPBAJ25ZQN+F4=; b=qsbhzw6/7c97gOTCmjlHHqQAfL
	G63rUPMXNjqY3LAKhYq6XDogvqphnD6edjoSttw7dnWLl+ReKEx3GPv1ZBKrf5IAQVHUU/Zye9E34
	Fp09oLlrgV2rZgsO67TpLHBr8p6D9L9RnAlxaxwilWfVFH5HPeNjlk25sJzSzb1UHv9pkjM9o6t0q
	oHoomGjgbB52zQV/iyiyNz1VnKesEvZA7QOglwE8OWs4TI84Xrdb/vK4knC69zs/E5moxW2Pa4dTb
	yuM28eYJ84hUuCgXMM4K9MFsoGPeng5ALAJUH0Zs1WQNNL+lS85JzKUMKvymKNW13r1F58TCsqV2c
	yXN8SUHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t35Qu-00000009QXc-2lLj;
	Tue, 22 Oct 2024 03:19:44 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t35OE-00000009PiF-1meE;
	Tue, 22 Oct 2024 03:17:00 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-6e35bf59cf6so57531417b3.0;
        Mon, 21 Oct 2024 20:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729567017; x=1730171817; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/cn0iNCyYAWaqDPrWymeoJ6QjtEh5iPBAJ25ZQN+F4=;
        b=c70Zl7avZCJ4Q7eo18WKmTQZyi96p9X9Jit3Sm775+n1fVgJAwIHjdBla4BonKfvf9
         fdCXEJXzA43ENcpjD4nL7cJE/lCJfd4cNBoAbR1pxbpES8fX3hDjf9F5wnST1ylANd4E
         Ee9ldj4mYs/4dw3WjJqReVO7i4Nn5U6JiCFTszJP/m2UHKYDfqJEZwczLZ9N8IXzlT6D
         yETSTI5p99NfpN2ydfU+adO2xaBIC5SsMvSRf1vvEN4sD1RaA3FO1SBzX6J4ZX76l6yi
         zyJQ3eGofMINgwygKGiT8GFMxeNtlG7GrVsvPSkb3IdQQ/qEGAtj/d0gi25/a+1r0Gia
         8olw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729567017; x=1730171817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/cn0iNCyYAWaqDPrWymeoJ6QjtEh5iPBAJ25ZQN+F4=;
        b=ZNVu+gai1qnvTNbg1i03BUlwlAC8D1whZdoI27KADvjJVOQ5zsmWF03xZtCmar3Nuw
         5evNF2kghfQAM1dFwL0yrMlLJvhtWCUlx1OhzRvFMgX7GYafKhsMk62z1PrKmE76vQ18
         BmrtTAGi56qP+RcNxoxbarpERTZT7nMDjrNUuaOJMouwh/LCC8I8MftfTIeHPigtC9BE
         cn6z2crgqGKTVM1qvlaN2/ufYnSIRyw6+/OErHgiisbPkzDZbzb927q5MwGhdAGy+e+I
         23AG8JUmvMT2cVvHBbXl6pqr8IEfreAg8jTHu8UWzw93XpNtSkf96KUpXMbVWWvBJN0i
         m/qw==
X-Forwarded-Encrypted: i=1; AJvYcCVg7IKpGvqk4LrhAONBa2MF/Bxn9I3grbLN6CgyOC43GZ75CDU2uVGuLJQZWbDT4AefsGZhkxjHDOFEQnN62Q4=@lists.infradead.org, AJvYcCXqPJmSvubsT5oL7wAIM9ioTJbS0A2CdtOBWySGLLjMcByeEVfOmLtMBzM2XEH+xh9S+h6B9r7RFp/K4sVCh4mY@lists.infradead.org
X-Gm-Message-State: AOJu0YylkhlnqjZzBlfqAunlitRRzWGxzNHwb2iMgvcy53bdsNN5oq5e
	8lVHwLr1TxJYt/ypHOGWFZar48e/9lrp3YA2T2dciYgX9/qYu1lrH9oYRQTKLhmXlQo8XZfFOiw
	rq56lYqI5KPFoV2OCQu8G6z3DLXg=
X-Google-Smtp-Source: AGHT+IFRk9XzxSsT9ULI+6gld1WMI5Vz5Pn3tTaPjwiKTRyp8Y0VIg3sDi0/mu/fTFHvTtDvWOp3qtiKrMy6jdISIr4=
X-Received: by 2002:a05:690c:b9c:b0:6dd:c619:4cb1 with SMTP id
 00721157ae682-6e7d4334d5amr16437527b3.0.1729567016653; Mon, 21 Oct 2024
 20:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240930031624.2116592-1-wojackbb@gmail.com> <e2f390c7-4d58-47fb-ba86-b1e5ccd6e546@lunn.ch>
 <CAAQ7Y6Z2xkgxv36=WOxbUArCw3eBeY0nx_7nAH36+Wicjs_fPg@mail.gmail.com> <562c8ee8-7ce3-4343-9d93-b01be1235954@lunn.ch>
In-Reply-To: <562c8ee8-7ce3-4343-9d93-b01be1235954@lunn.ch>
From: =?UTF-8?B?5ZCz6YC86YC8?= <wojackbb@gmail.com>
Date: Tue, 22 Oct 2024 11:16:44 +0800
Message-ID: <CAAQ7Y6aqLJoScfVD3NMyw_0r42qYS2BCCWa5iRDaM8h1EKwwkg@mail.gmail.com>
Subject: Re: [PATCH] [net,v2] net: wwan: t7xx: add PM_AUTOSUSPEND_MS_BY_DW5933E
 for Dell DW5933e
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, chandrashekar.devegowda@intel.com, 
	chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com, 
	m.chetan.kumar@linux.intel.com, ricardo.martinez@linux.intel.com, 
	loic.poulain@linaro.org, ryazanov.s.a@gmail.com, johannes@sipsolutions.net, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, 
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_201658_586753_7FDCA4BF 
X-CRM114-Status: GOOD (  21.42  )
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

Andrew Lunn <andrew@lunn.ch> =E6=96=BC 2024=E5=B9=B410=E6=9C=8815=E6=97=A5 =
=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:09=E5=AF=AB=E9=81=93=EF=BC=9A

>
> On Tue, Oct 15, 2024 at 10:48:15AM +0800, =E5=90=B3=E9=80=BC=E9=80=BC wro=
te:
> > Hi Andrew,
> >
> > We have a power test that uses a small script to loop through the power=
_state
> > of Dell DW5933e.(/sys/bus/pci/devices/..../power_state)
> >
> > We expect that PCIE can enter the D3 state when Host don;t have data pa=
cket
> > transmission,
> > but the experimental result of the small script test is that it is only=
 in the
> > D3 state about 5% of the time.
> >
> > We analyze logs to found that Dell DW5933e occasionally sends signal ch=
ange
> > notifications, and ModemManager occasionally captures Modem status.
> > Although these situations are not very frequent,
> > However, since the default auto suspend time is 20 seconds, the chance =
of PCIE
> > being able to enter the D3 state is very small.
> >
> > After we changed auto suspend to 5 seconds, PCIE have 50% of the time w=
as in D3
> > state, which met Dell's requirements.
>
> So you answered some of my questions. But missed:
>
> What makes this machine special?
>
> It is maybe because this machine occasionally sends signal change
> notifications? There are modem status changes?
>
> Have you compared this to other machines with the same hardware? Do
> they do the same? Or is this Dell special? If it is special, why is it
> special?
>
>         Andrew

Hi Andrew,

The chip of Fibocom FM350 is MTK T7XX,
It is the same chip as our device.

We tested the Fibocom FM350 and It had the same issue as our device.
The following tests use the same environment and steps:
a. Make data call to connect Internet
b. No data is transferred to the Internet and wait one minute.
c. use test script to capture and count power_state until one minute.

Result:
1. When autosuspend_delay_ms is 20000,
Our device's d3_cold time is 0%
Fibocom FM350's d3_cold time 0%

2. When autosuspend_delay_ms is 5000,
Our device's d3_cold time is 80%
Fibocom FM350's d3_cold time 60%

So this problem is a common problem.
Should I remove PM_AUTOSUSPEND_MS_BY_DW5933E,
and modify PM_AUTOSUSPEND_MS to 5000 at my patch?

Thanks.

