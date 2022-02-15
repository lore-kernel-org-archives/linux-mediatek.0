Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5E0C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 06:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UozmV/zUA6YWBZ+4MpOZKDtsu3RTgi3iEueeBnGDAJ8=; b=iAjViI9dR0M/Q0
	7LaECOv56QXR2WeAQVFlDQytxNQ9o1RjbE/h3knSkBksQtZAkJj8FZQzSzQaz0fXq41onTD/vKTYU
	d7NI9N2k0gSv3SAwDAhMyV/U+PkdoQR0Q2NJNeN+9wwQVv3YXXO9cBh00KlIqID+hsJFOnHmxWBCh
	JlfO8fFuCvvOB1P4BiQmJPMI2ABMlkUPgzN2n7NUXRuNMqxjcHBLZhmb6JuZtKohP06BqOSg7ZEXX
	Xsh7+pH/wiEUup0kRKxc1VrLWwMbb4do5ysLeGaPsf4VdClIov9i0lXKAPuWds/8eWB2Fvm2vxfmr
	tNRRsuyPP3G+HJT16vYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJrM9-000etg-7F; Tue, 15 Feb 2022 06:30:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJrLl-000efs-SA; Tue, 15 Feb 2022 06:30:12 +0000
X-UUID: 142c0c62bf1e4d55b17794760664e159-20220214
X-UUID: 142c0c62bf1e4d55b17794760664e159-20220214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 843566341; Mon, 14 Feb 2022 23:30:05 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Feb 2022 22:25:57 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 14:25:55 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 14:25:55 +0800
Message-ID: <89214251d40f78f5a11499c88a71cc7bf58e98de.camel@mediatek.com>
Subject: Re: [PATCH v3 07/31] clk: mediatek: cpumux: Internalize struct
 mtk_clk_cpumux
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Tue, 15 Feb 2022 14:25:55 +0800
In-Reply-To: <20220208124034.414635-8-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-8-wenst@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_223009_939650_73E4347E 
X-CRM114-Status: GOOD (  17.02  )
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
> struct mtk_clk_cpumux is an implementation detail of the cpumux clk
> type, and is not used outside of the implementation.
> 
> Internalize the definition to minimize leakage of details and shrink
> the header file.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

Reviewed-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-cpumux.c | 8 ++++++++
>  drivers/clk/mediatek/clk-cpumux.h | 8 --------
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-cpumux.c
> b/drivers/clk/mediatek/clk-cpumux.c
> index 99a819e3673f..344c6399b22f 100644
> --- a/drivers/clk/mediatek/clk-cpumux.c
> +++ b/drivers/clk/mediatek/clk-cpumux.c
> @@ -12,6 +12,14 @@
>  #include "clk-mtk.h"
>  #include "clk-cpumux.h"
>  
> +struct mtk_clk_cpumux {
> +	struct clk_hw	hw;
> +	struct regmap	*regmap;
> +	u32		reg;
> +	u32		mask;
> +	u8		shift;
> +};
> +
>  static inline struct mtk_clk_cpumux *to_mtk_clk_cpumux(struct clk_hw
> *_hw)
>  {
>  	return container_of(_hw, struct mtk_clk_cpumux, hw);
> diff --git a/drivers/clk/mediatek/clk-cpumux.h
> b/drivers/clk/mediatek/clk-cpumux.h
> index fda7770fd803..a538f2bbef0d 100644
> --- a/drivers/clk/mediatek/clk-cpumux.h
> +++ b/drivers/clk/mediatek/clk-cpumux.h
> @@ -7,14 +7,6 @@
>  #ifndef __DRV_CLK_CPUMUX_H
>  #define __DRV_CLK_CPUMUX_H
>  
> -struct mtk_clk_cpumux {
> -	struct clk_hw	hw;
> -	struct regmap	*regmap;
> -	u32		reg;
> -	u32		mask;
> -	u8		shift;
> -};
> -
>  int mtk_clk_register_cpumuxes(struct device_node *node,
>  			      const struct mtk_composite *clks, int
> num,
>  			      struct clk_onecell_data *clk_data);


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
