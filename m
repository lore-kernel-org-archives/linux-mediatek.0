Return-Path: <SRS0=2M+Y=3G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B533C33CB1
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 09:19:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDA102073A
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 09:19:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pB2FvBOH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bI6PLhTu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDA102073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IsLMYphLgizOqyFx5KfrRq1S0Il66/QWCOxlaG1wPDA=; b=pB2FvBOHGnXJVB
	TVFbuFqZ9KfgE91EozqkdBIV95TW2JZSERDilyDCExi9VhezyRRQ6PFZZafdifpgUXfGHZZy/+K17
	lVCga0jJQ0NaMU27G6IjEYgfmw8QyGwT8ntwePA0EXJmHPZkiIZe10U37lFsn0O1PnIG/gvdrupk9
	jSMfwbKsJ22BNuiGFbfL13SRuKW5tWp4hrcwhSDOTqOySSA06zotLPmebAwc3nYJNfSXpOkYnt/wT
	avKthLYv5oXyoiBbxv9alVsXmyQI4NtDJZTrOnv762tM64Om+TNWTJgQKvWNIztLZdSUbLxFCGRsA
	Pt3TjR+5PrBPRybnS4xw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isNmJ-0006OX-7v; Fri, 17 Jan 2020 09:18:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isNmC-0006NC-Ri
 for linux-mediatek@lists.infradead.org; Fri, 17 Jan 2020 09:18:53 +0000
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 551B92073A
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Jan 2020 09:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579252728;
 bh=dbFtB9tx5Ik28UfphW/ejtY/PWazwxVz1SLsdcqei3M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bI6PLhTumySuATS2G2KV98N8GAznqrHe32ZrkhHyWVIZ7jfL++xtpowyjkZrI/thB
 FU+F3byaTU2VlJlagUcwfSwemQ8t2J/TIZN1vi9PQDO/ZNLQAqlTZyJQKE7Iaw/cOx
 qZhCp8NEn8ktGJRfduraRbEP5n7tScWGDCHhsz0E=
Received: by mail-io1-f53.google.com with SMTP id z8so25232045ioh.0
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Jan 2020 01:18:48 -0800 (PST)
X-Gm-Message-State: APjAAAW9UcpFo2j5EqEAQ2PumDduvp733HEMpKSQH4SmoQtPJVsqsIPp
 0cowcU5e8VxZB+CpPXRFwjr0iiislC2HoKLz6hg=
X-Google-Smtp-Source: APXvYqykMsz76wtBXTrWkudZDu23blRbqGwiiN/D4MCwUvg6Q3/jQe7W+NmkB+amhPUf10uXQP4ov/ITIn18l69w6lU=
X-Received: by 2002:a5d:8782:: with SMTP id f2mr29590991ion.53.1579252727655; 
 Fri, 17 Jan 2020 01:18:47 -0800 (PST)
MIME-Version: 1.0
References: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
 <1577799707-11855-5-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1577799707-11855-5-git-send-email-light.hsieh@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Fri, 17 Jan 2020 01:18:36 -0800
X-Gmail-Original-Message-ID: <CAGp9LzpNnf-UJyPUkB8zd5SSNP2vv-Qry17T1tqWUEN7NH_HXw@mail.gmail.com>
Message-ID: <CAGp9LzpNnf-UJyPUkB8zd5SSNP2vv-Qry17T1tqWUEN7NH_HXw@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] Backward compatible to previous Mediatek's
 bias-pull usage
