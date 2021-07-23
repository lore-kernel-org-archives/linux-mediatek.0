Return-Path: <SRS0=Y38d=MP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387F4C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 09:54:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0765B608FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 09:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0765B608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pMpt72gHGP21OZkZ9oez1LLaDrvCEwo+NWsRAz66tx8=; b=wr++oGCJrg71GL
	rt+WoEryJJEGPaRFKUjJXzoFRgoNZD2yuoxr3Z/rBS4t1q8hnKdC1CxoCRvb3SZVqvtxKeSSskzro
	3bCs6WUsJBrU6PKwCFfCHt/zNAsJeHa3rLafn0zGEvzVY4jM5fG26uIE2GIqIdwLx48FEaPJM75SE
	iX3R1hOZ7KfP3EE1SynJaxrRPKZHBu8plMstY0x/9lVsyRAV27wuGhYhfU6M3hchayVejhwV5mlSX
	73L4xduIdikNUNmQaepftq+M1sx/tOXiY65rY2MNJtAMoCW1Kg7UcOL8E+Ft0bSpnQwUmLLJCdubq
	egUdLVptTkAbvk6Sx3RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6rt4-004DAb-5N; Fri, 23 Jul 2021 09:54:34 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6rsz-004D7L-Pt; Fri, 23 Jul 2021 09:54:31 +0000
Received: by mail-ot1-x32f.google.com with SMTP id
 o2-20020a9d22020000b0290462f0ab0800so1462038ota.11; 
 Fri, 23 Jul 2021 02:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5bndOuFZX3tiZBmJcO1TQjXh09mw6xwzbGzrURFBWw4=;
 b=OGfwqkbgF1tjhCLbVtickH2E5YJ3FaptPyEUgsChnGfDKEBnyvoSezdKA08OFY/F9c
 rnOABX6HJpFy1iy5XWYvOHQXHpR5S5WBN0/+oVqx35WiYg1MUFgfNk0m0D6+VIY3SSos
 kzmPvUG27pefM37stoDT3uvKdNrkiMq2WLBAu5JODSYGvvIW2k6jVEYFP4X6bI7bfjtH
 hCZota0zxq5/f74ziFvEGFvn99uZG0f/3SZxR5Km01OVzidzLKA80EPiL8uKojcbrvLr
 EdpZq2kZmtFgihZDfeqrTm17jXPJxZzxHubLCLycZFN0bz+1+19PtTzvYp7GzeqZ2OY9
 8Krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5bndOuFZX3tiZBmJcO1TQjXh09mw6xwzbGzrURFBWw4=;
 b=CzZC4bt+9A3Tej5lSTvtWlgn24hxqxjJv3MNqDDwvKJ9Kpay1Iaa4vCj6yBgZje7mb
 +zax00QYfGTTjQ3xIzm9a8/JhD7NphQ0IMghXb+aZgK8DmlmPaQqTJ00y8YeQlV0wuzc
 tP6Kq2miKMkb3aGd2T1UtscwBU79gYRXBo+5Q2mt/hhFxtjdesWjaEbP0o0ynLJ4r/yH
 CoNLx1h4UhT46WY1UoVsWXXrprhIQfSgHXRUl/3Z1izcQFK51nwjYn9gyIz+0DT6xk5P
 f2wP5PQcFFTb541B/h0nO9qYISTDi7j5LxT2DyLfP+TwuTN5DahLkpDbefZ1psLWcSqo
 vuVA==
X-Gm-Message-State: AOAM531VEnI3opcBEExGYlnWd1O0umdvxsz5D7PGRAUUWRQJ1/WabYP+
 Eb3FGrA3//yBKkXsN+OifarzpOutz+KBI/EGM9s=
X-Google-Smtp-Source: ABdhPJxyIuiIK8mtbPFlozBKzC68z5rXhaTfJeXWaPyq8oeJQuai1UiBZzvI0z3m1KDj7fGWx3TOJsb2yM7a6bwcV7U=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr2525083otb.281.1627034068504; 
 Fri, 23 Jul 2021 02:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210723094138.24793-1-Christine.Zhu@mediatek.com>
 <20210723094138.24793-3-Christine.Zhu@mediatek.com>
In-Reply-To: <20210723094138.24793-3-Christine.Zhu@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 23 Jul 2021 11:54:17 +0200
Message-ID: <CAFqH_539HesXQZz5F3mNXveHvHUjKTTBOkpZxmEf_BBOODHZcQ@mail.gmail.com>
Subject: Re: [v6, 2/3] dt-bindings: reset: mt8195: add toprgu reset-controller
 header file
To: Christine Zhu <Christine.Zhu@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 srv_heupstream <srv_heupstream@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree <devicetree@vger.kernel.org>, Seiya Wang <seiya.wang@mediatek.com>, 
 Rex-BC Chen <Rex-BC.Chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_025429_917488_F657BD6D 
X-CRM114-Status: GOOD (  17.00  )
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

Hi Christine,

Thank you for your patch.

Missatge de Christine Zhu <Christine.Zhu@mediatek.com> del dia dv., 23
de jul. 2021 a les 11:45:
>
> Add toprgu reset-controller header file for MT8195 platform
>
> Signed-off-by: Christine Zhu <Christine.Zhu@mediatek.com>
> ---
>  .../reset-controller/mt8195-resets.h          | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 include/dt-bindings/reset-controller/mt8195-resets.h
>
> diff --git a/include/dt-bindings/reset-controller/mt8195-resets.h b/include/dt-bindings/reset-controller/mt8195-resets.h

The DT binding includes for reset controllers are located in
`include/dt-bindings/reset/` Move the Mediatek reset constants there
instead of the `reset-controller`directory. We're doing this also for
current files that are there, see [1]

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20210714121116.v2.1.I514d9aafff3a062f751b37d3fea7402f67595b86@changeid/

> new file mode 100644
> index 000000000000..8176a3e5063f
> --- /dev/null
> +++ b/include/dt-bindings/reset-controller/mt8195-resets.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
> +/*
> + * This file is provided under a dual BSD/GPLv2 license.  When using or
> + * redistributing this file, you may do so under either licens

This is implicit in the SPDX-License-Identifier, so you can remove
these two lines.

Thanks,
  Enric

> + *
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Christine Zhu <christine.zhu@mediatek.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8195
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT8195
> +
> +#define MT8195_TOPRGU_CONN_MCU_SW_RST          0
> +#define MT8195_TOPRGU_INFRA_GRST_SW_RST        1
> +#define MT8195_TOPRGU_APU_SW_RST               2
> +#define MT8195_TOPRGU_INFRA_AO_GRST_SW_RST     6
> +#define MT8195_TOPRGU_MMSYS_SW_RST             7
> +#define MT8195_TOPRGU_MFG_SW_RST               8
> +#define MT8195_TOPRGU_VENC_SW_RST              9
> +#define MT8195_TOPRGU_VDEC_SW_RST              10
> +#define MT8195_TOPRGU_IMG_SW_RST               11
> +#define MT8195_TOPRGU_APMIXEDSYS_SW_RST        13
> +#define MT8195_TOPRGU_AUDIO_SW_RST             14
> +#define MT8195_TOPRGU_CAMSYS_SW_RST            15
> +#define MT8195_TOPRGU_EDPTX_SW_RST             16
> +#define MT8195_TOPRGU_ADSPSYS_SW_RST           21
> +#define MT8195_TOPRGU_DPTX_SW_RST              22
> +#define MT8195_TOPRGU_SPMI_MST_SW_RST          23
> +
> +#define MT8195_TOPRGU_SW_RST_NUM               16
> +
> +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8195 */
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
