Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D605C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 10:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDsOzmmnvUm1G11MYBhQGWKR4I6cbpM4/80jOVhzQFw=; b=QUjkqNQAhN70neS0V5NtyqYARZ
	l83uZ1PN6qjiXdvbWxqVzN1vtFfbfJjskZ5GdgWs2o7CKfhBqDUEUQJ2SUajU8Uc9cceQ2bknlO6z
	XD59GUlw+Zr5E14EWmVC699gkjhiy0dLJxUA2oyDYodC6mk+QQFAHEb61N4DvRqN/wA2FDNiRkkjY
	MNfuX2I+8ZssCjJBpEo3dq/kRa4MUrR/YBJguWgGmNgVKWJJ8LNz+pW11JlwAi71e1T3nLubj5Ta6
	NaiiTG1X8TFqauchZLC/A6vkZOOgO029jR7rCEgil+FLLqI1lnasHIlZQpkCYLP52iqioNgsFInxY
	QXuvWaCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qusTo-0073di-39;
	Mon, 23 Oct 2023 10:48:16 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qusTk-0073b5-2Y
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 10:48:14 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-457d9ffc9d2so2112743137.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 03:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698058091; x=1698662891; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDsOzmmnvUm1G11MYBhQGWKR4I6cbpM4/80jOVhzQFw=;
        b=izpIkXOmERDcdLCucTP7nv7MzkLelGqLhwxZj6r6/uLcTIgYLD7CxDJn2kZmefHprn
         t3dxaJKqy4lIORrLNB5HaOt/K8xd/3W+NPWqVUC++dWyY81aRRRQlZa2ZHICBFOpKTnO
         6Dx1EuIODH1P9jLUymwEDXBqvv8i5SBiurAq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698058091; x=1698662891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDsOzmmnvUm1G11MYBhQGWKR4I6cbpM4/80jOVhzQFw=;
        b=SchN0I3YKLDM5MmtiSLaQwHwYF1r6DCsoWaP32mZ4jxb82cW4A7NL8UyTnOE7WLxM1
         fuHag9xalbtTPOIyWWQg36JNW4ydhVOMPMSybnORh5rUqPxluCv9YsriQHVWac95c4lY
         EWq15rrQW1HJe4SR5uWC3KstW/xNNeqsdU1IIF2Kg3NTuZvq0UJsEQryfFZMyvVQlT4f
         +BhSqCoMdJM7gnMBU8LhmOs5CIDV3/c6mzpexAOqLSbzvArnKA0VqROP2yc2RE3XYgMI
         ha8vjW6g+NSBb+Yp/nLjn8oJSgXA9b6jOJ7TPpo/bny3hPqfHt8IPNeCoCwXxb5+EtHU
         MRmw==
X-Gm-Message-State: AOJu0Yz2KWyfcf0Fesemt/+SXOU6x80bUBDhBNxy0WGBM4HwozlMqC0t
	18VP8N0iDfxDaGtNDEC+1nCMXCbo+HbZZf584jI=
X-Google-Smtp-Source: AGHT+IGepTobOboTHiq4YjsvV2w3OmvDAI13PMROkgCneixK8o2xAafpk8K2fgKsyYVMY4wFJvEhwg==
X-Received: by 2002:a67:e7c5:0:b0:44e:837a:25e with SMTP id hy5-20020a67e7c5000000b0044e837a025emr6280786vsb.11.1698058091354;
        Mon, 23 Oct 2023 03:48:11 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id l16-20020ab07190000000b007ab975b8eb9sm881993uao.10.2023.10.23.03.48.11
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 03:48:11 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-49ab6c1869dso2795641e0c.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 03:48:11 -0700 (PDT)
X-Received: by 2002:a1f:9dd4:0:b0:496:187e:b33f with SMTP id
 g203-20020a1f9dd4000000b00496187eb33fmr3723710vke.3.1698058090760; Mon, 23
 Oct 2023 03:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20231023043751.17114-1-jason-jh.lin@mediatek.com> <20231023043751.17114-8-jason-jh.lin@mediatek.com>
In-Reply-To: <20231023043751.17114-8-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 23 Oct 2023 18:47:34 +0800
X-Gmail-Original-Message-ID: <CAC=S1niRYwftnmi8VABzENf2g94ELEBZrB3NRRdvwn0Ro6tO1A@mail.gmail.com>
Message-ID: <CAC=S1niRYwftnmi8VABzENf2g94ELEBZrB3NRRdvwn0Ro6tO1A@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] mailbox: mediatek: Add secure CMDQ driver support
 for CMDQ driver
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Jeffrey Kardatzke <jkardatzke@google.com>, Jason-ch Chen <jason-ch.chen@mediatek.com>, 
	Johnson Wang <johnson.wang@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_034812_865032_A198CE98 
X-CRM114-Status: GOOD (  28.13  )
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

Hi Jason,

