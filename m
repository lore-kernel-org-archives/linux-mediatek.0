Return-Path: <SRS0=2M+Y=3G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4482C33CB1
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 09:05:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 974082072B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2020 09:05:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZRRu17wQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LofFlGGB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 974082072B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/e1c1/CdHWHCuQXTAs9r3aXUe//V74Amdxzgf6VfjDw=; b=ZRRu17wQbQBwH8
	J6ja2FdrXpa2fO+qPBCmlkiXRDm89nclMbvS1UyjvKy295RISL09/hLEAMD76C1/V5c1LOj1Tlpsx
	31KER+8snmY5EMi9G6m8mef+K3J8QYb5YW/N42EEYT2U7qQRY3HpfTcM6phqtFzQ1hc8WmMFPxntO
	a+6mKAObMKK6Q7WAKjnP/FRpLKgwjMcErwyMRwzemUOi9Yxc/DnE855aQ0ZO5UiEfBJ3JMDP4peZg
	gZQB5pgf+EFw6ajV3MsOW0n2gsn9d1PqUN9pU0gtV67zdkmfTjYHyBvAin6/u6Cg7LTUbJhOtULXB
	oB4UY4ftFjXC0lSmto8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isNZb-0001es-PZ; Fri, 17 Jan 2020 09:05:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isNZU-0001dl-3Q
 for linux-mediatek@lists.infradead.org; Fri, 17 Jan 2020 09:05:44 +0000
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9712F2176D
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Jan 2020 09:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579251939;
 bh=C0jHhDTPXAI03Tgjv9zxh0xgKl0i2cWBs4EqAjbbEHQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LofFlGGBSq9mGJeeMrlyWWBOYOMeDza/J6+cbCK+XXupegHVIbbRAHjTc4WE/jAe2
 7CYaWDHuJk0hBDrn2ij61RdJNdWhmIcwOryvpOrrwcVQuj2YEoGGY5ipivWLoHJWHX
 rzOiebEG1JNTFhbD+PFkS5YyVIZy1nVFdUrRar2A=
Received: by mail-io1-f49.google.com with SMTP id b10so25154982iof.11
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Jan 2020 01:05:39 -0800 (PST)
X-Gm-Message-State: APjAAAWt1AhIBgcYfbgaO/wh0pmvs/F86BdtmtW8v2Yn48uleCu9vCrS
 RjSzR12yQijd67JS0RUN2fNaIovqNvvo9fedY1s=
X-Google-Smtp-Source: APXvYqwUYLR4G5C3b4Rk0D9e/X/qJJ5Mm6POMOjMYp3JrX0HLlfEtjCM/2Vpv/AMQQf0q5sLaZWX95dB9y0eWvKJklA=
X-Received: by 2002:a5d:8782:: with SMTP id f2mr29553549ion.53.1579251938985; 
 Fri, 17 Jan 2020 01:05:38 -0800 (PST)
MIME-Version: 1.0
References: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
 <1577799707-11855-6-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1577799707-11855-6-git-send-email-light.hsieh@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Fri, 17 Jan 2020 01:05:27 -0800
X-Gmail-Original-Message-ID: <CAGp9LzqB8=-46sNQHcZf+EA+2=icRqn+Yb8-e4emczyDjMRnBQ@mail.gmail.com>
Message-ID: <CAGp9LzqB8=-46sNQHcZf+EA+2=icRqn+Yb8-e4emczyDjMRnBQ@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] Add support for pin configuration dump via debugfs.
To: Light Hsieh <light.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_010540_188070_F8AF8F5C 
X-CRM114-Status: GOOD (  17.81  )
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
> Add support for pin configuration dump via catting
> /sys/kernel/debug/pinctrl/$platform_dependent_path/pinconf-pins.
> pinctrl framework had already support such dump. This patch implement the
> operation function pointer to fullfill this dump.
>
> Change-Id: I823642561adaedb847e77f9a8baea182913d6163

If removing the change-ids, add a prefix "pinctrl: mediatek:" to the
subject, and proper signed-off-by tags, then Acked-by: Sean Wang
<sean.wang@kernel.org>.


