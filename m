Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928B9C3ABC3
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 May 2025 08:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkNK4V4s8P1105G9M2GaM/bKTLtt9JfO/Y81L6C+ekY=; b=TtDMKgMTDTuXYJHGVdLai7GyP+
	9b4PwGL48FudiRhOLSADWAyXJo/12Oh+WSUGZmU/nkHuGNEumWOwTzmnzVk2RF2LKXMa6hXLTRpz1
	Qvg1h1Y9qID3P0RZzOmzSNgKrKcYCjBk9LmZJ1ernJs92owses4uHrJ8+SAZ/D7xB4QduG//6NV8o
	06x8mrQEvsUXCmYrIYniasp08a1MwTWkXLxKCs5yinI/Rd03IJ2+5XBGkWu08h7czk2Lb8lorZeT2
	qxXSiZghMCgGTzSTa9AgatfmXJdXEQgWWJ1hREo8u/uHfaFCtXp8YdzjSB+aMFkIp1QVvXCRgE3GV
	mzlrrBdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJSK-00000002zux-281y;
	Fri, 09 May 2025 08:51:44 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIjU-00000002rPT-0X68
	for linux-mediatek@lists.infradead.org;
	Fri, 09 May 2025 08:05:25 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-54e98f73850so2004491e87.1
        for <linux-mediatek@lists.infradead.org>; Fri, 09 May 2025 01:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746777922; x=1747382722; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkNK4V4s8P1105G9M2GaM/bKTLtt9JfO/Y81L6C+ekY=;
        b=WkEHpBJLB1vsb0iMb0e9HMBOMx7HxMipSb2PY0xrmuxKuG7Rx7nx4YvU85ifPhPrkV
         NBcznwPGuBF41CxRg0/4niXzjv8vhDgTnWYnaHYDo4swKyomafTSdgut884qqzdmhyPP
         veaL8tbVw4juiHLxOrF50t8ISKPNLKO8U+BiM40V/IwL+jYgEwJ8hmHHopsgcEBpq/vS
         l9YZLkXBaS9W2kdmMQRo+iCXAwBuOlMj/2jSc7BHQaKkvS3i7SJNA3UfVRhmmCR9/HmL
         ZwmCwrcTtU8VeqtrTOhbF6gNngM/xvEUnSvMk+XRbVQsAdEZMzIxMqDKp+4PP78oREi8
         TNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746777922; x=1747382722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkNK4V4s8P1105G9M2GaM/bKTLtt9JfO/Y81L6C+ekY=;
        b=jGtrb0+IbroTw0lpq/5Zgz13tCWZJZso4bf90bCpSB85uEIGPm2icH9p0YVJ2SISIY
         OHrsqA8VXCXKBdi4v9OUarNVxRFyvLOisWkuAK+PQaG7hHGJWgBem9gws8uQgm367s+F
         VSeHbs3440mrftxfzOi4WikOiKPQGYQiK0B0HhJGRBlvNx0u9AElyxKhhwhGfKPK1ihy
         i5xKxrScLAepTEqFuZgV+jDOyZWwZwjZW5WXYg78vDAf2wVvMmcDTBDwTHEcrpaoPOS1
         yWkUL60QhKVhYKVod3p3YDj70HZQb17bfqnbA7WLhlg3twDo84CArEGzBE2Y9GVueiea
         wXCg==
X-Forwarded-Encrypted: i=1; AJvYcCX+JxNPf056G7tMX9xBSjZHetyEw5egFOiWzigZOmqo3x5HJUXLdcEDp2bH5dhS3NtOQVvclydhynV175cgVg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwC3/5qwQIDVPVMxy6atvZLBLpRQpaXqLQ/o22ohUOSxHaYDqvR
	lp0KaiLzX0kKfFkkgV6VEaaAFY5LqjIAswaBNkaj/4phR0a3VOeSMm47lI2xRgTghCW1OAUQm9l
	WDwXiMO6Q4ERRr/ZNh7DFNC16nXiF+4LpcdRuzQ==
X-Gm-Gg: ASbGnct10b+yfmyTT5NbKsJUUgY4WWhrwHAmWc5kUZoAIGXA4U9bsQbjQeB//EcI+Q3
	TfzFu37J6qHMoyFzC7btAqYIuuAtDx4EtFqyQ3V4TVb7N5dpRB26rxNg8atxrRM4Gcz71GnzxjQ
	+ptCODfUwx4IcIIPDCdgReCw==
X-Google-Smtp-Source: AGHT+IHygTOWySTUQ1JX00eO97lqc6HJQVUyB58fvB2NipEYZeQL68WbWlijYDIMb2+wa1Msnq90mTMLlhAfQvVGkBw=
X-Received: by 2002:a05:6512:6802:b0:54c:a49:d3f4 with SMTP id
 2adb3069b0e04-54fc67602f6mr649569e87.0.1746777921621; Fri, 09 May 2025
 01:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 9 May 2025 10:05:10 +0200
X-Gm-Features: ATxdqUHooQ8Ld9mj2dz6cfM7sdUGr8k9BsEqfTdMAuQ6XUXjp9g6npbLz8jBOxY
Message-ID: <CACRpkdat91GuhtkYw8mzzt2fgufktWCy4fnA5Dkos2=pWfWftw@mail.gmail.com>
Subject: Re: [PATCH 0/5] pinctrl: mediatek: convert GPIO chips to using new
 value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_010524_175763_A742E1B8 
X-CRM114-Status: UNSURE (   9.90  )
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

On Fri, Apr 25, 2025 at 11:01=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all the mediatek pinctrl GPIO controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

All 5 patches applied!

Yours,
Linus Walleij

