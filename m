Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30F4C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 03:48:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F9656109E
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 03:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F9656109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6N5Pdfh5RCQ+LJ2/nosMVDAiIpiwEjjTJ26R4jOaVCU=; b=ViJktjJ/fscCOVi2+sHbt3G2G
	Rx8544eVFau6YtNOVJGb9O26htVGh7wrNgqY6HiNlqh9xNYjUgzqxehOBk9VAa8E7vm7j55BDh4U6
	ttyYdkdVz43Y27GmY6vWFv//Ws6UjuAVQWpJj6BLOqe7SB6zS004DJ692UFb4/sly9hlRK6aw0FR/
	hZFpYXZKAfuX/qNZ2ovpkcsb+sOTBORvmHCCKzprnALqLSraIvK0mhO6Bb0A/1rM5NuxnjH+eiUUD
	IjsLVQMrS1+0GSQO+aEVnuBM+GwfpcAGoo5+5AYvFtEXEftImntllueVJc/y/vq4Jp1PZknS3GiWJ
	kT2Co5JGA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYhMw-00B7rW-SB; Tue, 20 Apr 2021 03:48:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYhMk-00B7pZ-8H; Tue, 20 Apr 2021 03:47:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=iYbT7aFdo8ISAI8qb1fl7C//D9Y8IGEdT2XZjkkRhlk=; b=faK72EenvQZl0woBxA0yZZEYyh
 HuaQwovgq4kOGg7t1QjMZ3EowpxXO3LhqCeAcFP3Libm3WU02a0IkiTZ+mqJrjjiw3+dvnyx25zLq
 g71npOv3nBam/jF5JQg9ID+ZkyGa4qer8wXb1gdYyD5gyGQ0+Hr4GUqBwgWpwPxwN4azS8r0vvCIa
 cJf7WkoSIfxfCuIIcEn4A30lGDfdAG/CJT/Xshx4JbP9AneAdXvMTHMGDwnFFVG3o2jHTH/79SN8B
 po+x6SsTNUsZBS8tZL58T7IVGdZ27Ep5HGfSj2ZCmv+VOFvQmTtcEVmTGpYhfpVe4Ufhqh4UQ0gqE
 sp92apIA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYhMh-00BnPR-FM; Tue, 20 Apr 2021 03:47:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 829556100B;
 Tue, 20 Apr 2021 03:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618890474;
 bh=u5wPhL7Ene2VdmBvCDyRNlC2PWZ8+C9tJOnEa861pDY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vQF3+NV/L20k4H/VkmU59owGFRZtRE8Frf27nST/aViXOdbrm1oPx7Tz1ZzWW4S1F
 s3R5xJOvjV781uCDFsM4UDu/IenrDw9TY7pphBUdpexG87VdY2DHm34XzCR2HLqku2
 P+elRgNGG0IEsnTcofDtHuOZUbMhfAUB7NxQljyZQGDus/IMOi+xPFqZ3wfzZw2ARD
 iRn/74YDSJt8oM3g1l8+9WhgRwzXDXAafIfkgZzlyEXnbo+E+GQtsGA0J3jUF7Ua7r
 9dJ4GmHMp8co2Z6lOuDkeK5yVbbWRVrztbrUfRjhoigJdvazX4K1Lv8dFdIGOncnLj
 1Lkc4YWyjpSVw==
Received: by mail-ed1-f49.google.com with SMTP id h10so43245873edt.13;
 Mon, 19 Apr 2021 20:47:54 -0700 (PDT)
X-Gm-Message-State: AOAM530DDkKLpUzqp+iMgohqbWkEJYU5Ma9nVPOebg1hL3xk+1h3smZx
 4mhzKSgtTU/mhJK+ScdnFnSptEEgAON61eiV0YA=
X-Google-Smtp-Source: ABdhPJzbjU7jOrcMXgf5wS+UarAeT2b6g7MZ2uy1tkRai7qsw4N1ya/Nrh3tKlx1ENX8XLkHHcYsR0TBN4a3ho35o5A=
X-Received: by 2002:aa7:c3d8:: with SMTP id l24mr8049415edr.319.1618890473085; 
 Mon, 19 Apr 2021 20:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210413055702.27535-1-zhiyong.tao@mediatek.com>
 <20210413055702.27535-4-zhiyong.tao@mediatek.com>
In-Reply-To: <20210413055702.27535-4-zhiyong.tao@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Mon, 19 Apr 2021 20:47:42 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzr22hShK5F2qcPNH3yXxGZx=DUmoa0r8d6Fn=c-U2=j0g@mail.gmail.com>
Message-ID: <CAGp9Lzr22hShK5F2qcPNH3yXxGZx=DUmoa0r8d6Fn=c-U2=j0g@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] pinctrl: add drive for I2C related pins on MT8195
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, hui.liu@mediatek.com, 
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>, 
 jg_poxu@mediatek.com, Biao Huang <biao.huang@mediatek.com>, 
 Hongzhou Yang <hongzhou.yang@mediatek.com>, 
 =?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?= <sean.wang@mediatek.com>, 
 seiya.wang@mediatek.com, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_204755_589589_6C59AB98 
X-CRM114-Status: GOOD (  18.18  )
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

On Mon, Apr 12, 2021 at 10:57 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> This patch provides the advanced drive raw data setting version
> for I2C used pins on MT8195.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>

Acked-by: Sean Wang <sean.wang@kernel.org>

