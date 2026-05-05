Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2DACD342F
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 10:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NCwr5IzwXs1Qc4UinXjykqNmHwUAVjuU6Giar5Byk18=; b=N8VrfXmijPF2JxqP0MQiQWqOsL
	WRyUBHWWaT8BJ8OkANjwAIDCr7tWaYnoZaKWgPp+I06YWMbZB+Q9pd8jzGOgQMRyKSpFPyvi2VBom
	GfS7flJjhRo93+ForzCNyF9MLnlNMoCc7L5V3wPkwSmZ1957+mJI8OJ3jDdjJQrSmUIJqC9Ju6/Xg
	+hUjxihqVEVeydEbr/zcJHreNm8yFCAPo8ihQiozOhDoTW40b6ftl5B+ZTxxn8jgApa21IsYH3fiV
	FuTjUJUzhEt9uI0mj+YokJu/lkmb7fXDE3Q/5hN88rkxD/PJ+VmrZo8W28uYjEwa2T36oWs5BWBRr
	vYjT7ppw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDHe-0000000Fvym-42te;
	Tue, 05 May 2026 10:45:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDHd-0000000FvyA-0Q6B
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 10:45:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 825A560125
	for <linux-mediatek@lists.infradead.org>; Tue,  5 May 2026 10:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 372B8C2BCB4
	for <linux-mediatek@lists.infradead.org>; Tue,  5 May 2026 10:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777977944;
	bh=TsTg/4UWC81TfUPMbovyHWMpmJYOhH0GyHDfnnm3vHk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kJ+tCkcSp6dpIN6tgYJu9sXU6+VcQHZ8W1zFFfUpjX8/2a9fzB+NHY0+oM5ubz08a
	 EPwvgLTTDYnpinWIKHchn5Dy51BJeO15CBCAgYoSTfMYMpBVxh8eq8iobw7dkEcy1p
	 BHY8T0doxouMzLmXwp0pTkjEuc2uxl3fShHQmUcuiJ1xAs/bHaG5CQCPo9Ijy+anqG
	 8nDhUF6mRHTCmsDmQ+NizWo3zkHxEPZIhZX4S/XFacjjSr1vBb7Uq3txgsQiIMLnSx
	 CyIuS4LHW+WbYQ1K3AhYpaaM6iGDu8+egCSAFp4PCGgCigVKMOK+OnXSLeMJ1kfQSO
	 UqMCCoZtKUD2w==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39397d63804so22578031fa.2
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 03:45:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/jW7LCCOqLC//RswKGHTa1GhZYsun6+sI8L33X6ihZiN9ImYDe/JXEd+My9E+1DMsId2UgQcnJyHi2cKsA4A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0YoNpEqzwshSajgHLLscuouDwFPPWZ3pAHF+S9ZXkE5Deq1wQ
	jZwYdY5XRNr27hzaMfRgcLBeCJVx98ozmjjdC0ovVbYWYZT1RF3y5URqIB28O/DuqPsP0jVv8V5
	HiCmkG8hh140E/Dr9k96gCMYtaJNm0Fo=
X-Received: by 2002:a05:651c:4198:b0:393:a639:4a10 with SMTP id
 38308e7fff4ca-393a6394c4dmr22048921fa.15.1777977943005; Tue, 05 May 2026
 03:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777562725.git.geert+renesas@glider.be>
In-Reply-To: <cover.1777562725.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 12:45:31 +0200
X-Gmail-Original-Message-ID: <CAD++jLmg0-CviaWkzJi7xCvgwzz2KbVkmq-kqcWJ+2=uTNCoHg@mail.gmail.com>
X-Gm-Features: AVHnY4J5V-rMG0dWh1E5TLlvveEO0urdyGOidGxFOXsPqvTO1NYgVMcBKduDto0
Message-ID: <CAD++jLmg0-CviaWkzJi7xCvgwzz2KbVkmq-kqcWJ+2=uTNCoHg@mail.gmail.com>
Subject: Re: [PATCH 0/7] pinctrl: Fix types in .pin_config_group_get() callbacks
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-gpio@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Apr 30, 2026 at 5:33=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> On 64-bit platforms, "unsigned long" is 64-bit.  However, when checking
> if all "unsigned long" configuration values passed to the
> .pin_config_group_get() callback are equal, several drivers use a 32-bit
> temporary.  Fortunately this works, as currently all configuration
> values fit in 32-bit.
>
> This series makes the code cleaner and more future-proof by changing the
> types of all temporaries to unsigned long.
>
> I intend to queue patches 5 and 6 in renesas-pinctrl for v7.2.
> Thanks for your comments!

Excellent work Geert, thanks for noticing and fixing this!

I applied patches 1, 2, 3, 4 and 7 to the pin control
tree, leaving off the Renesas patches so you can keep the
Renesas stuff together.

Yours,
Linus Walleij

