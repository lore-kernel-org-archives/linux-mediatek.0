Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842D5C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 06:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vnw8JYWmZP/fZYzemdty9MtOGR9/Vvi6egkJ5TAIcv8=; b=DklRNq5ohchHW8
	PVeKIfQqr1GYqfEfnEUISX0HOtT9KVxSDXDLixrue1TGzYpZn7OTunAyDX9RXkJqOkcwcBCXq3jLb
	ZfGhnxVdQ0+yX0ngauoamyv6tShqMTOoTr8D3onKe0JEFGaHFY8XlGhQ/hI8B9aXUotb/4Sfi3V61
	552vfp1gnkAQ4z4I6iJnDmnuGceyIRSebfdKQcdimhVAPikU6KE81T3aSWXnzaAtu0POOAaLBvB+Y
	54xk7AEx019+f84CMZGiRj3eooZVnHhiS012wvGX/GHk58OE1wEX0BUnP5gzSfTg5G6AN/Chg2hI5
	z/xGMkH8He8ECTHewXzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJrF7-000bbv-Dc; Tue, 15 Feb 2022 06:23:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJrEu-000bU0-Fo; Tue, 15 Feb 2022 06:23:05 +0000
X-UUID: a7328ac92f334962a464b62ff7d00178-20220214
X-UUID: a7328ac92f334962a464b62ff7d00178-20220214
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1526273963; Mon, 14 Feb 2022 23:22:59 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 22:22:58 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 14:22:57 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 14:22:56 +0800
Message-ID: <278b72f20ba57a72be325ec27f40c6d28cdabf9d.camel@mediatek.com>
Subject: Re: [PATCH v3 03/31] clk: mediatek: gate: Internalize clk
 implementation
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Tue, 15 Feb 2022 14:22:57 +0800
In-Reply-To: <20220208124034.414635-4-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-4-wenst@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_222304_567579_F136A1F7 
X-CRM114-Status: GOOD (  21.12  )
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
> struct mtk_clk_gate and mtk_clk_register_gate() are not used outside
> of
> the gate clk library. Only the API that handles a list of clks is
> used
> by the individual platform clk drivers.
> 
> Internalize the parts that aren't used outside of the implementation.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

Reviewed-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-gate.c | 35 ++++++++++++++++++++++---------
> --
>  drivers/clk/mediatek/clk-gate.h | 31 ++---------------------------
>  2 files changed, 25 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-gate.c
> b/drivers/clk/mediatek/clk-gate.c
> index 54921768bfba..e51cfd8c653c 100644
> --- a/drivers/clk/mediatek/clk-gate.c
> +++ b/drivers/clk/mediatek/clk-gate.c
> @@ -11,11 +11,28 @@
>  #include <linux/slab.h>
>  #include <linux/delay.h>
>  #include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
> +#include <linux/container_of.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
> +#include <linux/regmap.h>
>  
>  #include "clk-gate.h"
>  
> +struct mtk_clk_gate {
> +	struct clk_hw	hw;
> +	struct regmap	*regmap;
> +	int		set_ofs;
> +	int		clr_ofs;
> +	int		sta_ofs;
> +	u8		bit;
> +};
> +
> +static inline struct mtk_clk_gate *to_mtk_clk_gate(struct clk_hw
> *hw)
> +{
> +	return container_of(hw, struct mtk_clk_gate, hw);
> +}
> +
>  static u32 mtk_get_clockgating(struct clk_hw *hw)
>  {
>  	struct mtk_clk_gate *cg = to_mtk_clk_gate(hw);
> @@ -140,17 +157,12 @@ const struct clk_ops
> mtk_clk_gate_ops_no_setclr_inv = {
>  };
>  EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_no_setclr_inv);
>  
> -struct clk *mtk_clk_register_gate(
> -		const char *name,
> -		const char *parent_name,
> -		struct regmap *regmap,
> -		int set_ofs,
> -		int clr_ofs,
> -		int sta_ofs,
> -		u8 bit,
> -		const struct clk_ops *ops,
> -		unsigned long flags,
> -		struct device *dev)
> +static struct clk *mtk_clk_register_gate(const char *name,
> +					 const char *parent_name,
> +					 struct regmap *regmap, int
> set_ofs,
> +					 int clr_ofs, int sta_ofs, u8
> bit,
> +					 const struct clk_ops *ops,
> +					 unsigned long flags, struct
> device *dev)
>  {
>  	struct mtk_clk_gate *cg;
>  	struct clk *clk;
> @@ -180,7 +192,6 @@ struct clk *mtk_clk_register_gate(
>  
>  	return clk;
>  }
> -EXPORT_SYMBOL_GPL(mtk_clk_register_gate);
>  
>  int mtk_clk_register_gates_with_dev(struct device_node *node,
>  				    const struct mtk_gate *clks, int
> num,
> diff --git a/drivers/clk/mediatek/clk-gate.h
> b/drivers/clk/mediatek/clk-gate.h
> index 432b571d23b3..3d75521ba20c 100644
> --- a/drivers/clk/mediatek/clk-gate.h
> +++ b/drivers/clk/mediatek/clk-gate.h
> @@ -7,42 +7,15 @@
>  #ifndef __DRV_CLK_GATE_H
>  #define __DRV_CLK_GATE_H
>  
> -#include <linux/regmap.h>
>  #include <linux/clk-provider.h>
> -
> -struct clk;
> -
> -struct mtk_clk_gate {
> -	struct clk_hw	hw;
> -	struct regmap	*regmap;
> -	int		set_ofs;
> -	int		clr_ofs;
> -	int		sta_ofs;
> -	u8		bit;
> -};
> -
> -static inline struct mtk_clk_gate *to_mtk_clk_gate(struct clk_hw
> *hw)
> -{
> -	return container_of(hw, struct mtk_clk_gate, hw);
> -}
> +#include <linux/device.h>
> +#include <linux/of.h>
>  
>  extern const struct clk_ops mtk_clk_gate_ops_setclr;
>  extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;
>  extern const struct clk_ops mtk_clk_gate_ops_no_setclr;
>  extern const struct clk_ops mtk_clk_gate_ops_no_setclr_inv;
>  
> -struct clk *mtk_clk_register_gate(
> -		const char *name,
> -		const char *parent_name,
> -		struct regmap *regmap,
> -		int set_ofs,
> -		int clr_ofs,
> -		int sta_ofs,
> -		u8 bit,
> -		const struct clk_ops *ops,
> -		unsigned long flags,
> -		struct device *dev);
> -
>  struct mtk_gate_regs {
>  	u32 sta_ofs;
>  	u32 clr_ofs;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
