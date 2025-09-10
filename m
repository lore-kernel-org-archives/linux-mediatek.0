Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8F1CA101F
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Sep 2025 21:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDgFFo1KURd80WOddqneN0YLx5E89K1CqsHmGyLdaRg=; b=x8dxPUt08ikzubCnMbVvtMlfvJ
	kDMdwYUG0QzXhU49z+PJthXXZ/KrW+SJa7Ye9ARcxdde2ElBJv7vM6u9Fm/lET8D2RvqrIhX2v2md
	1tCy/sA9XxWvvqBu4qtpZFoCuFOLlPvuSuXeNBawnLxc7loF6aVpWlLXHolVnY6SxsZXGXsxzJz74
	aUT0W0HliVG61XlUy0hV+qH/NSY8LsZ7JIcG6GT/LYFJiPkwvxtaQqzNNdQnuom2m9rSNonRCWKO7
	7PLNoyT9EL9ZEnidaXsmw0HqmIrZmXbftC8JjokS/YEUQKXCWQzXYc03/i3fXw88GpIxva/y3YNLH
	uzNaMkIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwSQk-0000000GsIH-2eAl;
	Wed, 10 Sep 2025 21:32:42 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwSQh-0000000GsGw-2q6l
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Sep 2025 21:32:41 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-55f6bb0a364so7939653e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Sep 2025 14:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757539957; x=1758144757; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDgFFo1KURd80WOddqneN0YLx5E89K1CqsHmGyLdaRg=;
        b=MpK2PZ5ZKZc8WosN+DrU82qI7DQDmJGCUzPzK5iE9ppewuRS5pU3r9Nb1saYJNSDrM
         HX6l/zQuqC+TYXEXLnsxAcKcsjo9rZfNmeb0yJfa6cDe+pbs00uCglgSdGp7IwQ5sqYd
         lcr0T/poaDU5BPdEW/nWC6BFeJOlAP4WdovDEDE1rQuQ7QbHmB7lWOwjloaFwg/mkgQ/
         Nw3w54YTT1ys/b40tXn3KN/CvsrVrCyfVu32zsW5bdbR0+HZkehiiVjbY11AiPum51aO
         aV45yJsiLsMO44s9eW4RWq7w7HA3r5R8b358PwHfk/U1R2Z1mA8FOL0unCD6oOa5erER
         PEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757539957; x=1758144757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDgFFo1KURd80WOddqneN0YLx5E89K1CqsHmGyLdaRg=;
        b=G/mvIIH0T0NwlT857ENNKlNpxJC2Tyv+Ukn5QE6vMb/2RsqBbFX/nWwcVhdesAj4DN
         n+XWa2rGZP23Tr0T+TcWFm/9/Wea4unDZF56/SBuHv67L2ULHPgNK3B9GpyJLBH0wb0g
         6UUvvfVc1uxSg5vRSVEDlhWiQpebilH/7JKBhduWlSXPSTJYkTH3tUIVzXXJx2GZwh/p
         QZ4Vw83paDoKnj30cTzVoRubZNBcZJ/MpPOWM8XmdNrpLMUx2H8mcAJ1bNTjVYVhqIv4
         X9AaCxKoOdz31Sw9Cl4NnhJg4JWV/vLW9Yaicdq0pHOycgzrN/pGivDQNXXXUacBCY1c
         yGbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmY/ci823FmdQU12Kdq6uKrU2dCT+8RNpsexs/W6D2szD+2cYpyFc8t4/aEpClps438m+Xk7r4uIQtpRSdCg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3ErbuRriOzg1zAoBClqdgJY+tJqdamwUNX5bUDTd+EJbgW07o
	WZkn6Z4Cp7tcB+txnD+Lb3N1FChY5VceAF8BJNvKgApp3Ty3hkDdz4ANYXQRwq6KyvourJbiZ8N
	7KnLI9gdWoFi14AzBmAy77f0y141zL3vyuZw7Opcmlw==
X-Gm-Gg: ASbGncuTEW6HbbjY/bF4dn8+5y26Xjusi1F7UX/EBmTTxVy+sDtNkhX7J2TLyYPQXxC
	pgYLjSHAILBNnVCozpJDcKgupzXDEe4rlUFd4fXvcL9QNSaPbCUEQoLzIY3RmHqYNB3/j9zB8xk
	QnUa9rt5BdNWJN7XgfeD1L8ZjRhIZ2KeYFP9+WUkSl82EDeEFaBnLd7eMVi971N9Eop1t7UbyAF
	5BPk9AdwZL4CdIvsA==
X-Google-Smtp-Source: AGHT+IEDFgI45XU5cTVW9FtG8gM2JjDzoZENa8d1uC1g5vQQ+iix+RIzuYFh88VfTx91WSF4c7ZJi4duHEmeM7k85Mw=
X-Received: by 2002:a05:6512:6404:b0:55f:595f:9a31 with SMTP id
 2adb3069b0e04-56262f11dd2mr5910272e87.51.1757539957420; Wed, 10 Sep 2025
 14:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Sep 2025 23:32:26 +0200
X-Gm-Features: Ac12FXzHQO4QoWSTSppUbrZutew2n-HjqWu5POboMsRGiUcu6mJnWXdH0E38Eq0
Message-ID: <CACRpkdb=J+hiC5cu+g0Z-gqzpG8PgX01CXc4P98FfSSAf7PZEA@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 4
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
	Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_143239_732933_E3D0D9B2 
X-CRM114-Status: GOOD (  18.25  )
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

On Wed, Sep 10, 2025 at 9:12=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Here's the final part of the generic GPIO chip conversions. Once all the
> existing users are switched to the new API, the final patch in the
> series removes bgpio_init(), moves the gpio-mmio fields out of struct
> gpio_chip and into struct gpio_generic_chip and adjusts gpio-mmio.c to
> the new situation.
>
> Down the line we could probably improve gpio-mmio.c by using lock guards
> and replacing the - now obsolete - "bgpio" prefix with "gpio_generic" or
> something similar but this series is already big as is so I'm leaving
> that for the future.
>
> Tested in qemu on vexpress-a9.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The patch set is a beauty, hands down.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I especially like where you caught local spinlocks being
(ab)used instead of the generic irqchip ones.

I don't know about merging patch 15/15 into just the GPIO
tree, that can make things fail in other subsystems depending
on merge order into Torvalds tree or linux-next if your tree is
merged first.

I would merge the first 14 and keep the last for the later part
of the merge window when all other trees with conversions
are merged.

(You probably already thought of this.)

Yours,
Linus Walleij

