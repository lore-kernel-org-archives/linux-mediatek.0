Return-Path: <SRS0=N2rV=IA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B5EC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Mar 2021 03:30:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 639F064DDD
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Mar 2021 03:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 639F064DDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MxwvuG+NsRK7DTzjMuzZW5h/OkEM8I3SugwmPwwdFU0=; b=uC2MXqdSfnOSNT8NPxisqUjJf
	+BG85HorrKD5ERE6bsHYKl+xJm/VI7nVknWZGJDxpCJlK0kGm1ZpOWrPWo3dk0h+fVoLWdOGXBlIP
	luyG9wCCg+NLUix34qXuiafmsRQxekhTAALjlcbq1DenwGfqBFNtNSCYL59BPp9k+LkNIq9u1X7FM
	LDfAzb8e7HAjJ1dkeGy2VobXos3Mka3716NTb5YcmuAMc6kxTtX5cvMpOBmBJeTnZC1ylCv+T3X3q
	Rp2n7ek2V6ORJRPU7dZmpbhoqdrysSf1B3oTzr8yc2BD4OoE3OUogrQRIfNccRysKiwc7TzVDI6ps
	8AIOhltTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGvjU-0007wY-DP; Tue, 02 Mar 2021 03:30:00 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGvjR-0007vI-AB
 for linux-mediatek@lists.infradead.org; Tue, 02 Mar 2021 03:29:58 +0000
Received: by mail-io1-xd34.google.com with SMTP id g27so18883370iox.2
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Mar 2021 19:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/oSnREyYrWKG+GDU2KGVslzs3LByzyb9v1lKNygr+Ko=;
 b=JgGhZOXgftXhq7TXErJ6G7/K05dkAsj2JjgJ7Z2eH18cGA1VybdJtjzKhT3ileBuUg
 HbJXD6MXYmPzayWk6SjpXW6ExGatWy4Nbq4FzXqASbFngTOuIN0BzuJy8o8EaMJxu0BT
 4U/ZTA34TexqinD3bmlvBFByIAts6DM56SLcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/oSnREyYrWKG+GDU2KGVslzs3LByzyb9v1lKNygr+Ko=;
 b=bGRos3NcLTAjKZq/Fo5XFF2qlL6CV8EolU+LU2E85vQDzLbobUsBcmoiaIMbX4OEU7
 ZpV2EYg4GRZUD2PFqgbGXUmq1XBL9VcI3uZycSoaJ7ztjNT/86J4s0DqAC54AC+I3e4U
 037A0KHxxQE6qGFf5PUBPhtt8hszhYgXaMutVM3cg7I92OTxuYnNH2knd3sxhq3e9Swq
 XLAERo0okkhhmoExD4fsChT0h+vmDLJWnlfMQupCTGUwVZdIpB4pRlJGk4tyiFqBFKEj
 QZJHHwdC0ulV2xE64zThZv/vbBcD6Pve0Max/0Y96YtP19NkaXOxE3/ByTLuMMJA8B4I
 1cgA==
X-Gm-Message-State: AOAM5333YbV9hL8uqQ6daJUFapFi43soPLmyvkgM0PFM9rjSl37rpQop
 J/yxDdbO3n7DtJ0wNBIddjE0uYqABxSPqt7MU46UEA==
X-Google-Smtp-Source: ABdhPJxzr57zJCc25ckeIBrGxo++RkaMAkrRqjbXM5OOdHjCr4Tm/07WtOIE1wlUN3i/7yo1ecJgqD82Qv2G31tg9lc=
X-Received: by 2002:a02:2a4a:: with SMTP id w71mr18725045jaw.43.1614655793569; 
 Mon, 01 Mar 2021 19:29:53 -0800 (PST)
