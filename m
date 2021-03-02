Return-Path: <SRS0=N2rV=IA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2279EC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Mar 2021 03:31:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE6A364D74
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Mar 2021 03:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE6A364D74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=695kPqwLRorHyRu9/CooP6JlokU/pF6eDc9fqz4dWxk=; b=C17Dk0dAXUKB3IFa+dMLddI1i
	MKYbmYjG8yHnQLO9Xf1HdTXQzdI0R5p/y6My8P6r2O4jybmQAeRkT9kl/Zu6kYQarvl5j48A9NLIL
	nyH2FkOD+6Ql7ySDWIw4grrsPDtkpMkay0hIVghjDkY05j+HVnuoc7/L/5R0MiBLjWfLnAP83M8Fs
	y2FPQWT+GITf06uJ4nEoDinbvg1mWV5G2Ndb3hqwgNxgFmS/JMGTKJajmMfFCb1oAw8pMM/3AaFTV
	TAwE/LAnKow5ykHRqL4vVkTRCPZnHCQ1jJRlWvYrDZXCtHbXWzEctU6oUec3URNLF0mFWqxLv/cZu
	7nX3HXgtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGvkO-000860-FO; Tue, 02 Mar 2021 03:30:56 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGvkK-00083k-Ea
 for linux-mediatek@lists.infradead.org; Tue, 02 Mar 2021 03:30:53 +0000
Received: by mail-io1-xd2f.google.com with SMTP id a7so20209362iok.12
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Mar 2021 19:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YmSGm0nXLfjFTCCCLeQ8emvB627JDPm5C2jL77IYa9o=;
 b=PSnZV0BTXV3W9S5Q/tI968oLIXrLBcvrR8XlxMZ5Gm6iKDCTq1F7eMDMBiNeMQXES3
 Bw9DACGzVBvAHSiusgPGtO8FmSZCUji7DrdBesYF7Q8gz1VThzMT27qIxx7Ktgj0xRZp
 7ZXWE6HN6UGRNJ7gHV1djoc2vV84YbZD7N6S8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YmSGm0nXLfjFTCCCLeQ8emvB627JDPm5C2jL77IYa9o=;
 b=YXYt5nM6IYGzdw9la3BdbeFWyELt8m+hXJTl1K4flIW4m8qgLAROycDwIdN57wJP7A
 gXe4StVnoxKEY31KngOmkkaclERWgWgaXHbWd/wQY2ugbsofauKZ4rI+bwNXGGxFZcOg
 u/e68g+0EGK97p4XeqUlp2ZPYAK5ZKLkvvMjYiywdQ8o4hmsFBxTzadE7kkXCKwgOHPL
 TfMe6UHkjSfKSelCOvmun97y9ulrMUPUyzMS6eyqJKjSd4i5RjRditsixQbX3ePonfrY
 ICS/pxPyc9Q20HcDwd08A449jjRcpmeiE6JJlvfATA1kNSeHxPfLgPg5j2yCW7SYPkkI
 /c+g==
X-Gm-Message-State: AOAM532X8VOGWusH4uBsbmxQ373qB92T8naXGQZrsKZ7frwTOfn1VQY1
 5UlzjgWI8b+Ae1T2PvwyA96o7bb8GJGIpRHzxZJxOw==
X-Google-Smtp-Source: ABdhPJxocnnKq+tbJz4i1vOu2TsIQbAwEJ+AHy0WIR800BMC4iPI+Swbk3o4wbgmrTdjmu3Acdl1+cbKbJuTpMAr1C4=
X-Received: by 2002:a5e:d61a:: with SMTP id w26mr7527304iom.40.1614655843956; 
 Mon, 01 Mar 2021 19:30:43 -0800 (PST)
MIME-Version: 1.0
References: <20210225175000.824661-1-enric.balletbo@collabora.com>
 <20210225175000.824661-3-enric.balletbo@collabora.com>
