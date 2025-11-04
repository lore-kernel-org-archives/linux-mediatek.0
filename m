Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3385ACCFA03
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Nov 2025 03:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52u3ce68a/2VewtwVxA8vPC3R1+VyiePk3LEPb1Gvvk=; b=agrJfmrKiYXr0Ak5G1bso60pNQ
	5HwkX56lG83WupP1MK/AvmLYSo6kS7T9Uf9AIhdLRUWVpX9uU4iHm9Nw2UnET2xlNkq1jYiLbH+Dp
	BCNS6MJgGFv1tAWUn1lh6b+e7zwu5jfb7VaXW2RI9sgmDexFSlDE+XWNVRmMpeai3E/kyHBz0xMRS
	5kJd2UXN3rg345XvgcCeB8O6q8MSeEKVT6jtxzVJs3Uri31UnQKTXH6Y0iUflbaeIK8pBtEtwUj45
	KWgOQwEfoVwZSMe3DfG6n6yYz1Ao5Oai85LI+kv/4K9jWNqXJjXWG4ekpESbWOsIWo/VM3B/bgeFn
	VO0MxAjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG7lU-0000000B3zf-3LXe;
	Tue, 04 Nov 2025 03:31:24 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG7lQ-0000000B3yr-24GB
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Nov 2025 03:31:21 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-5d967b67003so6007843137.2
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Nov 2025 19:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762227078; x=1762831878; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52u3ce68a/2VewtwVxA8vPC3R1+VyiePk3LEPb1Gvvk=;
        b=dnZfM3x2WXcWqzMGouHzXBK/8OB/qLV8fDn92JW7uqEAkwo6h/E2zxKBZALloD5Oj4
         c0fg8rZG35Ieakw7LlXEKU46XtVy2xLhWZYF3AdfUl7Cdadj3eaNms9Bs56nJcHQ5S9q
         ZNv+ONk/dilVlUDpaVHYBUBQlprexgsU5fq64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762227078; x=1762831878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52u3ce68a/2VewtwVxA8vPC3R1+VyiePk3LEPb1Gvvk=;
        b=SCNCvmEkAjH9nd2oNAPEYIvDbaqs+yY1PooLPqgc8/Y1EL/Dj7Jq9da2aBBeAAwCsp
         gNvDs2C62PAa76N/by064DOjPr5oHI4ZI7xNW3cyajLRQPqbdQo0w5ha6PxRh/mJHMhg
         EVjSXdnXalvNwePFsg0EsfcjMR3fHcVp1JNbtahd4Q2lMDILhrm0P7xJbZd1aK57wGfV
         yEgE2aH/LPmlepXgSwNM64OymJaUB8jG934hvZnts6hK6MjQaHEKgBfrbj8UVr6RbQAj
         FX+T/qGc4zwnV2sgZ3N/CS7/efdb7ExLksoAtaS1ZwdsydnNcLg60/DhJ8cznK+OefuJ
         9Sww==
X-Forwarded-Encrypted: i=1; AJvYcCWqfwQ2YY7ViAacsJqNhgdif0svg9OQIqteWFjpQZkoE7PdKgVzzKKqB+FR87lLTqDNJfwW52NlKKEqa9xyLg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9Sm30ls85ohL1967rYNQ+nvGouklFFukXJNcxEmY/HZut3iNe
	ztERDMFyDZV9g/Ek5Acc8vnSV8pN3CYz1wmvcZQC08/OWbPizGQEn6DvRBDPEOtXeT8jgJMw45B
	CCn4=
X-Gm-Gg: ASbGncvsZQcLlIS3VAvMwKkHIOt9IllGp8eYWQZ+5r8UScuI5U+ALgpvrAFt142ookZ
	x3r6Enqwnajfbt2MR57hz5KhUs2LMgeQ9/bERrnRGjfgLtQjLY/rDhFQvE9KdoHuu1tvM0AiNBC
	mArycw6VTeGI9dDmKMhnQknRS3kzebT3QooJdG31IogdUnJGefNwv8DERTqnLsv9R4oRX17UL3m
	JMjQ8kXJ45M/3MLoZG+QdC1tIoFxzex9POOq+zbar+CX9d1ljomApMhrKfBkoOH6ESy4bPVWRxM
	01FbfhSJB5pz8bD1WxH3NIIhJaXI535+YO+llAMDWBEXWqUafBTHM3to3+hAPO2wWXdlpEGSeZ5
	A165z0UCaFFV73pyNO+9rmZIYHSZTN/cXIDr2rVwqboj+Y9jVbHGkowAiNQIdq5kFJMu81OiynQ
	omt5lpcpXEGvwDDFRld3aXdmZ+3470LfC5MNgcQf8=
