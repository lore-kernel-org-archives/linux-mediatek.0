Return-Path: <SRS0=IT6v=7J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68B7C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 07:32:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 788CF2073B
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 07:32:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U8KS9XYO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+SvSCvK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 788CF2073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXdDhwfhjl3Hx8OFahk8gm6ntKh2LeWMutG029diZso=; b=U8KS9XYOllegUg
	KQrhiOb+sMO68tYhOkEMDE9zHJAp4GlFd9kGJLx6ddpgcQeANjHt0MzB2EkGAKIKFbe5bUCny70pF
	ZFE4HsBxC/XEr2O3Xq3dbbboEhZrsE49G4E5rmGybvobqpf0/TW0jmOk4epaXq1ACwztmCRxLUQuz
	r9Tr0N+tnHovUXVNwc5CvxXB44q7oTapxA902oY/5vhc1UTlBoPoqrzr+wn64NvKUn0ePCNG+BHQB
	qfQ9dHkgDpla9W6iPaCpk4nNhGawuJ7GOcFZd1Crsy/4CKD8b6e57UYFxX7Xcz3WDymq7yX+309Xc
	EbRz0eXChXwiynFDP6Zw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdqXp-0000Ce-SY; Wed, 27 May 2020 07:32:09 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdqXc-0008U1-0K; Wed, 27 May 2020 07:31:57 +0000
Received: by mail-pg1-x542.google.com with SMTP id p30so11369297pgl.11;
 Wed, 27 May 2020 00:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dDm+9Z+VPJSjQt7jMvgBvDOrkZkCZvbOfUxGN5gTgvk=;
 b=S+SvSCvKaczRkh6E5rg4fK7H9JKrdv2NKFW/1Jl8phKXX0v58SP3vNScUBJJeZ1jiH
 9wLuz07hmh7lsd6yMzwVIkkkVf8ceMzdc0Yr6NBA6knAhwlR7t2dO3BIjvTCJ3OLCbD2
 eiX5wWpq6qq7lit0AHrOMDrsc9wZAA/LPJbP3dVzoWAMjMaPLScRQHGXskjrUV5c3sb7
 t/0QV6wVICKk9vPcOmHRH9xT2sdZam18hOEPpAHY8rWLzwzdQxnWPKS9L1QVix2lwmEo
 IrwgiicjTwyOegjjNIG+cM8VayUT02sRe5t6mz8WhQ577Wlpb7Kl0FtGgsbzhKr0iCcx
 MPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dDm+9Z+VPJSjQt7jMvgBvDOrkZkCZvbOfUxGN5gTgvk=;
 b=axd8fdcbp+g7aopnVHkYdYtTx1kW0Mu2r3WOJCF7c1BUsTGv0mRU3VknlyvDADs9xS
 7Rk1/w+xNZQtYSLCHKfRM2+UYiGQMVTBvQshITRS0Xy5SJjAWcNpPadUKyOXoQgOmF0r
 UA1bantGl6y+D53nJNDDqpkXVnrpTdd5mXkYBY3TJeEHblisrrAsCbNbOnYwcZ7kv78l
 HAOCyrYXpPtpLwMZT1FtFVJPkC1NWs4Bd2G04MAhGc6w49YRsKZrqT0keqGdWAKOEM1w
 ntbXCybG7arVP/BF/yLOQjI8SO3wQcNwQOj1C57LgePGDo+hALMZMnRVsNEuROQNvhDB
 tPCw==
X-Gm-Message-State: AOAM532iJInQUnRNIc7Hh/cCcDHIcEfixeN30917axHwYLbjUJwPEIqV
 hALbK6tPkuNSuPWGytKZEYo=
X-Google-Smtp-Source: ABdhPJzvlSTCcW6WROkDcDvZLRqu96Xzc6vtJDJ3FS/a0I++olF+01zUgD6+TMAJ9TnmwyAr3yE5Dg==
X-Received: by 2002:a65:498f:: with SMTP id r15mr2697101pgs.345.1590564714992; 
 Wed, 27 May 2020 00:31:54 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id u14sm1371787pfc.87.2020.05.27.00.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 00:31:53 -0700 (PDT)
Date: Wed, 27 May 2020 00:31:50 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v5 06/11] net: ethernet: mtk-star-emac: new driver
Message-ID: <20200527073150.GA3384158@ubuntu-s3-xlarge-x86>
References: <20200522120700.838-1-brgl@bgdev.pl>
 <20200522120700.838-7-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522120700.838-7-brgl@bgdev.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_003156_055723_7354F853 
X-CRM114-Status: GOOD (  17.66  )
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
Cc: Edwin Peer <edwin.peer@broadcom.com>, devicetree@vger.kernel.org,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, Pedro Tsai <pedro.tsai@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 clang-built-linux@googlegroups.com,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, May 22, 2020 at 02:06:55PM +0200, Bartosz Golaszewski wrote:

<snip>

> diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> new file mode 100644
> index 000000000000..789c77af501f
> --- /dev/null
> +++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> @@ -0,0 +1,1678 @@

<snip>

