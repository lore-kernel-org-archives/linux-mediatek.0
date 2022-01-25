Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF846C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 17:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b+Br19wlRDSv72I6wQTV1hf1PDPn3DCXviy2GihlnUw=; b=SssUzN73tLU1qz
	Tc0hwW7fWO30WCq4ffGWPegW62tLe1grxkNu3JESJ4z3MQ9cqIVpLVgKWsgw3YgXvNzQWjRNutmuX
	NhwPM5j1KKsgHc5op3mPiJvXZqtnXHeVeht1xp6UX4bbYV8NmmQXwqOVA9qihJ5VdbBb12IyXPDne
	SXScae6eKHOTiLIeI4IK7qVggdhhmccEN+GDtLDTZm6MDSWjM/1nChFB1pMPjL0ent6NH7+re7M1E
	YvKxcm6Bz4uqSXKGMNNX+JW5I1mEBt+wYFaAAbEiVg8kPboVDJ4S2ow700Cj5KMjpdxqr6droJLZ/
	nD19lGFQ2pN0q/VQjBlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCPpl-0095F7-EE; Tue, 25 Jan 2022 17:42:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCPpO-00959N-Vb; Tue, 25 Jan 2022 17:42:01 +0000
X-UUID: 0d2a258de3a34ee7922b9fa727728016-20220125
X-UUID: 0d2a258de3a34ee7922b9fa727728016-20220125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 73737421; Tue, 25 Jan 2022 10:41:55 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 09:38:38 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 26 Jan 2022 01:38:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 01:38:36 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH 11/31] clk: mediatek: mux: Clean up included headers
Date: Wed, 26 Jan 2022 01:38:36 +0800
Message-ID: <20220125173836.14548-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220122091731.283592-12-wenst@chromium.org>
References: <20220122091731.283592-12-wenst@chromium.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_094159_091784_0DE0F033 
X-CRM114-Status: GOOD (  16.93  )
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

Is this inspired by [1]?
[1] https://lore.kernel.org/lkml/YdIfz+LMewetSaEB@gmail.com/ 

> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mux.c | 11 +++++++----
>  drivers/clk/mediatek/clk-mux.h |  8 +++++++-
>  2 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
> index 2d4d8dc0120a..01af6a52711a 100644
> --- a/drivers/clk/mediatek/clk-mux.c
> +++ b/drivers/clk/mediatek/clk-mux.c
> @@ -4,13 +4,16 @@
>   * Author: Owen Chen <owen.chen@mediatek.com>
>   */
>  
> -#include <linux/of.h>
> -#include <linux/of_address.h>
> -#include <linux/slab.h>
> +#include <linux/clk-provider.h>
> +#include <linux/compiler_types.h>
> +#include <linux/container_of.h>
> +#include <linux/err.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/spinlock.h>
> +#include <linux/slab.h>
>  
> -#include "clk-mtk.h"
>  #include "clk-mux.h"
>  
>  struct mtk_clk_mux {
> diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
> index 38a2b6014b08..903a3c937959 100644
> --- a/drivers/clk/mediatek/clk-mux.h
> +++ b/drivers/clk/mediatek/clk-mux.h
> @@ -7,7 +7,13 @@
>  #ifndef __DRV_CLK_MTK_MUX_H
>  #define __DRV_CLK_MTK_MUX_H
>  
> -#include <linux/clk-provider.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +
> +struct clk;
> +struct clk_onecell_data;
> +struct clk_ops;
> +struct device_node;
>  
>  struct mtk_mux {
>  	int id;
> -- 
> 2.35.0.rc0.227.g00780c9af4-goog



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
