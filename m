Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1E6C282EC
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Mar 2025 22:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+G1znUUY7rtTf9DzLNl5P+qD4jbuh64Bw3HveeQEA0=; b=GYyZ0R3xF8OWZXzUar2+NRHVM1
	UyJlzzQTHPSjF+KWbF2nfJZnsNTa6kRbL7vKoiriqr37whi3t8a/h2cEIIo82wx/ypeT+y5lsrbtH
	eAHuNPhpoOA5z0f4WVc6yraE9nMTpTjeXZDlFwVgIaegciBqznDaOv7Qh5CfJ2r0rEIC1CfqbuGnc
	h7ny7vIzDQ+L7UErLymXt9WqLtDDrRQ8dy6nUKZDYp5AIalZJz+hL2fuLEFlF74Si6VD/s8n4WlvK
	CXJg6ZjdvGYPah7TpUFF7KOiVbIn1HHc6Ybn2F2Xf4rYtqjigfCAyc8NJiPO1+s4xKi1KFH+pLT1E
	4nnLnhDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttD5K-0000000FP9j-1lKP;
	Fri, 14 Mar 2025 22:00:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttD3e-0000000FOqe-2sqB
	for linux-mediatek@bombadil.infradead.org;
	Fri, 14 Mar 2025 21:59:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Q+G1znUUY7rtTf9DzLNl5P+qD4jbuh64Bw3HveeQEA0=; b=hJR3qs9Fo8kfFOa4l9CFYEB68s
	9BaSvbcXZTDbYQ7USikrQvzSc1JE2QaDGAwr2A8+J8pVB/BYTXhrDGjJW9ebLIrPfONZi/BMmMDkb
	EHkVSSvcdvpFmt2OZF1KnpGuVuGF+2ScLgsb2tS6yjIcSiysgktWv4IY8oMJVxFtJMHjAnQW2eFMr
	leOjO2FY++8jEJQOUYbhVoJiFvR1LXSjvxJ1PTzOGyjk6NtD+c/fJWwOIqj9RFWuIFbbePm+bSJAO
	RA557+gGFuztSYpCGSctMmEO+Z3iblBBaq7fWC5IVGUhMBEUO49Rr+C3KbfE5ozlkaayil5hhbG+6
	d2CRfd6w==;
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttD3T-00000002z04-3uLx
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Mar 2025 21:59:09 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-30bf251025aso21979971fa.1
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Mar 2025 14:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741989533; x=1742594333; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+G1znUUY7rtTf9DzLNl5P+qD4jbuh64Bw3HveeQEA0=;
        b=GM1BCOJ8i4mrnjJocQKpohPIa8hgFmNXAiqbkPkJHbZqzFRaaagC6Mk08b9fZ0vGaS
         aZh13IoWover+kX71sYYPnat2iaSGdUBqADKRm+sVWy71+gjAtRo5cjx3wa71f2Dxa75
         Dq+lSKtCv30yrvViZj+hUjjqEdtdROpk5mJng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741989533; x=1742594333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+G1znUUY7rtTf9DzLNl5P+qD4jbuh64Bw3HveeQEA0=;
        b=cWWznVe60az3KR6Hkf4OLuVoEGMrIYZcDCYYmAGYV9gD6y2o4bcCDSDXxBLAPnbsNf
         vSvMvGbs5lBntSBOdsih/LGzE7f397bhl5gFlSPXvPweWDd0xKgnIV9edyzmtwqIZJyy
         s6goHkjvbOlfwP+MnI9wLo1vDsKZZ3RSVwvAAgH7eSvWAj9dv3pin5q6QTok2xQ9Jauy
         U9ITI+5d0doRB/oXrh0IGFhd+x92udIo+yTveviAaGVwtOBB4W4ZvW/v8Clsw+xrF+Tw
         fU3Kpc9gMkY13NzvTntFmLj1867el3En9rg9wE21VimLyGD9ru7g/Gwn28XBwLt/XnNV
         f6Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWGgtOt0dJq1m2zIVOVR7Ys1/L3Pclq4h8oXVR38qrmG3kEqS8Dsa7YA9/MC5JnGE9kuAamkF/sKDTWw8k5Pw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx27YK231sbrKjJ0w+iLEbQyoQxJT6gpnZ6qDaRvo+bKWIdLlZP
	8spysSAjqGt0F3dP5YsRSFXo0+AfsB0phIkklvAxgA5YhfuGLVWOLMBPOc+EyRPBPKkHfenVvSX
	h0lKO
