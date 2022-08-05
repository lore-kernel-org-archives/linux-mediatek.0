Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADFEC00140
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 11:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xevi7s0+mr+ptfy7uVrWQvtAVkuN9tBhA8DON7VF3hc=; b=kn3VFf+vjFGTdB/ZxRroaEjutm
	rbwX8bdVFDjdcLTZBvfS4Lydl/QvTt8hA5FGGBTamGZOsGjqvA13y5rbXj1fjI2U80XGvo8XcO7Je
	Hl7+cc8ObJFOhs9YSkHLmGuLNew5ZHyGhOVQU8bLmOfrZIn/QYokUHSiOY9JeCKZVdBpfig4/OYKo
	T6iVYjZES4/gKSQkbr9TE2qyxlPbwBtLhkEpMLFIfU4GeC502k+TniOUEZnfTuxn/kx3xGur4kElJ
	iASfNZzEsikgrVj2b9UgOAck0jprNZ7u1DqQSAJgiKGLqyX1JN6Wa6HYDtAoqYdmCwumlCYWO5iTq
	dSB7wvmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJvBa-00ENTv-5h; Fri, 05 Aug 2022 11:08:10 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJvBM-00ENOH-RM; Fri, 05 Aug 2022 11:07:58 +0000
Received: by mail-qt1-x830.google.com with SMTP id w6so1274347qtv.9;
        Fri, 05 Aug 2022 04:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=xevi7s0+mr+ptfy7uVrWQvtAVkuN9tBhA8DON7VF3hc=;
        b=a9+SkJgUlA0b0/BHR/ZnCRMvTgWWiTfbn+7hCLvZBsaMMCRDTPxUJBAC7vZNjxq/vo
         k8OLi0uQ406lmhmpDT6bTA8Ln7hcqHBvrfJ6793g1OGhONtOUz8WZFu//S4D+ajPvm+/
         HiavKm1cieEdFkxt1ha+nayBdzC2mzMdgbZG3PWagP1NkKBygX5opsEMSZg7lLxmqjo8
         LBS37LwpObC3ROrIeGlDwWsw0zgdY3DWHlzFAJgr2ZjpMu5E7HGDXRWesXtLS8v9Z+Us
         O4BT37Ii/msU+LJssnGZn5Y8/ZMnoo5h2TyNnno4biJLWE9r//68n4cVGwG19hhQqWRQ
         N3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=xevi7s0+mr+ptfy7uVrWQvtAVkuN9tBhA8DON7VF3hc=;
        b=Ck2PJU1EOVpRYsBs7ifmIMk92bZQafm54pmurS4ybo9C4PC7q2arOzTqPJuwP3en1U
         MPFlws0UKRhGxdQt7zW8ql5gYex7GPyctgp4IUb/YuZ/0+TXLgboS0cFwfXM19efB07K
         f8/NGRvj38x6fDjufrlPbuxAS4IV1kmbiWYJVsV7Wh1vKZY3nREUnzPEmKQjqZDN4hUC
         gg31yC/nhwyLAFhodBOT5g6kHQ9Cg9qhM2xQEwBmQoOiUBPLRk8MExyM7y4dD17W7ER7
         UPiNHnFLDLDYiugfl/Gsl5WlBOoyCg8MpU23fr5wtGHt++vsn5oFTbBtu4HA67ZovYRv
         ECiA==
X-Gm-Message-State: ACgBeo1kqBlQ4jBP/lYae7ifXILX6OL+aGg5YHQrcNdBJfEgKG+c/GDe
	991iaN4tdwsZ8bOp8g0e1mNLRFSalc1Rnwqvqac=
X-Google-Smtp-Source: AA6agR616g5NuJiBX7N2EN5Udk4icnJWQWfoN9qnVhTU27eNGicOdpHWiuxBhRNAeZcqXVc1r4KkqHm9jBQr5PV+ypI=
X-Received: by 2002:ac8:5784:0:b0:31f:24e:93f5 with SMTP id
 v4-20020ac85784000000b0031f024e93f5mr5286928qta.429.1659697674792; Fri, 05
 Aug 2022 04:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220805070610.3516-1-peterwu.pub@gmail.com> <20220805070610.3516-12-peterwu.pub@gmail.com>
In-Reply-To: <20220805070610.3516-12-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 5 Aug 2022 13:07:18 +0200
Message-ID: <CAHp75VeL=GVMSQaxePwc47FsQczs10m0ZFc-Y3Z2rGx45vLnuQ@mail.gmail.com>
Subject: Re: [PATCH v7 11/13] leds: rgb: mt6370: Add MediaTek MT6370 current
 sink type LED Indicator support
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
X-CRM114-CacheID: sfid-20220805_040756_911713_20E3F87B 
X-CRM114-Status: GOOD (  21.15  )
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

On Fri, Aug 5, 2022 at 9:07 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiYuan Huang <cy_huang@richtek.com>
>
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual
> Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
>
> Add a support for the MediaTek MT6370 Current Sink Type LED Indicator

Add support

(This is also for all other commit messages)

> driver. It can control four channels current-sink RGB LEDs with 3 modes,

3 modes:

> constant current, PWM, and breath mode.

...

> +static int mt6370_gen_breath_pattern(struct mt6370_priv *priv,
> +                                    struct led_pattern *pattern, u32 len,
> +                                    u8 *pattern_val, u32 val_len)
> +{
> +       enum mt6370_led_ranges sel_range;
> +       struct led_pattern *curr;
> +       unsigned int sel;
> +       u32 val = 0;
> +       int i;
> +
> +       if (len < P_MAX_PATTERNS && val_len < P_MAX_PATTERNS / 2)
> +               return -EINVAL;
> +
> +       /*
> +        * Pattern list
> +        * tr1:  byte 0, b'[7: 4]
> +        * tr2:  byte 0, b'[3: 0]
> +        * tf1:  byte 1, b'[7: 4]
> +        * tf2:  byte 1, b'[3: 0]
> +        * ton:  byte 2, b'[7: 4]
> +        * toff: byte 2, b'[3: 0]
> +        */
> +       for (i = 0; i < P_MAX_PATTERNS; i++) {
> +               curr = pattern + i;
> +
> +               sel_range = i == P_LED_TOFF ? R_LED_TOFF : R_LED_TRFON;
> +
> +               linear_range_get_selector_within(priv->ranges + sel_range,
> +                                                curr->delta_t, &sel);
> +
> +               val <<= i % 2 == 0 ? 8 : 0;
> +               val |= sel << (i % 2 == 0 ? 4 : 0);

It's too cryptic, why not simply:

  if (i % 2) {
    val |= sel;
  } else {
    val <<= 8;
    val |= sel << 4;
  }

?

> +       }
> +
> +       put_unaligned_be24(val, pattern_val);
> +
> +       return 0;
> +}

...

> +       const char * const states[] = { "off", "keep", "on" };

> +       ret = fwnode_property_read_string(init_data->fwnode, "default-state",
> +                                         &stat_str);
> +       if (!ret) {
> +               ret = match_string(states, ARRAY_SIZE(states), stat_str);
> +               if (ret < 0)
> +                       ret = STATE_OFF;
> +
> +               led->default_state = ret;
> +       }

Replace this by using led_init_default_state_get().

-- 
With Best Regards,
Andy Shevchenko