X-Google-Smtp-Source: AGHT+IHhYfJ3P4ZDHdmpx6lPDY7zP7HZSvbAsfsv5o7Kw3a+ANC4PH1aql1PlIQbDmCbNoilL0imuw==
X-Received: by 2002:a05:6102:3a07:b0:5db:2301:aa07 with SMTP id ada2fe7eead31-5dbb135a161mr4773251137.37.1762227077826;
        Mon, 03 Nov 2025 19:31:17 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dbf30e274csm731169137.3.2025.11.03.19.31.17
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 19:31:17 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5597330a34fso625871e0c.2
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Nov 2025 19:31:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXcnFOBIscSykyKE616Xl46rMDKVh2RzztxCT5CSc+lAoO5mGLHJaBTwl8cJVOo3ErCc/Jc7wSLJmceGq6Nlg==@lists.infradead.org
X-Received: by 2002:a05:6102:3592:b0:5db:cc25:dd7a with SMTP id
 ada2fe7eead31-5dbcc25e19emr3043231137.28.1762227076683; Mon, 03 Nov 2025
 19:31:16 -0800 (PST)
MIME-Version: 1.0
References: <20251104031533.9419-1-Niklaus.Liu@mediatek.com> <20251104031533.9419-2-Niklaus.Liu@mediatek.com>
In-Reply-To: <20251104031533.9419-2-Niklaus.Liu@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 4 Nov 2025 11:30:40 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngxeeV9m+5Yv0YNGWdbD0eVQisSr7k+nsxieok_7jKp=A@mail.gmail.com>
X-Gm-Features: AWmQ_bmOhDmgmGrSBNtj0-kgZvqxGdX1GAYzQFFwyDNQ0HSH4haoGBpnhf8glsQ
Message-ID: <CAC=S1ngxeeV9m+5Yv0YNGWdbD0eVQisSr7k+nsxieok_7jKp=A@mail.gmail.com>
Subject: Re: [PATCH 1/1] soc: mediatek: mtk-regulator-coupler: Add support for MT8189
To: "niklaus.liu" <Niklaus.Liu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, sirius.wang@mediatek.com, 
	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com, zhigang.qin@mediatek.com, 
	sen.chu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_193120_617254_2C537778 
X-CRM114-Status: GOOD (  22.16  )
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

On Tue, Nov 4, 2025 at 11:15=E2=80=AFAM niklaus.liu <Niklaus.Liu@mediatek.c=
om> wrote:
>
> From: Niklaus Liu <niklaus.liu@mediatek.com>
>
> Enhance the regulator coupler driver to support GPU power control on the
> MediaTek MT8189 platform. This update ensures proper coordination of
> multiple regulators required for GPU operation,improving power management
> and system stability.
>
> Signed-off-by: Niklaus Liu <niklaus.liu@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-regulator-coupler.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/mediatek/mtk-regulator-coupler.c b/drivers/soc/m=
ediatek/mtk-regulator-coupler.c
> index 0b6a2884145e..f6e3b2a3a5a8 100644
> --- a/drivers/soc/mediatek/mtk-regulator-coupler.c
> +++ b/drivers/soc/mediatek/mtk-regulator-coupler.c
> @@ -42,6 +42,18 @@ static int mediatek_regulator_balance_voltage(struct r=
egulator_coupler *coupler,
>         int max_uV =3D INT_MAX;
>         int ret;
>
> +       /*
> +        * When vsram_gpu is enabled or disabled and the use_count of the
> +        * vsram_gpu regulator is zero, the regulator coupler driver will
> +        * execute regulator_do_balance_voltage, which adjusts the vsram_=
gpu
> +        * voltage to the minimum value. This may result in vsram_gpu bei=
ng
> +        * lower than vgpu. Therefore, when enabling or disabling vsram_g=
pu,
> +        * the 8189 temporarily skips the regulator coupler driver's modi=
fication
> +        * of the vsram_gpu voltage.
> +        */
> +       if (of_machine_is_compatible("mediatek,mt8189") && rdev =3D=3D mr=
c->vsram_rdev)
> +               return 0;
> +
>         /*
>          * If the target device is on, setting the SRAM voltage directly
>          * is not supported as it scales through its coupled supply volta=
ge.
> @@ -148,7 +160,8 @@ static int mediatek_regulator_coupler_init(void)
>         if (!of_machine_is_compatible("mediatek,mt8183") &&
>             !of_machine_is_compatible("mediatek,mt8186") &&
>             !of_machine_is_compatible("mediatek,mt8188") &&
> -           !of_machine_is_compatible("mediatek,mt8192"))
> +           !of_machine_is_compatible("mediatek,mt8192") &&
> +           !of_machine_is_compatible("mediatek,mt8189"))

Please add the new entry by alphabetical order.

Regards,
Fei

>                 return 0;
>
>         return regulator_coupler_register(&mediatek_coupler.coupler);
> --
> 2.46.0
>
>