X-Gm-Gg: ASbGncuf6SjAW+2ICZ+XOeVihgaofKvU1UWmSpiovAuKadcsd/n39s4rT4LwGHpF/Yj
	sJGqQFOx37uBcAiGammqD8BXtST8qjeE0wPDnNKPyFptB4WEwzmqJ1aiaO4M75MFavQwwQiNJpd
	X88t+Rkzzm+8cnLvDvNxKrjConoErETOgR52sUGe9s2U05bqwz5UVbt7OsF7B710VgTcGA/Tu6g
	HuXMMuBuc2LN7MZm+aHlDjmGiue0Pn5EcCbxxKHCo8c07605UsYhWx6WEgReTpY6+4rckFcouqz
	Os/ggUS87L3BLgUfcGemAQsuZxZSk2zja1Dr+X7tpcKO1uuAdVl6cDAnDiKZ06gU5pKmqpdNeaI
	ktnbkbcjJ
X-Google-Smtp-Source: AGHT+IFVnI0/bIu3CytGSBBT7dWqLQP5c5YAzbFdRG0zbsbVdfRYo3hKdLUG/1XxLuyNnTxhBBKLig==
X-Received: by 2002:a05:6512:6cc:b0:545:746:f36a with SMTP id 2adb3069b0e04-549c396ee10mr1548554e87.34.1741989533151;
        Fri, 14 Mar 2025 14:58:53 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba87a450sm628095e87.166.2025.03.14.14.58.48
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 14:58:49 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5499c5d9691so2750814e87.2
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Mar 2025 14:58:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvXJ+BqXap+ymB4+6ehTBCIf0Y6GyCjph4f5LbHNcpn8i2RkAUR/PUfTz5D4KXU3zlWfzxGAP9697HD4joag==@lists.infradead.org
X-Received: by 2002:a05:6512:3d02:b0:545:c7d:1784 with SMTP id
 2adb3069b0e04-549c3988b84mr1398468e87.43.1741989528244; Fri, 14 Mar 2025
 14:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250312104344.3084425-1-wenst@chromium.org> <20250312104344.3084425-2-wenst@chromium.org>
In-Reply-To: <20250312104344.3084425-2-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Mar 2025 14:58:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X14XEdikE3hP4y53uZec12O_ZPtU+GyJ+Tf8R3DK89AA@mail.gmail.com>
X-Gm-Features: AQ5f1Jqp4S31G39Rg1NsczcQY3Hb3QPTaquvIuzNNpiFQjs9eAjzZVdMi2mJRe0
Message-ID: <CAD=FV=X14XEdikE3hP4y53uZec12O_ZPtU+GyJ+Tf8R3DK89AA@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_215900_943431_3E4A8E64 
X-CRM114-Status: GOOD (  20.19  )
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


On Wed, Mar 12, 2025 at 3:43=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
> longer boot-up time. Power sequence timing wise it is compatible with
> the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
> out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
> enumeration. Enumeration and subsequent operation follows the I2C HID
> standard. The eKTH6A12NAY requires longer times for both parts.

Somehow the last sentence above confused me. Can it just be dropped?
All you care about is that the new trackpad matches the timings for
"eKTH6A12NAY". Not sure what you mean by "eKTH6A12NAY" needing
"longer" timings.


> Add a compatible string for it with the ekth6a12nay one as a fallback.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../bindings/input/elan,ekth6915.yaml         | 29 ++++++++++++++++---
>  1 file changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b=
/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> index cb3e1801b0d3..81c391952ccc 100644
> --- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> +++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> @@ -4,14 +4,14 @@
>  $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>
> -title: Elan eKTH6915 touchscreen controller
> +title: Elan I2C-HID touchscreen controllers
>
>  maintainers:
>    - Douglas Anderson <dianders@chromium.org>
>
>  description:
> -  Supports the Elan eKTH6915 touchscreen controller.
> -  This touchscreen controller uses the i2c-hid protocol with a reset GPI=
O.
> +  Supports the Elan eKTH6915 and other I2C-HID touchscreen controllers.
> +  These touchscreen controller use the i2c-hid protocol with a reset GPI=
O.
>
>  allOf:
>    - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> @@ -23,12 +23,18 @@ properties:
>            - enum:
>                - elan,ekth5015m
>            - const: elan,ekth6915
> +      - items:
> +          - enum:
> +              - elan,ekth8d18
> +          - const: elan,ekth6a12nay

The "enum" above is weird, but it matches what we did for
"elan,ekth5015m" so I guess it's fine? I'd leave it up to bindings
maintainers. I guess the assumption is that we might add additional
touchscreens to the list...


>    reg:
> -    const: 0x10
> +    enum:
> +      - 0x10
> +      - 0x16

Again happy to leave it to the bindings maintainers, but _maybe_ just
drop the "reg" parts here and below. It doesn't really have to be part
of the bindings.

