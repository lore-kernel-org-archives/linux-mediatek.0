Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD4BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 06:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZuPP7PCnfDlB1WrA4xUqZ9iVl4es92wPbKM7VdgcOA0=; b=pjxk99728INdV7
	ZTr+ks58tbXnCtYBYD4so6d0kuTHb/U8FtqqIqcMDxHcX+Z1FIFw3QgDhiftX2MKXutLLpV9ac2Sc
	4A+IFItUOKQLEpxpeRB40HRYQAdmIxSnMj58GpnDZOOLqjaF13TKHoH3LpVogfGaNWHxrgS+eqgAS
	xKimUA2HyzkWjS8/069bLswaeAs0bfWb/gHLnC6NfFOlCZQQ/RyZVppyx20qy0qaYDZ2gM9lUPl1O
	pZqD8o+8rMvRMKSTMIMvy2ECPDus+e33DddYmPmnXjluB4hzUDoWT2gO5gsrAa2elbjHWp1z4Mg/s
	4uP9Uc2mm7zFjTY9GI8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJrRh-000jHH-Aj; Tue, 15 Feb 2022 06:36:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJrQs-000iiz-Ut; Tue, 15 Feb 2022 06:35:35 +0000
X-UUID: 6457f4167e0e4a298e3b0cbf17baafbe-20220214
X-UUID: 6457f4167e0e4a298e3b0cbf17baafbe-20220214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1132317871; Mon, 14 Feb 2022 23:35:23 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 22:26:24 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 15 Feb 2022 14:26:23 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 14:26:23 +0800
Message-ID: <d40d0c2ddf7d59c53d12cb57a94608425d4d2de1.camel@mediatek.com>
Subject: Re: [PATCH v3 08/31] clk: mediatek: cpumux: Clean up included headers
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Tue, 15 Feb 2022 14:26:23 +0800
In-Reply-To: <20220208124034.414635-9-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-9-wenst@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_223527_033318_46B5A1BC 
X-CRM114-Status: GOOD (  15.71  )
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
> Some headers with the declaration of functions and structures aren't
> directly included. Explicitly include them so that future changes to
> other headers would not result in an unexpected build break.
> 
> On the header side, add forward declarations for any data structures
> whose pointers are used in function signatures. No headers are
> required.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

Reviewed-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-cpumux.c | 3 +++
>  drivers/clk/mediatek/clk-cpumux.h | 4 ++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-cpumux.c
> b/drivers/clk/mediatek/clk-cpumux.c
> index 344c6399b22f..658aee789f44 100644
> --- a/drivers/clk/mediatek/clk-cpumux.c
> +++ b/drivers/clk/mediatek/clk-cpumux.c
> @@ -5,8 +5,11 @@
>   */
>  
>  #include <linux/clk-provider.h>
> +#include <linux/container_of.h>
> +#include <linux/err.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
> +#include <linux/regmap.h>
>  #include <linux/slab.h>
>  
>  #include "clk-mtk.h"
> diff --git a/drivers/clk/mediatek/clk-cpumux.h
> b/drivers/clk/mediatek/clk-cpumux.h
> index a538f2bbef0d..b07e89f7c283 100644
> --- a/drivers/clk/mediatek/clk-cpumux.h
> +++ b/drivers/clk/mediatek/clk-cpumux.h
> @@ -7,6 +7,10 @@
>  #ifndef __DRV_CLK_CPUMUX_H
>  #define __DRV_CLK_CPUMUX_H
>  
> +struct clk_onecell_data;
> +struct device_node;
> +struct mtk_composite;
> +
>  int mtk_clk_register_cpumuxes(struct device_node *node,
>  			      const struct mtk_composite *clks, int
> num,
>  			      struct clk_onecell_data *clk_data);


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
