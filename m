Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26E2C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 06:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=geCEqwunog6xSh1fUGO6Y5b4mbk/1SNF+xW6FgW//mk=; b=S5uCv/mmJBO+pb
	QcdUAHoArhd4q4DxKJ9RXVxisGjYLglBm332HbbiZObGVBCLrenRf+7czKm/h++QyffXrIxu9JTRV
	5rMq83LQ3fVD81op6taa2nQyByUAqUTby9UZSaNqZ0t7AgfJIp8J4soa8UFLyba9rXWqhTaqGk44+
	t1vEXBPyWCD0lUpVH4W/h6eL8vOeLT0r29dMrAN/CrPvy4p9nJeVckTNmQrdHOqv4e5juol2I2uSs
	dFSvUZCtL1Ggcd4yTTy8ukv4okuMdZVrSdkfdyymw4LYIDnt6jSheiJ7t/ZPIS8CBmIE8AsBkyMR/
	bbAasuiGArPTgyhVYTjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJrMU-000f8O-Es; Tue, 15 Feb 2022 06:30:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJrMF-000eyE-QK; Tue, 15 Feb 2022 06:30:41 +0000
X-UUID: ee5650d0b9c1429baf6afd6eacb8262d-20220214
X-UUID: ee5650d0b9c1429baf6afd6eacb8262d-20220214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1586090747; Mon, 14 Feb 2022 23:30:37 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 22:24:41 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 15 Feb 2022 14:24:40 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 14:24:39 +0800
Message-ID: <4b0f347eb09a156e848dc89174e0123b9a37b14d.camel@mediatek.com>
Subject: Re: [PATCH v3 05/31] clk: mediatek: gate: Clean up included headers
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Tue, 15 Feb 2022 14:24:40 +0800
In-Reply-To: <20220208124034.414635-6-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-6-wenst@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_223039_877532_1A294C79 
X-CRM114-Status: GOOD (  15.80  )
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
>  drivers/clk/mediatek/clk-gate.c | 11 +++--------
>  drivers/clk/mediatek/clk-gate.h | 10 +++++++---
>  2 files changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-gate.c
> b/drivers/clk/mediatek/clk-gate.c
> index ed1ad5535d41..e8881ae1489a 100644
> --- a/drivers/clk/mediatek/clk-gate.c
> +++ b/drivers/clk/mediatek/clk-gate.c
> @@ -4,18 +4,13 @@
>   * Author: James Liao <jamesjj.liao@mediatek.com>
>   */
>  
> -#include <linux/of.h>
> -#include <linux/of_address.h>
> -
> -#include <linux/io.h>
> -#include <linux/slab.h>
> -#include <linux/delay.h>
> -#include <linux/clkdev.h>
>  #include <linux/clk-provider.h>
> -#include <linux/container_of.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
> +#include <linux/printk.h>
>  #include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
>  
>  #include "clk-gate.h"
>  
> diff --git a/drivers/clk/mediatek/clk-gate.h
> b/drivers/clk/mediatek/clk-gate.h
> index 344adffb6578..6b5738826a22 100644
> --- a/drivers/clk/mediatek/clk-gate.h
> +++ b/drivers/clk/mediatek/clk-gate.h
> @@ -7,9 +7,13 @@
>  #ifndef __DRV_CLK_GATE_H
>  #define __DRV_CLK_GATE_H
>  
> -#include <linux/clk-provider.h>
> -#include <linux/device.h>
> -#include <linux/of.h>
> +#include <linux/types.h>
> +
> +struct clk;
> +struct clk_onecell_data;
> +struct clk_ops;
> +struct device;
> +struct device_node;
>  
>  extern const struct clk_ops mtk_clk_gate_ops_setclr;
>  extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