> ---
>  drivers/pinctrl/mediatek/pinctrl-paris.c | 109 +++++++++++++++++++++++++++++++
>  drivers/pinctrl/mediatek/pinctrl-paris.h |   3 +
>  2 files changed, 112 insertions(+)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 115ebc1..83bf29c 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -539,12 +539,120 @@ static int mtk_pctrl_get_group_pins(struct pinctrl_dev *pctldev,
>         return 0;
>  }
>
> +static int mtk_hw_get_value_wrap(struct mtk_pinctrl *hw, unsigned int gpio, int field)
> +{
> +       const struct mtk_pin_desc *desc;
> +       int value, err;
> +
> +       if (gpio > hw->soc->npins)
> +               return -EINVAL;
> +
> +       desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
> +
> +       err = mtk_hw_get_value(hw, desc, field, &value);
> +       if (err)
> +               return err;
> +
> +       return value;
> +}
> +
> +#define mtk_pctrl_get_pinmux(hw, gpio)                 \
> +       mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_MODE)
> +
> +#define mtk_pctrl_get_direction(hw, gpio)              \
> +       mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_DIR)
> +
> +#define mtk_pctrl_get_out(hw, gpio)                    \
> +       mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_DO)
> +
> +#define mtk_pctrl_get_in(hw, gpio)                     \
> +       mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_DI)
> +
> +#define mtk_pctrl_get_smt(hw, gpio)                    \
> +       mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_SMT)
> +
> +#define mtk_pctrl_get_ies(hw, gpio)                    \
> +       mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_IES)
> +
> +#define mtk_pctrl_get_driving(hw, gpio)                        \
> +       mtk_hw_get_value_wrap(hw, gpio, PINCTRL_PIN_REG_DRV)
> +
> +ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
> +       unsigned int gpio, char *buf, unsigned int bufLen)
> +{
> +       int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1;
> +       const struct mtk_pin_desc *desc;
> +
> +       if (gpio > hw->soc->npins)
> +               return -EINVAL;
> +
> +       desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
> +       pinmux = mtk_pctrl_get_pinmux(hw, gpio);
> +       if (pinmux >= hw->soc->nfuncs)
> +               pinmux -= hw->soc->nfuncs;
> +
> +       mtk_pinconf_bias_get_combo(hw, desc, &pullup, &pullen);
> +       if (pullen == MTK_PUPD_SET_R1R0_00) {
> +               pullen = 0;
> +               r1 = 0;
> +               r0 = 0;
> +       } else if (pullen == MTK_PUPD_SET_R1R0_01) {
> +               pullen = 1;
> +               r1 = 0;
> +               r0 = 1;
> +       } else if (pullen == MTK_PUPD_SET_R1R0_10) {
> +               pullen = 1;
> +               r1 = 1;
> +               r0 = 0;
> +       } else if (pullen == MTK_PUPD_SET_R1R0_11) {
> +               pullen = 1;
> +               r1 = 1;
> +               r0 = 1;
> +       } else if (pullen != MTK_DISABLE && pullen != MTK_ENABLE) {
> +               pullen = 0;
> +       }
> +       len += snprintf(buf + len, bufLen - len,
> +                       "%03d: %1d%1d%1d%1d%02d%1d%1d%1d%1d",
> +                       gpio,
> +                       pinmux,
> +                       mtk_pctrl_get_direction(hw, gpio),
> +                       mtk_pctrl_get_out(hw, gpio),
> +                       mtk_pctrl_get_in(hw, gpio),
> +                       mtk_pctrl_get_driving(hw, gpio),
> +                       mtk_pctrl_get_smt(hw, gpio),
> +                       mtk_pctrl_get_ies(hw, gpio),
> +                       pullen,
> +                       pullup);
> +
> +       if (r1 != -1) {
> +               len += snprintf(buf + len, bufLen - len, " (%1d %1d)\n",
> +                       r1, r0);
> +       } else {
> +               len += snprintf(buf + len, bufLen - len, "\n");
> +       }
> +
> +       return len;
> +}
> +
> +#define PIN_DBG_BUF_SZ 96
> +static void mtk_pctrl_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
> +                         unsigned int gpio)
> +{
> +       struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
> +       char buf[PIN_DBG_BUF_SZ];
> +
> +       (void)mtk_pctrl_show_one_pin(hw, gpio, buf, PIN_DBG_BUF_SZ);
> +
> +       seq_printf(s, "%s", buf);
> +}
> +
>  static const struct pinctrl_ops mtk_pctlops = {
>         .dt_node_to_map         = mtk_pctrl_dt_node_to_map,
>         .dt_free_map            = pinctrl_utils_free_map,
>         .get_groups_count       = mtk_pctrl_get_groups_count,
>         .get_group_name         = mtk_pctrl_get_group_name,
>         .get_group_pins         = mtk_pctrl_get_group_pins,
> +       .pin_dbg_show           = mtk_pctrl_dbg_show,
>  };
>
>  static int mtk_pmx_get_funcs_cnt(struct pinctrl_dev *pctldev)
> @@ -641,6 +749,7 @@ static int mtk_pconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
>         .pin_config_get = mtk_pinconf_get,
>         .pin_config_group_get   = mtk_pconf_group_get,
>         .pin_config_group_set   = mtk_pconf_group_set,
> +       .is_generic = true,
>  };
>
>  static struct pinctrl_desc mtk_desc = {
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.h b/drivers/pinctrl/mediatek/pinctrl-paris.h
> index 3d43771..afb7650 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.h
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.h
> @@ -60,6 +60,9 @@
>  int mtk_paris_pinctrl_probe(struct platform_device *pdev,
>                             const struct mtk_pin_soc *soc);
>
> +ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
> +       unsigned int gpio, char *buf, unsigned int bufLen);
> +
>  extern const struct dev_pm_ops mtk_paris_pinctrl_pm_ops;
>
>  #endif /* __PINCTRL_PARIS_H */
> --
> 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
