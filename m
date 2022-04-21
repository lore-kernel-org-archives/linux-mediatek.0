Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2BFC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 09:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZULzjMsq+P/at6UXFU6oW9r1EFuPBKJCwMdmQLF1lRE=; b=eCFkjCI+JrCgsl
	DGRbdxVwWzgsE6XI6OteLd7VuLW9YVzoBrqcvHwK8DJ5QpD/4W3cnG3nm0zrH0CmWdvGtrDFdGcdj
	I5pMmgnwc0bTAcv1woippB/Ga5rio1S2Z4rjDhuHgtDXwjV7b6SVk1aderJUdCBi0usGSgsC6h06p
	jeWcfaMajrVK4IDuiefjc/0uC36Pl3C4OiBjSIHdKYSNCju4aJqv11A02zmfLGwd+A3Wggo75m2A2
	AmDovaO/53ZJxobAl636YD2i2HnLPHvE+b8CYRvIWORPa5iup2Ic9cwhTXPOMsPx1XB+oscHK1hsk
	G2qEWUZRxiiQwrYxzRMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhSpG-00CbyR-1Y; Thu, 21 Apr 2022 09:10:10 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhSn6-00CamN-Jo; Thu, 21 Apr 2022 09:07:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 7D53E1F45276
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650532075;
 bh=in1WLxPVVCjDPJ4EL6wvt2BCn3AyEU6pduFeta4ETjM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HQdr9LBA3nMNCABpEBbccneExg2Kec1Fq6tMeqJer4rYWtm4+7ehM2fqRJdKZNJ+Q
 iJuQ6pvh10ZE9sBEgNzhPJpyQ9QTDbxOUh5b93lw/dQ2WQSBKOB9JheRb4NW3js5Yx
 dTabKGMbcZeMoDMSADtmMmT0X595tYKAjLNODAdW9AJ2ZQTbcEl9J1gBeiPu5Ca+AY
 cY2yEcBahv1rmocxGyqS9CdhvKGUUD7qemBDDhw+4NWUSjuDItUrcZUYZd7Irn6n0H
 fJxUwjhwuVfxzJ2mA4j6HNs7VqTSRkjXzM676lohzitKM5lv24Bjl4Mp8DzRKOfuj9
 nPl68NFt8YcQA==
Message-ID: <801c6a22-1772-2673-1fcf-5cfed54efab1@collabora.com>
Date: Thu, 21 Apr 2022 11:07:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 06/12] clk: mediatek: reset: Revise structure to
 control reset register
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com,
 linux-kernel@vger.kernel.org, allen-kh.cheng@mediatek.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-7-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220420130527.23200-7-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_020756_848457_C647D5E4 
X-CRM114-Status: GOOD (  14.61  )
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

Il 20/04/22 15:05, Rex-BC Chen ha scritto:
> Add mtk_clk_rst_desc to input the reset register data, and replace the
> structure "struct mtk_reset" to reset.h, and rename it as
> "mtk_clk_rst_data". We use them to store reset register data and
> store reset controller device.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/clk/mediatek/clk-mt2701-eth.c |  8 +++++-
>   drivers/clk/mediatek/clk-mt2701-g3d.c |  8 +++++-
>   drivers/clk/mediatek/clk-mt2701-hif.c |  8 +++++-
>   drivers/clk/mediatek/clk-mt2701.c     | 19 ++++++++++++--
>   drivers/clk/mediatek/clk-mt2712.c     | 19 ++++++++++++--
>   drivers/clk/mediatek/clk-mt7622-eth.c |  8 +++++-
>   drivers/clk/mediatek/clk-mt7622-hif.c | 10 ++++++--
>   drivers/clk/mediatek/clk-mt7622.c     | 19 ++++++++++++--
>   drivers/clk/mediatek/clk-mt7629-eth.c |  8 +++++-
>   drivers/clk/mediatek/clk-mt7629-hif.c | 10 ++++++--
>   drivers/clk/mediatek/clk-mt8135.c     | 19 ++++++++++++--
>   drivers/clk/mediatek/clk-mt8173.c     | 19 ++++++++++++--
>   drivers/clk/mediatek/clk-mt8183.c     |  9 +++++--
>   drivers/clk/mediatek/reset.c          | 36 +++++++++++++--------------
>   drivers/clk/mediatek/reset.h          | 15 ++++++++++-
>   15 files changed, 174 insertions(+), 41 deletions(-)
> 

..snip..

> diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
> index 8e42deee80a3..d67c13958458 100644
> --- a/drivers/clk/mediatek/reset.c
> +++ b/drivers/clk/mediatek/reset.c
> @@ -14,25 +14,19 @@
>   
>   #include "clk-mtk.h"
>   
> -struct mtk_reset {
> -	struct regmap *regmap;
> -	int regofs;
> -	struct reset_controller_dev rcdev;
> -};
> -
> -static inline struct mtk_reset *to_rst_data(struct reset_controller_dev *rcdev)
> +static inline struct mtk_clk_rst_data *to_rst_data(struct reset_controller_dev *rcdev)
>   {

to_mtk_clk_rst_data()...
by the way, it's probably better if you introduce this helper here directly,
instead of introducing it in commit 03/12 and changing it entirely in 06/12.

The rest of the code looks good to me, I'm sure that you'll get my R-b in the
next version.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
