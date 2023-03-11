Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C1FC6FD1C
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Mar 2023 16:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wp9g8mvtcyPVfWU1c35OlobShpJvkPzR3H9bu0L9qxs=; b=ZrGcLjWwiL7XebplUU+PN7KlGO
	r7DxEmgtNV/0/v3TGHmva3iG+OAPlco9PM/F6FEbKsWTpNamiUQahaEuytbvrIcgXyKBPvyOKv+X+
	BOGtkhwOhe5IAK88uiSVhJxJvx/9Cn9z9TDcTvt3GjfTM6R7YcpKELOZCouE/XGQ670kMnxAIFR3O
	E/s4XsKfdnKrXFTH9GpSd+6b1Gyb5lEGeIUdN5r8qdGu397Ipa0163qL5YFVbHYMvro40z/rPfyxa
	c2Ceer7kjH58d4EwgjzdSnaKJY8/xfJV9vLNnS82sq7R2wGlN7n4Drz3EiikO9FJui94W3ADsRufl
	4Qd2ZYMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb2BV-000t8d-Mb; Sat, 11 Mar 2023 16:35:05 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb2BS-000t7N-J3
	for linux-mediatek@lists.infradead.org; Sat, 11 Mar 2023 16:35:03 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5416698e889so38344827b3.2
        for <linux-mediatek@lists.infradead.org>; Sat, 11 Mar 2023 08:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678552501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wp9g8mvtcyPVfWU1c35OlobShpJvkPzR3H9bu0L9qxs=;
        b=pr0lMA2mOjrGpYKtk0QVF0tgFeqsi82LWxDkBLfPrvP6SzaFt8uRCUwVlEGVXt55Pr
         1LakAV5xZAA78BvaPzikSS3KxYsHahyc6ze80pSxeB0/399ArWjoxIhafnZA16imP8gz
         m6EpAPvbM6L06sONkdYvql4X4jRbWL9LYlwqEehMYRC5PR4Ezzc1Hd6E1UPOG0OlUZGX
         qjRs4XyDzd1PghVTUoOBMtSTg+n2zV8rTmOB8T0p8lcvYvlUsGTXXdfyY6R9E1SAjeNX
         Xu4Rg7B5iRhQ8orZmaA1RemdeqsQdHWR6fBji85TlIPP1bY1xc4LJJvcHnjA1VGPVK/1
         xHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678552501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wp9g8mvtcyPVfWU1c35OlobShpJvkPzR3H9bu0L9qxs=;
        b=72hJNi3C9bl1h2lK0r8Y9YMg0uZoLPX5pwXBigG1aPErXv4ZtTwpCtFuKcxnb1T205
         7m/E5x3vgi2ePKHgx3luDLsURtWg00ffZ+3gqmx/gPQr2IOW9+QYodDaPEdOd6nDoHYy
         oz306VH+aO/TrNQV60IruZLFm6NFNte3HN/2049tEx6mH3mvn+KeTNB0xCBNlI/BZ0/c
         Y4fie2O+9Z6pcOnurZfbe/06sj+jS0lCz9kmqrlzjnxVsAY88TURw578CC8gjUvGlrbC
         z4ZBdbcrpHJctKzjXLmFWzYNGTTYAG533mhupBjVbje85eU3N8pznodHpkhSWxssJ/Un
         r/Vg==
X-Gm-Message-State: AO0yUKXM5qILW4zg0kurNh7Aob9Uu6BTi+MOrSnNfcpFnhKkuP2eR6YK
	dpUQhIqTA9ApINva6tlEVMq1vJXpErMjOrqZCZipdQ==
X-Google-Smtp-Source: AK7set8DBNZWeU/lrlXBCIe5G4NDpGfK/C+Ec/pjM7HxB3XDcENfIe9cQNMXEKvMvuR3hSrHQKhqUXC0oY/5I7TPspg=
X-Received: by 2002:a81:b142:0:b0:541:6975:2340 with SMTP id
 p63-20020a81b142000000b0054169752340mr1503406ywh.6.1678552500949; Sat, 11 Mar
 2023 08:35:00 -0800 (PST)
MIME-Version: 1.0
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org> <20230311111658.251951-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111658.251951-3-krzysztof.kozlowski@linaro.org>
From: Guenter Roeck <groeck@google.com>
Date: Sat, 11 Mar 2023 08:34:49 -0800
Message-ID: <CABXOdTfGcByJaoXG5ifOdOCRWhemendQwG42RObZpc13v-BF6A@mail.gmail.com>
Subject: Re: [PATCH 3/5] i2c: xiic: hide OF related data for COMPILE_TEST
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
X-CRM114-CacheID: sfid-20230311_083502_655234_2483E2B0 
X-CRM114-Status: GOOD (  14.04  )
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
>   drivers/i2c/busses/i2c-xiic.c:1202:39: error: =E2=80=98xiic_2_00=E2=80=
=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/i2c/busses/i2c-xiic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.=
c
> index dbb792fc197e..806b447055fb 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -1199,11 +1199,11 @@ static const struct i2c_adapter xiic_adapter =3D =
{
>         .algo =3D &xiic_algorithm,
>  };
>
> +#if defined(CONFIG_OF)
>  static const struct xiic_version_data xiic_2_00 =3D {
>         .quirks =3D DYNAMIC_MODE_READ_BROKEN_BIT,
>  };
>
> -#if defined(CONFIG_OF)
>  static const struct of_device_id xiic_of_match[] =3D {
>         { .compatible =3D "xlnx,xps-iic-2.00.a", .data =3D &xiic_2_00 },
>         { .compatible =3D "xlnx,axi-iic-2.1", },
> --
> 2.34.1
>

