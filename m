Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115F6C001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Aug 2023 10:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHVFwf2+IJdhvL1m7bcmD2X+8MDeoieDkbHIWtoTZtU=; b=Ititsi+E0+pJFwORf73pbeNGDx
	PY2p3H3i/Cm8zw0QgGWTopUUeV5QDoLz5klf1HnjBJjIz6otpkz8wh1ka6a3zjB/qoOlxUgqIVioN
	wU67x+XOxP/Vg82tuDTgpbLtV4CD7vg2I72nAoaGJrJF6DIKBWQjl7fxWhE/umt+0tEK99wCbV/hx
	wX4ZypoF8jSJ20fmjYGp7Ht5afzCbh1QYG889sh0zK3JMJi2ujeN08qlILa/jQp+L7fJU3ZUuRbDw
	atXjeBYx7vDHPbeulOKxW4f2n1vhFsCvGNp9q/ZrKol2Di24aHs+Xs7XQuxKk371a6My+G/6WQtG8
	b5sqWYmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWE3Y-003tTP-3A;
	Wed, 16 Aug 2023 10:47:16 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWE3V-003tSM-1N
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Aug 2023 10:47:15 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6bc9d16c317so5076888a34.1
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Aug 2023 03:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692182831; x=1692787631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHVFwf2+IJdhvL1m7bcmD2X+8MDeoieDkbHIWtoTZtU=;
        b=Nlgcv2HJLA79Yxsz2pDMqw8KXCAYKf35hze4/k++oS8i+tFaUoOBUCemVoo+mmy2et
         TkNIzFP6EPK8Ex14d6TifkAeVTJ7s5Ank/Jj+Gvch59tbIuJ+5GT75kH2Nw951pwiyDN
         vvYJMQprRBYlJFsncnqLvGU8DfW0XcaIcqmLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692182831; x=1692787631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHVFwf2+IJdhvL1m7bcmD2X+8MDeoieDkbHIWtoTZtU=;
        b=ARs8/Z0K02GuTkmVv6uBImU86ZcVBa7Hh7UU326MwbefgFxYWgxRhr0dcqAPzGUC2W
         kcef4RZTx5r/I18wBtUqQfyw3Kwj2eFOPoHlsHYZ2LAYxsFUdlFUKxmMXqPpHfzvkULQ
         9FPZKo8cza+NtOKsIfGMZp+VCV14A4tL+fhWbxxt5aq4VvZ7mh7HaKfKmPJIMmyjFKuj
         7TbgHcFERNx/n9N0wDq5627w2Y4vzXwoiTDROywL61RjiXYZ7RSsRBcVWdQ7ELtnr3tk
         Cm34GSXa6nixCQ9mH36yOg3yUQfPVu1kU2BVdQq7Fabz4y9xXSvsHdq6VmpOLHARMi5u
         oYmg==
X-Gm-Message-State: AOJu0Yx2hb3OMYnQe7O/kYxh7OUOFlszROh6JmVJSZVwJlLPKJ7aqZWV
	1tqqleLDjSCyTo8pFP8dPgqsNmeb4d/TzXIq8GQKcQ==
X-Google-Smtp-Source: AGHT+IFop6ccKvKv4AO2QL1MFngv5Zyjpe0Iy6hNB7Ea7XfS2ppUUNyTqyfMkTCzFCreFuZWS/ZjF6x+8JoQCmIeYP8=
X-Received: by 2002:a05:6830:1d69:b0:6bd:b40:8912 with SMTP id
 l9-20020a0568301d6900b006bd0b408912mr1258271oti.35.1692182831303; Wed, 16 Aug
 2023 03:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230816104245.2676965-1-hsinyi@chromium.org>
