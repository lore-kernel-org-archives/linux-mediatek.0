Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6444BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 01:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNL1L2BLDFIWwmfdVNoGFFHAINIwR9J91EcfICMLHC4=; b=WRZ9VnIIG6qdFa
	+IkLnWJr/jo0tx++GvUkG9zwTNev43y/0ozBQnn0MVmL0P7tXKd9RO5vUhlkJG5us5ZhtPRsspRlM
	su5TFiJ1/bdedz8VeRcP9+WPy3TqqzNmJJ8fIJLLZ6KiC1WwjUTZ8su1k5L4eZqwa256CwO2CibJT
	CnEUUIcsxqmZJ4iXIGDL2t6eLUDTAFKW5xjYxCevv+RlOQRycWQ9JA/hen16LdIkluYXss3McWuKo
	q/zn1OgzKUe87MjK296awGNdvBLasicBdfDNr3c4vQLQamB+nKDuvZhJ4ikxaMkNDQeGCuF6EYM5B
	h8FGh10bLhRbVLjKNJ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYeUu-00727j-MQ; Mon, 28 Mar 2022 01:48:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYeUq-00725t-9o; Mon, 28 Mar 2022 01:48:41 +0000
X-UUID: ec0f73f2a2334446a39c73259606d3b3-20220327
X-UUID: ec0f73f2a2334446a39c73259606d3b3-20220327
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 554164551; Sun, 27 Mar 2022 18:48:29 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 27 Mar 2022 18:46:19 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 28 Mar 2022 09:46:06 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Mar 2022 09:46:06 +0800
Message-ID: <d5f8ec6f4b35f7db71b0261c9ddbbae9ccce90d4.camel@mediatek.com>
Subject: Re: [PATCH v9 21/22] drm/mediatek: change the aux retries times
 when receiving AUX_DEFER
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, <airlied@linux.ie>,
 <angelogioacchino.delregno@collabora.com>, <chunfeng.yun@mediatek.com>,
 <chunkuang.hu@kernel.org>, <ck.hu@mediatek.com>, <daniel@ffwll.ch>,
 <deller@gmx.de>, <jitao.shi@mediatek.com>, <kishon@ti.com>,
 <krzk+dt@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <matthias.bgg@gmail.com>, <mripard@kernel.org>, <p.zabel@pengutronix.de>,
 <robh+dt@kernel.org>, <tzimmermann@suse.de>, <vkoul@kernel.org>
CC: <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-fbdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-phy@lists.infradead.org>, <markyacoub@google.com>
Date: Mon, 28 Mar 2022 09:46:06 +0800
In-Reply-To: <20220327223927.20848-22-granquet@baylibre.com>
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-22-granquet@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_184840_354196_68A735B9 
X-CRM114-Status: GOOD (  16.59  )
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

On Mon, 2022-03-28 at 00:39 +0200, Guillaume Ranquet wrote:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> DP 1.4a Section 2.8.7.1.5.6.1:
> A DP Source device shall retry at least seven times upon receiving
> AUX_DEFER before giving up the AUX transaction.
> 
> Aux should retry to send msg whether how many bytes.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
> b/drivers/gpu/drm/mediatek/mtk_dp.c
> index e099491cc6a4..7a197c4a7143 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -2016,7 +2016,7 @@ static ssize_t mtk_dp_aux_transfer(struct
> drm_dp_aux *mtk_aux,
>  	bool is_read;
>  	u8 request;
>  	size_t accessed_bytes = 0;
> -	int retry = 3, ret = 0;
> +	int retry, ret = 0;
>  
>  	mtk_dp = container_of(mtk_aux, struct mtk_dp, aux);
>  
> @@ -2050,14 +2050,21 @@ static ssize_t mtk_dp_aux_transfer(struct
> drm_dp_aux *mtk_aux,
>  	}
>  
>  	if (msg->size == 0) {
> -		ret = mtk_dp_aux_do_transfer(mtk_dp, is_read, request,
> -					     msg->address +
> accessed_bytes,
> -					     msg->buffer +
> accessed_bytes, 0);
> +		retry = 32;
> +		while (retry--) {
> +			ret = mtk_dp_aux_do_transfer(mtk_dp, is_read,
> request,
> +						     msg->address +
> accessed_bytes,
> +						     msg->buffer +
> accessed_bytes, 0);
> +			if (ret == 0)
> +				break;
> +			usleep_range(500, 600);
> +		}
>  	} else {
>  		while (accessed_bytes < msg->size) {
>  			size_t to_access =
>  				min_t(size_t, DP_AUX_MAX_PAYLOAD_BYTES,
>  				      msg->size - accessed_bytes);
> +			retry = 32;
>  			while (retry--) {
>  				ret = mtk_dp_aux_do_transfer(mtk_dp,
>  							     is_read,
> request,
> @@ -2066,7 +2073,7 @@ static ssize_t mtk_dp_aux_transfer(struct
> drm_dp_aux *mtk_aux,
>  							     to_access)
> ;
>  				if (ret == 0)
>  					break;
> -				usleep_range(50, 100);
> +				usleep_range(500, 600);
>  			}
>  			if (!retry || ret) {
>  				drm_info(mtk_dp->drm_dev,

Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
