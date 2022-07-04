Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC45C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 20:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJ5uLmaL6h68lsnPAamuG1muud74QSPIe8Sz8xN9JKc=; b=imx7amr3B7O4fO5EFY0z29mGqx
	Wgi14eSDujiV7qivhpa6i/WGleJIbtnv5aWDrVssgdDaXIjoVUMzktWkBjQas/FLs1/8Ykc6q7I9m
	fI5zqifrG7wmebQr91lbz7gTZXuQyz3rM5OJk3bqPvuhSpeTfwUMMkXcfqOz07Twis5J7JkEM+hIo
	ZU9uPTFWjkx73Ruy+r6BuUltUl2OMIrmTL9LC96iO4IL/MCxo39qXMIhGM1CRTyCjh2ogUTLGTPMm
	nguE/11yyw98XG4Ky0147lcdTplc+tT16zFL0MNSWhREKbGmEC6EHgjWjFFqx5j7r4EtF2x1gtiom
	No8hYB4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Shn-00CCFN-I0; Mon, 04 Jul 2022 20:30:03 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Shb-00CCBn-OC; Mon, 04 Jul 2022 20:29:53 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id g4so18528947ybg.9;
        Mon, 04 Jul 2022 13:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BJ5uLmaL6h68lsnPAamuG1muud74QSPIe8Sz8xN9JKc=;
        b=IyhykYvWClWsa/rmW6Z/KwjZd5OEnZBjTZJoLjjQF9DF//3C/8TDLUZ9WgQcftxTIg
         RSAO/m1TfA810UfvrDxUciTgRWK2V4vdbkEYBtyWoxZlfSzBqFx5f84Zp+uH4jhvnzq/
         HsHVqaeINcK2mj/R1Ossi/8UDOV+jsLE5fw3mKztcr2IiO0IBISDLkBu1k6BwebWsnEj
         rhZLb6XD3sUUzdCeoSWKQm/M4LzSdBs90raNvlZ4+hvPn95gzOFxzHeI3LQRisB4w0up
         aec9JMZAW5+VoFpw7BV31bnXLr9oQpCTjtoPy02YGKT8SUHH8jzuYOAiMXH/V2hoIFH5
         cM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BJ5uLmaL6h68lsnPAamuG1muud74QSPIe8Sz8xN9JKc=;
        b=WL1w/jodLlavXwjBKup1r/NuCujsNudtlKh90V0fFRYhjlGlsRC3D1h7UivxeZ5T1N
         SzKjoMvUUOES4Za/ynLnbCcCkzp4E27YcpKniPW7/Mi185P8bkJCQhrQkDsyaoA5mm2y
         /gaW3nXfIMY1ezKNhKV+zRvllCXd/1YCE+/neWXMm3LYuxl3POXNLGTgOcuYZE1kT+xN
         gQ3sQ4LX6Ay5TBc/kiaIW2fusGhG7JVtX9Tscl6j/iLv6QD+M+Nck9fb9PBp95fqHP+v
         OLA53y7IxvYNIazDv0Zb4LgxA5UYJSMmQd9UHE4622/sCmI28uaCA+Z6tCm6zlmF6aom
         Akqg==
X-Gm-Message-State: AJIora8Y/KgekbJMIIQxUCNectP9+JiDDaXqWMS7NTL4T12dzCTzytHg
	5Ec3g+qktvpSt65di46s4I/9vQkXIPyGYlqlhHs=
X-Google-Smtp-Source: AGRyM1vEHdw+U96rIzhW6zkgtaj72ZS8Mc4Jf0CUsUjgZNa7gf9zGcS1I+LbCSSAS46frig4pqKB5Woq3OBcI+Ti+RY=
X-Received: by 2002:a25:858e:0:b0:66e:4898:63e2 with SMTP id
 x14-20020a25858e000000b0066e489863e2mr8437278ybk.296.1656966589934; Mon, 04
 Jul 2022 13:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com> <20220704053901.728-8-peterwu.pub@gmail.com>
