Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D81C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 02:47:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B71120780
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 02:47:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f7ulp6Iq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ceBFFlgj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B71120780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cPr5wWr5obAmNMrYF4YjIeeQRdCE5eARgup/6rJdnQI=; b=f7ulp6Iq8IKxHesH/9MhfvclH
	2883Xo/rhKlyMMk9XUS5qayf3C1JAAW9xovW8Vzw2B7f3h4GwYo+YL5WkybbzWd6HZMw3gop4PS/9
	yA9PEIIFeDo2AE9kCANV8/Kosc2kAYpHBzGy2iYAYmriN/Tb1ywNe52YfAQjDimbDhRT8mubvTPJq
	3yynt7Q0T7JHByDdONVExJfxk1TaWwlodum9fvAmufF81GLk/AxluuN+FUSVaOkkpvQCNRcu5J77L
	eHBzTn3DjNZKO8WKOP7ZA8vxHQ/yL/+L0r6sIBHKxPVk2mX2JmLkqwy9hj98/bH7Pz/toTsXTWLNr
	TCw7YxUnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXF17-0006AW-UF; Tue, 27 Oct 2020 02:47:21 +0000
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXF15-00069g-Lw
 for linux-mediatek@lists.infradead.org; Tue, 27 Oct 2020 02:47:20 +0000
Received: by mail-ua1-x941.google.com with SMTP id 52so55024uaj.4
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2020 19:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CfHMJowBDH8fp8MkQnVoV3I8mZnnK2rYmrQmkGAHTzk=;
 b=ceBFFlgjHmpT89ryHtdWPO+jbawd3DaOCZ5D0I9wPI7EANCEz9yiRF5j/PpZ0X9k8r
 PYDSAJeEQHPwrD+KlFRiMQEQ1f9cLZahvLrGuFHX6Y8tDyVxaenvNkfpXzdJRdi3Tn6l
 25+N0Xs9GMfsO9xLAUSjk/qNScs6PEEQGLDss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CfHMJowBDH8fp8MkQnVoV3I8mZnnK2rYmrQmkGAHTzk=;
 b=pX9oQM3h33LQwDWG4d9q+I1u4Mh4Zb2CRkHPk/1H8sPK9qGx75Eox/+8xjPObPsOqB
 1XdHUrfJal/s+D1pzb2Th4VvdIbS974+edUonQvXngjXFVGxRbIhXmdtrBteXJJ1Dzk7
 AFE+vKOujtAubsCTt3J7e6EDMmOvtsPwXI0y4Qu7Ca3WAmSIuKiJCV1K12IPFV1uopvM
 oCugpI6M0+FVoTTXdJN5Vb4LGwAyLJOlRvIjRnu+Dz3PzgXUzWZj51iaEQO0yr8Q4ORK
 JvRLXm1l+V++Ka6bXsr8o/JE9KBcBv8aIsiBxrlPQeU5RYJZUcNuJuNEmhXM1gEXEnpd
 g3BA==
X-Gm-Message-State: AOAM530qExmaofbAN62Ac6+RyeYXiInZNbmbCvR/ey4iOAAY/FsTMTDB
 c/aX/EWlgHjnUDOZk5zxMO/ADGib+OBrGQT5CzhA5A==
X-Google-Smtp-Source: ABdhPJyGpM3YUMVBx+nYfxPQlQBmBPZ6taDoHHfBDTZRvvPNjg6JOU0pushp7zq9etEWT3DiHWgNQq2vIQtsljEaHek=
X-Received: by 2002:ab0:5b0b:: with SMTP id u11mr95907uae.74.1603766837803;
 Mon, 26 Oct 2020 19:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201026175526.2915399-1-enric.balletbo@collabora.com>
 <20201026175526.2915399-8-enric.balletbo@collabora.com>