I've searched netdev and I cannot find any reports from others but this
function introduces a clang warning:

drivers/net/ethernet/mediatek/mtk_star_emac.c:1296:6: warning: variable 'new_dma_addr' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
        if (!new_skb) {
            ^~~~~~~~
drivers/net/ethernet/mediatek/mtk_star_emac.c:1321:23: note: uninitialized use occurs here
        desc_data.dma_addr = new_dma_addr;
                             ^~~~~~~~~~~~
drivers/net/ethernet/mediatek/mtk_star_emac.c:1296:2: note: remove the 'if' if its condition is always false
        if (!new_skb) {
        ^~~~~~~~~~~~~~~
drivers/net/ethernet/mediatek/mtk_star_emac.c:1285:6: warning: variable 'new_dma_addr' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
        if ((desc_data.flags & MTK_STAR_DESC_BIT_RX_CRCE) ||
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/mediatek/mtk_star_emac.c:1321:23: note: uninitialized use occurs here
        desc_data.dma_addr = new_dma_addr;
                             ^~~~~~~~~~~~
drivers/net/ethernet/mediatek/mtk_star_emac.c:1285:2: note: remove the 'if' if its condition is always false
        if ((desc_data.flags & MTK_STAR_DESC_BIT_RX_CRCE) ||
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/mediatek/mtk_star_emac.c:1285:6: warning: variable 'new_dma_addr' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
        if ((desc_data.flags & MTK_STAR_DESC_BIT_RX_CRCE) ||
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/mediatek/mtk_star_emac.c:1321:23: note: uninitialized use occurs here
        desc_data.dma_addr = new_dma_addr;
                             ^~~~~~~~~~~~
drivers/net/ethernet/mediatek/mtk_star_emac.c:1285:6: note: remove the '||' if its condition is always false
        if ((desc_data.flags & MTK_STAR_DESC_BIT_RX_CRCE) ||
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/mediatek/mtk_star_emac.c:1274:25: note: initialize the variable 'new_dma_addr' to silence this warning
        dma_addr_t new_dma_addr;
                               ^
                                = 0
3 warnings generated.

> +static int mtk_star_receive_packet(struct mtk_star_priv *priv)
> +{
> +	struct mtk_star_ring *ring = &priv->rx_ring;
> +	struct device *dev = mtk_star_get_dev(priv);
> +	struct mtk_star_ring_desc_data desc_data;
> +	struct net_device *ndev = priv->ndev;
> +	struct sk_buff *curr_skb, *new_skb;
> +	dma_addr_t new_dma_addr;

Uninitialized here

> +	int ret;
> +
> +	spin_lock(&priv->lock);
> +	ret = mtk_star_ring_pop_tail(ring, &desc_data);
> +	spin_unlock(&priv->lock);
> +	if (ret)
> +		return -1;
> +
> +	curr_skb = desc_data.skb;
> +
> +	if ((desc_data.flags & MTK_STAR_DESC_BIT_RX_CRCE) ||
> +	    (desc_data.flags & MTK_STAR_DESC_BIT_RX_OSIZE)) {
> +		/* Error packet -> drop and reuse skb. */
> +		new_skb = curr_skb;
> +		goto push_new_skb;

this goto

> +	}
> +
> +	/* Prepare new skb before receiving the current one. Reuse the current
> +	 * skb if we fail at any point.
> +	 */
> +	new_skb = mtk_star_alloc_skb(ndev);
> +	if (!new_skb) {
> +		ndev->stats.rx_dropped++;
> +		new_skb = curr_skb;
> +		goto push_new_skb;

and this goto

> +	}
> +
> +	new_dma_addr = mtk_star_dma_map_rx(priv, new_skb);
> +	if (dma_mapping_error(dev, new_dma_addr)) {
> +		ndev->stats.rx_dropped++;
> +		dev_kfree_skb(new_skb);
> +		new_skb = curr_skb;
> +		netdev_err(ndev, "DMA mapping error of RX descriptor\n");
> +		goto push_new_skb;
> +	}
> +
> +	/* We can't fail anymore at this point: it's safe to unmap the skb. */
> +	mtk_star_dma_unmap_rx(priv, &desc_data);
> +
> +	skb_put(desc_data.skb, desc_data.len);
> +	desc_data.skb->ip_summed = CHECKSUM_NONE;
> +	desc_data.skb->protocol = eth_type_trans(desc_data.skb, ndev);
> +	desc_data.skb->dev = ndev;
> +	netif_receive_skb(desc_data.skb);
> +
> +push_new_skb:
> +	desc_data.dma_addr = new_dma_addr;

assign it uninitialized here.

> +	desc_data.len = skb_tailroom(new_skb);
> +	desc_data.skb = new_skb;
> +
> +	spin_lock(&priv->lock);
> +	mtk_star_ring_push_head_rx(ring, &desc_data);
> +	spin_unlock(&priv->lock);
> +
> +	return 0;
> +}

I don't know if there should be a new label that excludes that
assignment for those particular gotos or if new_dma_addr should
be initialized to something at the top. Please take a look at
addressing this when you get a chance.

Cheers,
Nathan

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
