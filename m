Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B086F106F303
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 08:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZIuiXRVUEe8C+bPC4WsRGZm1BjkEqR+1WT0JlENtHs=; b=1P8H4PefP+zDi8/bORo6Fm2mLp
	5v/WAR5OXu9Nt94iTdUWhFgPLrbVL1GERGcCTpE21xsnTwkzMeE+faja892uzDQX3FQLfNbCbQov/
	rVoonWkIU5UOlKQy02FEE1J1AAYAtmLHDE3PmdKT7ZPpXbJhMKxGbvdUPS7GvZG9ZMC9xyC+7eU/V
	f+rkTjeIP/3mycZUnIeslBMcBvdoY1LLrpG8iu7Xt9IeH5oOMCiVBGrbYhD0Vm8m//t21bJqexRwk
	iUgqLUlv+sr0EYZ6Iy3ZoxRNvIqYWZwYzqvnH6T61z70baYYQXIX9GV2qn3h7DrCVyTZzhq3IrupD
	LJVtRfCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gGK-000000052hd-0pnU;
	Thu, 26 Mar 2026 08:40:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gGI-000000052gu-39QS
	for linux-mediatek@bombadil.infradead.org;
	Thu, 26 Mar 2026 08:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RZIuiXRVUEe8C+bPC4WsRGZm1BjkEqR+1WT0JlENtHs=; b=gKzGNwZAIS9x4Nhb3R3EywFYas
	4sSbQgwp8D1bQCcOcp7ck5/z8olQ6pkllJQ5vCwryqQ+zIwKvQZ62FQn/TF04KXxiacIPkACVh1Mf
	b27IrJNbhfcVRrmuqtwT4ed/jvES5zYcwjiVPSfCePPFoo3s+4blHG/5cbhyMM/KSlZ7OSSWrjRM0
	kXhrlwpHSnhAo3ONaEzfBd61XYQ0z9s6IbtLaY+w2zZsi3cCA1Q4sKPVn6curQhmG5PBfjmHnfnG+
	WrttSPpm7Kj3hp5+A+UP8Cc6nP40hMZz+XbKoM0vjT3ABNrxYp8hnC8T3u/weZsDsYPfP8GQAzjId
	iS/9kCWA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gGF-00000007lov-19tz
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Mar 2026 08:40:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E85EA44214
	for <linux-mediatek@lists.infradead.org>; Thu, 26 Mar 2026 08:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8189C2BCB7
	for <linux-mediatek@lists.infradead.org>; Thu, 26 Mar 2026 08:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774514411;
	bh=QfOa7OzRwwd4XlZR0+3Hhy9wDi0PAtKq+HHQAKzIr2Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ftVRdaDOnFGANoIrp9OBhja30/JqJdcf3WqhVM2IUvVXw1JgNZtfzpu2r9NuVwChu
	 joOjJsjzXJUWLt+dRFKmTpkTngVjS8DFiBoJ1ku8K6YdkYhh15H9U+Yj2GDrKUaEPa
	 Sw9pzt32LwMPHlNSpKHdfyI5x+h/+fpuWZY3hm3mQQQsUMdJKtH/Wy3RPLx5CSksGw
	 zJVQOUPBX2D/joxJX1uJJ01gj+2Q/gRrNklw3vit3m6/D4jR/LSLPCV+ciIuMS1O0K
	 0Tqg46eygQg5MxDMp9zjKRDyxww15tORBncfdovtYuhN55HeyXHK/qz7TQnyMLjRty
	 I2Wy4KJzpWdCg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a126c8aab9so1001161e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Mar 2026 01:40:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVoFAPVqaOuOCia9ltzyBRB4Bvv3XdtU2FqhnNJpX7+QVvzF2nkiy6SB0g2EfOnXCVP5PwbAL4LBXaiG8cwIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxyVO/FSnKvpuPZWaUoi6VPWJyH1huIkQsuEdEeCDCzLDnTiS9K
	B03NJW3PUaDP0xxXkoseGFfymuP2Am8XKYGWlbYIw1hYUmUFoMdpEbLyshQOoY+jWMk1QJCFLNu
	1TsfVo9r+iClCwoJzJOcGQON85D8gwON6UUvx9ZYCTw==
X-Received: by 2002:a05:6512:a8f:b0:5a1:3da4:e92f with SMTP id
 2adb3069b0e04-5a29b9ab6d8mr2497661e87.43.1774514410393; Thu, 26 Mar 2026
 01:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260325100144.1696731-1-arnd@kernel.org> <CAMRc=Mdwu85gghDjQEu4eP2HZxHjBFpph07q9SOfAifSDMtpVw@mail.gmail.com>
 <1789ce66-5a18-4b54-bbad-3b2049f2c26d@app.fastmail.com>
In-Reply-To: <1789ce66-5a18-4b54-bbad-3b2049f2c26d@app.fastmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 26 Mar 2026 09:39:57 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfwR9POm3OvuJTRcg8sO1y=LRdBMrbVLQ=eZD177r49qw@mail.gmail.com>
X-Gm-Features: AQROBzDadLtwyr2raaFqkwGzyCOh9M5RUz_Gm02mFq1aGi1CGm9iwle9RVHpGLA
Message-ID: <CAMRc=MfwR9POm3OvuJTRcg8sO1y=LRdBMrbVLQ=eZD177r49qw@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix up CONFIG_OF dependencies
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_084015_645200_097220B3 
X-CRM114-Status: GOOD (  19.92  )
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

On Wed, Mar 25, 2026 at 11:41=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> On Wed, Mar 25, 2026, at 11:32, Bartosz Golaszewski wrote:
> > On Wed, 25 Mar 2026 11:01:14 +0100, Arnd Bergmann <arnd@kernel.org> sai=
d:
> >>
> >> WARNING: unmet direct dependencies detected for GPIO_SYSCON
> >>   Depends on [n]: GPIOLIB [=3Dy] && HAS_IOMEM [=3Dy] && MFD_SYSCON [=
=3Dy] && OF [=3Dn]
> >>   Selected by [y]:
> >>   - GPIO_SAMA5D2_PIOBU [=3Dy] && GPIOLIB [=3Dy] && HAS_IOMEM [=3Dy] &&=
 MFD_SYSCON [=3Dy] && (ARCH_AT91 || COMPILE_TEST [=3Dy])
> >>
> >
> > Thanks and sorry for the breakage. However, I'm wondering if it wouldn'=
t make
> > sense to do the following:
> >
> >
> > -#if defined(CONFIG_OF_GPIO)
> >       /*
> >        * If CONFIG_OF_GPIO is enabled, then all GPIO controllers descri=
bed in
> >        * the device tree automatically may have an OF translation
> ...
> > Symbols from linux/of.h are stubbed out and these drivers can build jus=
t fine
> > with !CONFIG_OF. This would naturally increase the build coverage.
>
> I don't think we need to worry about the build coverage here, CONFIG_OF
> is still included in x86 allmodconfig and half the randconfig builds,
> so the drivers get enough exposure either way.
>
> On the other hand, dropping the build time check may help avoid
> future Kconfig dependency issues, so that still sounds like a
> reasonable suggestion. At least CONFIG_GPIO_SAMA5D2_PIOBU
> is going to need the 'depends on OF' regardless though to work
> around the other build error I cited above.
>
>      Arnd

Fair enough, I'll queue this patch.

Bart