On Mon, Oct 23, 2023 at 12:39=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@mediate=
k.com> wrote:
>
> CMDQ driver will probe a secure CMDQ driver when has_sec flag
> in platform data is true and its device node in dts has defined a
> event id of CMDQ_SYNC_TOKEN_SEC_EOF.
>
> Secure CMDQ driver support on mt8188 and mt8195 currently.
> So add a has_sec flag to their driver data to probe it.
>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c       | 42 ++++++++++++++++++++++--
>  include/linux/mailbox/mtk-cmdq-mailbox.h | 11 +++++++
>  2 files changed, 51 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmd=
q-mailbox.c
> index 3bdfb9a60614..4db5eb76f353 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -87,6 +87,7 @@ struct gce_plat {
>         u8 shift;
>         bool control_by_sw;
>         bool sw_ddr_en;
> +       bool has_sec;
>         u32 gce_num;
>  };
>
> @@ -560,14 +561,23 @@ static int cmdq_probe(struct platform_device *pdev)
>         int alias_id =3D 0;
>         static const char * const clk_name =3D "gce";
>         static const char * const clk_names[] =3D { "gce0", "gce1" };
> +       struct resource *res;
> +       struct platform_device *mtk_cmdq_sec;
> +       u32 hwid =3D 0;
>
>         cmdq =3D devm_kzalloc(dev, sizeof(*cmdq), GFP_KERNEL);
>         if (!cmdq)
>                 return -ENOMEM;
>
> -       cmdq->base =3D devm_platform_ioremap_resource(pdev, 0);
> -       if (IS_ERR(cmdq->base))
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
The devm_platform_ioremap_resource() helper was added on purpose [1].
Please stick to it unless you have a strong reason to re-split it.

[1]: a04f30356e75 ("mailbox: mtk-cmdq: Make use of the helper function
devm_platform_ioremap_resource()")

> +       if (!res)
> +               return -EINVAL;
> +
> +       cmdq->base =3D devm_ioremap_resource(dev, res);
> +       if (IS_ERR(cmdq->base)) {
> +               dev_err(dev, "failed to ioremap cmdq\n");
>                 return PTR_ERR(cmdq->base);
> +       }
>
>         cmdq->irq =3D platform_get_irq(pdev, 0);
>         if (cmdq->irq < 0)
> @@ -585,6 +595,8 @@ static int cmdq_probe(struct platform_device *pdev)
>                 dev, cmdq->base, cmdq->irq);
>
>         if (cmdq->pdata->gce_num > 1) {
> +               hwid =3D of_alias_get_id(dev->of_node, clk_name);
Why get hwid here while it's only used in the has_sec branch?

> +
>                 for_each_child_of_node(phandle->parent, node) {
>                         alias_id =3D of_alias_get_id(node, clk_name);
>                         if (alias_id >=3D 0 && alias_id < cmdq->pdata->gc=
e_num) {
> @@ -653,6 +665,30 @@ static int cmdq_probe(struct platform_device *pdev)
>                 return err;
>         }
>
> +       if (cmdq->pdata->has_sec) {
> +               struct cmdq_sec_plat gce_sec_plat;
> +
> +               if (of_property_read_u32_index(dev->of_node, "mediatek,gc=
e-events", 0,
> +                                              &gce_sec_plat.cmdq_event) =
=3D=3D 0) {
> +                       gce_sec_plat.gce_dev =3D dev;
> +                       gce_sec_plat.base =3D cmdq->base;
> +                       gce_sec_plat.base_pa =3D res->start;
> +                       gce_sec_plat.hwid =3D hwid;
> +                       gce_sec_plat.gce_num =3D cmdq->pdata->gce_num;
> +                       gce_sec_plat.clocks =3D cmdq->clocks;
> +                       gce_sec_plat.thread_nr =3D cmdq->pdata->thread_nr=
;
> +
> +                       mtk_cmdq_sec =3D platform_device_register_data(de=
v, "mtk_cmdq_sec",
> +                                                                    PLAT=
FORM_DEVID_AUTO,
> +                                                                    &gce=
_sec_plat,
> +                                                                    size=
of(gce_sec_plat));
> +                       if (IS_ERR(mtk_cmdq_sec)) {
> +                               dev_err(dev, "failed to register platform=
_device mtk_cmdq_sec\n");
> +                               return PTR_ERR(mtk_cmdq_sec);
> +                       }
> +               }
> +       }
> +
>         return 0;
>  }
>
> @@ -693,6 +729,7 @@ static const struct gce_plat gce_plat_v6 =3D {
>         .thread_nr =3D 24,
>         .shift =3D 3,
>         .control_by_sw =3D true,
> +       .has_sec =3D true,
>         .gce_num =3D 2
>  };
>
> @@ -708,6 +745,7 @@ static const struct gce_plat gce_plat_v8 =3D {
>         .thread_nr =3D 32,
>         .shift =3D 3,
>         .control_by_sw =3D true,
> +       .has_sec =3D true,
>         .gce_num =3D 2
>  };
>
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mai=
lbox/mtk-cmdq-mailbox.h
> index f78a08e7c6ed..fdda995a69ce 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -79,6 +79,17 @@ struct cmdq_pkt {
>         bool                    loop;
>  };
>
> +struct cmdq_sec_plat {
> +       struct device *gce_dev;
> +       void __iomem *base;
> +       dma_addr_t base_pa;
> +       u32 hwid;
> +       u32 gce_num;
> +       struct clk_bulk_data *clocks;
> +       u32 thread_nr;
> +       u32 cmdq_event;
> +};
I feel this should be in mtk-cmdq-sec-mailbox.h.

Regards,
Fei



> +
>  u8 cmdq_get_shift_pa(struct mbox_chan *chan);
>
>  #endif /* __MTK_CMDQ_MAILBOX_H__ */
> --
> 2.18.0
>
>

