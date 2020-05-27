Return-Path: <SRS0=IT6v=7J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC32FC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 16:36:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76FAE20899
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 16:36:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kct2kH4R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAMb3Gig"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76FAE20899
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rItjM7hoOMLGSn38I4DlWwUhEESYuLd0IZIejp4umWs=; b=Kct2kH4RYOtRoY
	GtU8JFYkJJ7YKLMOP6KIXVk45wPmGnWczmLcopBX08oUdHi/fZ3xsbw+Jnlh6gibL8e74gG3Ny7RV
	ByCJ1b/We4EUnonl5fJUtx2kDXVIRENjBqCNLfeRrmRHqehH4+lwCPIr264PBAVDaI5W3iXbMma1N
	nImM7/pakdZZlGoLWmlZsc444AnblaBFurtQwIjJjqSDWy3ONx7MD3ByvjRbESoPyKKNmOII5iGSg
	vOmBmudem8pgtJ9nX1jJXbcZLsFVJ4eQD6vAJODKEBFWaL/+KjBChxJQtx9i9EJw0Cfx+j9a5M3qX
	FI7Teez2lWkCGb2af+ew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdz2M-0006lU-0U; Wed, 27 May 2020 16:36:14 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdyOK-0004Er-IF; Wed, 27 May 2020 15:54:54 +0000
Received: by mail-pl1-x642.google.com with SMTP id m7so10281311plt.5;
 Wed, 27 May 2020 08:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nkIhbxtFT/sWyLG+CNPMvzFZfh5YwCelX3IPeKtDVng=;
 b=PAMb3Gighhz0cCKhjZLQ89rDfM+umkVZTkpYgFwBdzZ9PIGR1KNuJfANRSBsICHGU1
 9GFY4+NhktZozymnBZgQaGPkn8QdPxDOXGhFk13RvLQfW7JVN2KYbsdVXfBT1OinJLIp
 zrRy0l+YVDGcMRQy8Ldm4ZecscejFQHzikG3HLWm++8UC3ai8KnWZCyKH6z7T/HA1xRI
 Wp+WUBUbWpR2kBaZ0JpFXShORG+eXejQ1vCRS83kPuIkPDQqhhjsTVcFK0GFU7CbfTMs
 dACufN3iOpLHsbWp1FGFQTUumq0BZHbJAIhG4FZ5GeQo+es6H96EK3UqJhZ/+Te+5OLe
 Y23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nkIhbxtFT/sWyLG+CNPMvzFZfh5YwCelX3IPeKtDVng=;
 b=JAEhq6OwdEVRH3LtcwGd7voD0W3QZCA6KG4xc+mzfGRcBXUgjzGdbxc85inywLRCZd
 40jZ9Cbx2aTXiczp0ds0NQ50+MuAEG7CtIfGbuvU09BW0Tou6yeyAeL71KIBzEyjecw4
 9vvIBKBEuae9qwBd7fyfyfPRK6T+uADY653sWzWrHT4KjBLdj44EzBbHyw7CxUQH10cJ
 q9f0wjH2fPo5y3qjS5JwP1egKaO6+qR/R9nvVArTyQqoFM1mnVOR1f8PJ7nvtzxe4SG4
 CdiNc1rWeWGKmA1KagjH7a5tp6q/8ywkYiZPVJMKigGh9pBHZiSgfU1UHAKrF1XwxyGF
 jcsQ==
X-Gm-Message-State: AOAM5326ZGpJgz7RNhGqOH/t3eQSm92dfeJHspl9K5ZCJnSq8AvQ5E3X
 rn7J92orMcGAWTrbdxhqNogrl0q602A=
X-Google-Smtp-Source: ABdhPJxjWquEPV+JeRdzbhyTylh3GgQILPCaziRrufi5RFxgpIErfBy/fC56S/kQiDi7y42BfuoXZQ==
X-Received: by 2002:a17:902:9882:: with SMTP id
 s2mr6368400plp.184.1590594891507; 
 Wed, 27 May 2020 08:54:51 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id q44sm3286859pja.2.2020.05.27.08.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 08:54:50 -0700 (PDT)
Date: Wed, 27 May 2020 08:54:47 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] net: ethernet: mtk-star-emac: fix error path in RX
 handling
Message-ID: <20200527155447.GA568403@ubuntu-s3-xlarge-x86>
References: <20200527092404.3567-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200527092404.3567-1-brgl@bgdev.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_085452_713059_49544BA6 
X-CRM114-Status: GOOD (  15.49  )
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
Cc: Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, May 27, 2020 at 11:24:04AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The dma_addr field in desc_data must not be overwritten until after the
> new skb is mapped. Currently we do replace it with uninitialized value
> in error path. This change fixes it by moving the assignment before the
> label to which we jump after mapping or allocation errors.
> 
> Fixes: 8c7bd5a454ff ("net: ethernet: mtk-star-emac: new driver")
> Reported-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Tested-by: Nathan Chancellor <natechancellor@gmail.com> # build

> ---
>  drivers/net/ethernet/mediatek/mtk_star_emac.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> index b74349cede28..72bb624a6a68 100644
> --- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
> +++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> @@ -1308,6 +1308,8 @@ static int mtk_star_receive_packet(struct mtk_star_priv *priv)
>  		goto push_new_skb;
>  	}
>  
> +	desc_data.dma_addr = new_dma_addr;
> +
>  	/* We can't fail anymore at this point: it's safe to unmap the skb. */
>  	mtk_star_dma_unmap_rx(priv, &desc_data);
>  
> @@ -1318,7 +1320,6 @@ static int mtk_star_receive_packet(struct mtk_star_priv *priv)
>  	netif_receive_skb(desc_data.skb);
>  
>  push_new_skb:
> -	desc_data.dma_addr = new_dma_addr;
>  	desc_data.len = skb_tailroom(new_skb);
>  	desc_data.skb = new_skb;
>  
> -- 
> 2.25.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