To: Light Hsieh <light.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_011848_950972_6C08C9BA 
X-CRM114-Status: GOOD (  22.51  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, kuohong.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 31, 2019 at 5:41 AM Light Hsieh <light.hsieh@mediatek.com> wrote:
>
> Refine mtk_pinconf_set()/mtk_pinconf_get() for backward compatibility to
> previous MediaTek's bias-pull usage.
> In PINCTRL_MTK that use pinctrl-mtk-common.c, bias-pull setting for pins
> with 2 pull resistors can be specified as value for bias-pull-up and
> bias-pull-down. For example:
>     bias-pull-up = <MTK_PUPD_SET_R1R0_00>;
>     bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
>     bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
>     bias-pull-up = <MTK_PUPD_SET_R1R0_11>;
>     bias-pull-down = <MTK_PUPD_SET_R1R0_00>;
>     bias-pull-down = <MTK_PUPD_SET_R1R0_01>;
>     bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
>     bias-pull-down = <MTK_PUPD_SET_R1R0_11>;
>
> On the other hand, PINCTRL_MTK_PARIS use customized properties
> "mediatek,pull-up-adv" and "mediatek,pull-down-adv" to specify bias-pull
> setting for pins with 2 pull resistors.
> This introduce in-compatibility in device tree and increase porting
> effort to MediaTek's customer that had already used PINCTRL_MTK version.
> Besides, if customers are not aware of this change and still write devicetree
> for PINCTRL_MTK version, they may encounter runtime failure with pinctrl and
> spent time to debug.
>
> This patch adds backward compatible to previous MediaTek's bias-pull usage
> so that Mediatek's customer need not use a new devicetree property name.
> The rationale is that: changing driver implementation had better leave
> interface unchanged.
>
> Change-Id: I8f57c95e3baefcaabdcba4bbfb0dc69d2a825c34

Removing the change-ids, add a prefix "pinctrl: mediatek:" to the
subject, and proper signed-off-by tags.

> ---
>  drivers/pinctrl/mediatek/pinctrl-mt6765.c        |   6 +-
>  drivers/pinctrl/mediatek/pinctrl-mt8183.c        |   6 +-
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 241 +++++++++++++++++++++++
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h |  11 ++
>  drivers/pinctrl/mediatek/pinctrl-paris.c         |  49 +++--
>  5 files changed, 285 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6765.c b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> index 7fae397..905dae8c 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> @@ -1072,10 +1072,8 @@
>         .gpio_m = 0,
>         .base_names = mt6765_pinctrl_register_base_names,
>         .nbase_names = ARRAY_SIZE(mt6765_pinctrl_register_base_names),
> -       .bias_disable_set = mtk_pinconf_bias_disable_set,
> -       .bias_disable_get = mtk_pinconf_bias_disable_get,
> -       .bias_set = mtk_pinconf_bias_set,
> -       .bias_get = mtk_pinconf_bias_get,
> +       .bias_set_combo = mtk_pinconf_bias_set_combo,
> +       .bias_get_combo = mtk_pinconf_bias_get_combo,
>         .drive_set = mtk_pinconf_drive_set_raw,
>         .drive_get = mtk_pinconf_drive_get_raw,
>         .adv_pull_get = mtk_pinconf_adv_pull_get,
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8183.c b/drivers/pinctrl/mediatek/pinctrl-mt8183.c
> index 4eca818..6031833 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8183.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8183.c
> @@ -556,10 +556,8 @@
>         .gpio_m = 0,
>         .base_names = mt8183_pinctrl_register_base_names,
>         .nbase_names = ARRAY_SIZE(mt8183_pinctrl_register_base_names),
> -       .bias_disable_set = mtk_pinconf_bias_disable_set_rev1,
> -       .bias_disable_get = mtk_pinconf_bias_disable_get_rev1,
> -       .bias_set = mtk_pinconf_bias_set_rev1,
> -       .bias_get = mtk_pinconf_bias_get_rev1,
> +       .bias_set_combo = mtk_pinconf_bias_set_combo,
> +       .bias_get_combo = mtk_pinconf_bias_get_combo,
>         .drive_set = mtk_pinconf_drive_set_rev1,
>         .drive_get = mtk_pinconf_drive_get_rev1,
>         .adv_pull_get = mtk_pinconf_adv_pull_get,
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 2247eae..191b1c4 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -6,6 +6,7 @@
>   *
>   */
>
> +#include <dt-bindings/pinctrl/mt65xx.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/gpio/driver.h>
> @@ -206,6 +207,20 @@ int mtk_hw_set_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
>         return 0;
>  }
>
> +void mtk_hw_set_value_no_lookup(struct mtk_pinctrl *hw,
> +                               const struct mtk_pin_desc *desc,
> +                               int value, struct mtk_pin_field *pf)
> +{
> +       if (value < 0 || value > pf->mask)
> +               return;
> +
> +       if (!pf->next)
> +               mtk_rmw(hw, pf->index, pf->offset, pf->mask << pf->bitpos,
> +                       (value & pf->mask) << pf->bitpos);
> +       else
> +               mtk_hw_write_cross_field(hw, pf, value);
> +}

Should remove the function which no one refers to.

