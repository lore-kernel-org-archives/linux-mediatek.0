Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAA9C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 06:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4iB06pXs0HhkbSskOVTeJQAjw584XaavSKG58uCdIg0=; b=X5ce8I/XX4tGfc
	YXUEDciZ5OoYkKcFBfXlAYR5HEahygYYTxxC0Eytrmhw7HVrscvK7Eu7LIuyQGmi58Nv4ejI2uTEF
	xMhZmkNezRJsFaNMywpFEhD/1TpL0I5USyFJWuhhZU3EVpqN9wWGt0sc+J5rvpM/tk6OQ2FhQDDld
	tql0F/Qkh2naa8p06UWHnoD/bEAOZMAb3hKffwO+ZhUOiS3Qorlz10OSr34RZhEuZxX+HhjvikK5o
	0xE89ycgKDYm4mmycfALQylS95xNPhzGopH9oHWCIkZssCdRYZqTkishSdHwLndeoVQlVQijtH2aw
	QFYHob/TeyX2HHvBbcKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJrmC-000uYJ-VG; Tue, 15 Feb 2022 06:57:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJrly-000uQ2-2P; Tue, 15 Feb 2022 06:57:16 +0000
X-UUID: a00347130e5f4a7d9952f50725dd27c4-20220214
X-UUID: a00347130e5f4a7d9952f50725dd27c4-20220214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1487383475; Mon, 14 Feb 2022 23:57:11 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 22:57:09 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 15 Feb 2022 14:57:08 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 14:57:08 +0800
Message-ID: <73a6bfd04fb8e81e25e15ba686ba72a36d3899d2.camel@mediatek.com>
Subject: Re: [PATCH v3 20/31] clk: mediatek: mtk: Clean up included headers
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Tue, 15 Feb 2022 14:57:08 +0800
In-Reply-To: <20220208124034.414635-21-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-21-wenst@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_225714_158482_9320A8D4 
X-CRM114-Status: GOOD (  16.15  )
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

On Tue, 2022-02-08 at 20:40 +0800, Chen-Yu Tsai wrote:
> Some included headers aren't actually used anywhere, while other
> headers
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
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

Reviewed-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mtk.c | 13 ++++++-------
>  drivers/clk/mediatek/clk-mtk.h | 12 ++++++------
>  2 files changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mtk.c
> b/drivers/clk/mediatek/clk-mtk.c
> index f108786caeda..5618c84e4e08 100644
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
> diff --git a/drivers/clk/mediatek/clk-mtk.h
> b/drivers/clk/mediatek/clk-mtk.h
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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
