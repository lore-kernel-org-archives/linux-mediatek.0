Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB67C61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Mar 2023 16:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/G/X5+IzPvIp/u0h6IkNiabirE8Y9puo1twyHDWLaMA=; b=3hL1/i1SmPIwWY3Ir5K+bpsxpT
	KIYJLCZZu+zzlGdixGraMXnupQCwRZjsxiGWGOnf+pNLKXa8jbyodyzs7fCChi4A8fzIMdrK1uO0s
	5FH/YKkiAKC9F9Yq4e7JprDQy7oifEUxl22Udp0xkOx6S9uIcCI54zWa9Eh6VBX8fKwC7WHkqcb5D
	OnkKlltfGuJJb2MmCDvte/Cymro/v1Y1npg5DDOqdrvqNF1xRtGQHTKIsOAa1S3EWvq8yPS9cUzDZ
	M7asHjrAYDtXHmwVwNhqM1ejONNaUG6CyiZX6IzJhtwoiDO/vF3FkpWyw6zOeBuhpk66eoooS4QD7
	+XUcVW6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb1iM-000q89-GE; Sat, 11 Mar 2023 16:04:58 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb1iK-000q7C-GA
	for linux-mediatek@lists.infradead.org; Sat, 11 Mar 2023 16:04:57 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-53916ab0c6bso158700197b3.7
        for <linux-mediatek@lists.infradead.org>; Sat, 11 Mar 2023 08:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678550689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/G/X5+IzPvIp/u0h6IkNiabirE8Y9puo1twyHDWLaMA=;
        b=VJCB1uC5JrWowq+lL5LKURGf9F6grJOUQgJ0kSJDYl76qXzRvwoWda/HsCN3ZQfB6G
         DSa+tDW+3NlqICRdnvqurB7WtF4geijT6FWAWjF5vYBcGOMBSO+1Q9eRCHPobKdAjwQ1
         5IMWSXKnOoZV9qWXWjzPcRwhEtN3R1J/XMn5Camro6uha3/YC1gYfzuJD+0Bifq/2szQ
         2yglUr8Wne8GE1Q1FEjzSeQqs8bga5ij4uo5HJrjsjP7Q+j5GYzuIbycLrUsL03VsSpA
         FXTf1oCE4sO7FH0IIq6YUPwhvli0m6vKvVi25DbrRop6B43Y22XPpMy33rMhzYsz7vuk
         cj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678550689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/G/X5+IzPvIp/u0h6IkNiabirE8Y9puo1twyHDWLaMA=;
        b=7mR8UW4jQIA0Tuyt926XeO13DV2MLGOfcZo7b5s/YYg1bXuXSYujcUwlDPPpYICuoG
         53GzUTVd4C5ptpzObnB3iooJK7Jvdkvu2vkHTL5tmOKKpm2wvNoEbgF1JzwS4rUOp0hw
         QTGK6g5tEHlSI0EBkzHPIgZ9XSeUx93wH/Rh9jUwFaAHEZra3YSgUzpTc9RLtIT/zIFU
         SA/6/qlRLLmRzQJevhvGhnqilAOk0Mqgoc2U95FF1tvpVFntzxnYkmMVmoRg6TT/2UF5
         JiYUo5jw40ee1o6j2iv1vC1qc979ZJt5Q9lxfKQoMB7KOrOGBKTCTrtYXlAWpYn9/T5I
         NfGg==
X-Gm-Message-State: AO0yUKXiFconmYV30c2VqlDNH18l0wnBxd3Ztm4uVsxgpj5ExiGHLvbl
	XqZMCZ0lx5IMJVPUO2RWcmXsmnQHmKrofwBcGQkd7w==
X-Google-Smtp-Source: AK7set9c9qRxU35UmkHTgz32UHoKUY+oqyuYpi2DEgv0Gw4dOgKiDSabwSr9lVyr+LPm+IMt8NbrQV2unV0hRjZR+Y8=
X-Received: by 2002:a81:ae4e:0:b0:52f:3399:ed08 with SMTP id
 g14-20020a81ae4e000000b0052f3399ed08mr18340951ywk.6.1678550689567; Sat, 11
 Mar 2023 08:04:49 -0800 (PST)
MIME-Version: 1.0
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
From: Guenter Roeck <groeck@google.com>
Date: Sat, 11 Mar 2023 08:04:38 -0800
Message-ID: <CABXOdTdm74LsShmx+Xv5W6D-Ub2q4ccU+SV4+VJUpBJmpXxLvw@mail.gmail.com>
Subject: Re: [PATCH 1/5] i2c: mt65xx: drop of_match_ptr for ID table
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
X-CRM114-CacheID: sfid-20230311_080456_572569_D4BC4D18 
X-CRM114-Status: GOOD (  17.26  )
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
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).
>
>   drivers/i2c/busses/i2c-mt65xx.c:514:34: error: =E2=80=98mtk_i2c_of_matc=
h=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt6=
5xx.c
> index 43dd966d5ef5..59eaefe999b1 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -1546,7 +1546,7 @@ static struct platform_driver mtk_i2c_driver =3D {
>         .driver =3D {
>                 .name =3D I2C_DRV_NAME,
>                 .pm =3D &mtk_i2c_pm,
> -               .of_match_table =3D of_match_ptr(mtk_i2c_of_match),
> +               .of_match_table =3D mtk_i2c_of_match,
>         },
>  };
>
> --
> 2.34.1
>

