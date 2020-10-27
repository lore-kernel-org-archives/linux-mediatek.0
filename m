Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A76C4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 02:45:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03D7520872
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 02:45:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z8hfYpdQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T/557vXy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03D7520872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LWbWA92vgqopW5hLh/CtaKFyD9nKro45IoYqS0m6WL0=; b=Z8hfYpdQ7JTj0mTtTZ6UmSU91
	RcJFgc+SRAEc+6zV/ju6JRtjPVoBU5Imax3Ct0BPaCroXRLKU5wMbxoFY4Fa4ljpwmZAl7++EdCIG
	GLKF/FORzu/hAVd2xsk03swyl3ercqNcpNxxJPGXrnLkAmdf9QnZJl/pWUrk44OXu5EK3xF5LGfA8
	8PrRxEVDXmGyUcSXb+zhTD5TnBDJyNcmcQFXtZBGgM7QeREMoAjmRnIjumZ/9a/8jr9azrRzQ3Ahs
	o2WUTOwYJBQXd/Flgs8UjkIZgrUADXIk2GCY3nyEIoHuYOeiGgEcnWmWixPFQRNhO0o7JtLfjn+n9
	LF9fJywxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXEyr-0005eX-TY; Tue, 27 Oct 2020 02:45:02 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXEyp-0005cs-1u
 for linux-mediatek@lists.infradead.org; Tue, 27 Oct 2020 02:45:00 +0000
Received: by mail-vs1-xe43.google.com with SMTP id b129so69060vsb.1
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2020 19:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wXRta/l0rIpVqWKOqa7VKxnC+dawIwiqAsPvJhT8cAw=;
 b=T/557vXyVCMYMplHmwqgl2C/+oWuotWYjE5ulgHmbhcBcoUTGTUcLKoLrseSR4dNbW
 lf70JtnoluukbB2REDI+6kSD1qMUWEwgv4Nw3GBikF9JZLY7vPGmYAXbyJRKbcFRr3ar
 WJklOqdkzS/LIIQLdrIKO3yASrpnU3LO4SrEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wXRta/l0rIpVqWKOqa7VKxnC+dawIwiqAsPvJhT8cAw=;
 b=MC7gfKNXqrLlQpXmiVUS56ypjqqhAWLYPlYA3PcwvqXrr4MWynud/1h7465SJI7rKY
 zuBZmi4k/6HigyAyL4cNUluuOUsClEFKr1c9xfqqOG+Nqin1hCnFdFTaBskV6on/thkW
 TP/fV7oEFPNiiayDfGM6IE1IZhkysjoTyFZ95PT/dKQQeCb+Nirz3n45ssPaqkkg1YJo
 Ov29xe2kyTgiDXnwakZSDYn7uhHRxJXM5f3bg+2XlGa9wNb4nZcQI9dd6xhrAFKSOeKg
 wqGbqzQOLe+lP812K3K9t4VEAyIzzNLQSIcanO1FsK47pAGEEEOvf2PAHQ4Iug2UZ3Fg
 +P3Q==
X-Gm-Message-State: AOAM5325uOFXYfxIOB0ZO6FavaeyI4j+UEJTzonfCL+tK833kTbKFBu+
 fCg+EsVde2GjZuJiv5N687CwrDZbRIG3FIi3axwXbg==
X-Google-Smtp-Source: ABdhPJyaj4h+nsHSHvyeat3tzFBttagersKPsH8TB4jnReJYbVxBNFyR6MXj9JmE7u1qH0zeqev5JFPLu55kIKQjZFI=
X-Received: by 2002:a67:2783:: with SMTP id n125mr231844vsn.47.1603766697607; 
 Mon, 26 Oct 2020 19:44:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201026175526.2915399-1-enric.balletbo@collabora.com>
 <20201026175526.2915399-7-enric.balletbo@collabora.com>