In-Reply-To: <20220704053901.728-8-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Jul 2022 22:29:13 +0200
Message-ID: <CAHp75VcmEasZu53kZFO9R0Y=gZau-XFpAPd2a00deHv3PO1ZOg@mail.gmail.com>
Subject: Re: [PATCH v4 07/13] mfd: mt6370: Add Mediatek MT6370 support
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
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_132951_835008_49D29685 
X-CRM114-Status: GOOD (  13.64  )
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

On Mon, Jul 4, 2022 at 7:41 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> Add Mediatek MT6370 MFD support.

...

> +         This driver can also be built as a module. If so the module

If so,

> +         will be called "mt6370.ko".

".ko" part is not needed.

To all your patches in the series where this applies.

...

> +static const struct regmap_irq mt6370_irqs[] = {
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHGON, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_TREG, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_AICR, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_MIVR, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_PWR_RDY, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_FL_CHG_VINOVP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VSYSUV, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VSYSOV, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VBATOV, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_VINOVPCHG, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_COLD, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_COOL, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_WARM, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_BAT_HOT, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_TS_STATC, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_FAULT, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_STATC, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_TMR, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_BATABS, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_ADPBAD, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_RVP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_TSHUTDOWN, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_IINMEAS, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_ICCMEAS, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHGDET_DONE, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_WDTMR, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_SSFINISH, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_RECHG, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_TERM, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHG_IEOC, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_ADC_DONE, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_PUMPX_DONE, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_BST_BATUV, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_BST_MIDOV, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_BST_OLP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_ATTACH, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DETACH, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_HVDCP_STPDONE, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_HVDCP_VBUSDET_DONE, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_HVDCP_DET, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_CHGDET, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DCDT, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_VGOK, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_WDTMR, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_UC, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_OC, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DIRCHG_OV, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_SWON, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_UVP_D, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_UVP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_OVP_D, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_OVPCTRL_OVP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_STRBPIN, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_TORPIN, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_TX, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED_LVF, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED2_SHORT, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_SHORT, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED2_STRB, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_STRB, 8),
> +       REGMAP_IRQ_REG_LINE(mT6370_IRQ_FLED2_STRB_TO, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_STRB_TO, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED2_TOR, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_TOR, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_OTP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_VDDA_OVP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_VDDA_UV, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_LDO_OC, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_BLED_OCP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_BLED_OVP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VNEG_OCP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VPOS_OCP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_BST_OCP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VNEG_SCP, 8),
> +       REGMAP_IRQ_REG_LINE(MT6370_IRQ_DSV_VPOS_SCP, 8)

Leave a comma here.

> +};

...

> +static const struct resource mt6370_regulator_irqs[] = {
> +       DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VPOS_SCP, "db_vpos_scp"),
> +       DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VNEG_SCP, "db_vneg_scp"),
> +       DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_BST_OCP, "db_vbst_ocp"),
> +       DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VPOS_OCP, "db_vpos_ocp"),
> +       DEFINE_RES_IRQ_NAMED(MT6370_IRQ_DSV_VNEG_OCP, "db_vneg_ocp"),
> +       DEFINE_RES_IRQ_NAMED(MT6370_IRQ_LDO_OC, "ldo_oc")

Leave a comma here.

> +};
> +
> +static const struct mfd_cell mt6370_devices[] = {
> +       MFD_CELL_OF("adc", NULL, NULL, 0, 0, "mediatek,mt6370-adc"),
> +       MFD_CELL_OF("charger", NULL, NULL, 0, 0, "mediatek,mt6370-charger"),
> +       MFD_CELL_OF("backlight", NULL, NULL, 0, 0, "mediatek,mt6370-backlight"),
> +       MFD_CELL_OF("flashlight", NULL, NULL, 0, 0, "mediatek,mt6370-flashlight"),
> +       MFD_CELL_OF("indicator", NULL, NULL, 0, 0, "mediatek,mt6370-indicator"),
> +       MFD_CELL_OF("tcpc", NULL, NULL, 0, 0, "mediatek,mt6370-tcpc"),
> +       MFD_CELL_RES("regulator", mt6370_regulator_irqs)

Leave a comma here.

> +};


-- 
With Best Regards,
Andy Shevchenko

