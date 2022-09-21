Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05A5ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 08:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSFzolpTBXM61aiBcOXLmXOa2FIEnY/H0epZStkh+ck=; b=xsW4AQned2jk4007+XVAHC9RRk
	vmxWXTwzIaYl7hu1BVJqe7t8yCszVqvWYmS0U4Tsadjcq09PufKjRJ3NqONGTx3k2GCcK3TREIY0W
	T0flqOjAXZvGTlj1yDjrNkSWDZU97jWC9ytTXIrTV7rd+sCQhGk24sa3lx3nWvAb0n+pqoIC0WJQo
	RSUdG3oE1dTlbYLsWAl+ypcSQMTFKSK/be1WaOs/saNc6ij+9b3BpuJ00JAqhtUkuxCFuOWZbNmqa
	FNEYK+Z+aKQtG12ex+4nhiuOwJmqVZIqNrv7DH5Tpwu64G+C6aX+FOPlgUrdkQ+XpiDw/8OgI9ZH5
	4YK03zlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oav3j-009wPh-Dl; Wed, 21 Sep 2022 08:26:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oautU-009rJO-LI; Wed, 21 Sep 2022 08:15:46 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C3DC36601F3F;
	Wed, 21 Sep 2022 09:15:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663748143;
	bh=XH9jh6d/hbkh2EaYj2CvFnDhMpxuJds1twj/Gjm5QII=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n6N75gL0cvd7s2ORUOI6HiDaAATa+J+CFW2qnVM07rXmVNZdqrxfaQ/SnVqiAR3Ui
	 KrKJAZfDhqFDlTbrqYYMFygw5NGnBObQ6i57rbeTQxXi33u4qix6JWe3HPs+Q+OFv0
	 9b2nJT8Hl0DQbgkhUEqhuMyPYbIYKK+xYr765lsey+cKk0LdXt9S6T10WcQrDDpqbE
	 X2qV1/Mp5jC7hS3CdH/pfQMDVRPuINTxtihbx5kkezlXKdIBOWYPZdQ+pfHeDvYCdL
	 iD+kdPhLt7PxdbkFAjdJ79s7ZhLFWQBgKv0Jk7+PP8LmRoJRr/Cne0Bx42srTYeoAk
	 p2LYSYU+7SK8g==
Message-ID: <2d13b383-7d25-240b-bdbb-e53848df4d47@collabora.com>
Date: Wed, 21 Sep 2022 10:15:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 01/18] phy: mediatek: add a new helper to update bitfield
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jitao Shi <jitao.shi@mediatek.com>, Stanley Chu <stanley.chu@mediatek.com>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
 <20220920090038.15133-2-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220920090038.15133-2-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_011544_893456_81B9D38D 
X-CRM114-Status: GOOD (  14.75  )
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

Il 20/09/22 11:00, Chunfeng Yun ha scritto:
> Due to FIELD_PREP() macro can be used to prepare a bitfield value,
> local ones can be remove; add the new helper to make bitfield update
> easier.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>   drivers/phy/mediatek/phy-mtk-io.h | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-io.h b/drivers/phy/mediatek/phy-mtk-io.h
> index 500fcdab165d..a723d4afc9b4 100644
> --- a/drivers/phy/mediatek/phy-mtk-io.h
> +++ b/drivers/phy/mediatek/phy-mtk-io.h
> @@ -8,6 +8,7 @@
>   #ifndef __PHY_MTK_H__
>   #define __PHY_MTK_H__
>   
> +#include <linux/bitfield.h>
>   #include <linux/io.h>
>   
>   static inline void mtk_phy_clear_bits(void __iomem *reg, u32 bits)
> @@ -35,4 +36,10 @@ static inline void mtk_phy_update_bits(void __iomem *reg, u32 mask, u32 val)
>   	writel(tmp, reg);
>   }
>   
> +/* field @mask should be constant and continuous */

"Field @mask shall be [...]"
              ^^^^^

> +static inline void mtk_phy_update_field(void __iomem *reg, u32 mask, u32 val)

...so, (void __iomem *reg, const u32 mask, u32 val)

> +{
> +	mtk_phy_update_bits(reg, mask, FIELD_PREP(mask, val));
> +}
> +
>   #endif



