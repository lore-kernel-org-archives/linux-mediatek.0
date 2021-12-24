Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3214C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Dec 2021 10:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7geLvZMZPSlNrJ5ibp78mTM8h5P/KD1y35CVTr+u+E=; b=FZnxc54VsTJVbTivxpU6zvg7Ru
	eRGsasPSkmocPA9MZYigMx1CQiA4Iu7dc7u1BjLhCgWEA9ENXB7DG9vZV8QP+eFyDV1aV8I8cARM0
	+oTTh3tFhA7pZzATnU7dZ0gsuoVDM1ApGKeBy0tYJvi2kTh+7XN32I0UslZGhGQRTFUnKA9OW3ssZ
	V95CtpnTImKv5i890995kGqzEjoRoHvuGxlj+xH8QBk9/zkOSPgOFeiobHMjWsCTPiA7SMJqieL4x
	bF3h7LVQFUxvFJIyy7P3THU2WXQ7QNc/uLlkv4w8Kqk03vukoL1Wq9or1BV5p3EwnQPTR4FPsv6Li
	mzqa0LfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0hXa-00E55R-5H; Fri, 24 Dec 2021 10:11:10 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0hXO-00E53x-RJ; Fri, 24 Dec 2021 10:11:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1ABC71F45CC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1640340657;
 bh=K0vduRr/PSyXSZURCDSAe+4sfJYS7J60lk/6WQDlpcg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Saf556NNDqc6qq6vvuZBsNYtzw57NQTrKeXFn4aAec/8HBh4iAWReD8sZs9xgU8Nu
 xLRC1NCzZVVeonuR9yQrkIyt6WVRl/S5c4SOoP8Zdt9J+livMZeYY68KMmikJRXrHz
 9ywxUk7maA0wLDh5MYrB/Gy4BqbLvodZC1r+07qicypwrN+EIj7fDZTkBmOgvxf8CO
 Mmb7WZ9qujweXRcsmP4NhbHHOuUXV+YJeRX9rC+tuIMmsfgwJd+kaSO0G//BmwXATl
 9f2E06nsVksHSw0Db0SZDDDUgmeztKBTjzFOjScFAeFJ1lVJSLNZ8afUQSScBzqBbv
 UqnEvHjWD54fg==
Subject: Re: [PATCH v2 3/5] phy: mediatek: add helpers to update bits of
 registers
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>
References: <20211218082802.5256-1-chunfeng.yun@mediatek.com>
 <20211218082802.5256-3-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <047803b9-d09f-d4f8-a674-317cc19dd055@collabora.com>
Date: Fri, 24 Dec 2021 11:10:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211218082802.5256-3-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_021059_055348_5376013D 
X-CRM114-Status: GOOD (  17.93  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/12/21 09:28, Chunfeng Yun ha scritto:
> Add three helpers mtk_phy_clear/set/update_bits() for registers operation
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: new patch, add register access helpers,
>      Add updatel() macro suggested by Vinod, here add more ones instead.
> ---
>   drivers/phy/mediatek/phy-mtk-io.h | 38 +++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
>   create mode 100644 drivers/phy/mediatek/phy-mtk-io.h
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-io.h b/drivers/phy/mediatek/phy-mtk-io.h
> new file mode 100644
> index 000000000000..500fcdab165d
> --- /dev/null
> +++ b/drivers/phy/mediatek/phy-mtk-io.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + *
> + * Author: Chunfeng Yun <chunfeng.yun@mediatek.com>
> + */
> +
> +#ifndef __PHY_MTK_H__
> +#define __PHY_MTK_H__
> +
> +#include <linux/io.h>
> +
> +static inline void mtk_phy_clear_bits(void __iomem *reg, u32 bits)
> +{
> +	u32 tmp = readl(reg);
> +
> +	tmp &= ~bits;
> +	writel(tmp, reg);
> +}
> +
> +static inline void mtk_phy_set_bits(void __iomem *reg, u32 bits)
> +{
> +	u32 tmp = readl(reg);
> +
> +	tmp |= bits;
> +	writel(tmp, reg);
> +}
> +
> +static inline void mtk_phy_update_bits(void __iomem *reg, u32 mask, u32 val)
> +{
> +	u32 tmp = readl(reg);
> +
> +	tmp &= ~mask;
> +	tmp |= val & mask;
> +	writel(tmp, reg);
> +}
> +
> +#endif
> 

These helpers are almost exactly duplicating what regmap_update_bits() is doing.
I appreciate the effort to stop open-coding the same sequences over and over by
adding such helper functions, but I think that the proper way of doing what you
are proposing is not to add custom functions but rather reuse what the Linux APIs
give you.

What about doing a conversion to use regmap on this driver?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
