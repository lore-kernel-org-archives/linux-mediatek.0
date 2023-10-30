Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4361FC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Oct 2023 23:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=luudkAssmNJ0bwZBMropQoV9NGSQLXNONdtiNSJDkQc=; b=MjFYllchg393MUJrWZOS1DcO4c
	hownRqwXZPkbfN2iHalQRyDKXFgrubOF/klHvn0sEV9LUQrNw7cKcjS2yGmjg+YroX/kr74KnybjY
	Dp2hXkYZItUBOGuahiP+Fj3CnT714qS/S8gbZlhp+w56Sg0AHVEOcxNukQSLSbobB+Cet/O/xJyf6
	quxyj3gEG6DeFUDEi2wih+VyfmDdcVRx5rLuADte7MWwYSv5PDSw5fOi+Fm4tWG6/j2UWBO1BTdWR
	ZJedSa1uUhtM8Jg8H0o+ZjK2x2gT85+LPS3PW5i8ghiqJbeern+ZwPzqyGzxzuT+MEgblxaKrXf88
	Ezfj4JNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxbH4-004Adt-0e;
	Mon, 30 Oct 2023 23:02:22 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxbH0-004AcF-0J
	for linux-mediatek@lists.infradead.org;
	Mon, 30 Oct 2023 23:02:19 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-53e04b17132so8274753a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Oct 2023 16:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698706933; x=1699311733; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luudkAssmNJ0bwZBMropQoV9NGSQLXNONdtiNSJDkQc=;
        b=IdwMOognXzYNtLxiVXRLD0/DsssX3xW7fTKTXgBECc8+u+Y2rcZSvbXQHtAJThdEYz
         XSJiZ8gyATtaXX6aTRZbcbVs3qiLe1m/XJwOKsg0maa10m4hknb7pm0j5LQj1jwRXaHP
         oshIxueTi6e/5XPaOpP9OK21UfG4HpN08Vqk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698706933; x=1699311733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luudkAssmNJ0bwZBMropQoV9NGSQLXNONdtiNSJDkQc=;
        b=A6zEIBVQAbifX3jvs35PfUP4j1QJ7ct5Wz08Ppi91NauXAv3M9j2IwiOXaoly0Xlx0
         z+Mv+Vm+aRJrwBN1ybCLX747cIji82miQkxEiGjvNtblIfKJ6DsmR5JfDl6XQezVc7+q
         JeCA3OexCOSupAr26pt3sbxCMNutgrZy00yrebgsbXQd+TNKOyfQ9kZZ5yfFKFqFk2lz
         qXSFfaARkyZmzUV9o5gAKD7ZpiKOBoXADKQpH30fLXXfP/6UV3Q5KJ+vmjT4JqlODruO
         Ca6NWdA+5GyHn6xL/2Dzj0st186FxcZyMRniCrFOkskKNAf/pFEce8TminibCiva+yfK
         stjQ==
X-Gm-Message-State: AOJu0YzX3HoXt0r4RgFXxzJqPlTuG3WG0LUQrZHNdD8C7R2zbwAHXNNl
	U2Q+bS0jKxu1C1eHHISzp3NhL07315JAB2zAG0qqMcpd
X-Google-Smtp-Source: AGHT+IE7fDN4POXFGWwI44WpOXIEh9HPn23aChznniLbsoxZJg6XIgZwfVgIrQZN/VlDl2Km8WArzQ==
X-Received: by 2002:a50:d7c2:0:b0:543:5c2f:e0e6 with SMTP id m2-20020a50d7c2000000b005435c2fe0e6mr961744edj.17.1698706932805;
        Mon, 30 Oct 2023 16:02:12 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id q19-20020a056402033300b0054354da96e5sm114859edw.55.2023.10.30.16.02.11
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 16:02:12 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-54366bb1c02so2128a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Oct 2023 16:02:11 -0700 (PDT)
X-Received: by 2002:a50:d741:0:b0:542:d8ec:5e9f with SMTP id
 i1-20020a50d741000000b00542d8ec5e9fmr9310edj.7.1698706931021; Mon, 30 Oct
 2023 16:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231006151547.1.Ide945748593cffd8ff0feb9ae22b795935b944d6@changeid>
 <20231006151547.3.Ie582d33cfe46f9ec2248e7f2dabdd6bbd66486a6@changeid> <ZS-8k22ZWgn5hcCd@FVFF77S0Q05N>
In-Reply-To: <ZS-8k22ZWgn5hcCd@FVFF77S0Q05N>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 30 Oct 2023 16:01:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UVkE9k=o3-3UT2L172hhAH-gtpe5ByELN8srC+a-7mJw@mail.gmail.com>
Message-ID: <CAD=FV=UVkE9k=o3-3UT2L172hhAH-gtpe5ByELN8srC+a-7mJw@mail.gmail.com>
Subject: Re: [PATCH 3/3] irqchip/gic-v3: Remove Mediatek pseudo-NMI firmware
 quirk handling
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_160218_132323_CDA2A132 
X-CRM114-Status: GOOD (  19.20  )
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

On Wed, Oct 18, 2023 at 4:08=E2=80=AFAM Mark Rutland <mark.rutland@arm.com>=
 wrote:
>
> On Fri, Oct 06, 2023 at 03:15:53PM -0700, Douglas Anderson wrote:
> > This is a partial revert of commit 44bd78dd2b88 ("irqchip/gic-v3:
> > Disable pseudo NMIs on Mediatek devices w/ firmware issues"). In the
> > patch ("arm64: Disable GiC priorities on Mediatek devices w/ firmware
> > issues") we've moved the quirk handling to another place and so it's
> > not needed in the GiC driver.
> >
> > NOTE: this isn't a full revert because it leaves some of the changes
> > to the "quirks" structure around in case future code needs it.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
>
> I think it might make sense to fold this into the patch adding the cpucap
> detection. Otherwise, if you apply my suggestions to the first patch, the=
re's a
> 2-commit window where we'll have two places that log that NMI is being di=
sabled
> due to the FW issue. That's not a functional issue, so doesn't matter tha=
t
> much.
>
> Either way:
>
> Acked-by: Mark Rutland <mark.rutland@arm.com>

I'm happy to go either way so I'd love some advice from maintainers
(Marc Zyngier, Catalin Marinas, Will Deacon) about what you'd prefer.

-Doug

