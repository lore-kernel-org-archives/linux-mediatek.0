Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F60C677C4
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 00:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7nuDXxHMeW+apAcE+4L7YtuvyqeNU/MY3xvfvw+85c=; b=QI+D6RDjBm2zqjhWjOD5job9T1
	TQlDIkj0vvwL8yZg/hvbpc9vIihfZB/7Q3i5gMwvQY5obBScD6L+tgO3hTG/2UCNCDBawPZoP8T2H
	YFamS05lp70gC+AN/nE0SLH9gWwZjIq99GXq2vPyn2N5pbHha518B9gDBS3WH/LYN9Xtfl39P4wN/
	gvT1qJux6Gki9q4hf7znrisacyf5LEphvQeI3Gg0OIp52LeUNScwIrMuSj82W9lCc9yBnYOLGPPfs
	N0lkkgNQZoY0LG4hIYZEOd81tt62XMHzMaSVFwfWw2MN7rN5Xu65p9Bze7jC+NFxrVI4tw6xFWwaw
	a4atdRZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP9jA-00000008Vd3-3OkT;
	Wed, 11 Jun 2025 00:54:04 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP79J-00000008BU6-1Gl8
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Jun 2025 22:08:54 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-551efd86048so6055868e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Jun 2025 15:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749593332; x=1750198132; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7nuDXxHMeW+apAcE+4L7YtuvyqeNU/MY3xvfvw+85c=;
        b=N9FLxPGDajkGEA+DV6gR4dka+cFq/uidV60Rx1Lt3wgwBmhbYlQUaeTqyoXGmPckUh
         f1KiD8dSuQS9+MaRXfOzKJpEI5qeZPHN/2bKRXI6PDSRRXMvewK3G5y9yHqXIHJcA1Yj
         5NJee85RKID/xaFvTNfxH1UMB7FAvMqCehxcoZvWpjZOrWAmVT6Zd48G13YbWMFgFN6Z
         oq9BWzuigYU09n9CDBsVsZZdwKv/s7IszAQqeXD7uX9Q0m0DAEBW7ScybVRCNYmndOMZ
         uRQSnR1claQ5inJUSV+lESGeefJYWyJJwXxNzs47oAivXEkgLalCKLbzEVPfVW/LGsRx
         EfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593332; x=1750198132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7nuDXxHMeW+apAcE+4L7YtuvyqeNU/MY3xvfvw+85c=;
        b=eQJ3x+ZGRSHbJ+qanbrCppDSI/tRwbNYY9ZFMq3cTrDV9hRFnoBkHfL00vMW+oAB2/
         6jb52ffeqkYUmOjQMNNg9wyGcMeionoFWLmn6tpbwh31YbKyjDssOoPCQNuDVIl3yp67
         ytteATTb/fEbd0Fb1P4omSxqSbG5NJOCQ4OYJVbLTMQeG3Rs0855kC53FkA8+Uy/7C1r
         z4ASFgbeTQcdHFdRnP6KXVpoCbl1jWzzhe0oHUvHis7HLJdbENJlxU4CwWahKirhaB8G
         2K7XOWc9UAj2QsH591lyF9YhTdbY/sE5uScWzg2ciwwXtCVI7HyJ2aA7R+G4gWFEBdW6
         bbEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwjRU4kvI7WoK2J7dFhFJaLji+JHpwYBXciC8fR9tFrbn31HdHam+DnYcqIY+tAq+mmST0/ChLCOCToF3m6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUcNDqWWxuRDbN7a/Pdlykh37C+Xu/NosMqnvjssbXtkM/JndV
	M1riG/VAaLqWlBk0fAtYtbJZkJK+z8z9yYsgYlUGU1RtCaW5sVh4cKk7+cSLn4/uP708x31rXgU
	Xxfq2ev4LjY1z9BAvxFtkurOBWvbA+aN+/WwLShO6hA==
X-Gm-Gg: ASbGncsjVG5RqPC2il0kv2xeQ0UmBw4qZg3lYwa+5ONXVzquusQCXFpetAxMHIBEx7f
	Q8oXCL547mK9JWt+hbMPA4Au2WlAf6G5ToIhdJ+1k29IfKEWVqeH37ESy0CPbmMIkOpMmxuiGiS
	iYRTP0BJKgofIXX2WfLVJTrDfDGCwkCjbTuLGA+AuD60Q=
X-Google-Smtp-Source: AGHT+IH8MetiTltiLxVsoQdcqnz9SyKbfeIivBe6BgaYPax7FqypUr47bqpDDYKrtQHdmKVxRlIZT6Fr1Q1yswx0lfM=
X-Received: by 2002:a05:6512:3b96:b0:553:202e:a405 with SMTP id
 2adb3069b0e04-5539d327776mr135286e87.0.1749593331540; Tue, 10 Jun 2025
 15:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org> <20250610-gpiochip-set-rv-net-v1-1-35668dd1c76f@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-net-v1-1-35668dd1c76f@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 00:08:40 +0200
X-Gm-Features: AX0GCFvL7R8uIhwfFeu8Zy5wwVjWQCtUtnOLFaGyd-WVGbMxfXjNiZWqOaZW5QQ
Message-ID: <CACRpkdb+1uYy92975JbFUgvO0GWZBru1A8gOsF_VY-opzxopSQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] net: dsa: vsc73xx: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, 
	DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-can@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_150853_341087_F437C87C 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jun 10, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

