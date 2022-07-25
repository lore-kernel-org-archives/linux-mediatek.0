Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463DBC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 08:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9oGiDsxiFpBH+3rbxjYFk4fKS6kxjytRyEJ438nM14=; b=ItKBgoy9oDas5bW95TdrHEY8Z+
	nPfLWZO0msU1E6SRRC3K0Me05axcAaFBiHcozcqFApYagpiFRduFzn/onOwVUbGsRnCP99tknic9c
	TFn/rXShWjJaMX2oTnOeKPOSO3QvSPf6Tet9csrZLBLHdAt9O5FGaLqqLZaFIuC9hwcamnTrxRE/w
	VtDC3iLPEvozRW+RaVCvhnxsf3d1bN3m9J0gPGdTL76anS9BLMTCTRKK9v9TSGBh85QLRAhQ6WY4x
	NyG4gW8P8JNFyNcTecUXH5PTHXAdhnM4ngk8QQTh24LIubRiB39d4f6NZxCjAlNqI8/KAw9mR4lmk
	twtQpaAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFt4y-006Wdk-EQ; Mon, 25 Jul 2022 08:04:40 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFt4i-006WO3-Fq; Mon, 25 Jul 2022 08:04:28 +0000
Received: by mail-ej1-x630.google.com with SMTP id bp15so19121510ejb.6;
        Mon, 25 Jul 2022 01:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r9oGiDsxiFpBH+3rbxjYFk4fKS6kxjytRyEJ438nM14=;
        b=CJb2GrDqw5wptQkMGvGnlEHmNqNpBTz+oVejWM8vbDuV20ZOTC6BJ/xAOcSduhufTS
         CtY8s0Ob07oaPbu/f4yqfvkHz/xDY1O6vs2/oftm3gv1Uc+ykJC+fUd1S21cXIv8VjyW
         kSXeGTgiv3k4SaU7t5pXcn2tjl5/OFjnaZJ8Uu0DxeB/9Oof1BN5BOo2rRbXDmOoY1Oc
         CAj9lT0OP1cy+XTY99JtA98O+TDOotsScJIH1YM0dQeqD+8VHoEVugkGshM79Qhx2IYY
         Qmh4+CVjG1cahmKQrRaUHy+VKbjtu21T43SHNPAsr2ti4ofng6x5uib9AjGL5NY7lM5l
         yEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r9oGiDsxiFpBH+3rbxjYFk4fKS6kxjytRyEJ438nM14=;
        b=SokOilYlgS3RrZi32H3eZUdu+4KjqsSsy1MfZYoepmGOY/WNFhgUersi7bOI0s4IhT
         d2AAS+o61CCof6jy/hAnrMTu0ANgbYgOpWjMjiY4gO4wCfM9wWHBvc3PbDwY7boO83hN
         H6hTuttpEt7uAbtDO7HPvPAiC3Hn9hzsMZfPBr3f2mHiszJIP1jr2UAoxILaWm040d/E
         0ZuGVdpBmjQd7Jk6SHz6+GsTRHiBZ6qdJIHXOQekVuKIQsgW2ilUVj8CIh7Oxr09alSB
         4OYFxcpDS/awqtGYl0pscQg+CKv5tHnD/06TbAj1SBHn65vonZGf3GZviUXdLRpDM1dl
         r3GA==
X-Gm-Message-State: AJIora+9VgigdGsB8PVpzSoR5TnCrOICr3yvwvq5GYgG/rPKyy1AmksQ
	cbuzUSIjjqd3mH05jNhJxrpRVgQOG5iiHi0/U3Q=
X-Google-Smtp-Source: AGRyM1slRdGOzS2afMezkzisSa07VKYBk0S3NkjvREARPdSLLPsbko0C4F61HAPbqNjfvUDyrYKyJb1xX+GfnwkFVZU=
X-Received: by 2002:a17:906:8a4a:b0:72b:5b23:3065 with SMTP id
 gx10-20020a1709068a4a00b0072b5b233065mr9334315ejc.557.1658736256789; Mon, 25
 Jul 2022 01:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-9-peterwu.pub@gmail.com>
In-Reply-To: <20220722102407.2205-9-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Jul 2022 10:03:40 +0200
Message-ID: <CAHp75VessBZMBA6wNWhhXhPshDCghgkV8EkEUUqOeLqn-5pmpA@mail.gmail.com>
Subject: Re: [PATCH v6 08/13] usb: typec: tcpci_mt6370: Add MediaTek MT6370
 tcpci driver
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	ChiaEn Wu <chiaen_wu@richtek.com>, Alice Chen <alice_chen@richtek.com>, 
	cy_huang <cy_huang@richtek.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_010424_541413_891E22FF 
X-CRM114-Status: GOOD (  14.62  )
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

On Fri, Jul 22, 2022 at 12:25 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiYuan Huang <cy_huang@richtek.com>
>
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual
> Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
>
> Add support for the Type-C & Power Delivery controller in
> MediaTek MT6370 IC.

...

> +static int mt6370_tcpc_set_vconn(struct tcpci *tcpci, struct tcpci_data *data,
> +                                bool enable)
> +{
> +       return regmap_update_bits(data->regmap, MT6370_REG_SYSCTRL8,
> +                                 MT6370_AUTOIDLE_MASK,
> +                                 !enable ? MT6370_AUTOIDLE_MASK : 0);

Why not positive conditional?

  enable ? 0 : mask

> +}

...

> +       ret = devm_add_action_or_reset(dev, mt6370_unregister_tcpci_port,
> +                                      priv->tcpci);

I believe nothing bad will happen if you put it on one line.

-- 
With Best Regards,
Andy Shevchenko

