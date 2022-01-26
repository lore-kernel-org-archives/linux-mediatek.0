Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5ABC28CF5
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 07:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6TZKuY6v2Ytb98gCzYF8LuisIYXgwXHVE88cq8GJkM=; b=MBVJNaVma5VXfD
	fO3GTV6+eeLeCGZC4koBPa/jsnMmTdb6LvdKqUWXh3Y/q3GUH2NM5XgzsfN9QrxWd4VL7+P84L+sq
	CX/AX9nR/RA6wEcKm+RE9WkShlW0Fx94sZlZRLUlnCDnHXVSeRLgYf8Q0MBOaFG/1w8b67HgtsbCQ
	Q5RvIVOtbB1S3KeDC1vIgxYodL95wc3g7kmIr8jFDZ33CCzCtMXMRN7/MC28LMdmWhEvJeK6A8yyy
	Yd8TLzBtibPyGItlqy/Ta2KW+WPTfEJaCebv1DkBdJd0UcYltsuhfIyfXwW6J8pTCrXGnrjAfYts1
	yanrEzNBTa0xP2A51kdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCcrl-00AZug-Dy; Wed, 26 Jan 2022 07:37:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCcrT-00AZqu-Jq; Wed, 26 Jan 2022 07:37:03 +0000
X-UUID: bccfde4bdf604cdea64d51f3869f98b2-20220126
X-UUID: bccfde4bdf604cdea64d51f3869f98b2-20220126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 649893314; Wed, 26 Jan 2022 00:36:56 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 23:26:54 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 26 Jan 2022 15:26:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 15:26:47 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH 20/31] clk: mediatek: mtk: Clean up included headers
Date: Wed, 26 Jan 2022 15:26:47 +0800
Message-ID: <20220126072647.8794-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220122091731.283592-21-wenst@chromium.org>
References: <20220122091731.283592-21-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_233659_698056_AA487B87 
X-CRM114-Status: GOOD (  16.61  )
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

> Some included headers aren't actually used anywhere, while other headers
> with the declaration of functions and structures aren't directly
> included.
> 
> Get rid of the unused ones, and add the ones that should be included
> directly.
> 
> On the header side, replace headers that are included purely for data
> structure definitions with forward declarations. This decreases the
> amount of preprocessing and compilation effort required for each
> inclusion.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mtk.c | 13 ++++++-------
>  drivers/clk/mediatek/clk-mtk.h | 12 ++++++------
>  2 files changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
> index cd76e1d80242..d2c50186cceb 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -4,17 +4,16 @@
>   * Author: James Liao <jamesjj.liao@mediatek.com>
>   */
>  
> -#include <linux/of.h>
> -#include <linux/of_address.h>
> +#include <linux/bitops.h>
> +#include <linux/clk-provider.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
> -#include <linux/slab.h>
> -#include <linux/delay.h>
> -#include <linux/clkdev.h>
> -#include <linux/module.h>
>  #include <linux/mfd/syscon.h>
> -#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
>  
>  #include "clk-mtk.h"
>  #include "clk-gate.h"
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
> index 4fa658f5d934..7f902581a115 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -7,19 +7,19 @@
>  #ifndef __DRV_CLK_MTK_H
>  #define __DRV_CLK_MTK_H
>  
> -#include <linux/regmap.h>
> -#include <linux/bitops.h>
>  #include <linux/clk-provider.h>
> -#include <linux/platform_device.h>
> -
> -struct clk;
> -struct clk_onecell_data;
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
>  
>  #define MAX_MUX_GATE_BIT	31
>  #define INVALID_MUX_GATE_BIT	(MAX_MUX_GATE_BIT + 1)
>  
>  #define MHZ (1000 * 1000)
>  
> +struct platform_device;
> +
>  struct mtk_fixed_clk {
>  	int id;
>  	const char *name;
> -- 
> 2.35.0.rc0.227.g00780c9af4-goog



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
