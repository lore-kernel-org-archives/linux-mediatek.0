Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 869E6C4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 02:41:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE2D320872
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 02:41:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X9Uq6BLO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oBV6h+fG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE2D320872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=43EJSt4mbCtUouel4Do48gAcezeb4WpadHvQz4AcMwo=; b=X9Uq6BLOT3ZS6lSP0kVBtIlmk
	KCcbMhbQ6yk5eSm9RXxIa9GSK3Mks7h7Fxt6XfwyeC0B+oab22wLeueMPx16GRPXTjYyAhMqf7cQD
	PopLXPs6M3ovPj3mUzwJ62qpQdNiUGCz17s2S/W/eExc5I4P1Yk0bH0wAY+lZicc2IaQtW7WdH9IB
	hzit0yzgmg6Qg6H4387l16OeJMCA8HTUR7NVnhtHPaYQEyt4s4LrXaUPA2iw1PtGvxkeo4sBJfF5k
	B3Y8BdLz/zqWOLdbMDrP6qcbI+AvxMCXfMx5OjybxMrOKqRrEv1/xhsqeLQA3BtsKbj/qYSrj9+oC
	w1ie/9IpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXEvT-0005Hv-5A; Tue, 27 Oct 2020 02:41:31 +0000
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXEvO-0005Gg-Hc
 for linux-mediatek@lists.infradead.org; Tue, 27 Oct 2020 02:41:27 +0000
Received: by mail-vs1-xe41.google.com with SMTP id h5so60494vsp.3
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2020 19:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bmk0UTS3x9Tp1HCmgDXGjH+YpS7EiLVNFjl9WtxBa50=;
 b=oBV6h+fG2Mxgvbs1jMZ3U+Dxxal0evBf3S3wH6YrlK/pFt5T+D1VlhP3XbltSFGRcA
 KzpitOQ+M8phttR+1pxWGAtS9qNRLYQT/6uK9ZbWQk29CBjo2W4v/iYMfh5Gl9P4GbZN
 AiiY05SllXB9izzEZiG8uONUBp2kiLuegya7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bmk0UTS3x9Tp1HCmgDXGjH+YpS7EiLVNFjl9WtxBa50=;
 b=QFFSUQ7iT0CsKDuzB33FbjN/WdFle2Wn5unO8/dSUk2O4X2HL5pBi8BMrNtEfA6RNI
 Vja/wQwJfJN8SV3qPHGmpFr4j17we9UcLY2e0iPvYwdf47ViGeliC6NV/YTdI9qdglii
 /A0zDp6Cgm1w20537V9RX1awACXnsL92EpQc7pE2NHPxtwPTtnWaHSV4oY+egCFWtnHa
 mYIS52h81SZzGouuN46QtlaIH31zqEIhbbQx4uYvq2lxeseQkFXbsuWTVgdZTslSqWCS
 sIW5Dmsms5wCTWrYzoK6WrJKBaW9gGGlvEMyueXUBkrHWWLwABV0s8iChDPsCkmguo6B
 lA8g==
X-Gm-Message-State: AOAM530KdqE27zrlSHVW8pi1aHJEozPx5Xf6dO1JePy43u7NHpVBi9Za
 2GUfBbrZ+cssRdMWtpgCC5rgmM14/xV2z81n7LRrzw==
X-Google-Smtp-Source: ABdhPJx2W7iE7ZtLv3PQAdx32ue6WAArJMZ6rjaKeAAEEdusvUyHsnHXrL0Eekr9cHR06NHe8++RceLGNh3DACqb/8k=
X-Received: by 2002:a67:15c6:: with SMTP id 189mr6110vsv.16.1603766483061;
 Mon, 26 Oct 2020 19:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <20201026175526.2915399-1-enric.balletbo@collabora.com>
 <20201026175526.2915399-6-enric.balletbo@collabora.com>
