Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B13C47089
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 16:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSbbsJ74TEP47b+sUr2N86BCzXItlgefatqqCYJFGhk=; b=WcmZSg5SUxr62iRaZznTkt72uK
	usDjs7drOin263mucBT+0G4Iv9iukaO4B3vWRlsolDp0774YRGrcx4r7viTR/kvhg0k/MyXgLGqGf
	41fES6fAILLWLoZtx2IcDXEizMuiDGeCcWt9pYswOOiBpYEJjtGKJenIWlUye0KQT6aaBSaqgrMWg
	9EjVCk4omq8NyMHub2jjQnY/heUDBe6XPr+3+NNvpIot9xDeUgesCtScGgVwtQPP2xtE2pr3BuMxA
	n6FY+63g1gtpSgciE2R/o+KmHGNv1xt9sx+QlOvDk3rCvLOvyqDzo6LbYTmXtCk328rpAeUtJFFyx
	Gi+Bh26A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Enn-0075Ue-7q; Mon, 05 Dec 2022 16:58:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Enk-0075Fw-Co
	for linux-mediatek@lists.infradead.org; Mon, 05 Dec 2022 16:58:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CC16D6122F;
	Mon,  5 Dec 2022 16:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BC7C433D6;
	Mon,  5 Dec 2022 16:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670259520;
	bh=7EV0jXWy9hOf/Ucrpiiq1MKM0P0LmE+diFld3cktmiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VxWXHy1MF/y8NQI+fNioD1ikZJ+GqVG0pvkrscgNP9CYeJH6A5MDhC1RfHlvwiJtt
	 6H7zakG3lBi1smYxKz5MMgvPNRIuNNZdVvcYKigRS58NoU1/wWpJ+Ra+R7C6agPDBO
	 rpgYXETaK7byh7hWSi8c8Ob29bhmPke1utY/2soJGCUr9eBxQrZ20VQ3UXmD8b4ILC
	 xlYghf7kwL/DG2/WU5iFWGXBy7a6fZ8mfzP3EZAwl5T3+vt8u6ZY4ovNM4qtqcxhD/
	 LIwRjhkG+aC4f//xuVWoyAIT/QRYy2nsg7TJrBpY2otDRF7TgriJw9jJUHGOxPMKjs
	 7jq+igAxJusVg==
Date: Mon, 5 Dec 2022 18:58:35 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
	sujuan.chen@mediatek.com
Subject: Re: [PATCH v2 net-next] net: ethernet: mtk_wed: fix possible
 deadlock if mtk_wed_wo_init fails
Message-ID: <Y44jO1ZT9RgqYtxF@unreal>
References: <5a29aae6c4a26e807844210d4ddac7950ca5f63d.1670238731.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a29aae6c4a26e807844210d4ddac7950ca5f63d.1670238731.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_085844_558504_2574394B 
X-CRM114-Status: GOOD (  21.39  )
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

On Mon, Dec 05, 2022 at 12:14:41PM +0100, Lorenzo Bianconi wrote:
> Introduce __mtk_wed_detach() in order to avoid a possible deadlock in
> mtk_wed_attach routine if mtk_wed_wo_init fails.
> Check wo pointer is properly allocated before running mtk_wed_wo_reset()
> and mtk_wed_wo_deinit() in __mtk_wed_detach routine.
> Honor mtk_wed_mcu_send_msg return value in mtk_wed_wo_reset().
> 
> Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes since v1:
> - move wo pointer checks in __mtk_wed_detach()
> ---
>  drivers/net/ethernet/mediatek/mtk_wed.c     | 30 ++++++++++++++-------
>  drivers/net/ethernet/mediatek/mtk_wed_mcu.c |  3 +++
>  2 files changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
> index d041615b2bac..2ce9fbb1c66d 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> @@ -174,9 +174,10 @@ mtk_wed_wo_reset(struct mtk_wed_device *dev)
>  	mtk_wdma_tx_reset(dev);
>  	mtk_wed_reset(dev, MTK_WED_RESET_WED);
>  
> -	mtk_wed_mcu_send_msg(wo, MTK_WED_MODULE_ID_WO,
> -			     MTK_WED_WO_CMD_CHANGE_STATE, &state,
> -			     sizeof(state), false);
> +	if (mtk_wed_mcu_send_msg(wo, MTK_WED_MODULE_ID_WO,
> +				 MTK_WED_WO_CMD_CHANGE_STATE, &state,
> +				 sizeof(state), false))
> +		return;
>  
>  	if (readx_poll_timeout(mtk_wed_wo_read_status, dev, val,
>  			       val == MTK_WED_WOIF_DISABLE_DONE,
> @@ -576,12 +577,10 @@ mtk_wed_deinit(struct mtk_wed_device *dev)
>  }
>  
>  static void
> -mtk_wed_detach(struct mtk_wed_device *dev)
> +__mtk_wed_detach(struct mtk_wed_device *dev)
>  {
>  	struct mtk_wed_hw *hw = dev->hw;
>  
> -	mutex_lock(&hw_lock);
> -
>  	mtk_wed_deinit(dev);
>  
>  	mtk_wdma_rx_reset(dev);
> @@ -590,9 +589,11 @@ mtk_wed_detach(struct mtk_wed_device *dev)
>  	mtk_wed_free_tx_rings(dev);
>  
>  	if (mtk_wed_get_rx_capa(dev)) {
> -		mtk_wed_wo_reset(dev);
> +		if (hw->wed_wo)
> +			mtk_wed_wo_reset(dev);
>  		mtk_wed_free_rx_rings(dev);
> -		mtk_wed_wo_deinit(hw);
> +		if (hw->wed_wo)
> +			mtk_wed_wo_deinit(hw);
>  	}
>  
>  	if (dev->wlan.bus_type == MTK_WED_BUS_PCIE) {
> @@ -612,6 +613,13 @@ mtk_wed_detach(struct mtk_wed_device *dev)
>  	module_put(THIS_MODULE);
>  
>  	hw->wed_dev = NULL;
> +}
> +
> +static void
> +mtk_wed_detach(struct mtk_wed_device *dev)
> +{
> +	mutex_lock(&hw_lock);
> +	__mtk_wed_detach(dev);
>  	mutex_unlock(&hw_lock);
>  }
>  
> @@ -1490,8 +1498,10 @@ mtk_wed_attach(struct mtk_wed_device *dev)
>  		ret = mtk_wed_wo_init(hw);
>  	}
>  out:
> -	if (ret)
> -		mtk_wed_detach(dev);
> +	if (ret) {
> +		dev_err(dev->hw->dev, "failed to attach wed device\n");
> +		__mtk_wed_detach(dev);
> +	}
>  unlock:
>  	mutex_unlock(&hw_lock);
>  
> diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
> index f9539e6233c9..3dd02889d972 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
> @@ -207,6 +207,9 @@ int mtk_wed_mcu_msg_update(struct mtk_wed_device *dev, int id, void *data,
>  	if (dev->hw->version == 1)
>  		return 0;
>  
> +	if (!wo)
> +		return -ENODEV;
> +

Can you please help me to understand how and when this mtk_wed_mcu_msg_update()
function is called?

I see this line .msg_update = mtk_wed_mcu_msg_update, and
relevant mtk_wed_device_update_msg() define, but nothing calls to this
define.



>  	return mtk_wed_mcu_send_msg(wo, MTK_WED_MODULE_ID_WO, id, data, len,
>  				    true);
>  }
> -- 
> 2.38.1
> 

