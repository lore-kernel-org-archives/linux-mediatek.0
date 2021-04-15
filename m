Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E5B5C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 23:11:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF004610FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 23:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF004610FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cLwTl6nTrOdlIX1QvEeaO8PgYfZeq/WnE7YVBC+QZcs=; b=TlmlDdpK1lCr8eRgcDcwZ5Hou
	sjmXDtw0NMk/57s5stMPf8tgLr/UyzZcw/zj6ypVThldbWeyM1EaDsejru6OC0GRcbtvHekGXaIlc
	7HCFkjyBrI7bxwwIPKiluxQQcUEMbHyaZLcwjq7MRwNsFn9gxsFTED17itqeRG2VUj9xPvY+F68SZ
	rUX34ruhId7jc1QRnnLcXuIfahhXYVIX6HnGPS8GChoUZRpW24NAX4yj5gopf7wmdbfZ7/U3TrQ5z
	+kEUDBk8XuDIBXOzB7Wj/J99Y3WxVRs+7X4xsZeANyypHR6PHrXHGx/WJqrdiC2Igi0VTTyMUrfHV
	2vY2OYyCw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXB8Z-0001Sn-8X; Thu, 15 Apr 2021 23:11:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXB8C-0001R1-Pk; Thu, 15 Apr 2021 23:10:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0kQeFOiZj3563xYf018wimJpBSwQX9FNjlDY7loSqFA=; b=03YXkW4gVbxRmIDf9EiaQvvXdF
 rYHQSkz8RGsvXs1PWJ0q0emq9gBEzrX/8phonU6WtxeVjO15GGz3PIMCzTpY1+sa2lSpyObTfnvPw
 867hHs5/3GdjV1zEQKvyApKzt/voRSIUAX0UlN7k0G/EhfRbU9NwKMuDl8jDf718RmzLcahDbXrZS
 zoTGVlJJbIJuM9TDdQI7GfdXz7ucUxKek8/Bbj5yTq2nQ5bblFHErZa5culDDWH+tcebkU3pKoDuw
 JvHqs1gqACk3SA6Mco7RF9Iy62jUFfTGZQAeHJcjIYoyaw4rCvATUw9xjCLE9Q3bfgpJ1/rzxKpuH
 2aHtVOWA==;
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXB8A-008xf9-6t; Thu, 15 Apr 2021 23:10:39 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lXB7s-00GyY2-Pu; Fri, 16 Apr 2021 01:10:20 +0200
Date: Fri, 16 Apr 2021 01:10:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: ethernet: mediatek: ppe: fix busy wait loop
Message-ID: <YHjH3DxteZrID2hW@lunn.ch>
References: <20210415230234.14895-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210415230234.14895-1-ilya.lipnitskiy@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_161038_268864_4E3B825D 
X-CRM114-Status: GOOD (  19.04  )
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

On Thu, Apr 15, 2021 at 04:02:34PM -0700, Ilya Lipnitskiy wrote:
> The intention is for the loop to timeout if the body does not succeed.
> The current logic calls time_is_before_jiffies(timeout) which is false
> until after the timeout, so the loop body never executes.
> 
> time_is_after_jiffies(timeout) will return true until timeout is less
> than jiffies, which is the intended behavior here.
> 
> Fixes: ba37b7caf1ed ("net: ethernet: mtk_eth_soc: add support for initializing the PPE")
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> Cc: Felix Fietkau <nbd@nbd.name>
> ---
>  drivers/net/ethernet/mediatek/mtk_ppe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
> index 71e1ccea6e72..af3c266297aa 100644
> --- a/drivers/net/ethernet/mediatek/mtk_ppe.c
> +++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
> @@ -46,7 +46,7 @@ static int mtk_ppe_wait_busy(struct mtk_ppe *ppe)
>  {
>  	unsigned long timeout = jiffies + HZ;
>  
> -	while (time_is_before_jiffies(timeout)) {
> +	while (time_is_after_jiffies(timeout)) {
>  		if (!(ppe_r32(ppe, MTK_PPE_GLO_CFG) & MTK_PPE_GLO_CFG_BUSY))
>  			return 0;

Maybe see is iopoll.h can be used.

      Andrew

>  
> -- 
> 2.31.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
