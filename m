Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01BEEED600
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 14:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scguzdulq438fU0onIt7wsp5N42l2pkF5ndYQ3KepA0=; b=MSvGJ5y7n2XwPA1DeKK9J1ltqQ
	TaDMmatrAh8TwozODGU2zaUowJg1tkxxfJCVJo3XHoF58YEy/JJ86s2wOJfHf1UfEXT2pUPkBZPII
	GRQFVXleOIdFUHzOtNdSy0YnUt4hqa+D4LGhzBRaR/HazT7Ao7dot2iJtMD4NpAx75kewdeksStLc
	10tL3vSPgfdqMEN1qxNw4nouZC3g71RsxwfPOyL/gBLcDvaABKDR9zWKkpNM8N3PGjdjr3zZN9XkE
	ggWIrwl0X84kCQdAtZP0S1E8cM1vQ9fj5IqDKLai4XESyH8DoTtGGF4zhWFwtNT1CsVdnRsixbfOP
	bOZM5/Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAEg-00AvWn-2E;
	Fri, 15 Sep 2023 14:55:58 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAEc-00AvWL-2Y
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Sep 2023 14:55:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 9F757CE2BBE;
	Fri, 15 Sep 2023 14:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B92EC433C8;
	Fri, 15 Sep 2023 14:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694789750;
	bh=y6HHnZ0gvCSnMyLqBjNEOadpDvwv3LTp/L1X/KwdXQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cyy6KrQa5hoT5HoIK1blJQAo06evX6ZG37TdQU8L89hpQpbSXorIbDUQTZ375yhk1
	 GZOIIXxehUp4fXGqB8OmglxFdGYnj3x0N+x5EnWiFSiKwhZwbjXIGZo9ivk4GPhEGz
	 yvZe7t2IrWbwxeEBbsRdIXxWTeeH3/o03OI96EKscB0EsiWfcF1KtBxLhdFqt7Mnea
	 n3q2XtQhGWRZgn1OzOv7ZZyKzg9bTNlAM+KNrp4idoaxPlso7IsokaGVK/SMKU+iUs
	 SXC+L8NG4Aqo3D/Cz3IZpouIeiThkSKeretA68SdlwsNPvqW7z+q5TzVC04W0VcR2h
	 Zb46cWTLyaRcQ==
Received: (nullmailer pid 3714184 invoked by uid 1000);
	Fri, 15 Sep 2023 14:55:48 -0000
Date: Fri, 15 Sep 2023 09:55:48 -0500
From: Rob Herring <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, lorenzo.bianconi@redhat.com, nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, daniel@makrotopia.org, linux-mediatek@lists.infradead.org, sujuan.chen@mediatek.com, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 10/15] net: ethernet: mtk_wed: introduce WED
 support for MT7988
Message-ID: <20230915145548.GA3704791-robh@kernel.org>
References: <cover.1694701767.git.lorenzo@kernel.org>
 <330efa9f15a6da8a8e7596d3a942f3e893730e12.1694701767.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <330efa9f15a6da8a8e7596d3a942f3e893730e12.1694701767.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_075555_187518_200E4382 
X-CRM114-Status: GOOD (  20.67  )
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

