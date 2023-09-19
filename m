Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892D2CD54A7
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 08:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pYZm4hp9gvX8nggL5YhWsmaKor+rHmaKPyGwMDbBDpk=; b=TYKmyeL0F45U8QBUJ6rojRXS7m
	/rnTZ9Q/XvIkaaq/hEkFLP++7+/zaM6u7b+8DLw32HGMdv/KVM++p9/StTFFsjA1RqBkbFh7X3mxd
	pZLiUseXxY6lozl2TzbCgZqVlWGxYc/g/D9hcW47SRhxMELStmDprNnDKEUqY0sfDN5TJrDWsguty
	weHId/wPerCUH1vikB031fQejrXQtVMFKwejvxJvTgppj9pIu8b5INkeEzdHXNJfg2kD6oYst13XR
	5g1z+4YQ2pfc//6M1GHh++LOLkJ7m/miFu9ZwoU7BVEOQSFrNjO7egXyHNC8C40/TwfZiANN719xt
	YCzsByQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiVsh-00HLYl-19;
	Tue, 19 Sep 2023 08:14:51 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiVse-00HLXu-18;
	Tue, 19 Sep 2023 08:14:49 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qiVsO-0004jH-01;
	Tue, 19 Sep 2023 08:14:32 +0000
Date: Tue, 19 Sep 2023 09:14:23 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 5/9] net: dsa: mt7530: Convert to platform
 remove callback returning void
Message-ID: <ZQlYXybKPSEew2w1@makrotopia.org>
References: <20230918191916.1299418-1-u.kleine-koenig@pengutronix.de>
 <20230918191916.1299418-6-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230918191916.1299418-6-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_011448_390715_5ED6E953 
X-CRM114-Status: GOOD (  25.73  )
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

On Mon, Sep 18, 2023 at 09:19:12PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Daniel Golle <daniel@makrotopia.org>

> ---
>  drivers/net/dsa/mt7530-mmio.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530-mmio.c b/drivers/net/dsa/mt7530-mmio.c
> index 0a6a2fe34e64..b74a230a3f13 100644
> --- a/drivers/net/dsa/mt7530-mmio.c
> +++ b/drivers/net/dsa/mt7530-mmio.c
> @@ -63,15 +63,12 @@ mt7988_probe(struct platform_device *pdev)
>  	return dsa_register_switch(priv->ds);
>  }
>  
> -static int
> -mt7988_remove(struct platform_device *pdev)
> +static void mt7988_remove(struct platform_device *pdev)
>  {
>  	struct mt7530_priv *priv = platform_get_drvdata(pdev);
>  
>  	if (priv)
>  		mt7530_remove_common(priv);
> -
> -	return 0;
>  }
>  
>  static void mt7988_shutdown(struct platform_device *pdev)
> @@ -88,7 +85,7 @@ static void mt7988_shutdown(struct platform_device *pdev)
>  
>  static struct platform_driver mt7988_platform_driver = {
>  	.probe  = mt7988_probe,
> -	.remove = mt7988_remove,
> +	.remove_new = mt7988_remove,
>  	.shutdown = mt7988_shutdown,
>  	.driver = {
>  		.name = "mt7530-mmio",
> -- 
> 2.40.1
> 
> 

