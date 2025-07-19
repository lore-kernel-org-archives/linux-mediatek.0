Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBBAC83F34
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Jul 2025 16:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJxRZr7iN1QAKs2m80VW48YbRh0uObEphOGlhuo4nf8=; b=Ttg7vvlkFNWTfeYmYWUUYL41mp
	9Qg5mowWPPRW399kJ2qxP2JHOka5EyY2HN/ibo4gqhADfmH+DtxF1ehFVx9gOgfd8KdMGw2Dr3uDk
	Q3KqyKLP7S8C7xfkEhpf9BipQVO+zwkPsoMeqLM1Jg2IwB30IJHPr//tlO2xCyc23QowYGkypNlIl
	vInt+5XDM8E+z5DlynmvxeWAoR5pju73qVAydOKiLb8/vm+uEyITeym70IP8rj/hCP6cH75VfQQ7m
	AUCcei7xDpH3PCut44+MfEVgULYiiso+WZ9hA7osCPnH2klHB0sh3ta301Ujcx32ztW9I9u1dKoBx
	tB2FsM7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udA3a-0000000EPup-2KzX;
	Sat, 19 Jul 2025 16:05:02 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udA16-0000000EPmk-2rmz
	for linux-mediatek@lists.infradead.org;
	Sat, 19 Jul 2025 16:02:30 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso3143549e87.0
        for <linux-mediatek@lists.infradead.org>; Sat, 19 Jul 2025 09:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752940947; x=1753545747; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJxRZr7iN1QAKs2m80VW48YbRh0uObEphOGlhuo4nf8=;
        b=vH1Mxiz+XXpBKkcespbtnXykg19cfuR+Lf1BX4YhFxwkmJozTDnXfo8N2YpNf1Yd7D
         bLH7H+2H/8oGihuQ71pUnA6o7KXkSKRMAGSU1oM2jjZPya97wZ9cwY9EsXW26e2swsrj
         DSlMMI3s3GHwEsB7Xto8OB8A5fGjbG9XnozKZUAwrMPJ/banp0QnbWdwzrOiuDoKm1Bp
         t5d412gGZojTz2oY6Z2oY66/Ks0qRjYTNJVpdC9i9glP51ZEfGkdO7bcU2xKpIdWeNB3
         EoM4lLUCbqECSR3bQ0vRsnjwsMB0Xi06XsP3USnyMmxFUc3zYcXBy3sKL3MgM+BvI/Bs
         uxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752940947; x=1753545747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJxRZr7iN1QAKs2m80VW48YbRh0uObEphOGlhuo4nf8=;
        b=k1l+78LbcZpP9sOBDR7gjA1U/pem5H+UT6hre78903WHPgEjNXoLZJHgiC7xSciCSF
         P+IjeKgMQakkVfhISF+mjk+AtUoSCWb5/EJB8yKTJzsIQwnSwY9bToDBlOXsGCEcPeYY
         5iIl04AS0mgeSkLB2ZroVy37mmaKfXcCoWD+H7wpHPMqM21b6jd45bLhD9GYBZ56qbu1
         1ATvtLPAREN7WaiciNE7U7zv7h2iPA+7XqHRVD9r3vo0lmq/np1HsWq/2WvrVpdeJn1z
         Fxueu7JNEkne7GlduyJ50khlVOC442b3F5gwXPvJeQFHyjQDMXHML+lRZouKtbOoGKCj
         kAUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe2EKatI5jYkogaaHkPylAFqHVquAq4fgwB6qiqgtge6FpJzlRaxSRXQe2XG587A80d5vBaiLUw21RtfjBkg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQLTdaZrdAcw1ThGWK1JINXGJmSGgRQi5cDNwFcL7DUZKjusyN
	84lpA/V6gw71LQrVNe4aeXR1zpw0RizCrSMFDGh5dxpIHy3P1/Ip6oP6uY3V/WCzwT3p3iw9jb0
	CLOBDsJPJrDyJ9mL6I2fX4vjdzihIRXZmcpiYLOnWgw==
X-Gm-Gg: ASbGncuivwzabGFuKEHbm1H5KSrem/OW3QIFvV3DdzoTpis2NwDNE/lkceldXHqMDnr
	cLsUMGFG8AeXvrfld9Xv+SnoMbctieslbRRb8Jz1h0tkE1f0ktVTxcB/eQNph4xoo5kaclzH8PO
	nxGsH0wLHTbdbKSTZwmrmHUeDGzfbLSC8pR/yPDalVCab9lKZK+WXsS1CHt3q142yYLViW75gYH
	46YoBY=
X-Google-Smtp-Source: AGHT+IEoUxfZHhjopPDobqn7dOjOmBm5Yh2lx21AMKQLkwO7yH4BlU0K80uOKrtvDizTOqyz64KGrJ56htRl33CUOe0=
X-Received: by 2002:a05:6512:3406:b0:553:241d:4e7d with SMTP id
 2adb3069b0e04-55a23f6dd82mr3887668e87.42.1752940946812; Sat, 19 Jul 2025
 09:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 19 Jul 2025 18:02:15 +0200
X-Gm-Features: Ac12FXztrlt_TII82ZBIkZmMLTzLg24otRAxfGOCzM7K4BljVaj3bGcukozw-cQ
Message-ID: <CACRpkdZN3qAJdvDkzvr0_=7grNHWFQ6M+_b=BvREq+PyosBmiA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] pinctrl: introduce the concept of a GPIO pin
 function category
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_090228_729758_307997D6 
X-CRM114-Status: UNSURE (   6.78  )
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

On Wed, Jul 9, 2025 at 4:39=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> Bartosz Golaszewski (12):
>       pinctrl: pinmux: open-code PINCTRL_FUNCTION_DESC()
>       pinctrl: provide pinmux_generic_add_pinfunction()
>       pinctrl: equilibrium: use pinmux_generic_add_pinfunction()
>       pinctrl: airoha: use pinmux_generic_add_pinfunction()
>       pinctrl: mediatek: moore: use pinmux_generic_add_pinfunction()
>       pinctrl: keembay: use pinmux_generic_add_pinfunction()
>       pinctrl: ingenic: use pinmux_generic_add_pinfunction()

Patches 1-7 applied!

Expect qcom to follow early in the next development cycle.

Yours,
Linus Walleij

