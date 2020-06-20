Return-Path: <SRS0=iUBX=AB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152A3C433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Jun 2020 07:30:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB89422211
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Jun 2020 07:30:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SYpwk0eP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="k27ycLrK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB89422211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R15y7KPb4bBuoVZKHWPVAAYSxG6YNSOYVaRJps5Uhn4=; b=SYpwk0ePtswi5Z
	7V0xYV1W4j/15oTIKXnqUihgb7S1zsUxIHg1EiR0nNm54TVS2uLL69j28N1pk9yUpRnCGxCDOGR0K
	ulizI/6ld+kT2l5YAd+SOaJVBc8ikew/ECK0bu3fXyFJ2/tZumMMLQWi/JqlWRSQjnKjH06th9T2o
	Mqdm16bvhwg6QOd4vFEeYqfRE7vSgf7CXkkDcX4AwQVeHGZCDzY2TJ2pYIAcMOyeLGGTHykTMHuLx
	qZTwT9R+qOn5dpMkkj0KHdjUzJ0lHF++psvD6Mo0OVnhhIY3C23Oo/HJLdhVGXfhSu4m6aYvN1cLJ
	JcGZMSxes13I7gFSl4hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmXxJ-0003Yv-Jb; Sat, 20 Jun 2020 07:30:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmXxF-0003YF-Sc; Sat, 20 Jun 2020 07:30:23 +0000
X-UUID: 377a25039d1746bcaa86552a2ca11c08-20200619
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=zBsN1Wyck+84Mbm+gBiGCKGBcPWj9Ghj2Dt/tXk8j/4=; 
 b=k27ycLrKmA9/8vzoQYhodSiDjJAffxgXh0GQ5WNkFRb3h4L9PkUqWL6mKG5JopoJH2arXhNkU8bCO7s9Xx+Ai/FoJvKHL17ySJf7CFHvMcB5w/M9gG1YAnTQUhm7U1DJ2CBNEqMyPtjQ2xrssZ6p60wMHJrC5ITRxOGs6rRo5zw=;
