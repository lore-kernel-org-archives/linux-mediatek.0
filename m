Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E244AC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 04:04:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5A8564DD6
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 04:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5A8564DD6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7zATfRPXGiV9YYjKmyM5pXfxa0Kb/fgLHDjZSjQWbjQ=; b=ki4iw8SZjallSNxdGhIa3uLHa
	+2yLjOj4/T3K3Htc1kWWrirt+MixVp9AgIp14Yflcu2GrE1R2q8VCnwkPhtqSviGxm+Jf1r/ferpk
	HPF0AWiOleiHrcxHU+NRWYQoV/bWAGKq8KYRmYiwJXEgjy6JXq2DI7157Y8fne/4f6Vaa8/YeozPE
	ekQrXgQQtvs+IxNeqzGPIqd6/U/2+N00pBA5JaBqrnwT99sYcaxItU0qX0r4tefuc3qJ5VCzERFna
	XbBvj4K7CQgXcxRkwDjeYDoKudp0gJUWcWs5MiBu0ud8Y7HpAx++ii7xZp/A9QSBT0MCcODq54Tfg
	jQ6t5jONQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4yY0-0007LY-Mf; Thu, 28 Jan 2021 04:04:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4yXx-0007Ky-HI
 for linux-mediatek@lists.infradead.org; Thu, 28 Jan 2021 04:04:43 +0000
X-UUID: 2f96384a37374aafb5f2fd7c41eb1b2a-20210127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fg+euiyblGbtxNVAjLLyu7Sv510gpFwpVrdrd1jugf4=; 
 b=qkNEl1DZETvkkT7lcPJmBNgX1/+SIMjdqBJ3/6Z0i8ULmlNVKgYvJGKdWmtyo+4/MjktiEbzxwcAHuq8cjqagBPknJFUejTZslMe51rx7b/YHwGaD/vLCmbMYofEDARKLud77781v38bETZ3BY5B+dIfk394eRDPdldwLkRfIvU=;
X-UUID: 2f96384a37374aafb5f2fd7c41eb1b2a-20210127
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1456223896; Wed, 27 Jan 2021 20:04:36 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Jan 2021 20:04:35 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 12:04:33 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 12:04:33 +0800
Message-ID: <1611806673.11015.5.camel@mtksdaap41>
Subject: Re: [PATCH 2/2] clk: mediatek: mux: Update parent at enable time
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Thu, 28 Jan 2021 12:04:33 +0800
In-Reply-To: <20210125170819.26130-3-laurent.pinchart@ideasonboard.com>
References: <20210125170819.26130-1-laurent.pinchart@ideasonboard.com>
 <20210125170819.26130-3-laurent.pinchart@ideasonboard.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_230442_378184_E7D8265B 
X-CRM114-Status: GOOD (  24.07  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Phi-Bang Nguyen <pnguyen@baylibre.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2021-01-25 at 19:08 +0200, Laurent Pinchart wrote:
> The mux clocks don't always correctly take the new parent into account
> when the parent is updated while the clock is disabled. Set the update
> bit when enabling the clock to force an update of the mux.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Hi Laurent,

Thank you for the patch. Looks good to me.
Reviewed-by: Weiyi Lu <weiyi.lu@mediatek.com>

> ---
>  drivers/clk/mediatek/clk-mux.c | 32 +++++++++++++++++++++++++++++---
>  drivers/clk/mediatek/clk-mux.h |  1 +
>  2 files changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
> index 9370bebca7f8..b0c61709bacc 100644
> --- a/drivers/clk/mediatek/clk-mux.c
> +++ b/drivers/clk/mediatek/clk-mux.c
> @@ -20,9 +20,33 @@ static inline struct mtk_clk_mux *to_mtk_clk_mux(struct clk_hw *hw)
>  static int mtk_clk_mux_enable_setclr(struct clk_hw *hw)
>  {
>  	struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
> +	unsigned long flags = 0;
>  
> -	return regmap_write(mux->regmap, mux->data->clr_ofs,
> -			BIT(mux->data->gate_shift));
> +	if (mux->lock)
> +		spin_lock_irqsave(mux->lock, flags);
> +	else
> +		__acquire(mux->lock);
> +
> +	regmap_write(mux->regmap, mux->data->clr_ofs,
> +		     BIT(mux->data->gate_shift));
> +
> +	/*
> +	 * If the parent has been changed when the clock was disabled, it will
> +	 * not be effective yet. Set the update bit to ensure the mux gets
> +	 * updated.
> +	 */
> +	if (mux->reparent && mux->data->upd_shift >= 0) {
> +		regmap_write(mux->regmap, mux->data->upd_ofs,
> +			     BIT(mux->data->upd_shift));
> +		mux->reparent = false;
> +	}
> +
> +	if (mux->lock)
> +		spin_unlock_irqrestore(mux->lock, flags);
> +	else
> +		__release(mux->lock);
> +
> +	return 0;
>  }
>  
>  static void mtk_clk_mux_disable_setclr(struct clk_hw *hw)
> @@ -77,9 +101,11 @@ static int mtk_clk_mux_set_parent_setclr_lock(struct clk_hw *hw, u8 index)
>  		regmap_write(mux->regmap, mux->data->set_ofs,
>  				index << mux->data->mux_shift);
>  
> -		if (mux->data->upd_shift >= 0)
> +		if (mux->data->upd_shift >= 0) {
>  			regmap_write(mux->regmap, mux->data->upd_ofs,
>  					BIT(mux->data->upd_shift));
> +			mux->reparent = true;
> +		}
>  	}
>  
>  	if (mux->lock)
> diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
> index 15c62366ba9a..f1946161ade1 100644
> --- a/drivers/clk/mediatek/clk-mux.h
> +++ b/drivers/clk/mediatek/clk-mux.h
> @@ -14,6 +14,7 @@ struct mtk_clk_mux {
>  	struct regmap *regmap;
>  	const struct mtk_mux *data;
>  	spinlock_t *lock;
> +	bool reparent;
>  };
>  
>  struct mtk_mux {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
