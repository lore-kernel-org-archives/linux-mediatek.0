Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F8CC46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 11:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8SejUHs1W9gaUoknAn3M3RzZT0Eh1o5Bdsrp5OrtOIU=; b=aTejF0kxhaYBsUMWawpBjH16vo
	xElfB3HE/hliCWsd+W1vnpbFL7nW2gxeCs7nZpkqbE/pH03sDwwewjrvwKwN2+tErAgCtvO8h8e+X
	q/qq4RwXm39Z5oUJxijrNibQLiHbIhjcRc3+G5uJpYuEw+879nBc25WkUHwMrOEa/eL8kwkZoSFQj
	mFPD6HRqbqrejAJT7YVBFhSalMKuDxtlu7ZxP6xS/S8Tuj6XyZQWA7kR2ouVsho69dW/J+bD5xWdl
	LXwnMZ2lrSl6R5w/Pla5iadE1dqnZHZ6ymZj8/ebb3F2uKnrC+48fsNT1E72nKhuVsyQN/gQZfPf2
	FYqVD3Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiCbB-00FL7g-2h;
	Mon, 18 Sep 2023 11:39:29 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiCb8-00FL6S-3C
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 11:39:28 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qiCad-0008GJ-2g;
	Mon, 18 Sep 2023 11:38:55 +0000
Date: Mon, 18 Sep 2023 12:35:31 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, lorenzo.bianconi@redhat.com, nbd@nbd.name,
	john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, linux-mediatek@lists.infradead.org,
	sujuan.chen@mediatek.com, horms@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 net-next 09/17] net: ethernet: mtk_wed: fix
 EXT_INT_STATUS_RX_FBUF definitions for MT7986 SoC
Message-ID: <ZQg2AxAIxkadOiIr@makrotopia.org>
References: <cover.1695032290.git.lorenzo@kernel.org>
 <ebde071cc3cc9c35b00366c41912ee2f25e5282d.1695032291.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebde071cc3cc9c35b00366c41912ee2f25e5282d.1695032291.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_043927_025631_9FBE3373 
X-CRM114-Status: GOOD (  14.82  )
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

On Mon, Sep 18, 2023 at 12:29:11PM +0200, Lorenzo Bianconi wrote:
> Fix MTK_WED_EXT_INT_STATUS_RX_FBUF_LO_TH and
> MTK_WED_EXT_INT_STATUS_RX_FBUF_HI_TH definitions for MT7986 (MT7986 is
> the only SoC to use them).

Afaik this applies also to MT7981 which is very similar to MT7986.

> 
> Fixes: de84a090d99a ("net: ethernet: mtk_eth_wed: add wed support for mt7986 chipset")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_wed_regs.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_wed_regs.h b/drivers/net/ethernet/mediatek/mtk_wed_regs.h
> index 47ea69feb3b2..f87ab9b8a590 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed_regs.h
> +++ b/drivers/net/ethernet/mediatek/mtk_wed_regs.h
> @@ -64,8 +64,8 @@ struct mtk_wdma_desc {
>  #define MTK_WED_EXT_INT_STATUS_TKID_TITO_INVALID	BIT(4)
>  #define MTK_WED_EXT_INT_STATUS_TX_FBUF_LO_TH		BIT(8)
>  #define MTK_WED_EXT_INT_STATUS_TX_FBUF_HI_TH		BIT(9)
> -#define MTK_WED_EXT_INT_STATUS_RX_FBUF_LO_TH		BIT(12)
> -#define MTK_WED_EXT_INT_STATUS_RX_FBUF_HI_TH		BIT(13)
> +#define MTK_WED_EXT_INT_STATUS_RX_FBUF_LO_TH		BIT(10) /* wed v2 */
> +#define MTK_WED_EXT_INT_STATUS_RX_FBUF_HI_TH		BIT(11) /* wed v2 */
>  #define MTK_WED_EXT_INT_STATUS_RX_DRV_R_RESP_ERR	BIT(16)
>  #define MTK_WED_EXT_INT_STATUS_RX_DRV_W_RESP_ERR	BIT(17)
>  #define MTK_WED_EXT_INT_STATUS_RX_DRV_COHERENT		BIT(18)
> -- 
> 2.41.0
> 
> 