X-UUID: 377a25039d1746bcaa86552a2ca11c08-20200619
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yingjoe.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1768344219; Fri, 19 Jun 2020 23:30:06 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 20 Jun 2020 00:30:12 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 20 Jun 2020 15:30:11 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 20 Jun 2020 15:30:11 +0800
Message-ID: <1592638212.4087.5.camel@mtksdaap41>
Subject: Re: [PATCH] i2c: mediatek: Add to support continuous mode
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Qiangming Xia <qiangming.xia@mediatek.com>
Date: Sat, 20 Jun 2020 15:30:12 +0800
In-Reply-To: <20200619080643.25269-1-qiangming.xia@mediatek.com>
References: <20200619080643.25269-1-qiangming.xia@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200620_003021_934007_022AAE0C 
X-CRM114-Status: GOOD (  17.40  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, wsa@the-dreams.de, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 Qii Wang <Qii.Wang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Fri, 2020-06-19 at 16:06 +0800, Qiangming Xia wrote:
> From: "qiangming.xia" <qiangming.xia@mediatek.com>

Please make 'From:' the same to Signed-off-by.



>     Mediatek i2c controller support for continuous mode,
> it allow to transfer once multiple writing messages of equal length.

So the limitations are writing to same address, all in same length.
I think this is strict limitation. Do we have many this kind of usage?
How about change this to:

MediaTek i2c controller support continuous mode. This allows to write
multiple same length messages to single address with only one setup.


>     For example, a slave need write a serial of non-continuous
> offset range in chip,e.g. writing offset 0,offset 2 and offset 4.
> Normally, it need three times i2c write operation. However,it can
> use once transfer to finish it by using continuous mode.
> 
> Change-Id: If06991e3fd32867bdeaacf15bb24864d5c5904d0

Please drop Change-Id:


> Signed-off-by: Qiangming Xia <qiangming.xia@mediatek.com>
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 67 +++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index deef69e56906..76ec65d869f6 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -97,6 +97,7 @@ enum mtk_trans_op {
>  	I2C_MASTER_WR = 1,
>  	I2C_MASTER_RD,
>  	I2C_MASTER_WRRD,
> +	I2C_MASTER_CONTINUOUS_WR,
>  };
>  
>  enum I2C_REGS_OFFSET {
> @@ -846,6 +847,9 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>  					    OFFSET_TRANSFER_LEN);
>  		}
>  		mtk_i2c_writew(i2c, I2C_WRRD_TRANAC_VALUE, OFFSET_TRANSAC_LEN);
> +	} else if (i2c->op == I2C_MASTER_CONTINUOUS_WR) {
> +		mtk_i2c_writew(i2c, msgs->len / num, OFFSET_TRANSFER_LEN);
> +		mtk_i2c_writew(i2c, num, OFFSET_TRANSAC_LEN);
>  	} else {
>  		mtk_i2c_writew(i2c, msgs->len, OFFSET_TRANSFER_LEN);
>  		mtk_i2c_writew(i2c, num, OFFSET_TRANSAC_LEN);
> @@ -896,6 +900,23 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>  			writel(reg_4g_mode, i2c->pdmabase + OFFSET_TX_4G_MODE);
>  		}
>  
> +		writel((u32)wpaddr, i2c->pdmabase + OFFSET_TX_MEM_ADDR);
> +		writel(msgs->len, i2c->pdmabase + OFFSET_TX_LEN);
> +	} else if (i2c->op == I2C_MASTER_CONTINUOUS_WR) {
> +		writel(I2C_DMA_INT_FLAG_NONE, i2c->pdmabase + OFFSET_INT_FLAG);
> +		writel(I2C_DMA_CON_TX, i2c->pdmabase + OFFSET_CON);
> +		wpaddr = dma_map_single(i2c->dev, msgs->buf,
> +					msgs->len, DMA_TO_DEVICE);
> +		if (dma_mapping_error(i2c->dev, wpaddr)) {
> +			kfree(msgs->buf);
> +			return -ENOMEM;
> +		}
> +
> +		if (i2c->dev_comp->support_33bits) {
> +			reg_4g_mode = mtk_i2c_set_4g_mode(wpaddr);
> +			writel(reg_4g_mode, i2c->pdmabase + OFFSET_TX_4G_MODE);
> +		}
> +
>  		writel((u32)wpaddr, i2c->pdmabase + OFFSET_TX_MEM_ADDR);
>  		writel(msgs->len, i2c->pdmabase + OFFSET_TX_LEN);
>  	} else {
> @@ -979,6 +1000,11 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
>  				 msgs->len, DMA_FROM_DEVICE);
>  
>  		i2c_put_dma_safe_msg_buf(dma_rd_buf, msgs, true);
> +	} else if (i2c->op == I2C_MASTER_CONTINUOUS_WR) {
> +		dma_unmap_single(i2c->dev, wpaddr,
> +				 msgs->len, DMA_TO_DEVICE);
> +
> +		kfree(msgs->buf);
>  	} else {
>  		dma_unmap_single(i2c->dev, wpaddr, msgs->len,
>  				 DMA_TO_DEVICE);
> @@ -1009,6 +1035,9 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
>  {
>  	int ret;
>  	int left_num = num;
> +	int i, j;
> +	u8 *dma_multi_wr_buf;
> +	struct i2c_msg multi_msg[1];
>  	struct mtk_i2c *i2c = i2c_get_adapdata(adap);
>  
>  	ret = mtk_i2c_clock_enable(i2c);
> @@ -1025,6 +1054,44 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
>  		}
>  	}
>  
> +	if (num > 1) {
> +		for (i = 0; i < num - 1; i++) {
> +			if (!(msgs[i].flags & I2C_M_RD) && !(msgs[i+1].flags &
> +				I2C_M_RD) && (msgs[i].addr == msgs[i+1].addr)
> +					&& (msgs[i].len == msgs[i+1].len)) {

Since this block is all for continuous mode check, we could move first
flags check out and made the if in for loop simpler to read:

	if (num > 1 && !(msgs[0].flags & I2C_M_RD)) {
		for (i = 0; i < num - 1; i++) {
			if (!(msgs[i+1].flags &	I2C_M_RD) && 
				msgs[i].addr == msgs[i+1].addr &&
				msgs[i].len == msgs[i+1].len) {


> +				continue;
> l+			} else
> +				break;
> +		}
> +		if (i >= num - 1) {

just check i == num -1 is enough.


> +			i2c->op = I2C_MASTER_CONTINUOUS_WR;
> +			j = 0;
> +			dma_multi_wr_buf = kzalloc(msgs->len * num, GFP_KERNEL);

don't need to zero it out. kmalloc is enough.

> +			if (!dma_multi_wr_buf) {
> +				ret =  -ENOMEM;
> +				goto err_exit;
> +			}
> +			multi_msg->addr  = msgs->addr;
> +			multi_msg->len   = msgs->len * num;
> +			multi_msg->buf   = dma_multi_wr_buf;
> +			multi_msg->flags  = 0;
> +			while (j < num) {
> +				memcpy(dma_multi_wr_buf + msgs->len * j,
> +							msgs->buf, msgs->len);
> +				j++;
> +				msgs++;
> +				}

extra tab before the closing '}'

> +
> +			i2c->ignore_restart_irq = false;
> +			ret = mtk_i2c_do_transfer(i2c, multi_msg, num, 0);
> +			if (ret < 0)
> +				goto err_exit;
> +			ret = num;
> +				goto err_exit;
> +

extra indent level for last goto and blank line after it.

Joe.C

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
