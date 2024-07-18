Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9654DC3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 09:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WurLU3I0ZY0rwZGNbG1KQfDTWM2GScsE4+HGMoCekcE=; b=OywWkp/4BNLx82Wg+6HKmmRJRx
	STv+51tYzYywwKSsSPzWMuCTvFC5D1VlW+Zf+n1d43qMt+fTOlSofEbbYZbuj6SMS/IX1MlubxdfJ
	+jR1mp1GS8tYhUYYYi0piK3hKtUrfDMd86TMiRIePtn61ig3leK5JCV9HhrHGnv0POQzqcV2F8WMC
	KGKfP4tdATdwQSbQG1PnhRMSfm++UCcetPDv0cr1Kz9VmWjZ4IJMeYxRuvMaOs+4ilhdvs01Xahpy
	oswjrRkANipGWQN0iFujDDDMd9imzCrmA5a7NzTmtSjr1pUk0CGEwYfAds625fk5QGtldrGd8DiCY
	yfNsB75A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNep-0000000Ganz-0yHU;
	Thu, 18 Jul 2024 09:42:39 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNeT-0000000Gajb-3Sbi
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jul 2024 09:42:19 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-4f481c2bc80so261502e0c.0
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jul 2024 02:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721295736; x=1721900536; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WurLU3I0ZY0rwZGNbG1KQfDTWM2GScsE4+HGMoCekcE=;
        b=goKOCI5OEXAoMFmR1X5JysXuxQ5HEqMLus5iKa6r0o0dDez7yoGZO+zLwwP91l3i2v
         piAE/sJWKALgtp7eac5Xqwtg3SkHT+jQ3UzFk5iTAn1aLpNbBFcIeXFtIpuvxbRvd3K0
         OtiTV5p5z2HJlHFMiBERUDKv0EA9aQ1ivveOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721295736; x=1721900536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WurLU3I0ZY0rwZGNbG1KQfDTWM2GScsE4+HGMoCekcE=;
        b=CYPF71KLShSQuO2Oot4QC79DnvXFkrRIrxMg+2i5B2wydSiuouCdPUD21UA49a6yj2
         50nzKodcY2m/NTmDcWjBY1zzqU0QwchEnev88e/YOYfaAE3EnJtR2FjnDOYu+8qAYHl5
         DZbXBQrhKooNxLXDfWc6qKLGaJCAUhTWGrbw4SGCCx1IWYPKp2h/wvxV485TEyDs7rF1
         sMCyeOXrzqiPRtkrYXUT1lFv9K+QiqjgEkCgVgEYDfsIvRxVvrFOe5QBK6qo5favN7Mq
         GRrUBrONb3xNuY0GJZCgWdcn2n5EA+JrwocvHEpociJ5JnOXPcd+q2B97d2o37mkH2bC
         n5IA==
X-Forwarded-Encrypted: i=1; AJvYcCXhXpCTyxkYLFxZwek/EfJRXaijvswZOreXyITpnMcfuLZs6GlaiIY6zDUO0Md1kN0WYIebILAcNQEcMpIy5Fa0IoRWc/WSlVNGoFPZNsnjy02h
X-Gm-Message-State: AOJu0Yx6HcHE5Q/GQ3sEZchn8uyF4yez0IAx2ria5kKrXnfZQGYnbTah
	fgGhNfdQE0eGr2PtvIn30d/imYUADAmvddmyQBpBTntSaNl6pzNi2fIASazWfmRecb2agtC2iOI
	2Zw==
X-Google-Smtp-Source: AGHT+IFTH+YLHOLUhNF9LX38jAkvmoLKZ1deDxs7LOmSfMuTDfygtGIhyEI/LggJOw7q+t6JJD028w==
X-Received: by 2002:a05:6122:3bcd:b0:4d3:cff6:79f0 with SMTP id 71dfb90a1353d-4f4df687dbcmr5798946e0c.4.1721295736337;
        Thu, 18 Jul 2024 02:42:16 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-4f4ee9a0284sm125796e0c.12.2024.07.18.02.42.15
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 02:42:15 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-820f047c4e4so196592241.0
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jul 2024 02:42:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9I5Kv/NVWJ4NqkuURW++Azo34M4r11uhLtyfInfdir7flqBxBf0xazwQL65AJ3a5yHFChPUDcMVvYCyTS7+VEWkjSqS9Qb3NBzzchOKHchCfo
X-Received: by 2002:a05:6102:8014:b0:48f:bbf3:b8b5 with SMTP id
 ada2fe7eead31-4915986a8afmr5862849137.7.1721295735028; Thu, 18 Jul 2024
 02:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240718082528.220750-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240718082528.220750-1-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 18 Jul 2024 17:41:39 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhmuGfaQrK-3TZzY3-c1_cDbB5g_Zp2nXOzg6zQZ-j4Lw@mail.gmail.com>
