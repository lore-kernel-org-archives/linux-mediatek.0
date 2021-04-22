Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF12C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 12:21:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1F6C613C9
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 12:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1F6C613C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+Le8BENYrmcZub3QoufjWMtQyz24JNmuDKtfrmtASOg=; b=BlUVi9siOePWrDbc+IJ7yDKpH
	4qP+RH9eogdYrYU396hsDoWo7CPWsyOl43ceKxLcxwfAuFiIQyNkx75UogKuW2FQ8QAmGEKKFqArO
	2Id81mXQZxLEwt9nIeId3AUEdcIrg+aJGyqfFW7pSPGDxrhjRsJ+jxh85J93Y7TQx9haC3G2+IXTe
	57R6FGpYLxpev6AuBejv633ZzbYKX2EAuYIRdAxAR2DHaAne6v7vuwo3iQnbj291hsCkGgq1EyeT8
	DnONpArrv2Zyl20CJowW8ksKjM7OOQYjiuL1shny2vFyQNOUAOiWPteQ+8dTau5BldWXC7pR9pTtQ
	j8tOF2m6Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZYKV-00GgDr-TR; Thu, 22 Apr 2021 12:21:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZYKI-00GgAT-NI; Thu, 22 Apr 2021 12:20:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=u2cGQfeGetEx/8JXnJ0fMnzvoAHBWjefQb8NyCGxBqM=; b=neoRsfp/Qn0MR5sfgC6E9+PHTr
 5QGTwJZKdCY7vzwgv9NK+JX6XYmzM96jq8mSMHv7YcvscSgqagu9kIebVkQ6THOgyfaIN0nIz1YGE
 q1wVJ4yorYSdWC1Egv69VQ5PtpfmkNTdpQIjd0s/ykcj3Cr+UTEIHZqy69uECxyM+fn/DDlVkrLRP
 honCm4Mt73awgZneVOllE+BBauz2gf2kQDDLfvcE1j6osmvS3nM5ygRa76hSIyw6NraHw+Rf4Ja7y
 9d81q/HQtqF1RdIkF8yHzYS4zHTjObzzmtSSia17dkdW+Qw1OS2NrF+OUEIx1EbcRXqNCZJowLYkK
 vmn0N5jg==;
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZYKG-00DfLp-Bh; Thu, 22 Apr 2021 12:20:57 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lZYK8-000Ujw-Tx; Thu, 22 Apr 2021 14:20:48 +0200
Date: Thu, 22 Apr 2021 14:20:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 14/14] net: ethernet: mtk_eth_soc: use iopoll.h
 macro for DMA init
Message-ID: <YIFqIJpAJKUrXQVS@lunn.ch>
References: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
 <20210422040914.47788-15-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210422040914.47788-15-ilya.lipnitskiy@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_052056_416020_D1870BDD 
X-CRM114-Status: GOOD (  14.87  )
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

On Wed, Apr 21, 2021 at 09:09:14PM -0700, Ilya Lipnitskiy wrote:
> Replace a tight busy-wait loop without a pause with a standard
> readx_poll_timeout_atomic routine with a 5 us poll period.
> 
> Tested by booting a MT7621 device to ensure the driver initializes
> properly.
> 
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 29 +++++++++------------
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h |  2 +-
>  2 files changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 8c863322587e..720d73d0c007 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -2037,25 +2037,22 @@ static int mtk_set_features(struct net_device *dev, netdev_features_t features)
>  /* wait for DMA to finish whatever it is doing before we start using it again */
>  static int mtk_dma_busy_wait(struct mtk_eth *eth)
>  {
> -	unsigned long t_start = jiffies;
> +	u32 val;
> +	int ret;
> +	unsigned int reg;

Nit:

Reverse christmass tree.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
