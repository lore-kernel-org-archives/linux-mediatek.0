Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DEEC6FD1C
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Mar 2023 16:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzWZK/2DOJOXsvG+XJAqxVL+3bPwefI5Iyt8l7pygUU=; b=tp+oOtIQJ8cEFwVRW4hgX+040+
	DdL6llu7zgGLfjH4kEJg6dzArSlxkW01UZJTAgYbFleFEz5Q8G32u6pLdmLihdiu8n7S8n2lc5Adn
	mQlthJPe8eeH19haeqn6E1WN6MQTGpRSwD+naj9IY1aoqNLMpXeQvmqNzwZBdU4XkXndPCLm7fIV5
	8sDIQMnGsjiM5jD5PbfG4r7f25jMsywrtuTyo1nFs12Jg27/Kp0FOjSU9HtSH3nMmQ/P6iqNNicZr
	mqwTw/nfPejIGI6swnsXBwLujbbfwUlMLTpQobRI84JX2IQS5nQZ7ActoHE6MVzjjt0jeIaF2mil0
	iNQQ22Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb1n9-000r1f-HL; Sat, 11 Mar 2023 16:09:55 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb1my-000qyt-QZ
	for linux-mediatek@lists.infradead.org; Sat, 11 Mar 2023 16:09:46 +0000
Received: by mail-yb1-xb30.google.com with SMTP id h97so1058834ybi.5
        for <linux-mediatek@lists.infradead.org>; Sat, 11 Mar 2023 08:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678550982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzWZK/2DOJOXsvG+XJAqxVL+3bPwefI5Iyt8l7pygUU=;
        b=NEU+nw8LaiuwdyVp2yAz91CWBZNF3qBVdmKv6heVA54lqDYYTkQrItkE9diE+ifQvu
         JvEPZtVIR0BDGlJwIrgrBc7d2s6maquNDE8jtzghRqbxKRpUVOdpMfOby2LbDLTkQM9I
         nhAsUBIxRZ1zNOu529mfMDU1amVxwVhKh3u8EvhIS2FqswVJB4uYyDfQGcMUoTguAgj6
         fwP5UaRMUCK8TTDU1bS0mmVSCxZVRjVXI9NBr51EZ6g+91OBMQZshXNjyXxCbmVTQWBG
         jAhwLRB5tfqbjvCqVcvBLfPwrkizvdEYZcD/7Lw/+NG4spsuOWY2d9moj1xd8BzIAC+E
         bxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678550982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzWZK/2DOJOXsvG+XJAqxVL+3bPwefI5Iyt8l7pygUU=;
        b=JpqQ4uUtdx3tFKXhPNGeK3kHYJ27drBdx4TvsXRzc36/3jAka1TNhFrfUwmQlfXxGP
         bNY4JshxJVKH766rWkjVziZc8PkYXqbXxSLs8JW8Xo4eozGVcfkFx/mxFRe4HnffDSTt
         Q/pySW8FBv9YPyfw3So5HuJofEuiiW48ua9+jqWUKmiY/PYV+I+Y/ataeceiCm75w/Oy
         lOY0gC+7pZrsCCHLOsSbC/aP0SAx7C9DAzcWVvTjDBXe+SrRzAOgRgtuCZkQLAPf6SrJ
         7h616m4oTiwj4GGsaQq4/r982/MJRkzvn+q8OaVU6vzOArqk8pXiKf8Pe0KD7NGIfvLk
         e+/g==
X-Gm-Message-State: AO0yUKW0v9z+Tn4dI/uYwJYSL4tpt3lGngkawSSkRC1HVd3cVXZoICJ/
	aW3bNkOKlWvg5iecXQKC/uz1zPugUGmxLKgFe7eDMg==
X-Google-Smtp-Source: AK7set/M/rmOrpL0L838CFr6LBaCI08Xy5jWKITiGoAakJxe2vY4+K5X0NVyMqq5eu3mW3qdOhSXtUFtnmiWfHsmpwQ=
X-Received: by 2002:a25:8d8e:0:b0:b30:2539:a2b0 with SMTP id
 o14-20020a258d8e000000b00b302539a2b0mr3437066ybl.9.1678550982435; Sat, 11 Mar
 2023 08:09:42 -0800 (PST)
MIME-Version: 1.0
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org> <20230311111658.251951-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111658.251951-4-krzysztof.kozlowski@linaro.org>
From: Guenter Roeck <groeck@google.com>
Date: Sat, 11 Mar 2023 08:09:31 -0800
Message-ID: <CABXOdTero=NcfJRmyOCWrt8aOVWsyEUWy0h1Y1msTmDL0VS6ew@mail.gmail.com>
Subject: Re: [PATCH 4/5] i2c: cros-ec-tunnel: Mark ACPI and OF related data as
 maybe unused
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Qii Wang <qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Michal Simek <michal.simek@xilinx.com>, linux-i2c@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-actions@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_080944_882687_5ACBFF2A 
X-CRM114-Status: GOOD (  14.73  )
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

On Sat, Mar 11, 2023 at 3:17=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The driver can be compile tested with !CONFIG_OF or !CONFIG_ACPI making
> certain data unused:
>
>   drivers/i2c/busses/i2c-cros-ec-tunnel.c:295:34: error: =E2=80=98cros_ec=
_i2c_of_match=E2=80=99 defined but not used [-Werror=3Dunused-const-variabl=
e=3D]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses=
/i2c-cros-ec-tunnel.c
> index 4e787dc709f9..8b3ff5bb14d8 100644
> --- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> +++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> @@ -292,13 +292,13 @@ static int ec_i2c_remove(struct platform_device *de=
v)
>         return 0;
>  }
>
> -static const struct of_device_id cros_ec_i2c_of_match[] =3D {
> +static const struct of_device_id cros_ec_i2c_of_match[] __maybe_unused =
=3D {
>         { .compatible =3D "google,cros-ec-i2c-tunnel" },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, cros_ec_i2c_of_match);
>
> -static const struct acpi_device_id cros_ec_i2c_tunnel_acpi_id[] =3D {
> +static const struct acpi_device_id cros_ec_i2c_tunnel_acpi_id[] __maybe_=
unused =3D {
>         { "GOOG0012", 0 },
>         { }
>  };
> --
> 2.34.1
>

