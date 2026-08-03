Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBD7C55182
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 15:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CISqUyNrQHnuig4NG6zWObmoUM7qsn/M6rO8iF8GMa0=; b=2AnhePsFbJhtkVA0WTY37hdC8m
	ERJwqF3Qxo17p7smxLCOSjLh3EU9igkJqP6PFf4Y84qtEuxgjxEYDap9RCGncdXWhy+DlZbklkYGn
	Jht2BjZZXlsNY4bjNae0y5Mh+KclHpWkIFPzgoN+lxokVLB7XzIa4n5ifa/VfU13ap8NwM0HqMjkv
	3Hx3gmEtOtyO0eAomNAuuYMbcBOv0p88n/dz8yybn5eib7FOxJbGgIDz9mxR4HdO+UR+43F+xwzFG
	VqHzpd9bDvNwLvfVWuRTOgT5s4yZyl1zCWOMhKnyWSYqZNp+m8JEcQJ0+ysDjFzZB9SrAg1jWRVcn
	AXitYlIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquQ2-0000000HUr7-1aSU;
	Mon, 03 Aug 2026 15:17:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquQ0-0000000HUq9-2pVr
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 15:17:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785770251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CISqUyNrQHnuig4NG6zWObmoUM7qsn/M6rO8iF8GMa0=;
	b=fq+uo//qv9QSLzp0diMsILKSrb7IkWINacP4lzjzKtBIO9Ulh7C+t0Y/VCpykpWgco3JpD
	5Xf8zL3KrfK2H9O6cfeWMPja9llx6xDswtRPwTiXbcRmirF3keeDY49JhqiRwbFSBG2nUc
	J3t3mHnpws4aCe0wNOFPLYOd60kWMGU=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-xNJoCwYcPNymyoHDl_CHXA-1; Mon, 03 Aug 2026 11:17:19 -0400
X-MC-Unique: xNJoCwYcPNymyoHDl_CHXA-1
X-Mimecast-MFC-AGG-ID: xNJoCwYcPNymyoHDl_CHXA_1785770238
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81eb7dc4e28so126212117b3.0
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 08:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785770238; x=1786375038;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CISqUyNrQHnuig4NG6zWObmoUM7qsn/M6rO8iF8GMa0=;
        b=WneU3wzLDHElS596qNBZOc1xAhwjHCVH8Qj+hl/aUiegQp4YWaxmS+ZeVublfV15lM
         bPn+oWOVAXNJWQvTBn6P9MLkrE+tkY/HXN8VT9BQxC0Auqycg6SDPiddvyebqSlZUYQm
         GT05R0ZQIfXCskg6PmW/AlOLdxNpDXQ4lQ0gonDwkxLZRpiM1+YAd8tbuxtl7Cn6tnhp
         fYAuSF3MqmKCnFQ50ixlsF/KKKBKLfxGsHarD1c1InJLiYjCrVqAH87zHJAGcDPTuQ6D
         0Un66Xq2Ou8lAdVoVjDLt2C2ZEjkJlCI5Y8YqESZynk1Ibb7/YrZN+++Ud/Fm9SrEO69
         1vdg==
X-Forwarded-Encrypted: i=1; AHgh+RpJu7w1L/Vvdmb1RpKwXAQMfEirCPkpdKSAU6ghc3ihMdMdxSEDJUiiRAWnPZylxe1vhRAtLOo6EJ0KQsdZ5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx90ZgmssXopOAV5xTC11eLLvzdUfoZGnOLCQJEgUvNc7SYpzeH
	Fm5g4n23YXEgnZm3yrS0Etb6s8wHXv0PWlHV3lekZAWoHd4PQmWTfqIJHoCgQuAAPYJI+dCSNWy
	as//GAY0qPgZM3dN3mZv9DL9MPXsT1Wc8Mrz3FZsRtBcvWGKGWFyv/DXhDF5IwLsQxTWGFc+pcA
	==
X-Gm-Gg: AR+sD10BGL6Hqp6edYxDhdSr19xKklAtW7zG+S/hmN33XX825v5ilhrY7/82HsYUrls
	nIRW658O9pOVLkYbSAdhD9lNsqycza+WDqU1CBCa4U1wRCSb9vd0zENQG55Ue+Rc32W0Cg2VloG
	OXfuBIBZkfaPt9au3qnIBZsDxyCt3Jn8lOEB0m+J/sKg9imd8pSVG8YVNoWaOIORnWIil5QfkUx
	Q9ADR0shGk8ga+REWXUlCJj7/lJWEvdDHyds+hocq9SGHSAGtKBmoR0oaviiZcsaD12QeKRZETc
	qy5WWq+s+rnYvbJSMr2b/RCZeplpUmV3hQ4ozBpEEB0BizXmOlR6Mj3ib33I4diD2i7hBvj9ncG
	7jfmIzaKJT9w7dnwxpYas7lTctnubhxCmWAY=
X-Received: by 2002:a05:690c:450d:b0:7d1:dd7b:b734 with SMTP id 00721157ae682-81fd4b5a2c8mr136703437b3.23.1785770238462;
        Mon, 03 Aug 2026 08:17:18 -0700 (PDT)
X-Received: by 2002:a05:690c:450d:b0:7d1:dd7b:b734 with SMTP id 00721157ae682-81fd4b5a2c8mr136702797b3.23.1785770237899;
        Mon, 03 Aug 2026 08:17:17 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf2e239sm57358447b3.5.2026.08.03.08.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:17:17 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:17:14 -0400
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
Subject: Re: [PATCH v5 18/25] clk: mediatek: Add MT8189 vlpckgen clock support
Message-ID: <anCw-ozpIjYfan5O@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-18-ac4410697cc2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-18-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -CSstPRKtsQPgWBhq7v5slNAg2ZVjJCgDBq1_3XaW2s_1785770238
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_081732_802625_FFD04415 
X-CRM114-Status: GOOD (  19.54  )
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

On Sat, Aug 01, 2026 at 01:21:04PM +0200, Louis-Alexis Eyraud wrote:
> Add support for the MT8189 vlpckgen clock controller, which provides
> muxes and dividers for clock selection in vlp domain for other IP blocks.
> 
> Co-developed-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile              |   3 +-
>  drivers/clk/mediatek/clk-mt8189-vlpckgen.c | 285 +++++++++++++++++++++++++++++
>  2 files changed, 287 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 9d3d2983bfb2..3b25df9e7b50 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -123,7 +123,8 @@ obj-$(CONFIG_COMMON_CLK_MT8188_VDOSYS) += clk-mt8188-vdo0.o clk-mt8188-vdo1.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_VENCSYS) += clk-mt8188-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_VPPSYS) += clk-mt8188-vpp0.o clk-mt8188-vpp1.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_WPESYS) += clk-mt8188-wpe.o
> -obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o
> +obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o clk-mt8189-topckgen.o \
> +				   clk-mt8189-vlpckgen.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8189-vlpckgen.c b/drivers/clk/mediatek/clk-mt8189-vlpckgen.c
> new file mode 100644
> index 000000000000..8eda5331972e
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-vlpckgen.c
> @@ -0,0 +1,285 @@
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
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>

There are also some headers that can likely be dropped here as well. I'm
not going to comment on this on any other patches. I'll just list any
new issues I see.

Brian