> +
>  int mtk_hw_get_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
>                      int field, int *value)
>  {
> @@ -225,6 +240,17 @@ int mtk_hw_get_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
>         return 0;
>  }
>
> +void mtk_hw_get_value_no_lookup(struct mtk_pinctrl *hw,
> +                               const struct mtk_pin_desc *desc,
> +                               int *value, struct mtk_pin_field *pf)
> +{
> +       if (!pf->next)
> +               *value = (mtk_r32(hw, pf->index, pf->offset)
> +                         >> pf->bitpos) & pf->mask;
> +       else
> +               mtk_hw_read_cross_field(hw, pf, value);
> +}
> +

Should remove the function which no one refers to, too.

>  static int mtk_xt_find_eint_num(struct mtk_pinctrl *hw, unsigned long eint_n)
>  {
>         const struct mtk_pin_desc *desc;
> @@ -517,6 +543,221 @@ int mtk_pinconf_bias_get_rev1(struct mtk_pinctrl *hw,
>         return 0;
>  }
>
> +/* Combo for the following pull register type:
> + * 1. PU + PD
> + * 2. PULLSEL + PULLEN
> + * 3. PUPD + R0 + R1
> + */
> +static int mtk_pinconf_bias_set_pu_pd(struct mtk_pinctrl *hw,
> +                               const struct mtk_pin_desc *desc,
> +                               u32 pullup, u32 arg)
> +{
> +       int err, pu, pd;
> +
> +       if (arg == MTK_DISABLE) {
> +               pu = 0;
> +               pd = 0;
> +       } else if ((arg == MTK_ENABLE) && pullup) {
> +               pu = 1;
> +               pd = 0;
> +       } else if ((arg == MTK_ENABLE) && !pullup) {
> +               pu = 0;
> +               pd = 1;
> +       } else {
> +               goto out;

Give err a proper value such as -EINVAL before going out

> +       }
> +
> +       err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PU, pu);
> +       if (err)
> +               goto out;
> +
> +       err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PD, pd);
> +
> +out:
> +       return err;
> +}
> +
> +static int mtk_pinconf_bias_set_pullsel_pullen(struct mtk_pinctrl *hw,
> +                               const struct mtk_pin_desc *desc,
> +                               u32 pullup, u32 arg)
> +{
> +       int err, enable;
> +
> +       if (arg == MTK_DISABLE)
> +               enable = 0;
> +       else if (arg == MTK_ENABLE)
> +               enable = 1;
> +       else
> +               goto out;

Give err a proper value such as -EINVAL before going out

> +
> +       err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PULLEN, enable);
> +       if (err)
> +               goto out;
> +
> +       err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PULLSEL, pullup);
> +
> +out:
> +       return err;
> +}
> +
> +static int mtk_pinconf_bias_set_pupd_r1_r0(struct mtk_pinctrl *hw,
> +                               const struct mtk_pin_desc *desc,
> +                               u32 pullup, u32 arg)
> +{
> +       int err, r0, r1;
> +
> +       if ((arg == MTK_DISABLE) || (arg == MTK_PUPD_SET_R1R0_00)) {
> +               pullup = 0;
> +               r0 = 0;
> +               r1 = 0;
> +       } else if (arg == MTK_PUPD_SET_R1R0_01) {
> +               r0 = 1;
> +               r1 = 0;
> +       } else if (arg == MTK_PUPD_SET_R1R0_10) {
> +               r0 = 0;
> +               r1 = 1;
> +       } else if (arg == MTK_PUPD_SET_R1R0_11) {
> +               r0 = 1;
> +               r1 = 1;
> +       } else
> +               goto out;

Give err a proper value such as -EINVAL before going out

> +
> +       /* MTK HW PUPD bit: 1 for pull-down, 0 for pull-up */
> +       err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PUPD, !pullup);
> +       if (err)
> +               goto out;
> +
> +       err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_R0, r0);
> +       if (err)
> +               goto out;
> +
> +       err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_R1, r1);
> +
> +out:
> +       return err;
> +}
> +
> +static int mtk_pinconf_bias_get_pu_pd(struct mtk_pinctrl *hw,
> +                               const struct mtk_pin_desc *desc,
> +                               u32 *pullup, u32 *enable)
> +{
> +       int err, pu, pd;
> +
> +       err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PU, &pu);
> +       if (err)
> +               goto out;
> +
> +       err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PD, &pd);
> +       if (err)
> +               goto out;
> +
> +       if (pu == 0 && pd == 0) {
> +               *pullup = 0;
> +               *enable = MTK_DISABLE;
> +       } else if (pu == 1 && pd == 0) {
> +               *pullup = 1;
> +               *enable = MTK_ENABLE;
> +       } else if (pu == 0 && pd == 1) {
> +               *pullup = 0;
> +               *enable = MTK_ENABLE;
> +       } else
> +               err = -EINVAL;
> +
> +out:
> +       return err;
> +}
> +
> +static int mtk_pinconf_bias_get_pullsel_pullen(struct mtk_pinctrl *hw,
> +                               const struct mtk_pin_desc *desc,
> +                               u32 *pullup, u32 *enable)
> +{
> +       int err;
> +
> +       err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PULLSEL, pullup);
> +       if (err)
> +               goto out;
> +
> +       err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PULLEN, enable);
> +
> +out:
> +       return err;
> +}
> +
> +static int mtk_pinconf_bias_get_pupd_r1_r0(struct mtk_pinctrl *hw,
> +                               const struct mtk_pin_desc *desc,
> +                               u32 *pullup, u32 *enable)
> +{
> +       int err, r0, r1;
> +
> +       err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PUPD, pullup);
> +       if (err)
> +               goto out;
> +       /* MTK HW PUPD bit: 1 for pull-down, 0 for pull-up */
> +       *pullup = !(*pullup);
> +
> +       err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_R0, &r0);
> +       if (err)
> +               goto out;
> +
> +       err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_R1, &r1);
> +       if (err)
> +               goto out;
> +
> +       if ((r1 == 0) && (r0 == 0))
> +               *enable = MTK_PUPD_SET_R1R0_00;
> +       else if ((r1 == 0) && (r0 == 1))
> +               *enable = MTK_PUPD_SET_R1R0_01;
> +       else if ((r1 == 1) && (r0 == 0))
> +               *enable = MTK_PUPD_SET_R1R0_10;
> +       else if ((r1 == 1) && (r0 == 1))
> +               *enable = MTK_PUPD_SET_R1R0_11;
> +       else
> +               err = -EINVAL;
> +
> +out:
> +       return err;
> +}
> +
> +int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
> +                               const struct mtk_pin_desc *desc,
> +                               u32 pullup, u32 arg)
> +{
> +       int err;
> +
> +       err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg);
> +       if (!err)
> +               goto out;
> +
> +       err = mtk_pinconf_bias_set_pullsel_pullen(hw, desc, pullup, arg);
> +       if (!err)
> +               goto out;
> +
> +       err = mtk_pinconf_bias_set_pupd_r1_r0(hw, desc, pullup, arg);
> +
> +out:
> +       return err;
> +}
> +
> +int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
> +                             const struct mtk_pin_desc *desc,
> +                             u32 *pullup, u32 *enable)
> +{
> +       int err;
> +
> +       err = mtk_pinconf_bias_get_pu_pd(hw, desc, pullup, enable);
> +       if (!err)
> +               goto out;
> +
> +       err = mtk_pinconf_bias_get_pullsel_pullen(hw, desc, pullup, enable);
> +       if (!err)
> +               goto out;
> +
> +       err = mtk_pinconf_bias_get_pupd_r1_r0(hw, desc, pullup, enable);
> +
> +out:
> +       return err;
> +}
> +
>  /* Revision 0 */
>  int mtk_pinconf_drive_set(struct mtk_pinctrl *hw,
>                           const struct mtk_pin_desc *desc, u32 arg)
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> index 75d0e07..27df087 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> @@ -216,6 +216,11 @@ struct mtk_pin_soc {
>         int (*bias_get)(struct mtk_pinctrl *hw,
>                         const struct mtk_pin_desc *desc, bool pullup, int *res);
>
> +       int (*bias_set_combo)(struct mtk_pinctrl *hw,
> +                       const struct mtk_pin_desc *desc, u32 pullup, u32 arg);
> +       int (*bias_get_combo)(struct mtk_pinctrl *hw,
> +                       const struct mtk_pin_desc *desc, u32 *pullup, u32 *arg);
> +
>         int (*drive_set)(struct mtk_pinctrl *hw,
>                          const struct mtk_pin_desc *desc, u32 arg);
>         int (*drive_get)(struct mtk_pinctrl *hw,
> @@ -277,6 +282,12 @@ int mtk_pinconf_bias_set_rev1(struct mtk_pinctrl *hw,
>  int mtk_pinconf_bias_get_rev1(struct mtk_pinctrl *hw,
>                               const struct mtk_pin_desc *desc, bool pullup,
>                               int *res);
> +int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
> +                               const struct mtk_pin_desc *desc,
> +                               u32 pullup, u32 enable);
> +int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
> +                             const struct mtk_pin_desc *desc,
> +                             u32 *pullup, u32 *enable);
>
>  int mtk_pinconf_drive_set(struct mtk_pinctrl *hw,
>                           const struct mtk_pin_desc *desc, u32 arg);
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index d09a726..115ebc1 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -78,7 +78,7 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>  {
>         struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
>         u32 param = pinconf_to_config_param(*config);
> -       int err, reg, ret = 1;
> +       int pullup, err, reg, ret = 1;
>         const struct mtk_pin_desc *desc;
>
>         if (pin >= hw->soc->npins) {
> @@ -89,22 +89,31 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>
>         switch (param) {
>         case PIN_CONFIG_BIAS_DISABLE:
> -               if (hw->soc->bias_disable_get)
> -                       err = hw->soc->bias_disable_get(hw, desc, &ret);
> -               else
> -                       err = -ENOTSUPP;
> -               break;
>         case PIN_CONFIG_BIAS_PULL_UP:
> -               if (hw->soc->bias_get)
> -                       err = hw->soc->bias_get(hw, desc, 1, &ret);
> -               else
> -                       err = -ENOTSUPP;
> -               break;
>         case PIN_CONFIG_BIAS_PULL_DOWN:
> -               if (hw->soc->bias_get)
> -                       err = hw->soc->bias_get(hw, desc, 0, &ret);
> -               else
> +               if (hw->soc->bias_get_combo) {
> +                       err = hw->soc->bias_get_combo(hw, desc, &pullup, &ret);
> +                       if (err)
> +                               goto out;
> +                       if (param == PIN_CONFIG_BIAS_DISABLE) {
> +                               if (ret == MTK_PUPD_SET_R1R0_00)
> +                                       ret = MTK_DISABLE;
> +                       } else if (param == PIN_CONFIG_BIAS_PULL_UP) {
> +                               /* When desire to get pull-up value, return
> +                                *  error if current setting is pull-down
> +                                */
> +                               if (!pullup)
> +                                       err = -EINVAL;
> +                       } else if (param == PIN_CONFIG_BIAS_PULL_DOWN) {
> +                               /* When desire to get pull-down value, return
> +                                *  error if current setting is pull-up
> +                                */
> +                               if (pullup)
> +                                       err = -EINVAL;
> +                       }
> +               } else {
>                         err = -ENOTSUPP;
> +               }
>                 break;
>         case PIN_CONFIG_SLEW_RATE:
>                 err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_SR, &ret);
> @@ -196,20 +205,20 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>
>         switch ((u32)param) {
>         case PIN_CONFIG_BIAS_DISABLE:
> -               if (hw->soc->bias_disable_set)
> -                       err = hw->soc->bias_disable_set(hw, desc);
> +               if (hw->soc->bias_set_combo)
> +                       err = hw->soc->bias_set_combo(hw, desc, 0, MTK_DISABLE);
>                 else
>                         err = -ENOTSUPP;
>                 break;
>         case PIN_CONFIG_BIAS_PULL_UP:
> -               if (hw->soc->bias_set)
> -                       err = hw->soc->bias_set(hw, desc, 1);
> +               if (hw->soc->bias_set_combo)
> +                       err = hw->soc->bias_set_combo(hw, desc, 1, arg);
>                 else
>                         err = -ENOTSUPP;
>                 break;
>         case PIN_CONFIG_BIAS_PULL_DOWN:
> -               if (hw->soc->bias_set)
> -                       err = hw->soc->bias_set(hw, desc, 0);
> +               if (hw->soc->bias_set_combo)
> +                       err = hw->soc->bias_set_combo(hw, desc, 0, arg);
>                 else
>                         err = -ENOTSUPP;
>                 break;
> --
> 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
