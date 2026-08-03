Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4834C55182
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 15:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LTxJzMwyKJ+KE+3ACQJ1eEMl59YLw7vdII78uf288/s=; b=kIEPitFNz2eC5HC3EfMv8UY42t
	EfJgdPKuGvQXCKXwbg5wqNEY/8LFzsGYcK+ovGJORDr9SwkgvjfL7Kj8ikllCav1cFgH9LdSXGaVj
	ggiYBNsmotejk+gs24UDOxDWSd2HWYxqLpxhKd/AG6n9R/qYwj9a9jR2RInyUxWT+5VIyNj5gcDp9
	JCbzsDnzUHgdkJNGc56dhxhNrPpxQd+aXafHK9QkCyJa1KVog/ecr6JB76HlfR/dFOXU0qYo9eEs6
	Oiwz98SSDQ0/TdROQ05O5gurzOfH1l6drZUY4IaarTJg+XH1UpuANomsAlkVza2FXJxFXN+ytJvh7
	9B/ylv8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquOx-0000000HUeb-3FSn;
	Mon, 03 Aug 2026 15:16:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquOv-0000000HUd9-14hQ
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 15:16:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785770184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LTxJzMwyKJ+KE+3ACQJ1eEMl59YLw7vdII78uf288/s=;
	b=ZpKfB+U98+GdcknEd45V5xdDKCUuzzQCu810D0LkTfHCXfmJQELfTOS2G0txXgEeWh/dcY
	cnTOyPlAx1WK+xocZ2icldZRj0O63TkevnXJ9tWe6TfUpSkotjnZb48T1W9SBhXip65Z5U
	LPCkV8HGggiQZtmDmQY3CVxxmpdiBeE=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-DdtdAlQwM5Ck5s9Ls5Bqvg-1; Mon, 03 Aug 2026 11:16:21 -0400
X-MC-Unique: DdtdAlQwM5Ck5s9Ls5Bqvg-1
X-Mimecast-MFC-AGG-ID: DdtdAlQwM5Ck5s9Ls5Bqvg_1785770181
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81e6abfca68so79973977b3.1
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 08:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785770180; x=1786374980;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LTxJzMwyKJ+KE+3ACQJ1eEMl59YLw7vdII78uf288/s=;
        b=XJlsOR+6P0R/GaQgl6O2DhnU/RYkTrUT97m5HRuZR26LgNw0HZLoRi1dcihhJTT5Up
         FIVA+dPJV+Zih6TiZcmLLfRt+wIDw4IwFVxDfU/oj6xGOSMg/kxNAYOPoKzUlG0Uqyzk
         f0lgIhjxZox2JQODhRixSBNbnA7a+nFX8wXZxTp2QIY5DTSqRM4R/4QBujLD752c2ZjM
         9MPqojOBztBDfpZZhx3pWJEfMm5avH6LyAg/jCbH5Cw/4X5CpHOhjfmGT/guztk3sNuZ
         zw9GPiKuRKqmPDUiJCT8oJI4TFPwz7J/s2K7cZ0lflXPXPA5pkzhqQ6Mjz7D6ldz3su7
         5CNw==
X-Forwarded-Encrypted: i=1; AHgh+RrlnMKuONni0UmrhS1K/C463GABrzY//cRbrgvr5i3pVwQcYuw8wYIFNTCooGOPHZcy93TnhiEx+g+sDQJ2og==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLLQf7FkbV4lZbRo/BUSKGN7S8Z4+Cza51QDWJ4DsGIHHwO6rs
	D+gIcDc/FCkwMKG+yLrzZoCZDAEiA3DBJV8e9XTo4JRLUlERhPaaDzeBsQ/Gp5EVhq+gBN6Ns8a
	yZCbnYTfAcgKikzNitGLGAGI3DF+aQ1jYPiXEM08SgKgGdkqDrIvewiIbJrb4LO7AI6KtwjVlag
	==
X-Gm-Gg: AR+sD11PJjuh0JJDbZAcXQHECG+/rtyKzfvDMYhUq9oXTtyL6jNcBJ4FFGeuZp+UHhD
	W8U7Uyn43ViQNVmxdWjKCkpl2zfL8srbHiDpU1EMbleqkjqDzXEDbLKww7D4ll7E6j514JPQGtp
	3n0UUwG5eWcM6dvwEgL8CK/iTmLn4sU0YWQoEHXRt4z6Dft9bcZ6fLugzFpJGc2MGG2Ma/b/HsZ
	0qtTbxyGZ49JhiZYEWW8R9A9O5zOhDS20+A6UK+AdveMa5NwPot5Smye4Ad3SendNfxxgk9YlXK
	y1hzHZZ4W6pet4/1+IT8OCo6g7l/AUE191RJBquTZQITlmEvgV3Ixr+knNZhLB0J6vsYRalYHjH
	1cXV9QsarOXrMBz82vqq1blrMmkE9srNHS/g=
X-Received: by 2002:a05:690c:6e0d:b0:7dc:aa85:5c67 with SMTP id 00721157ae682-81fd4ad3603mr135326977b3.11.1785770180473;
        Mon, 03 Aug 2026 08:16:20 -0700 (PDT)
X-Received: by 2002:a05:690c:6e0d:b0:7dc:aa85:5c67 with SMTP id 00721157ae682-81fd4ad3603mr135326267b3.11.1785770179868;
        Mon, 03 Aug 2026 08:16:19 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd123dacsm56520997b3.39.2026.08.03.08.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:16:19 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:16:16 -0400
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
Subject: Re: [PATCH v5 17/25] clk: mediatek: Add MT8189 topckgen clock support
Message-ID: <anCwwMRMYex2_eSN@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-17-ac4410697cc2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-17-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: n--g0paF7FCeVAUqr4rOcdrKG7sXt-KyOCHXFGLjQmw_1785770181
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_081625_384605_453AC4DE 
X-CRM114-Status: GOOD (  18.76  )
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

Hi Louis-Alexis,

On Sat, Aug 01, 2026 at 01:21:03PM +0200, Louis-Alexis Eyraud wrote:
> Add support for the MT8189 topckgen clock controller, which provides
> muxes and dividers for clock selection in other IP blocks.
> 
> Co-developed-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile              |    2 +-
>  drivers/clk/mediatek/clk-mt8189-topckgen.c | 1025 ++++++++++++++++++++++++++++
>  2 files changed, 1026 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 66577ccb9b93..9d3d2983bfb2 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -123,7 +123,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188_VDOSYS) += clk-mt8188-vdo0.o clk-mt8188-vdo1.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_VENCSYS) += clk-mt8188-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_VPPSYS) += clk-mt8188-vpp0.o clk-mt8188-vpp1.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_WPESYS) += clk-mt8188-wpe.o
> -obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o
> +obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8189-topckgen.c b/drivers/clk/mediatek/clk-mt8189-topckgen.c
> new file mode 100644
> index 000000000000..f25c0711512c
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-topckgen.c
> @@ -0,0 +1,1025 @@
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
> +#include <linux/clk.h>
> +#include <linux/delay.h>

Are these two headers needed?

> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>

And this one?

Brian


