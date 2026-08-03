Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C85C55184
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 15:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfrwFppqeJr324Y3CbSyZQEjIv8H0QwZoY4+hT00zdY=; b=KmuvchRO6IFhC46K4pieRDS5Ik
	6qIAYClESbfIbFsXK+9bORuv3cnObM4CeDGYkWzdE5MJ1rmmOpqVhnOVE/Tr/vS/WfPnLocPpQp6J
	ev7cPapWAhtgVHQB1TJ7X9OHu6sMNisEUL1lJHeMM7pi7AyqGwUEsPrIeYI3Cf0H+qvmPMBA3Hkrs
	t7tpPa6HIJrFP6ZIKWnumge+1UMoyhy8Xuuxf63IN2Vb3xaqUWz9HlioFLQXtgPmOv4W8r3UPNPk5
	bJaRG4Z6b1rP96rfAUJxFrasaFI7ed0Bdn6rVfcIUDG8odvUZxMs1lVkajvnBZS86GpHerRL4LarR
	RNjBG++Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquS6-0000000HVQZ-2RZ7;
	Mon, 03 Aug 2026 15:19:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquS3-0000000HVON-3Pjk
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 15:19:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785770379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mfrwFppqeJr324Y3CbSyZQEjIv8H0QwZoY4+hT00zdY=;
	b=Aq03bMLYvnUBdewIaUTpgr7+x5kGUfOdZ6r2aEzLAJW1oz6Q+0LakpgZXvvqkFfDw85tfL
	2tDLXF5rQok+hzni4yQgU1UV16xo0H2NEoyZSz8SHEbu+cBkbFZ0AS5o7Fu86IxSS75XLb
	GogI8k7UKruRgzrYaVWgBdry/rHy8kU=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-S85BlbkCM3WWXNhWZOEpSQ-1; Mon, 03 Aug 2026 11:19:37 -0400
X-MC-Unique: S85BlbkCM3WWXNhWZOEpSQ-1
X-Mimecast-MFC-AGG-ID: S85BlbkCM3WWXNhWZOEpSQ_1785770377
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81bee860fb7so133697907b3.3
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 08:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785770377; x=1786375177;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mfrwFppqeJr324Y3CbSyZQEjIv8H0QwZoY4+hT00zdY=;
        b=CLTjeReb8hKKvUICw7Pv5n5khF+IiAZpntwKW9wvE4JVFHmJqULt5uN54+dj+aRlo7
         5hJeI290lGjsICC82R7QhsImrsds4CGKrcGjOy1dw1HqDUXYsKdXUf9NXVfbW+n9IQ6k
         +J/xSgn25Ykf/NspE+fFGLa90Pw8XVMXG+w/fcvLRaVr9pbBDTDHoqWbqYCb0OhCqXft
         ed6qMtpKAxUS+cJ8MXtlH3K4UxNLrktyahHTdpC4cIjKXT4pmOWv9BMb2WOgSfOgGUAO
         w3FEDfA9LMVJVrkB0SRgNVGdSQSXAWchtXQMf/NfOioUovm3BY0/IT2OFc3BYdk0y6eW
         UinA==
X-Forwarded-Encrypted: i=1; AHgh+RoY143o0X0fxg6PKvA1zwG8TvBoNJYt6jZbbUgFw1U830lxYfOJd2BQo4eoqHhMNmLQNYvTeQLxCgkAs/ZH5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxyAMh1LBM8Qh5Quzixyu7JXIGOoOoQCSOB1k/3wtelC0pJKaPc
	FwLK/3e4Na0FnLPMpbWds7YF7JpPzgRnUXfnTwHKLcdxpi5ZvBjV6V7QkWO9+oqnjgiHOucFkMS
	xwd+b6wLzEuJHNcZ4iZozbHtgCL37JOOMRF0ub4hIOhkAr/6Wl6zvA1GhokTS0tlVDc4qTM9oSA
	==
X-Gm-Gg: AR+sD13/ATVmGoSNhszp55/xjJvFQyGUyblhFSd69Mlc4F/5VaNOHjpsnnHAm3zXt1b
	PIjPpnkkP/iPHtOS2dQkDFYRuTAovXDv1Z27yrAOAyVNURH3SrWxS4TxxAuNGFUh8DOTglZTLTa
	MNZj4LwVegJuzNIfMm5pby3IF4xQnERADiISwjXvb7CYeOFMxR65p+PLpxyfCw/aEytih16jGk2
	23jlmDUBllN3kQfgzwj7VD90l+bCK07wBZqIAv9B1a2BuqhLNML6PBTHhv5A2h6bHYLuVrkt1DU
	4CrQKYYgVqpp93A9QaVXQAQX1fLm7cHzYLqAX+/ho/lg9596eU0tEnoxAkn20LLiCnOzcM/pwBQ
	zx1MezEFl1wU9FF44o2Lv+75C9IQNum21+eI=
X-Received: by 2002:a05:690c:278a:b0:81c:a61e:6309 with SMTP id 00721157ae682-81fd4bee7cfmr133566897b3.32.1785770376554;
        Mon, 03 Aug 2026 08:19:36 -0700 (PDT)
X-Received: by 2002:a05:690c:278a:b0:81c:a61e:6309 with SMTP id 00721157ae682-81fd4bee7cfmr133566557b3.32.1785770376131;
        Mon, 03 Aug 2026 08:19:36 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf2e2b0sm55932967b3.8.2026.08.03.08.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:19:35 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:19:33 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Irving-CH Lin <irving-ch.lin@mediatek.com>
Subject: Re: [PATCH v5 19/25] clk: mediatek: Add MT8189 vlpcfg clock support
Message-ID: <anCxhZEK9Rh1H4U9@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-19-ac4410697cc2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-19-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: D4b4v3YT0HLS73Y9YHLJqWiNO8chJJ8VKYSsDmLHPFQ_1785770377
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_081940_049929_4A3B7909 
X-CRM114-Status: GOOD (  18.12  )
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

On Sat, Aug 01, 2026 at 01:21:05PM +0200, Louis-Alexis Eyraud wrote:
> Add support for the MT8189 vlpcfg clock controller,
> which provides clock gate control for vlp domain IPs.
> 
> Co-developed-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile            |   2 +-
>  drivers/clk/mediatek/clk-mt8189-vlpcfg.c | 116 +++++++++++++++++++++++++++++++
>  2 files changed, 117 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 3b25df9e7b50..d9279b237b7b 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -124,7 +124,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188_VENCSYS) += clk-mt8188-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_VPPSYS) += clk-mt8188-vpp0.o clk-mt8188-vpp1.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_WPESYS) += clk-mt8188-wpe.o
>  obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o \
> -				   clk-mt8189-vlpckgen.o
> +				   clk-mt8189-vlpckgen.o clk-mt8189-vlpcfg.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8189-vlpcfg.c b/drivers/clk/mediatek/clk-mt8189-vlpcfg.c
> new file mode 100644
> index 000000000000..cc4ebfd46a6f
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-vlpcfg.c
> @@ -0,0 +1,116 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025-2026 MediaTek Inc.
> + *                    Qiqi Wang <qiqi.wang@mediatek.com>
> + *                    Irving-CH Lin <irving-ch.lin@mediatek.com>
> + * Copyright (C) 2026 Collabora Ltd.
> + *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> + *                    Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>

of_device.h is deprecated. You can drop this one since what you need
will be provided by platform_device.h.

With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>


