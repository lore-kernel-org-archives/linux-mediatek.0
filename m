Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADCCD3C536
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 21:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwSGZxm0nPOCcXElvwF4s1O3dQZtjR+E7hVy6q0TNNI=; b=eB5NvgAQoddqJD3SRe/vgevebh
	qfNcKGteLJO3Zz2KedI9hQ3yNm1zyCFPsH9phf5sFfe6zaCBeXzIymqERAllDuZAvz+3v2IaTxsRQ
	N5PBTr3i9sRZc7xnafzmgHhlX/vDSXkQq7WVQz3fG4yhtMHF8O6KIVVTPKWuic1cZF1wRS9kjXkCI
	AapPhBYkooYtXd0v7Zi8nid3jgMsCe5U+m+F8rfadR7guwblSUPT6h0lY8ggFU3ye6G99OEicmnUb
	i/odq7FdSKf6S+Nl6rMVNFHPMiX7C4Xx8Du3Lo/iDhUSeYgtY9v3wVWNhhQhCLG+s9j0B25u8Q1og
	fA0hNmDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Y5O-0000000GF2j-0sKg;
	Thu, 17 Oct 2024 21:31:10 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Xqu-0000000GCZg-0ItY
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Oct 2024 21:16:16 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539f72c913aso1816476e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Oct 2024 14:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729199770; x=1729804570; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwSGZxm0nPOCcXElvwF4s1O3dQZtjR+E7hVy6q0TNNI=;
        b=dwuOPLwLC59m9faabkc2UmoVTER5EJZPLbLI5anaGzgztMx5EaCc7IC28xEBPirae4
         CIs3arK/7LHruILPGYWTeiaqh5EYCwd/c2iBOCY21bPIIE6HRKUWeVbqob/gydyn81zW
         WOOU94ePdrkgZY5U4n/5FJAAnKxduvKsr8lFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729199770; x=1729804570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwSGZxm0nPOCcXElvwF4s1O3dQZtjR+E7hVy6q0TNNI=;
        b=CHbUzxIyvaqP6v16uhpySHyng49JdJEHVdaJasjqARoiEOYta4pHUPml2+EJv6fTh7
         Fl62qTt2LLK9+uRWI1cqN8NygjPG4A2OR9mo8JMlKcAsSAZb6V9OvhUH+tHVbXJ/5H1o
         iDtE18nH1IVk16FTpdtQZmUxajyX2AfWxTHkAH+R0EObhPYjHF6F51j2fpQ3YVmXS084
         uKV49ssOE6UhXf1hLA7zuz3fAuQxdKhvqGjBKLj7D1wE1DdrwQpU6b0GJetwCxpTz4VG
         LmF1n7QuScTXT4D6uw/08tlQSOxGOnOi8MBBWvfD+akYNJbFsIc2N/1M/N77ED+gv7BO
         c8LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfx4gQKG+IcSJMICTvoU8RZQ2ddOvAXwfVJbYbt2MTTBfsQFOzjpOUCFkb0QPGpU8+tpEQwNSqKFlrEEEhGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxD5c6O9bw6FaC0Mi/KpT5IxVJXx8MaS8t9IVsCIK4ClUsnbpKz
	GMNbwVtOPCibyb6ZK7SqkJmtfCzkbGV6/Bh0loiyyqeOGX3UmqPLnZ0l7gx7L4kKaamfKkke/vB
	qDDum
X-Google-Smtp-Source: AGHT+IGcjKpmFeHUqZz1PGWMPMmX27eWC6fCzDVh/IByWSFi49gEB7kN9L/GMEt3L9QnkjmK0352wA==
X-Received: by 2002:a05:6512:ba4:b0:539:f468:a51c with SMTP id 2adb3069b0e04-53a1546f995mr167951e87.52.1729199769636;
        Thu, 17 Oct 2024 14:16:09 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a152046f2sm29545e87.228.2024.10.17.14.16.09
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 14:16:09 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb443746b8so17369441fa.0
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Oct 2024 14:16:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSlbR9Ym2K7mwVjnlN2GC1L4LFfub1LE4xh9PjhSd5AX32FqY78MT5ASpvj1qrHxy6h+z0FPVubntuoka5Ig==@lists.infradead.org
X-Received: by 2002:a05:6512:308b:b0:539:f754:ae15 with SMTP id
 2adb3069b0e04-53a15445ebfmr181364e87.41.1729199768852; Thu, 17 Oct 2024
 14:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20241017094222.1014936-1-wenst@chromium.org> <20241017094222.1014936-8-wenst@chromium.org>
In-Reply-To: <20241017094222.1014936-8-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Oct 2024 14:15:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X-YzEGEc+tp-uB6vdPMEC-V9M=Gb60H69=_XY9w4R8nw@mail.gmail.com>
Message-ID: <CAD=FV=X-YzEGEc+tp-uB6vdPMEC-V9M=Gb60H69=_XY9w4R8nw@mail.gmail.com>
Subject: Re: [PATCH v9 7/7] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_141612_153896_E5FA6EA5 
X-CRM114-Status: GOOD (  16.87  )
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

On Thu, Oct 17, 2024 at 2:42=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Instead of having them all available, mark them all as "fail-needs-probe"
> and have the implementation try to probe which one is present.
>
> Also remove the shared resource workaround by moving the pinctrl entry
> for the trackpad interrupt line back into the individual trackpad nodes.

It could be worth noting in the description that it's a really bad
idea to pick this patch if you don't also have the patch
("platform/chrome: Introduce device tree hardware prober").


> @@ -35,6 +37,7 @@ touchscreen@40 {
>                 hid-descr-addr =3D <0x0001>;
>                 interrupt-parent =3D <&pio>;
>                 interrupts =3D <88 IRQ_TYPE_LEVEL_LOW>;
> +               status =3D "fail-needs-probe";

It's a little weird that there's no pinctrl definition for the
touchscreens but there is one for the trackpad, but that predates your
patch and is unlikely to be a big deal.

>         };
>  };
>
> @@ -47,6 +50,8 @@ &i2c4 {
>         trackpad2: trackpad@2c {
>                 compatible =3D "hid-over-i2c";
>                 interrupts-extended =3D <&pio 117 IRQ_TYPE_LEVEL_LOW>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&trackpad_irq>;
>                 reg =3D <0x2c>;

I should have noticed before, but officially the order above is
slightly off. According to:

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

The "reg" property should be higher (right after compatible). It's not
a new problem with your patch but since you're inserting a new
property you might as well match the new dts style.


In any case, nothing is a huge deal.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

