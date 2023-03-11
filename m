Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DC3C61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Mar 2023 16:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSYGBwvERR9paAWVm+BPfUaOdOyyaRsYjyfcyhXtVw0=; b=lcKTI6fxy2iEoFj+xo05pyhXkw
	MxM5F/Ad4zhcsbfnoZzQQislMYFMxODK3IhBbUBHu0vSG4TS7ftBkcmqvnYZtWZb+lJMMvoW9J0DS
	Rq5ofYuOTSROJkE62ZaHcKoyEVFWhXapwlLg8N5nWATOVumoIs88xwOFZg4w/HMfsHVRiXsbsvIRC
	3QtbD8M04r4gdJzBIWSSBwrcGg+Z6ZUenGO2GG63Y/mFKB/uH+9jMFfDUMeZv7UOQE/iO36LJtHZI
	iz8vlRsm6CkW9FvkTN/Z0Hs9k2Acdt6Rg+1jdAxA80YIee1eRdFbyBgfsW63JuELQ/vvRv6BxouHK
	bBpJ1bWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb2CJ-000tJU-OE; Sat, 11 Mar 2023 16:35:55 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb2C8-000tF9-L5
	for linux-mediatek@lists.infradead.org; Sat, 11 Mar 2023 16:35:46 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-540cb2fb5b9so55092387b3.3
        for <linux-mediatek@lists.infradead.org>; Sat, 11 Mar 2023 08:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678552543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSYGBwvERR9paAWVm+BPfUaOdOyyaRsYjyfcyhXtVw0=;
        b=UAQ71mkDnVkAMX0dBUZr9na7yjE4UcUPxg0d4QW9+TED0PGTdhVGRYzEOewrz4OOEA
         VZW95uFOQsbTG7SCyL1y5/XjlKCkwxuoSglzm5bgqGtQdoAyBwCwhkFAK62n9uP4NUqX
         5NXsW75RXvaDplRaP73qW5BIVFkYFPl2iKS9Msg4T2Kc7E85yFAsDC/o9m8oRylQFtVT
         rieInkzI+bi92+xxSiHSVVDuTfY72Ir/LAqQza7lLPRG8X9YLCnpd98cj36uhSC5kBxV
         bRLb63mcK+uo33HUtFca6zrhBdTTSD+/EtDXha8sz5m999IdYsA9t7xvbr2OIXH3nmUe
         DQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678552543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wSYGBwvERR9paAWVm+BPfUaOdOyyaRsYjyfcyhXtVw0=;
        b=iE3wj1JiaJ/Z5jZAHuHi0rA7HRQ9hdblWjPEXgDuRxUefZWPqYNeLtK+y+a+t581bZ
         S37uBHbQqmze7PJ1xw5gVuoVkZJa8XLv7lgpgDW4MjAFOrmL38c0rdcHyXf2ekSmhc7S
         A3NNdVNCCxAP2fv9g677kk3HdsxaNFnrcZ6jne/hOHNmznNS/wC2ONd8bb8oYwU+b2LB
         1NZehbSm/aVRNc1YP+zvTfncAxircuQrjdEsMRlQesufq5KE9MHtdKyEn2rJsYIHG3X4
         5yDkmFEOLP/OGV/+SAeIKfF7SznPS8dh8sFOIiBLPIJMruFnDgErC25NuFefxn7OxHx2
         NXQQ==
X-Gm-Message-State: AO0yUKUyn3AfNz7FYivH7fzxv7ZQLsqZ1UTGTOsOz+Pc7rQ8SB6kKhAg
	22fZzWWM4tJGCYhgOmF1JksR5aWds9GDvmcWfVHVaQ==
X-Google-Smtp-Source: AK7set93tV+avSHhtVAdwyX7DfN5gzCh81D4seJpwkCcmvQqrqKMSESRIYfCezkiV/oqBS7uIDZ168ZXua3DqwAa1MY=
X-Received: by 2002:a81:ac1a:0:b0:533:cf4e:9a80 with SMTP id
 k26-20020a81ac1a000000b00533cf4e9a80mr18506420ywh.6.1678552543118; Sat, 11
 Mar 2023 08:35:43 -0800 (PST)
MIME-Version: 1.0
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org> <20230311111658.251951-5-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111658.251951-5-krzysztof.kozlowski@linaro.org>
From: Guenter Roeck <groeck@google.com>
Date: Sat, 11 Mar 2023 08:35:32 -0800
Message-ID: <CABXOdTdWkX9hpJtZmgMEBvT8XS5i3cTTF868RLx3Y9o52x6QAw@mail.gmail.com>
Subject: Re: [PATCH 5/5] i2c: synquacer: mark OF related data as maybe unused
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
X-CRM114-CacheID: sfid-20230311_083544_696781_BE86C9D3 
X-CRM114-Status: GOOD (  14.93  )
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
> The driver can be compile tested with !CONFIG_OF making certain data
> unused:
>
>   drivers/i2c/busses/i2c-synquacer.c:632:34: error: =E2=80=98synquacer_i2=
c_dt_ids=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/i2c/busses/i2c-synquacer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-=
synquacer.c
> index e4026c5416b1..50d19cf99a03 100644
> --- a/drivers/i2c/busses/i2c-synquacer.c
> +++ b/drivers/i2c/busses/i2c-synquacer.c
> @@ -629,7 +629,7 @@ static int synquacer_i2c_remove(struct platform_devic=
e *pdev)
>         return 0;
>  };
>
> -static const struct of_device_id synquacer_i2c_dt_ids[] =3D {
> +static const struct of_device_id synquacer_i2c_dt_ids[] __maybe_unused =
=3D {
>         { .compatible =3D "socionext,synquacer-i2c" },
>         { /* sentinel */ }
>  };
> --
> 2.34.1
>