In-Reply-To: <20210225175000.824661-3-enric.balletbo@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 2 Mar 2021 11:30:18 +0800
Message-ID: <CAJMQK-iPs8VXfRhq3Kt_sHfY4iyywh4QfkkNC0ABhHJDfjKKNA@mail.gmail.com>
Subject: Re: [PATCH 3/4] soc: mediatek: pm-domains: Add a power domain names
 for mt8192
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_223052_507710_DF02910E 
X-CRM114-Status: GOOD (  14.91  )
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
> Add the power domains names for the mt8192 SoC.
>
> Fixes: a49d5e7a89d6 ("soc: mediatek: pm-domains: Add support for mt8192")
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>
>  drivers/soc/mediatek/mt8192-pm-domains.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/drivers/soc/mediatek/mt8192-pm-domains.h b/drivers/soc/mediatek/mt8192-pm-domains.h
> index 0fdf6dc6231f..543dda70de01 100644
> --- a/drivers/soc/mediatek/mt8192-pm-domains.h
> +++ b/drivers/soc/mediatek/mt8192-pm-domains.h
> @@ -12,6 +12,7 @@
>
>  static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
>         [MT8192_POWER_DOMAIN_AUDIO] = {
> +               .name = "audio",
>                 .sta_mask = BIT(21),
>                 .ctl_offs = 0x0354,
>                 .sram_pdn_bits = GENMASK(8, 8),
> @@ -24,6 +25,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
>                 },
>         },
>         [MT8192_POWER_DOMAIN_CONN] = {
> +               .name = "conn",
>                 .sta_mask = PWR_STATUS_CONN,
>                 .ctl_offs = 0x0304,
>                 .sram_pdn_bits = 0,
> @@ -45,12 +47,14 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
>                 .caps = MTK_SCPD_KEEP_DEFAULT_OFF,
>         },
>         [MT8192_POWER_DOMAIN_MFG0] = {
> +               .name = "mfg0",
>                 .sta_mask = BIT(2),
>                 .ctl_offs = 0x0308,
>                 .sram_pdn_bits = GENMASK(8, 8),
>                 .sram_pdn_ack_bits = GENMASK(12, 12),
>         },
>         [MT8192_POWER_DOMAIN_MFG1] = {
> +               .name = "mfg1",
>                 .sta_mask = BIT(3),
>                 .ctl_offs = 0x030c,
>                 .sram_pdn_bits = GENMASK(8, 8),
> @@ -75,36 +79,42 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
>                 },
>         },
>         [MT8192_POWER_DOMAIN_MFG2] = {
> +               .name = "mfg2",
>                 .sta_mask = BIT(4),
>                 .ctl_offs = 0x0310,
>                 .sram_pdn_bits = GENMASK(8, 8),
>                 .sram_pdn_ack_bits = GENMASK(12, 12),
>         },
>         [MT8192_POWER_DOMAIN_MFG3] = {
> +               .name = "mfg3",
>                 .sta_mask = BIT(5),
>                 .ctl_offs = 0x0314,
>                 .sram_pdn_bits = GENMASK(8, 8),
>                 .sram_pdn_ack_bits = GENMASK(12, 12),
>         },
>         [MT8192_POWER_DOMAIN_MFG4] = {
> +               .name = "mfg4",
>                 .sta_mask = BIT(6),
>                 .ctl_offs = 0x0318,
>                 .sram_pdn_bits = GENMASK(8, 8),
>                 .sram_pdn_ack_bits = GENMASK(12, 12),
>         },
>         [MT8192_POWER_DOMAIN_MFG5] = {
> +               .name = "mfg5",
>                 .sta_mask = BIT(7),
>                 .ctl_offs = 0x031c,
>                 .sram_pdn_bits = GENMASK(8, 8),
>                 .sram_pdn_ack_bits = GENMASK(12, 12),
>         },
>         [MT8192_POWER_DOMAIN_MFG6] = {
> +               .name = "mfg6",
>                 .sta_mask = BIT(8),
>                 .ctl_offs = 0x0320,
>                 .sram_pdn_bits = GENMASK(8, 8),
>                 .sram_pdn_ack_bits = GENMASK(12, 12),
>         },
>         [MT8192_POWER_DOMAIN_DISP] = {
> +               .name = "disp",
>                 .sta_mask = BIT(20),
>                 .ctl_offs = 0x0350,
>                 .sram_pdn_bits = GENMASK(8, 8),
> @@ -133,6 +143,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
>                 },
>         },
>         [MT8192_POWER_DOMAIN_IPE] = {
> +               .name = "ipe",
>                 .sta_mask = BIT(14),
>                 .ctl_offs = 0x0338,
>                 .sram_pdn_bits = GENMASK(8, 8),
> @@ -149,6 +160,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
>                 },
>         },
>         [MT8192_POWER_DOMAIN_ISP] = {
> +               .name = "isp",
>                 .sta_mask = BIT(12),
>                 .ctl_offs = 0x0330,
>                 .sram_pdn_bits = GENMASK(8, 8),
> @@ -165,6 +177,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
>                 },
>         },
>         [MT8192_POWER_DOMAIN_ISP2] = {
> +               .name = "isp2",
>                 .sta_mask = BIT(13),
>                 .ctl_offs = 0x0334,
>                 .sram_pdn_bits = GENMASK(8, 8),
> @@ -181,6 +194,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
>                 },
>         },
>         [MT8192_POWER_DOMAIN_MDP] = {
> +               .name = "mdp",
>                 .sta_mask = BIT(19),
>                 .ctl_offs = 0x034c,
>                 .sram_pdn_bits = GENMASK(8, 8),
> @@ -197,6 +211,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
>                 },
>         },
>         [MT8192_POWER_DOMAIN_VENC] = {
> +               .name = "venc",
>                 .sta_mask = BIT(17),
>                 .ctl_offs = 0x0344,
>                 .sram_pdn_bits = GENMASK(8, 8),
> @@ -213,6 +228,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
>                 },
>         },
>         [MT8192_POWER_DOMAIN_VDEC] = {
> +               .name = "vdec",
>                 .sta_mask = BIT(15),
>                 .ctl_offs = 0x033c,
>                 .sram_pdn_bits = GENMASK(8, 8),
> @@ -229,12 +245,14 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
>                 },
>         },
>         [MT8192_POWER_DOMAIN_VDEC2] = {
> +               .name = "vdec2",
>                 .sta_mask = BIT(16),
>                 .ctl_offs = 0x0340,
>                 .sram_pdn_bits = GENMASK(8, 8),
>                 .sram_pdn_ack_bits = GENMASK(12, 12),
>         },
>         [MT8192_POWER_DOMAIN_CAM] = {
> +               .name = "cam",
>                 .sta_mask = BIT(23),
>                 .ctl_offs = 0x035c,
>                 .sram_pdn_bits = GENMASK(8, 8),
> @@ -263,18 +281,21 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
>                 },
>         },
>         [MT8192_POWER_DOMAIN_CAM_RAWA] = {
> +               .name = "cam_rawa",
>                 .sta_mask = BIT(24),
>                 .ctl_offs = 0x0360,
>                 .sram_pdn_bits = GENMASK(8, 8),
>                 .sram_pdn_ack_bits = GENMASK(12, 12),
>         },
>         [MT8192_POWER_DOMAIN_CAM_RAWB] = {
> +               .name = "cam_rawb",
>                 .sta_mask = BIT(25),
>                 .ctl_offs = 0x0364,
>                 .sram_pdn_bits = GENMASK(8, 8),
>                 .sram_pdn_ack_bits = GENMASK(12, 12),
>         },
>         [MT8192_POWER_DOMAIN_CAM_RAWC] = {
> +               .name = "cam_rawc",
>                 .sta_mask = BIT(26),
>                 .ctl_offs = 0x0368,
>                 .sram_pdn_bits = GENMASK(8, 8),
> --
> 2.30.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