> ---
>  drivers/pinctrl/mediatek/pinctrl-mt8195.c     | 22 +++++++++++++++++++
>  .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 14 ++++++++++++
>  .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  5 +++++
>  3 files changed, 41 insertions(+)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8195.c b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> index 063f164d7c9b..a7500e18bb1d 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> @@ -760,6 +760,25 @@ static const struct mtk_pin_field_calc mt8195_pin_drv_range[] = {
>         PIN_FIELD_BASE(143, 143, 1, 0x020, 0x10, 24, 3),
>  };
>
> +static const struct mtk_pin_field_calc mt8195_pin_drv_adv_range[] = {
> +       PIN_FIELD_BASE(8, 8, 4, 0x020, 0x10, 15, 3),
> +       PIN_FIELD_BASE(9, 9, 4, 0x020, 0x10, 0, 3),
> +       PIN_FIELD_BASE(10, 10, 4, 0x020, 0x10, 18, 3),
> +       PIN_FIELD_BASE(11, 11, 4, 0x020, 0x10, 3, 3),
> +       PIN_FIELD_BASE(12, 12, 4, 0x020, 0x10, 21, 3),
> +       PIN_FIELD_BASE(13, 13, 4, 0x020, 0x10, 6, 3),
> +       PIN_FIELD_BASE(14, 14, 4, 0x020, 0x10, 24, 3),
> +       PIN_FIELD_BASE(15, 15, 4, 0x020, 0x10, 9, 3),
> +       PIN_FIELD_BASE(16, 16, 4, 0x020, 0x10, 27, 3),
> +       PIN_FIELD_BASE(17, 17, 4, 0x020, 0x10, 12, 3),
> +       PIN_FIELD_BASE(29, 29, 2, 0x020, 0x10, 0, 3),
> +       PIN_FIELD_BASE(30, 30, 2, 0x020, 0x10, 3, 3),
> +       PIN_FIELD_BASE(34, 34, 1, 0x040, 0x10, 0, 3),
> +       PIN_FIELD_BASE(35, 35, 1, 0x040, 0x10, 3, 3),
> +       PIN_FIELD_BASE(44, 44, 1, 0x040, 0x10, 6, 3),
> +       PIN_FIELD_BASE(45, 45, 1, 0x040, 0x10, 9, 3),
> +};
> +
>  static const struct mtk_pin_reg_calc mt8195_reg_cals[PINCTRL_PIN_REG_MAX] = {
>         [PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt8195_pin_mode_range),
>         [PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt8195_pin_dir_range),
> @@ -773,6 +792,7 @@ static const struct mtk_pin_reg_calc mt8195_reg_cals[PINCTRL_PIN_REG_MAX] = {
>         [PINCTRL_PIN_REG_PUPD] = MTK_RANGE(mt8195_pin_pupd_range),
>         [PINCTRL_PIN_REG_R0] = MTK_RANGE(mt8195_pin_r0_range),
>         [PINCTRL_PIN_REG_R1] = MTK_RANGE(mt8195_pin_r1_range),
> +       [PINCTRL_PIN_REG_DRV_ADV] = MTK_RANGE(mt8195_pin_drv_adv_range),
>  };
>
>  static const char * const mt8195_pinctrl_register_base_names[] = {
> @@ -801,6 +821,8 @@ static const struct mtk_pin_soc mt8195_data = {
>         .bias_get_combo = mtk_pinconf_bias_get_combo,
>         .drive_set = mtk_pinconf_drive_set_rev1,
>         .drive_get = mtk_pinconf_drive_get_rev1,
> +       .adv_drive_get = mtk_pinconf_adv_drive_get_raw,
> +       .adv_drive_set = mtk_pinconf_adv_drive_set_raw,
>  };
>
>  static const struct of_device_id mt8195_pinctrl_of_match[] = {
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 72f17f26acd8..2b51f4a9b860 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -1027,6 +1027,20 @@ int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
>  }
>  EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_get);
>
> +int mtk_pinconf_adv_drive_set_raw(struct mtk_pinctrl *hw,
> +                                 const struct mtk_pin_desc *desc, u32 arg)
> +{
> +       return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV_ADV, arg);
> +}
> +EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_set_raw);
> +
> +int mtk_pinconf_adv_drive_get_raw(struct mtk_pinctrl *hw,
> +                                 const struct mtk_pin_desc *desc, u32 *val)
> +{
> +       return mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DRV_ADV, val);
> +}
> +EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_get_raw);
> +
>  MODULE_LICENSE("GPL v2");
>  MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
>  MODULE_DESCRIPTION("Pin configuration library module for mediatek SoCs");
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> index e2aae285b5fc..fd5ce9c5dcbd 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> @@ -66,6 +66,7 @@ enum {
>         PINCTRL_PIN_REG_DRV_EN,
>         PINCTRL_PIN_REG_DRV_E0,
>         PINCTRL_PIN_REG_DRV_E1,
> +       PINCTRL_PIN_REG_DRV_ADV,
>         PINCTRL_PIN_REG_MAX,
>  };
>
> @@ -314,6 +315,10 @@ int mtk_pinconf_adv_drive_set(struct mtk_pinctrl *hw,
>                               const struct mtk_pin_desc *desc, u32 arg);
>  int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
>                               const struct mtk_pin_desc *desc, u32 *val);
> +int mtk_pinconf_adv_drive_set_raw(struct mtk_pinctrl *hw,
> +                                 const struct mtk_pin_desc *desc, u32 arg);
> +int mtk_pinconf_adv_drive_get_raw(struct mtk_pinctrl *hw,
> +                                 const struct mtk_pin_desc *desc, u32 *val);
>
>  bool mtk_is_virt_gpio(struct mtk_pinctrl *hw, unsigned int gpio_n);
>  #endif /* __PINCTRL_MTK_COMMON_V2_H */
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