In-Reply-To: <20201026175526.2915399-8-enric.balletbo@collabora.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 27 Oct 2020 10:47:06 +0800
Message-ID: <CANMq1KCRk6Wb=pFh03vUQ02ZoJw7ZvDJi8ayjsw1LG-hVqaBAQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/16] soc: mediatek: pm-domains: Add extra sram control
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_224719_792609_547605A4 
X-CRM114-Status: GOOD (  22.87  )
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
> For some power domains like vpu_core on MT8183 whose sram need to do clock
> and internal isolation while power on/off sram. We add a cap
> "MTK_SCPD_SRAM_ISO" to judge if we need to do the extra sram isolation
> control or not.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>
> Changes in v3: None
> Changes in v2:
> - Nit, split readl(ctl_addr) | pd->data->sram_pdn_bits in two lines.
> - Use regmap API
>
>  drivers/soc/mediatek/mtk-pm-domains.c | 25 +++++++++++++++++++++++--
>  drivers/soc/mediatek/mtk-pm-domains.h |  1 +
>  2 files changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index 006eb7571d32..82f6d937ed93 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -24,6 +24,8 @@
>  #define PWR_ON_BIT                     BIT(2)
>  #define PWR_ON_2ND_BIT                 BIT(3)
>  #define PWR_CLK_DIS_BIT                        BIT(4)
> +#define PWR_SRAM_CLKISO_BIT            BIT(5)
> +#define PWR_SRAM_ISOINT_B_BIT          BIT(6)
>
>  struct scpsys_domain {
>         struct generic_pm_domain genpd;
> @@ -65,12 +67,24 @@ static int scpsys_sram_enable(struct scpsys_domain *pd)
>         u32 pdn_ack = pd->data->sram_pdn_ack_bits;
>         struct scpsys *scpsys = pd->scpsys;
>         unsigned int tmp;
> +       int ret;
>
>         regmap_update_bits(scpsys->base, pd->data->ctl_offs, pd->data->sram_pdn_bits, 0);
>
>         /* Either wait until SRAM_PDN_ACK all 1 or 0 */
> -       return regmap_read_poll_timeout(scpsys->base, pd->data->ctl_offs, tmp,
> -                                       (tmp & pdn_ack) == 0, MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> +       ret = regmap_read_poll_timeout(scpsys->base, pd->data->ctl_offs, tmp,
> +                                      (tmp & pdn_ack) == 0, MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (MTK_SCPD_CAPS(pd, MTK_SCPD_SRAM_ISO)) {
> +               regmap_update_bits(scpsys->base, pd->data->ctl_offs, PWR_SRAM_ISOINT_B_BIT,
> +                                  PWR_SRAM_ISOINT_B_BIT);

regmap_set_bits?

> +               udelay(1);
> +               regmap_update_bits(scpsys->base, pd->data->ctl_offs, PWR_SRAM_CLKISO_BIT, 0);

regmap_clear_bits?

But then I'm afraid we'll want to modify it everywhere for consistency.

I only noticed here as the first call spans over 2 lines..

> +       }
> +
> +       return 0;
>  }
>
>  static int scpsys_sram_disable(struct scpsys_domain *pd)
> @@ -79,6 +93,13 @@ static int scpsys_sram_disable(struct scpsys_domain *pd)
>         struct scpsys *scpsys = pd->scpsys;
>         unsigned int tmp;
>
> +       if (MTK_SCPD_CAPS(pd, MTK_SCPD_SRAM_ISO)) {
> +               regmap_update_bits(scpsys->base, pd->data->ctl_offs, PWR_SRAM_CLKISO_BIT,
> +                                  PWR_SRAM_CLKISO_BIT);
> +               udelay(1);
> +               regmap_update_bits(scpsys->base, pd->data->ctl_offs, PWR_SRAM_ISOINT_B_BIT, 0);
> +       }
> +
>         regmap_update_bits(scpsys->base, pd->data->ctl_offs, pd->data->sram_pdn_bits,
>                            pd->data->sram_pdn_bits);
>
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> index 7b1abcfc4ba3..4152b96c1b29 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.h
> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> @@ -5,6 +5,7 @@
>
>  #define MTK_SCPD_ACTIVE_WAKEUP         BIT(0)
>  #define MTK_SCPD_FWAIT_SRAM            BIT(1)
> +#define MTK_SCPD_SRAM_ISO              BIT(2)
>  #define MTK_SCPD_CAPS(_scpd, _x)       ((_scpd)->data->caps & (_x))
>
>  #define SPM_VDE_PWR_CON                        0x0210
> --
> 2.28.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
