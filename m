Return-Path: <SRS0=Q4g2=MM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C081C07E95
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 10:52:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C06A661107
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 10:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C06A661107
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9iE194KR0lbwJIX/2ajFf+0wJybn9MEqTZaxKCUJF2Y=; b=VfZ/cPA3/W+pjf
	ctob3dNoX4C/lOGYZdW85ezL8UhMHiuAFfEPVduLRUjrEIudcd8EtZOufamOXzEE2AOGXA514k95R
	COoYeSQjTFaRDNxu60ecyb2/lj5o7CVQptQCYNzgnBtUngRHftrW3GO9HBXs/jimOnyMBqpb1xXy8
	KLIp2bIvirEw68d+G5luohqDnGsXJpX9kcckTctTWvLDHcezrfH82nb3tKmnDND92F1b4iPXnrX0K
	LERrYtSgUe1b6H62ZIF9zXULUyKU5nn9dFD+Fz0y2NrLm54PxDvKvourY85R9MMVErZJahnoCIgnF
	U0Tohc18F4tcQCvifydg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5nMf-00CZty-AK; Tue, 20 Jul 2021 10:52:41 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5nMR-00CZsJ-SQ
 for linux-mediatek@lists.infradead.org; Tue, 20 Jul 2021 10:52:29 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1m5nMK-0005E8-1J; Tue, 20 Jul 2021 12:52:20 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1m5nMH-0003Ys-FO; Tue, 20 Jul 2021 12:52:17 +0200
Message-ID: <039151e1f17676a101fb9c0682f5ee9fb8ad502d.camel@pengutronix.de>
Subject: Re: [PATCH v2 6/7] soc: mediatek: mmsys: Add reset controller support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 linux-kernel@vger.kernel.org
Cc: chunkuang.hu@kernel.org, hsinyi@chromium.org, kernel@collabora.com, 
 drinkcat@chromium.org, eizan@chromium.org,
 linux-mediatek@lists.infradead.org,  matthias.bgg@gmail.com,
 jitao.shi@mediatek.com,  linux-arm-kernel@lists.infradead.org
Date: Tue, 20 Jul 2021 12:52:17 +0200
In-Reply-To: <20210714121116.v2.6.I15e2419141a69b2e5c7e700c34d92a69df47e04d@changeid>
References: <20210714101141.2089082-1-enric.balletbo@collabora.com>
 <20210714121116.v2.6.I15e2419141a69b2e5c7e700c34d92a69df47e04d@changeid>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_035227_959984_2D25D65D 
X-CRM114-Status: GOOD (  17.62  )
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

Hi Enric,

On Wed, 2021-07-14 at 12:11 +0200, Enric Balletbo i Serra wrote:
> Among other features the mmsys driver should implement a reset
> controller to be able to reset different bits from their space.
> 
> Cc: Jitao Shi <jitao.shi@mediatek.com>
> Suggested-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

The reset controller driver looks fine, just two questions below.

> ---
> 
> (no changes since v1)
> 
>  drivers/soc/mediatek/mtk-mmsys.c | 69 ++++++++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.h |  2 +
>  2 files changed, 71 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index e681029fe804..6ac4deff0164 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
[...]
> @@ -91,6 +95,59 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
[...]
> +static int mtk_mmsys_reset(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	int ret;
> +
> +	ret = mtk_mmsys_reset_assert(rcdev, id);
> +	if (ret)
> +		return ret;
> +
> +	usleep_range(1000, 1100);

Is this known to be enough for all IP cores that can be reset by this
controller?

> +	return mtk_mmsys_reset_deassert(rcdev, id);
> +}
> +
> +static const struct reset_control_ops mtk_mmsys_reset_ops = {
> +	.assert = mtk_mmsys_reset_assert,
> +	.deassert = mtk_mmsys_reset_deassert,
> +	.reset = mtk_mmsys_reset,
> +};
> +
>  static int mtk_mmsys_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -111,6 +168,18 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	spin_lock_init(&mmsys->lock);
> +
> +	mmsys->rcdev.owner = THIS_MODULE;
> +	mmsys->rcdev.nr_resets = 32;

Are all bits in the MMSYS_SW0_RST_B register individual reset controls?

regards
Philipp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
