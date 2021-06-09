Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67347C48BCF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 10:12:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 223CE61359
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 10:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 223CE61359
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CQN97JeyXwHPnCzVhuDXAahujeXdaIpTZ596xlYFzBc=; b=4cknrmQ5O1tBoy
	0Hmej+Z+FuApXpcTtnnbwQp0l3vLdG1wNlDyXjr/kwM6Zpx5Bi+LfzfBck0JM1UdY5tRHKAI45GIA
	hM1QmpK93hvxOcT30g0hPeSlu38luDL5/FJ+Ss0SEb+es4avn4oGs6q09GEmKfob2kGdq6m3Rl6zR
	uTO+EZBGlGvOa2lYEzWFXIyrn2xPrv86D6RoyPeTuq7GfYSaiwLpkhoN3XRe3PjynM+s4026A/IFk
	l3u+mMQ2XaMVw6zoBVrqLZbxZ1lZgdkNI/2/CLzT6p9yDSOaYnrH0F4iYz2RHlRNMk611/4hDsEUZ
	1viRYjpg3nGlU+CCKa2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqvAU-00Cv4V-0k; Wed, 09 Jun 2021 10:10:38 +0000
Received: from mail-il1-f177.google.com ([209.85.166.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqv3u-00CsJQ-76
 for linux-mediatek@lists.infradead.org; Wed, 09 Jun 2021 10:03:51 +0000
Received: by mail-il1-f177.google.com with SMTP id b9so24769798ilr.2
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Jun 2021 03:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hxhSa0kvLC7oP/RrEKCgojf2CT4psCrXq+njT9seZ0A=;
 b=UhlRk1H5gURKZzZL61G0sM0838VcqS9EvsL0IWAzaEgAilG0YWIVhX0lUeqgyP9GIx
 Tg8VZ/diEezSUdH8c3083XiOh8gno54pl5MABAA2mnzJ19+ik/TjMO2IjLHtXBzh3lQn
 KxDPtlxEZY8BfUSa9vP/HRQcEuanMqUHs2f1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hxhSa0kvLC7oP/RrEKCgojf2CT4psCrXq+njT9seZ0A=;
 b=jkijCU24LdQyZuvL9DqHtiIYijDH2G+7CjfWasa5ZbFQ1XcRcRMocsxoHBC15NhtTl
 Iqh70DSPq6EME7MfbwgaLe7tWM4Muk1hZk3CxR85f+wB137yQBspraZxy3b3H5RkZI5Y
 3C3JRZb4uMnx5wgbmnfR3tX8tdCvUEnV3n/eS09UgxwPP5G2ukV551/RZGIhZYfC2EJr
 sTJ99E9kgioGtIAFFdJV2TOzXWoyiesmSG/Dt9tBPcs1LV/lNjz+fDRrRoJ1J6w0N1D2
 VKfSWlblODzAxcjlEayuIanxr1aHTOkSlWwFRxmU6ZjebPYjuasmnNT5KgGLIMw4oRQY
 YcLg==
X-Gm-Message-State: AOAM5328PCFjdq7R6uHpdY1iH1LohlJBYcCjp7bn/GmDA7qUyhFdHIJi
 DQl+wBVZnZyqn6foTSc/qm23/DewiXIaFQ==
X-Google-Smtp-Source: ABdhPJxX/atMTvAF+axkMLURrtknYAcSS7L5zVU/bf4ScUlNiUOC9DnYH5DemBY5xNEki2X5t8yrtQ==
X-Received: by 2002:a6b:6519:: with SMTP id z25mr20666789iob.191.1623232969020; 
 Wed, 09 Jun 2021 03:02:49 -0700 (PDT)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com.
 [209.85.166.171])
 by smtp.gmail.com with ESMTPSA id a11sm1212975ioq.12.2021.06.09.03.02.48
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 03:02:48 -0700 (PDT)
Received: by mail-il1-f171.google.com with SMTP id h3so5670415ilc.9
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Jun 2021 03:02:48 -0700 (PDT)
X-Received: by 2002:a05:6e02:ca8:: with SMTP id
 8mr23794380ilg.115.1623232967763; 
 Wed, 09 Jun 2021 03:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210517173314.140912-1-gene.chen.richtek@gmail.com>
 <20210517173314.140912-9-gene.chen.richtek@gmail.com>
In-Reply-To: <20210517173314.140912-9-gene.chen.richtek@gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 9 Jun 2021 18:02:11 +0800
X-Gmail-Original-Message-ID: <CAC=S1niBX4cL7EaROvG9NKSrnFFqCj+EPAZx0KASNTcF9F6E0Q@mail.gmail.com>
Message-ID: <CAC=S1niBX4cL7EaROvG9NKSrnFFqCj+EPAZx0KASNTcF9F6E0Q@mail.gmail.com>
Subject: Re: [PATCH v8 08/10] mfd: mt6360: Fix flow which is used to check ic
 exist
To: Gene Chen <gene.chen.richtek@gmail.com>
Cc: lee.jones@linaro.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com, 
 shufan_lee@richtek.com, cy_huang@richtek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_030350_301469_55C4C57A 
X-CRM114-Status: GOOD (  22.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, May 18, 2021 at 1:36 AM Gene Chen <gene.chen.richtek@gmail.com> wrote:
>
> From: Gene Chen <gene_chen@richtek.com>
>
> Fix flow which is used to check ic exist.
>
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/mfd/mt6360-core.c | 32 +++++++++++++++++++++-----------
>  1 file changed, 21 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
> index 50a170065a98..cdd99770f94a 100644
> --- a/drivers/mfd/mt6360-core.c
> +++ b/drivers/mfd/mt6360-core.c
> @@ -293,6 +293,25 @@ static const struct mfd_cell mt6360_devs[] = {
>                     NULL, 0, 0, "mediatek,mt6360-tcpc"),
>  };
>
> +static int mt6360_check_vendor_info(struct mt6360_ddata *ddata)
> +{
> +       u32 info;
> +       int ret;
> +
> +       ret = regmap_read(ddata->regmap, MT6360_PMU_DEV_INFO, &info);
> +       if (ret < 0)

A dev_err() to indicate the read info error? (it used to be there)

> +               return ret;
> +
> +       if ((info & CHIP_VEN_MASK) != CHIP_VEN_MT6360) {
> +               dev_err(ddata->dev, "Device not supported\n");
> +               return -ENODEV;
> +       }
> +
> +       ddata->chip_rev = info & CHIP_REV_MASK;
> +
> +       return 0;
> +}
> +
>  static const unsigned short mt6360_slave_addr[MT6360_SLAVE_MAX] = {
>         MT6360_PMU_SLAVEID,
>         MT6360_PMIC_SLAVEID,
> @@ -303,7 +322,6 @@ static const unsigned short mt6360_slave_addr[MT6360_SLAVE_MAX] = {
>  static int mt6360_probe(struct i2c_client *client)
>  {
>         struct mt6360_ddata *ddata;
> -       unsigned int reg_data;
>         int i, ret;
>
>         ddata = devm_kzalloc(&client->dev, sizeof(*ddata), GFP_KERNEL);
> @@ -319,17 +337,9 @@ static int mt6360_probe(struct i2c_client *client)
>                 return PTR_ERR(ddata->regmap);
>         }
>
> -       ret = regmap_read(ddata->regmap, MT6360_PMU_DEV_INFO, &reg_data);
> -       if (ret) {
> -               dev_err(&client->dev, "Device not found\n");
> +       ret = mt6360_check_vendor_info(ddata);
> +       if (ret)
>                 return ret;
> -       }
> -
> -       ddata->chip_rev = reg_data & CHIP_REV_MASK;
> -       if (ddata->chip_rev != CHIP_VEN_MT6360) {
> -               dev_err(&client->dev, "Device not supported\n");
> -               return -ENODEV;
> -       }
>
>         ret = devm_regmap_add_irq_chip(&client->dev, ddata->regmap, client->irq,
>                                        0, 0, &mt6360_irq_chip,
> --
> 2.25.1
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
