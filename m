Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FDCC10DC1
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Dec 2023 00:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2AjpI9QlzX4/sI/azrgjTOEsQmOURin+5qeGoAR1AD0=; b=b7J46vRz0h/l7MugqvtPDhG2sE
	SenlddgtWt2sQpmccOKQXc3pt/DKmTmtlHtl8VqgRVVwTDK+0hp1VDmWRsC4C6wPhTUdON8Bf9Tfc
	q1UW4xN7gR9SlOanrTc7qL9x1uX/6VHr/oTfDPH11oMzoXBSrr3bulBgNHgP4cCZITomobv6VwmbP
	kjlbhe1a1tNYZpsI+G/7OgFhfw8UHUueG6EhOerTG3G2BoOzZPSzb/h99kS1MFpWEFpHz59Y5qhzY
	TKmFbUazH1XPahzTfOqbOVbspAiul9T5PzUsvV6aDMTlNQT/SLTbH7BgrT9LVKO1BDX4VA70ZOJTx
	ye1j1pnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9ELQ-00ExLU-2I;
	Sat, 02 Dec 2023 00:58:56 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9ELO-00ExKZ-0t
	for linux-mediatek@lists.infradead.org;
	Sat, 02 Dec 2023 00:58:55 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a196f84d217so232760766b.3
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Dec 2023 16:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701478731; x=1702083531; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AjpI9QlzX4/sI/azrgjTOEsQmOURin+5qeGoAR1AD0=;
        b=Fko32cillz6WxqS5nyLB2mEX2eKPUACHa3GdqJAAscEwg10+lB2uJM9AWtboAKp/Xd
         PBG97GP58Kieob8i3dqfePc4wGL+WqVpRPS2AZ6NbuOnTLiwdAkCQw5ojHVen74xgxZk
         aO5YNqf8PWP101Uz5s6m2AL3S4D+nWn9v5POc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701478731; x=1702083531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AjpI9QlzX4/sI/azrgjTOEsQmOURin+5qeGoAR1AD0=;
        b=m8SZbkFjp+yfMLkO48SRdvKGCHaiT/dkd8ZxQ5tiRTJGM/h+EUtgYXMzr1hgnIWQzH
         V1r8EEwFdtsNS/S9fj0/LgfaG5B9fEuhz/eBBOORLFmJmRCYrnMOBDCCKJirVG0JrcAM
         YxltVkHveriNYqUJW8OaCkOojibzUFFaMxqAD8vaCl7NTd5pFD76rD3GGMkaXH4xL2E4
         RhqqZpXkUFGAKieePoaD/zvxN9f/1qic40SYrb7AU5zhx3dhZmW0C93tXSTxCSg3n0I8
         eB90uB8msIpMV4GvB32168B9X3P6Q0K7dkI2e0ZmHgFkCzqtnbPb9pijtAjfuDgo2xkN
         bFuw==
X-Gm-Message-State: AOJu0YzCLPJ8Moq80n6c/0e9849KQa6vELEBgLQAx6AMKv/nEy7e8W1C
	fO6sbSsE8WRIyQYQINYDNgpKKU2mVQ1ccNnhQHLdLYAJ
X-Google-Smtp-Source: AGHT+IH9vjQQJmtWOjdBgK4/rS2mBtU8YecPYlHbsdJ1RjcwDxSC/xvUc1h/Rh8+SeDhNoSXvdurZQ==
X-Received: by 2002:a17:907:3555:b0:a16:4929:1484 with SMTP id aa21-20020a170907355500b00a1649291484mr1257208ejc.47.1701478731257;
        Fri, 01 Dec 2023 16:58:51 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id i9-20020a170906250900b00a0a25541153sm2512303ejb.93.2023.12.01.16.58.50
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 16:58:50 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40b35199f94so27515e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Dec 2023 16:58:50 -0800 (PST)
X-Received: by 2002:a7b:c4c6:0:b0:40b:3d89:ba70 with SMTP id
 g6-20020a7bc4c6000000b0040b3d89ba70mr237236wmk.7.1701478730440; Fri, 01 Dec
 2023 16:58:50 -0800 (PST)
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-5-wenst@chromium.org>
In-Reply-To: <20231128084236.157152-5-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 Dec 2023 16:58:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W01gfxV6RN2o6CVS7jjf8qgKP-jUy9Bp94d2hWzVC48A@mail.gmail.com>
Message-ID: <CAD=FV=W01gfxV6RN2o6CVS7jjf8qgKP-jUy9Bp94d2hWzVC48A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/5] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
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
X-CRM114-CacheID: sfid-20231201_165854_333883_E45EB99F 
X-CRM114-Status: UNSURE (   9.33  )
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

Hi,

On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> @@ -44,6 +46,7 @@ trackpad2: trackpad@2c {
>                 reg =3D <0x2c>;
>                 hid-descr-addr =3D <0x0020>;
>                 wakeup-source;
> +               status =3D "fail-needs-probe";

While doing this, you could also remove the hack where the trackpad
IRQ pinctrl is listed under i2c4.