On Thu, Sep 14, 2023 at 04:38:15PM +0200, Lorenzo Bianconi wrote:
> From: Sujuan Chen <sujuan.chen@mediatek.com>
> 
> Similar to MT7986 and MT7622, enable Wireless Ethernet Ditpatcher for
> MT7988 in order to offload traffic forwarded from LAN/WLAN to WLAN/LAN
> 
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c   |   1 +
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h   |   2 +-
>  .../net/ethernet/mediatek/mtk_ppe_offload.c   |   3 +
>  drivers/net/ethernet/mediatek/mtk_wed.c       | 458 +++++++++++++-----
>  drivers/net/ethernet/mediatek/mtk_wed.h       |  28 ++
>  drivers/net/ethernet/mediatek/mtk_wed_mcu.c   |  33 +-
>  drivers/net/ethernet/mediatek/mtk_wed_regs.h  | 228 ++++++++-
>  drivers/net/ethernet/mediatek/mtk_wed_wo.h    |   2 +
>  include/linux/soc/mediatek/mtk_wed.h          |   9 +-
>  9 files changed, 618 insertions(+), 146 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 3cffd1bd3067..697620c6354b 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -197,6 +197,7 @@ static const struct mtk_reg_map mt7988_reg_map = {
>  	.wdma_base = {
>  		[0]		= 0x4800,
>  		[1]		= 0x4c00,
> +		[2]		= 0x5000,
>  	},
>  	.pse_iq_sta		= 0x0180,
>  	.pse_oq_sta		= 0x01a0,
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> index 403219d987ef..9ae3b8a71d0e 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> @@ -1132,7 +1132,7 @@ struct mtk_reg_map {
>  	u32	gdm1_cnt;
>  	u32	gdma_to_ppe;
>  	u32	ppe_base;
> -	u32	wdma_base[2];
> +	u32	wdma_base[3];
>  	u32	pse_iq_sta;
>  	u32	pse_oq_sta;
>  };
> diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> index ef3980840695..95f76975f258 100644
> --- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> +++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
> @@ -201,6 +201,9 @@ mtk_flow_set_output_device(struct mtk_eth *eth, struct mtk_foe_entry *foe,
>  			case 1:
>  				pse_port = PSE_WDMA1_PORT;
>  				break;
> +			case 2:
> +				pse_port = PSE_WDMA2_PORT;
> +				break;
>  			default:
>  				return -EINVAL;
>  			}
> diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
> index 58d97be98029..0d8e10df9da2 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> @@ -17,17 +17,19 @@
>  #include <net/flow_offload.h>
>  #include <net/pkt_cls.h>
>  #include "mtk_eth_soc.h"
> -#include "mtk_wed_regs.h"
>  #include "mtk_wed.h"
>  #include "mtk_ppe.h"
>  #include "mtk_wed_wo.h"
>  
>  #define MTK_PCIE_BASE(n)		(0x1a143000 + (n) * 0x2000)
>  
> -#define MTK_WED_PKT_SIZE		1900
> +#define MTK_WED_PKT_SIZE		1920
>  #define MTK_WED_BUF_SIZE		2048
> +#define MTK_WED_PAGE_BUF_SIZE		128
>  #define MTK_WED_BUF_PER_PAGE		(PAGE_SIZE / 2048)
> +#define MTK_WED_RX_PAGE_BUF_PER_PAGE	(PAGE_SIZE / 128)
>  #define MTK_WED_RX_RING_SIZE		1536
> +#define MTK_WED_RX_PG_BM_CNT		8192
>  
>  #define MTK_WED_TX_RING_SIZE		2048
>  #define MTK_WED_WDMA_RING_SIZE		1024
> @@ -41,7 +43,10 @@
>  #define MTK_WED_RRO_QUE_CNT		8192
>  #define MTK_WED_MIOD_ENTRY_CNT		128
>  
> -static struct mtk_wed_hw *hw_list[2];
> +#define MTK_WED_TX_BM_DMA_SIZE		65536
> +#define MTK_WED_TX_BM_PKT_CNT		32768
> +
> +static struct mtk_wed_hw *hw_list[3];
>  static DEFINE_MUTEX(hw_lock);
>  
>  struct mtk_wed_flow_block_priv {
> @@ -300,33 +305,39 @@ mtk_wed_assign(struct mtk_wed_device *dev)
>  static int
>  mtk_wed_tx_buffer_alloc(struct mtk_wed_device *dev)
>  {
> +	int i, page_idx = 0, n_pages, ring_size;
> +	int token = dev->wlan.token_start;
>  	struct mtk_wed_buf *page_list;
> -	struct mtk_wdma_desc *desc;
>  	dma_addr_t desc_phys;
> -	int token = dev->wlan.token_start;
> -	int ring_size;
> -	int n_pages;
> -	int i, page_idx;
> +	void *desc_ptr;
>  
> -	ring_size = dev->wlan.nbuf & ~(MTK_WED_BUF_PER_PAGE - 1);
> -	n_pages = ring_size / MTK_WED_BUF_PER_PAGE;
> +	if (!mtk_wed_is_v3_or_greater(dev->hw)) {
> +		dev->tx_buf_ring.desc_size = sizeof(struct mtk_wdma_desc);

Instead of checking the version or using of_device_is_compatible() in 
other places why don't you define driver match data for all this static 
data.

Rob

