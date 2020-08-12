Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E155C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 01:28:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD3042076C
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 01:28:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G4CLHMYn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fNwu8mbE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD3042076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K79xN7yiD53qSEpgM8rCbg1MASTbFGCL0xLdx0A2Q98=; b=G4CLHMYnvZh954UHJTEEBJnPf
	C0SFJsopJb89i+dNNMswne9nUQURR3QoTB8PZKRBthH/HkF2ZOFBTIGX/ggEoHBhH826knTmF9dY/
	s4E9oOMtJ+tr/Bm69VpIoTQQ9P5d7mS4Am7XBlKtl7BDxdu655aSJdW8oj8NHTjzKqXT0RlGeJe6D
	R6CHnOkkVb1qrRBRHOxx6XJx4E+Ep0pAUF++PuQrjy3x6HnpNDEeNBTphzc90w/OkN64QGP/9a98C
	+kZd61b8UTYREOQsXcTLRlq04UQLN+N0fLZ9FdpxuylQCf0NnF/aPyQl4xFmk66UCqBi2HUtRb2NR
	qsDIMnSyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5fZN-0001xX-Vz; Wed, 12 Aug 2020 01:28:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5fZG-0001wI-Du; Wed, 12 Aug 2020 01:28:39 +0000
X-UUID: d5609948da4a426c80ced48a7fcab28c-20200811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PSmyy6RB68QIlyE2RdAZ/dLjGNAiqe5NS8RADOChyZA=; 
 b=fNwu8mbEg/qvYXZ5W4yLrDB3JRk9UrylJwK4a2Ndk1tRRyy9vc1TilzsGdfOo/yEDL+Mw/FcfViBbsvb5syxTUFTlvhrujiZ98cZDHXUFFpG0uv+b8vxp3kDp/oUrnAaxl/VzCqrO1Znws+4rLUtIpOuuC7gixIbH633iqgRVnU=;
X-UUID: d5609948da4a426c80ced48a7fcab28c-20200811
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1740336376; Tue, 11 Aug 2020 17:28:28 -0800
Received: from MTKMBS32DR.mediatek.inc (172.27.6.104) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Aug 2020 18:28:24 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32DR.mediatek.inc
 (172.27.6.104) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 12 Aug 2020 09:28:19 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 Aug 2020 09:28:14 +0800
Message-ID: <1597195610.21478.10.camel@mhfsdcap03>
Subject: Re: [PATCH] usb: xhci-mtk: Fix typo
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Frank Wunderlich <linux@fw-web.de>
Date: Wed, 12 Aug 2020 09:26:50 +0800
In-Reply-To: <20200808124906.89976-1-linux@fw-web.de>
References: <20200808124906.89976-1-linux@fw-web.de>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0D2B0029EF119CD7EB5464ABFEF244164C84DA1B3C0330CEACF56DF3E90248D72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200811_212838_708007_F470AD4B 
X-CRM114-Status: GOOD (  18.43  )
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
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 2020-08-08 at 14:49 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> fix this small typo u3_ports_disabed => u3_ports_disabled
> 
> Fixes: 55ba6e9e25a6 (usb: xhci-mtk: support option to disable usb3 ports)
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  drivers/usb/host/xhci-mtk.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index 4311d4c9b68d..8f321f39ab96 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -77,7 +77,7 @@ static int xhci_mtk_host_enable(struct xhci_hcd_mtk *mtk)
>  {
>  	struct mu3c_ippc_regs __iomem *ippc = mtk->ippc_regs;
>  	u32 value, check_val;
> -	int u3_ports_disabed = 0;
> +	int u3_ports_disabled = 0;
>  	int ret;
>  	int i;
>  
> @@ -92,7 +92,7 @@ static int xhci_mtk_host_enable(struct xhci_hcd_mtk *mtk)
>  	/* power on and enable u3 ports except skipped ones */
>  	for (i = 0; i < mtk->num_u3_ports; i++) {
>  		if ((0x1 << i) & mtk->u3p_dis_msk) {
> -			u3_ports_disabed++;
> +			u3_ports_disabled++;
>  			continue;
>  		}
>  
> @@ -117,7 +117,7 @@ static int xhci_mtk_host_enable(struct xhci_hcd_mtk *mtk)
>  	check_val = STS1_SYSPLL_STABLE | STS1_REF_RST |
>  			STS1_SYS125_RST | STS1_XHCI_RST;
>  
> -	if (mtk->num_u3_ports > u3_ports_disabed)
> +	if (mtk->num_u3_ports > u3_ports_disabled)
>  		check_val |= STS1_U3_MAC_RST;
>  
>  	ret = readl_poll_timeout(&ippc->ip_pw_sts1, value,

Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
