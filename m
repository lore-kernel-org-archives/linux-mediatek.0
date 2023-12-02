Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC544C4167B
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Dec 2023 00:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbR8KzXYL0ybnYKqP2A2MrIjHre31FRqYESM+8DIU+s=; b=SslMm+QXixlcqPCYJCty57esqI
	KV6Wepf5olzPVYzEsTJWvcdJI6lEJWcoTkB9dT47lqpIlHZDyKCAC4qD3Rx6RMKf/WqtyOWaOn1Pp
	3rFETBBrvLUlH9iQ1NgCzN3oV7ntEG+PFyuCJrk/4Garn6de8AA5GwrFPyrZI/yO6ECslVCU8HNF1
	otfhEOLJPCi5ZYOMXb1fxhEKx2zRX7sCs4yWxnD4YAdWQoFwIm5NBqg6zajuMssFyV6+3PySW5I6I
	O5o+QhWfKcdRyYYyKLp4LW7a2EAzVHVobeauu2uowJsgZHeSZnFzlAyV/nj6yBopaJw8OxNeBmW6/
	fVSGi5/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9EL8-00ExIV-2j;
	Sat, 02 Dec 2023 00:58:38 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9EL6-00ExHw-2P
	for linux-mediatek@lists.infradead.org;
	Sat, 02 Dec 2023 00:58:38 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9fa45e75ed9so394364466b.1
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Dec 2023 16:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701478713; x=1702083513; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbR8KzXYL0ybnYKqP2A2MrIjHre31FRqYESM+8DIU+s=;
        b=mWTNtCA0sToS/t87quRw7W4okljJ/9jWiQ0bMKYcFAsEDhHhwJ66kOMcZBvJV66Ac0
         iHTYiWhV1kMfLJsrqPmOqQSq4oIj2JQyk64Qqj43qxQW1jz4S21TxNb9JtuBg3l7oNSL
         eSqoUP5nb1RTsCnxeHxJgNLjXH1Vp8pfy7DUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701478713; x=1702083513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbR8KzXYL0ybnYKqP2A2MrIjHre31FRqYESM+8DIU+s=;
        b=sVJ2H627XWtmALp5TtebfRoAbu2uNQlg1hfkf6NidWTieyR7NnVsjSJKi8JCEPDbVD
         igPwph9PAQhSnVbOuzfTJQd1rx7L90DsGPzgL4HtJjKCSbN/dW17X2tj05A4VPnN2SF8
         dm4JOGERJu8xNl7jYV49Hx2R/4NGy3A5IedaYsxqCO3d8pJ3qKU323pUSrLTZO4DSl1v
         uYWB7HaEcY9wOAzYm5wvNAuZhpkl2X5G4TQ8WwFWX7bpBL0B/wvWdJBg8NVbkWklj5Cd
         gXvgIqwN+y2o5+gWOPC4Zb9/yrgMi5Ej7aqQyT2kyXTnO4RZ09bY9mmrsnst8y/kYvi5
         Vx5g==
X-Gm-Message-State: AOJu0YyHZbYsugPUU83MfQMr/l/3QtCOjJoasB/L3n/5bTZL3p4Ys4uv
	NGifrQVoyXqiy+uP6qh2KyBpDqTFFprhKd48zJSmloJZ
X-Google-Smtp-Source: AGHT+IEyJJavHFacWAr7QNoahXmZ0D/eglaPL4HGiuvkwCFAssJQjaoOf2vi+RFoOI8VPKCPMt5HYw==
X-Received: by 2002:a17:906:530e:b0:a19:5e12:d573 with SMTP id h14-20020a170906530e00b00a195e12d573mr1443625ejo.27.1701478713261;
        Fri, 01 Dec 2023 16:58:33 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id lc6-20020a170906dfe600b009ad7fc17b2asm2464108ejc.224.2023.12.01.16.58.32
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 16:58:32 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40b367a0a12so12655e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Dec 2023 16:58:32 -0800 (PST)
X-Received: by 2002:a7b:cb59:0:b0:40b:4221:4085 with SMTP id
 v25-20020a7bcb59000000b0040b42214085mr244275wmj.1.1701478712415; Fri, 01 Dec
 2023 16:58:32 -0800 (PST)
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-4-wenst@chromium.org>
In-Reply-To: <20231128084236.157152-4-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 Dec 2023 16:58:20 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XV0+G=uFBE_n6WFGVW2szGcKToZgCNTdSrNf3LVk9MOQ@mail.gmail.com>
Message-ID: <CAD=FV=XV0+G=uFBE_n6WFGVW2szGcKToZgCNTdSrNf3LVk9MOQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/5] platform/chrome: Introduce device tree
 hardware prober
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, 
	linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, 
	keescook@chromium.org, rafael@kernel.org, tglx@linutronix.de, 
	Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_165836_783518_9EC24691 
X-CRM114-Status: GOOD (  17.34  )
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

On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> @@ -61,6 +61,17 @@ config CHROMEOS_TBMC
>           To compile this driver as a module, choose M here: the
>           module will be called chromeos_tbmc.
>
> +config CHROMEOS_OF_HW_PROBER
> +       bool "ChromeOS Device Tree Hardware Prober"

Any reason that it can't be a module?


> +       depends on OF
> +       depends on I2C
> +       select OF_DYNAMIC
> +       default OF

You probably don't want "default OF". This means that everyone will
automatically get this new driver enabled which is unlikely to be
right.


> +static int chromeos_of_hw_prober_probe(struct platform_device *pdev)
> +{
> +       for (size_t i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++)
> +               if (of_machine_is_compatible(hw_prober_platforms[i].compa=
tible)) {
> +                       int ret;
> +
> +                       ret =3D hw_prober_platforms[i].prober(&pdev->dev,
> +                                                           hw_prober_pla=
tforms[i].data);
> +                       if (ret)

Should it only check for -EPROBE_DEFER here? ...and then maybe warn
for other cases and go through the loop? If there's some error
enabling the touchscreen I'd still want the trackpad to probe...


> +                               return ret;
> +               }
> +
> +       return 0;

Random thought: once we get here, the driver is useless / just wasting
memory. Any way to have it freed? ;-)