MIME-Version: 1.0
References: <20210225175000.824661-1-enric.balletbo@collabora.com>
In-Reply-To: <20210225175000.824661-1-enric.balletbo@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 2 Mar 2021 11:29:27 +0800
Message-ID: <CAJMQK-gcGY+i2CrUDK49_b4dNY9zbwxcMyW3E94aSz8dzV-3fg@mail.gmail.com>
Subject: Re: [PATCH 1/4] soc: mediatek: pm-domains: Add a meaningful power
 domain name
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_222957_417292_7232FBF9 
X-CRM114-Status: GOOD (  19.30  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Feb 26, 2021 at 1:50 AM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Add the power domains names to the power domain struct so we
> have meaningful name for every power domain. This also removes the
> following debugfs error message.
>
>   [    2.242068] debugfs: Directory 'power-domain' with parent 'pm_genpd' already present!
>   [    2.249949] debugfs: Directory 'power-domain' with parent 'pm_genpd' already present!
>   [    2.257784] debugfs: Directory 'power-domain' with parent 'pm_genpd' already present!
>   ...
>
> Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>
>  drivers/soc/mediatek/mt8173-pm-domains.h | 10 ++++++++++
>  drivers/soc/mediatek/mtk-pm-domains.c    |  6 +++++-
>  drivers/soc/mediatek/mtk-pm-domains.h    |  2 ++
>  3 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/mediatek/mt8173-pm-domains.h b/drivers/soc/mediatek/mt8173-pm-domains.h
> index 3e8ee5dabb43..654c717e5467 100644
> --- a/drivers/soc/mediatek/mt8173-pm-domains.h
> +++ b/drivers/soc/mediatek/mt8173-pm-domains.h
> @@ -12,24 +12,28 @@
>
>  static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
>         [MT8173_POWER_DOMAIN_VDEC] = {
> +               .name = "vdec",
>                 .sta_mask = PWR_STATUS_VDEC,
>                 .ctl_offs = SPM_VDE_PWR_CON,
>                 .sram_pdn_bits = GENMASK(11, 8),
>                 .sram_pdn_ack_bits = GENMASK(12, 12),
>         },
>         [MT8173_POWER_DOMAIN_VENC] = {
> +               .name = "venc",
>                 .sta_mask = PWR_STATUS_VENC,
>                 .ctl_offs = SPM_VEN_PWR_CON,
>                 .sram_pdn_bits = GENMASK(11, 8),
>                 .sram_pdn_ack_bits = GENMASK(15, 12),
>         },
>         [MT8173_POWER_DOMAIN_ISP] = {
> +               .name = "isp",
>                 .sta_mask = PWR_STATUS_ISP,
>                 .ctl_offs = SPM_ISP_PWR_CON,
>                 .sram_pdn_bits = GENMASK(11, 8),
>                 .sram_pdn_ack_bits = GENMASK(13, 12),
>         },
>         [MT8173_POWER_DOMAIN_MM] = {
> +               .name = "mm",
>                 .sta_mask = PWR_STATUS_DISP,
>                 .ctl_offs = SPM_DIS_PWR_CON,
>                 .sram_pdn_bits = GENMASK(11, 8),
> @@ -40,18 +44,21 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
>                 },
>         },
>         [MT8173_POWER_DOMAIN_VENC_LT] = {
> +               .name = "venc_lt",
>                 .sta_mask = PWR_STATUS_VENC_LT,
>                 .ctl_offs = SPM_VEN2_PWR_CON,
>                 .sram_pdn_bits = GENMASK(11, 8),
>                 .sram_pdn_ack_bits = GENMASK(15, 12),
>         },
>         [MT8173_POWER_DOMAIN_AUDIO] = {
> +               .name = "audio",
>                 .sta_mask = PWR_STATUS_AUDIO,
>                 .ctl_offs = SPM_AUDIO_PWR_CON,
>                 .sram_pdn_bits = GENMASK(11, 8),
>                 .sram_pdn_ack_bits = GENMASK(15, 12),
>         },
>         [MT8173_POWER_DOMAIN_USB] = {
> +               .name = "usb",
>                 .sta_mask = PWR_STATUS_USB,
>                 .ctl_offs = SPM_USB_PWR_CON,
>                 .sram_pdn_bits = GENMASK(11, 8),
> @@ -59,18 +66,21 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
>                 .caps = MTK_SCPD_ACTIVE_WAKEUP,
>         },
>         [MT8173_POWER_DOMAIN_MFG_ASYNC] = {
> +               .name = "mfg_async",
>                 .sta_mask = PWR_STATUS_MFG_ASYNC,
>                 .ctl_offs = SPM_MFG_ASYNC_PWR_CON,
>                 .sram_pdn_bits = GENMASK(11, 8),
>                 .sram_pdn_ack_bits = 0,
>         },
>         [MT8173_POWER_DOMAIN_MFG_2D] = {
> +               .name = "mfg_2d",
>                 .sta_mask = PWR_STATUS_MFG_2D,
>                 .ctl_offs = SPM_MFG_2D_PWR_CON,
>                 .sram_pdn_bits = GENMASK(11, 8),
>                 .sram_pdn_ack_bits = GENMASK(13, 12),
>         },
>         [MT8173_POWER_DOMAIN_MFG] = {
> +               .name = "mfg",
>                 .sta_mask = PWR_STATUS_MFG,
>                 .ctl_offs = SPM_MFG_PWR_CON,
>                 .sram_pdn_bits = GENMASK(13, 8),
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index b7f697666bdd..694d6ea6de1d 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -438,7 +438,11 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>                 goto err_unprepare_subsys_clocks;
>         }
>
> -       pd->genpd.name = node->name;
> +       if (!pd->data->name)
> +               pd->genpd.name = node->name;
> +       else
> +               pd->genpd.name = pd->data->name;
> +
>         pd->genpd.power_off = scpsys_power_off;
>         pd->genpd.power_on = scpsys_power_on;
>
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> index 141dc76054e6..21a4e113bbec 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.h
> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> @@ -76,6 +76,7 @@ struct scpsys_bus_prot_data {
>
>  /**
>   * struct scpsys_domain_data - scp domain data for power on/off flow
> + * @name: The name of the power domain.
>   * @sta_mask: The mask for power on/off status bit.
>   * @ctl_offs: The offset for main power control register.
>   * @sram_pdn_bits: The mask for sram power control bits.
> @@ -85,6 +86,7 @@ struct scpsys_bus_prot_data {
>   * @bp_smi: bus protection for smi subsystem
>   */
>  struct scpsys_domain_data {
> +       const char *name;
>         u32 sta_mask;
>         int ctl_offs;
>         u32 sram_pdn_bits;
> --
> 2.30.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