In-Reply-To: <20230816104245.2676965-1-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 16 Aug 2023 18:46:45 +0800
Message-ID: <CAJMQK-hR0eaO0b4Vd0U8_KAndLyZapqdHjVLAoe42rWi9rdLkA@mail.gmail.com>
Subject: Re: [PATCH v2,1/2] mtd: spi-nor: giga: gd25lq64c: Disable quad mode
 according to bus width
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
	"Miquel Raynal )" <miquel.raynal@bootlin.com>, "Richard Weinberger )" <richard@nod.at>, 
	"Vignesh Raghavendra )" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_034713_521249_70BB1B06 
X-CRM114-Status: GOOD (  27.16  )
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

On Wed, Aug 16, 2023 at 6:42=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> gd25lq64c has Quad Enable Requirement flag parsed as
> BFPT_DWORD15_QER_SR2_BIT1_BUGGY in BFPT, even if spi-{rx/tx}-bus-width
> set as non QUAD, eg. 0, 1, 2... Thus quad_enable will not be NULL and
> quad enable (QE) bit will be set to 1 by default. According to
> datasheet[1], if QE bit is enabled, WP pin will become IO pin and the
> system can't use write protection feature, and it's also not recommended
> to set QE bit to 1[1].
>
> Add a post_bfpt fixup that reads spi-rx-bus-width to remove quad_enable
> if the width is set to below QUAD mode.
>
> [1]
> https://www.gigadevice.com.cn/Public/Uploads/uploadfile/files/20220714/DS=
-00012-GD25LQ64C-Rev3.4.pdf
> page 13
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
change log:
v1->v2: read bus width property in driver instead of creating a
duplicate dt property.
v1 link: https://lore.kernel.org/lkml/20230815154412.713846-1-hsinyi@chromi=
um.org/
---
>  drivers/mtd/spi-nor/gigadevice.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigad=
evice.c
> index d57ddaf1525b3..8ea89e1858f9b 100644
> --- a/drivers/mtd/spi-nor/gigadevice.c
> +++ b/drivers/mtd/spi-nor/gigadevice.c
> @@ -33,6 +33,31 @@ static const struct spi_nor_fixups gd25q256_fixups =3D=
 {
>         .post_bfpt =3D gd25q256_post_bfpt,
>  };
>
> +static int
> +gd25lq64c_post_bfpt(struct spi_nor *nor,
> +                   const struct sfdp_parameter_header *bfpt_header,
> +                   const struct sfdp_bfpt *bfpt)
> +{
> +       struct device_node *np =3D spi_nor_get_flash_node(nor);
> +       u32 value;
> +
> +       /*
> +        * Even if spi-{tx,rx}-bus-width is set to DUAL mode, due to the =
QER
> +        * flag parsed from BFPT is BFPT_DWORD15_QER_SR2_BIT1_BUGGY, so t=
he
> +        * quad_enable will be set and QE bit set to 1.
> +        */
> +       if (!of_property_read_u32(np, "spi-rx-bus-width", &value)) {
> +               if (value <=3D 2)
> +                       nor->params->quad_enable =3D NULL;
> +       }
> +
> +       return 0;
> +}
> +
> +static struct spi_nor_fixups gd25lq64c_fixups =3D {
> +       .post_bfpt =3D gd25lq64c_post_bfpt,
> +};
> +
>  static const struct flash_info gigadevice_nor_parts[] =3D {
>         { "gd25q16", INFO(0xc84015, 0, 64 * 1024,  32)
>                 FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> @@ -53,7 +78,8 @@ static const struct flash_info gigadevice_nor_parts[] =
=3D {
>         { "gd25lq64c", INFO(0xc86017, 0, 64 * 1024, 128)
>                 FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> -                             SPI_NOR_QUAD_READ) },
> +                             SPI_NOR_QUAD_READ)
> +               .fixups =3D &gd25lq64c_fixups },
>         { "gd25lq128d", INFO(0xc86018, 0, 64 * 1024, 256)
>                 FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> --
> 2.41.0.694.ge786442a9b-goog
>

