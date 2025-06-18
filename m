Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA74C7115A
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jun 2025 13:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvDeYY1tyHLW44AqHwWF82BKnD0o1q8Cao4PGtdqJcc=; b=hyQBdnUCpDF2gqCsXEZYqIrDph
	dD+0ibpYoe0iyMaHDgighfIsBjtrYgGLpKqfLMkMlOYR04+ia3dqnmZl6KKV17SVIQTbTj/0fVNTI
	QrE3PdERNPm+bjkDaa1nv3k5lPN18uxrZ6FETIwyYTB12cFfQYmjn/5pMKq7Y06g4e4xq8Q0o0uZe
	7mHYfgM/9ZWBdQAZYuWCzvyvdePbUn6bGowIVOwYPY9yaIL5cAYFKQ2qeOoDPxUAbtqmyfYN2934+
	T4zIPHluY79RzXjCCM6JwmV2hQZKLJa6kQZERXHkq6XeQ4I1RWUmpLM3CLugbxTTnbBAvICevJK9J
	PiOFGEWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRssE-0000000AJq7-1131;
	Wed, 18 Jun 2025 13:30:42 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrtL-0000000A7cz-4BpY
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Jun 2025 12:27:49 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-32b7fd20f99so4705761fa.0
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Jun 2025 05:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750249666; x=1750854466; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvDeYY1tyHLW44AqHwWF82BKnD0o1q8Cao4PGtdqJcc=;
        b=xUTA9i7lMZAPnxkGdPxmhZV8mzNrsnRaRHERsbNsoTVp0ntP9MV9eUfkBRKjycDMKh
         j9VV1EM8uNpXh3uey/9VIbG8xBtYBrFQK2hGDUFiHIj0HIXIzfpWwU28vnGyF8xI0hGR
         suiYVIQkOIcSeav9B9JWvZLor3vkdXETTKsZTrbd1sX/1AxxpJ8Vgv100A2P/WqZ5gsq
         eraKUXprFeqtGgefbZPu4f6nrriV8ZAy8UcWV9Aun2/fwXqgARtH21TlyQy07y7QyaPA
         0s/5i5KDkG2xFWJIx2bQqktH3M5ggMmNbpf+uKas+Y/WetlWNG6C/7V7vNYIsWf8T5Mf
         3yCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249666; x=1750854466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvDeYY1tyHLW44AqHwWF82BKnD0o1q8Cao4PGtdqJcc=;
        b=L85eJA5cEdhFX8k/AHlRmJNmTb4rcgftZDP9kBJWJ5SoQXZHNfenx24cumeXGG1htk
         Xg2VUvyaY0neCXtZR1227Ypd8G46cmmUZQOT3iXd4C0jUm4EBiPKsKig4GTJ+2hKwKd0
         X2TXpyr5cnIB+Z+QN82ysyD8xtiFxtczwOJWYFkyMPoUcMec37OCzHCm/kDbM+DfFPMW
         GSiH7FIsB77pBD5M1Gwknl2sCL7sGV0nmXGfa7Pe8ZcFtaxccRXjlusqysFEQjSev5v+
         riJYS8gIBGZSC0q3kOKCMiJz+bbVlneDtRt1mTss8BCDW0LPz0aul/DdOLkwTqNHHI4Y
         T9hw==
X-Forwarded-Encrypted: i=1; AJvYcCVaiT872XDBPxieI2gvWk7gPtM7BDj93G2vIHE79Zmkr103i9v+M+6Q0GXbpB52YIQB2eDTg0evb8c7vj6h0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzK19Eb2fagw+dMm9MK74LPeSTWDDY4Az08/FlGhNLkoqnUvFs
	RNyJaK7F6766cm0+HLRWX4Bno/50wE1FvEJVfXGrDpIiTO28YTVl2X2CrA2aDS2bNY++adHq7Jt
	sTdmGaJY5MMr67KnoyNeufnm5pgFV+VsoexAFD+iR0g==
X-Gm-Gg: ASbGncst5A1Q8l3zyJOf7HC8DU5ze7JY5ZElLz28/EMl4fgBfRDevlXafdITO9Q153H
	TmLRVclNquNoxNke7TF5urO4Pw6/I+eS6RI70YL77O2V9cwQUe5uHO8hC3/rPe3LRWV9sEiaq5r
	ZtrMemwWL8b+E25V9iEIuavJditC7iptsjFun4tIFVPVE=
X-Google-Smtp-Source: AGHT+IEO41Nyhls6z+tYoLHnOV+DOmxEURxkPhjx4goE9pZdzx8ZYG8pWoqgfu9hnvxH3hdYq4NmpJCLdC/k/NenFbc=
X-Received: by 2002:a05:651c:169c:b0:32b:4441:e1a6 with SMTP id
 38308e7fff4ca-32b7cece005mr6055841fa.1.1750249666214; Wed, 18 Jun 2025
 05:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250616-gpiochip-set-rv-net-v2-0-cae0b182a552@linaro.org> <20250616-gpiochip-set-rv-net-v2-1-cae0b182a552@linaro.org>
In-Reply-To: <20250616-gpiochip-set-rv-net-v2-1-cae0b182a552@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:27:32 +0200
X-Gm-Features: AX0GCFudNOYMyXLJ7vMaeO2dSvhoaQWQJroQG17p-nXTR5Iec4T0QKmapC2D9eA
Message-ID: <CACRpkdYJ9O_y9TGTOw8mzf1=LvaxYCE463MPf12YaXUQCKaLzQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] net: dsa: vsc73xx: use new GPIO line value setter callbacks
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
X-CRM114-CacheID: sfid-20250618_052748_035389_625DA95E 
X-CRM114-Status: UNSURE (   9.00  )
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

On Mon, Jun 16, 2025 at 9:24=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
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