Message-ID: <CAC=S1nhmuGfaQrK-3TZzY3-c1_cDbB5g_Zp2nXOzg6zQZ-j4Lw@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: reset: Remove unused mtk_register_reset_controller()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, 
	p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-clk@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_024217_876753_3B2E3FC9 
X-CRM114-Status: GOOD (  21.05  )
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

On Thu, Jul 18, 2024 at 4:26=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Now that all clock controllers have been migrated to the new
> mtk_register_reset_controller_with_dev() function, the one taking
> struct device node is now unused: remove it.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/clk/mediatek/reset.c | 59 ------------------------------------
>  drivers/clk/mediatek/reset.h | 10 ------
>  2 files changed, 69 deletions(-)
>
> diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
> index 290ceda84ce4..069f9e909cb0 100644
> --- a/drivers/clk/mediatek/reset.c
> +++ b/drivers/clk/mediatek/reset.c
> @@ -110,65 +110,6 @@ static int reset_xlate(struct reset_controller_dev *=
rcdev,
>         return data->desc->rst_idx_map[reset_spec->args[0]];
>  }
>
> -int mtk_register_reset_controller(struct device_node *np,
> -                                 const struct mtk_clk_rst_desc *desc)
> -{
> -       struct regmap *regmap;
> -       const struct reset_control_ops *rcops =3D NULL;
> -       struct mtk_clk_rst_data *data;
> -       int ret;
> -
> -       if (!desc) {
> -               pr_err("mtk clock reset desc is NULL\n");
> -               return -EINVAL;
> -       }
> -
> -       switch (desc->version) {
> -       case MTK_RST_SIMPLE:
> -               rcops =3D &mtk_reset_ops;
> -               break;
> -       case MTK_RST_SET_CLR:
> -               rcops =3D &mtk_reset_ops_set_clr;
> -               break;
> -       default:
> -               pr_err("Unknown reset version %d\n", desc->version);
> -               return -EINVAL;
> -       }
> -
> -       regmap =3D device_node_to_regmap(np);
> -       if (IS_ERR(regmap)) {
> -               pr_err("Cannot find regmap for %pOF: %pe\n", np, regmap);
> -               return -EINVAL;
> -       }
> -
> -       data =3D kzalloc(sizeof(*data), GFP_KERNEL);
> -       if (!data)
> -               return -ENOMEM;
> -
> -       data->desc =3D desc;
> -       data->regmap =3D regmap;
> -       data->rcdev.owner =3D THIS_MODULE;
> -       data->rcdev.ops =3D rcops;
> -       data->rcdev.of_node =3D np;
> -
> -       if (data->desc->rst_idx_map_nr > 0) {
> -               data->rcdev.of_reset_n_cells =3D 1;
> -               data->rcdev.nr_resets =3D desc->rst_idx_map_nr;
> -               data->rcdev.of_xlate =3D reset_xlate;
> -       } else {
> -               data->rcdev.nr_resets =3D desc->rst_bank_nr * RST_NR_PER_=
BANK;
> -       }
> -
> -       ret =3D reset_controller_register(&data->rcdev);
> -       if (ret) {
> -               pr_err("could not register reset controller: %d\n", ret);
> -               kfree(data);
> -               return ret;
> -       }
> -
> -       return 0;
> -}
> -
>  int mtk_register_reset_controller_with_dev(struct device *dev,
>                                            const struct mtk_clk_rst_desc =
*desc)

I guess that means the "_with_dev" suffix here becomes redundant and
therefore can be removed.
Do you want to update it all together?

Regards,
Fei


>  {
> diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
> index 6a58a3d59165..562ffd290a22 100644
> --- a/drivers/clk/mediatek/reset.h
> +++ b/drivers/clk/mediatek/reset.h
> @@ -59,16 +59,6 @@ struct mtk_clk_rst_data {
>         const struct mtk_clk_rst_desc *desc;
>  };
>
> -/**
> - * mtk_register_reset_controller - Register MediaTek clock reset control=
ler
> - * @np: Pointer to device node.
> - * @desc: Constant pointer to description of clock reset.
> - *
> - * Return: 0 on success and errorno otherwise.
> - */
> -int mtk_register_reset_controller(struct device_node *np,
> -                                 const struct mtk_clk_rst_desc *desc);
> -
>  /**
>   * mtk_register_reset_controller - Register mediatek clock reset control=
ler with device
>   * @np: Pointer to device.
> --
> 2.45.2
>
>