In-Reply-To: <20201026175526.2915399-7-enric.balletbo@collabora.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 27 Oct 2020 10:44:46 +0800
Message-ID: <CANMq1KCDNH1w+jo5kjyhusLdzCR0hF8QUi3a+jkkDvv75uGK5A@mail.gmail.com>
Subject: Re: [PATCH v3 06/16] soc: mediatek: pm-domains: Add SMI block as bus
 protection block
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_224459_130005_AB9485CA 
X-CRM114-Status: GOOD (  23.24  )
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
Cc: Matthias Brugger <mbrugger@suse.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 27, 2020 at 1:55 AM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> From: Matthias Brugger <mbrugger@suse.com>
>
> Apart from the infracfg block, the SMI block is used to enable the bus
> protection for some power domains. Add support for this block.
>
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>
> Changes in v3:
> - Do not reuse bpd for 2 different things.
> - Disable pd->smi first and after that pd->infracfg.
> - Rename BUT_PROT_UPDATE_MT8173 to BUS_PROT_UPDATE_TOPAXI as in all the
>   other SoCs TOPAXI is mapped to the same address.
>
[snip]
>  static int scpsys_power_on(struct generic_pm_domain *genpd)
> @@ -266,6 +271,10 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>         if (IS_ERR(pd->infracfg))
>                 pd->infracfg = NULL;
>
> +       pd->smi = syscon_regmap_lookup_by_phandle(node, "mediatek,smi");
> +       if (IS_ERR(pd->smi))
> +               pd->smi = NULL;

This is the second time I see this pattern, I think.

Do we want to create a new syscon_regmap_lookup_by_phandle_optional wrapper?

Also, are we ok with ignoring all errors? I agree we can ignore
-ENODEV if optional, but I'm not sure about the others.

> +
>         pd->num_clks = of_clk_get_parent_count(node);
>         if (pd->num_clks > 0) {
>                 pd->clks = devm_kcalloc(scpsys->dev, pd->num_clks, sizeof(*pd->clks), GFP_KERNEL);
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> index e428fe23a7e3..7b1abcfc4ba3 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.h
> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> @@ -34,8 +34,31 @@
>
>  #define SPM_MAX_BUS_PROT_DATA          3
>
> +#define _BUS_PROT(_mask, _set, _clr, _sta, _update) {  \
> +               .bus_prot_mask = (_mask),               \
> +               .bus_prot_set = _set,                   \
> +               .bus_prot_clr = _clr,                   \
> +               .bus_prot_sta = _sta,                   \
> +               .bus_prot_reg_update = _update,         \
> +       }
> +
> +#define BUS_PROT_WR(_mask, _set, _clr, _sta)           \
> +               _BUS_PROT(_mask, _set, _clr, _sta, false)
> +
> +#define BUS_PROT_UPDATE(_mask, _set, _clr, _sta)               \
> +               _BUS_PROT(_mask, _set, _clr, _sta, true)
> +
> +#define BUS_PROT_UPDATE_TOPAXI(_mask)                          \
> +               BUS_PROT_UPDATE(_mask,                          \
> +                               INFRA_TOPAXI_PROTECTEN,         \
> +                               INFRA_TOPAXI_PROTECTEN_CLR,     \
> +                               INFRA_TOPAXI_PROTECTSTA1)
> +
>  struct scpsys_bus_prot_data {
>         u32 bus_prot_mask;
> +       u32 bus_prot_set;
> +       u32 bus_prot_clr;
> +       u32 bus_prot_sta;
>         bool bus_prot_reg_update;
>  };
>
> @@ -47,6 +70,7 @@ struct scpsys_bus_prot_data {
>   * @sram_pdn_ack_bits: The mask for sram power control acked bits.
>   * @caps: The flag for active wake-up action.
>   * @bp_infracfg: bus protection for infracfg subsystem
> + * @bp_smi: bus protection for smi subsystem
>   */
>  struct scpsys_domain_data {
>         u32 sta_mask;
> @@ -55,6 +79,7 @@ struct scpsys_domain_data {
>         u32 sram_pdn_ack_bits;
>         u8 caps;
>         const struct scpsys_bus_prot_data bp_infracfg[SPM_MAX_BUS_PROT_DATA];
> +       const struct scpsys_bus_prot_data bp_smi[SPM_MAX_BUS_PROT_DATA];
>  };
>
>  struct scpsys_soc_data {
> --
> 2.28.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