In-Reply-To: <20201026175526.2915399-6-enric.balletbo@collabora.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 27 Oct 2020 10:41:12 +0800
Message-ID: <CANMq1KBXBEWwweuGFYGTbVrhYXgdjZuwhWVC6SedArFH2GJHoQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/16] soc: mediatek: pm_domains: Make bus protection
 generic
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_224126_648533_0B9EC5F4 
X-CRM114-Status: GOOD (  24.36  )
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
 Miles Chen <miles.chen@mediatek.com>, Joerg Roedel <jroedel@suse.de>,
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
> Bus protection is not exclusively done by calling the infracfg misc driver.
> Make the calls for setting and clearing the bus protection generic so
> that we can use other blocks for it as well.
>
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>
> Changes in v3: None
> Changes in v2: None
>
>  drivers/soc/mediatek/mtk-infracfg.c   |  5 ---
>  drivers/soc/mediatek/mtk-pm-domains.c | 53 +++++++++++++++++++++------
>  include/linux/soc/mediatek/infracfg.h |  5 +++
>  3 files changed, 47 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-infracfg.c b/drivers/soc/mediatek/mtk-infracfg.c
> index 4a123796aad3..0590b68e0d78 100644
> --- a/drivers/soc/mediatek/mtk-infracfg.c
> +++ b/drivers/soc/mediatek/mtk-infracfg.c
> @@ -12,11 +12,6 @@
>  #define MTK_POLL_DELAY_US   10
>  #define MTK_POLL_TIMEOUT    (jiffies_to_usecs(HZ))
>
> -#define INFRA_TOPAXI_PROTECTEN         0x0220
> -#define INFRA_TOPAXI_PROTECTSTA1       0x0228
> -#define INFRA_TOPAXI_PROTECTEN_SET     0x0260
> -#define INFRA_TOPAXI_PROTECTEN_CLR     0x0264
> -
>  /**
>   * mtk_infracfg_set_bus_protection - enable bus protection
>   * @infracfg: The infracfg regmap
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index 2121e05cb9a4..92c61e59255b 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -87,18 +87,24 @@ static int scpsys_sram_disable(struct scpsys_domain *pd)
>                                         MTK_POLL_TIMEOUT);
>  }
>
> -static int scpsys_bus_protect_enable(struct scpsys_domain *pd)
> +static int _scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd, struct regmap *regmap)
>  {
> -       const struct scpsys_bus_prot_data *bpd = pd->data->bp_infracfg;
>         int i, ret;
>
>         for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
> -               if (!bpd[i].bus_prot_mask)
> +               u32 val, mask = bpd[i].bus_prot_mask;
> +
> +               if (!mask)
>                         break;
>
> -               ret = mtk_infracfg_set_bus_protection(pd->infracfg,
> -                                                     bpd[i].bus_prot_mask,
> -                                                     bpd[i].bus_prot_reg_update);
> +               if (bpd[i].bus_prot_reg_update)
> +                       regmap_update_bits(regmap, INFRA_TOPAXI_PROTECTEN, mask, mask);
> +               else
> +                       regmap_write(regmap, INFRA_TOPAXI_PROTECTEN_SET, mask);
> +
> +               ret = regmap_read_poll_timeout(regmap, INFRA_TOPAXI_PROTECTSTA1,
> +                                              val, (val & mask) == mask,
> +                                              MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
>                 if (ret)
>                         return ret;
>         }
> @@ -106,18 +112,34 @@ static int scpsys_bus_protect_enable(struct scpsys_domain *pd)
>         return 0;
>  }
>
> -static int scpsys_bus_protect_disable(struct scpsys_domain *pd)
> +static int scpsys_bus_protect_enable(struct scpsys_domain *pd)
>  {
>         const struct scpsys_bus_prot_data *bpd = pd->data->bp_infracfg;
> +       int ret;
> +
> +       ret = _scpsys_bus_protect_enable(bpd, pd->infracfg);
> +       return ret;
> +}
> +
> +static int _scpsys_bus_protect_disable(const struct scpsys_bus_prot_data *bpd,
> +                                      struct regmap *regmap)
> +{
>         int i, ret;
>
>         for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
> -               if (!bpd[i].bus_prot_mask)
> +               u32 val, mask = bpd[i].bus_prot_mask;
> +
> +               if (!mask)
>                         return 0;
>
> -               ret = mtk_infracfg_clear_bus_protection(pd->infracfg,
> -                                                       bpd[i].bus_prot_mask,
> -                                                       bpd[i].bus_prot_reg_update);
> +               if (bpd[i].bus_prot_reg_update)
> +                       regmap_update_bits(regmap, INFRA_TOPAXI_PROTECTEN, mask, 0);
> +               else
> +                       regmap_write(regmap, INFRA_TOPAXI_PROTECTEN_CLR, mask);
> +
> +               ret = regmap_read_poll_timeout(regmap, INFRA_TOPAXI_PROTECTSTA1,
> +                                              val, !(val & mask),
> +                                              MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
>                 if (ret)
>                         return ret;
>         }
> @@ -125,6 +147,15 @@ static int scpsys_bus_protect_disable(struct scpsys_domain *pd)
>         return 0;
>  }
>
> +static int scpsys_bus_protect_disable(struct scpsys_domain *pd)
> +{
> +       const struct scpsys_bus_prot_data *bpd = pd->data->bp_infracfg;

More of a nit: The next patch gets rid of this line, so maybe you
don't need to add it here.

Also `int ret` isn't really needed, but I think that's ok since the
next CL needs to add another call.

> +       int ret;
> +
> +       ret = _scpsys_bus_protect_disable(bpd, pd->infracfg);
> +       return ret;
> +}
> +
>  static int scpsys_power_on(struct generic_pm_domain *genpd)
>  {
>         struct scpsys_domain *pd = container_of(genpd, struct scpsys_domain, genpd);
> diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
> index 233463d789c6..5bcaab767f6a 100644
> --- a/include/linux/soc/mediatek/infracfg.h
> +++ b/include/linux/soc/mediatek/infracfg.h
> @@ -32,6 +32,11 @@
>  #define MT7622_TOP_AXI_PROT_EN_WB              (BIT(2) | BIT(6) | \
>                                                  BIT(7) | BIT(8))
>
> +#define INFRA_TOPAXI_PROTECTEN                 0x0220
> +#define INFRA_TOPAXI_PROTECTSTA1               0x0228
> +#define INFRA_TOPAXI_PROTECTEN_SET             0x0260
> +#define INFRA_TOPAXI_PROTECTEN_CLR             0x0264
> +
>  #define REG_INFRA_MISC                         0xf00
>  #define F_DDR_4GB_SUPPORT_EN                   BIT(13)
>
> --
> 2.28.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
