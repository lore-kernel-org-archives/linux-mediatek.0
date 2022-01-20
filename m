Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8C2C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jan 2022 06:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzggmamMTcT62HBXbKgIVC6Ku097LF+ePLUhYftF1+I=; b=tz9OMM4CJ1J+2H
	7mm9TABH0oXw/IsU9TPj2MIMtlVMbBxszHunqw/8GKotGqzLd8abW/TZCiKdR+zZ6sIGF0BALTmGr
	TTm0/IP2+0BVVXCOh8ryrSOW00fR+SBwiODrwrhLkqwTSTMColV/lUn2MuVGMI776wLIIdjg2tHDF
	iEND1kOXmGCH7uOEWq/3je9SKzXup8KJeDOBUACt+TSgKM9CKFZDHICmCFQy1x3qKlyio+gQmyypN
	S16jsdm9ga1fFvS5nAUunu3nsfTp1CQiDf+WhkZ8BA9hAPYdkE52AiO1J0hsbualvxpEtCrd2kTtZ
	RD4STzlsnPMiE2QY78kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAQzb-0092Py-06; Thu, 20 Jan 2022 06:32:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAQzM-0092No-Bh; Thu, 20 Jan 2022 06:32:08 +0000
X-UUID: 087714855e9849a29c61ce42f5e55996-20220119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=gGooAwrkBzPf4neZRWsAA9RU9epTYzOROVLAgriF+/8=; 
 b=TD848gLqDkuv0+kdKQ3GEAisF5qX9OWaJ+Ll7PL1WXJiAAHcBf9b2BkABQJjxB5Ea740iA6UHRNDTOPHzgOZw1bvqUDfloye99d62sUex5QZThnePrn2XEzelHBobzwllb32XJ7FQlsiPDnCmbSu5Z9R5I5b39qSknzySVcuCrw=;
X-UUID: 087714855e9849a29c61ce42f5e55996-20220119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1349894543; Wed, 19 Jan 2022 23:31:59 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 22:31:57 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 20 Jan 2022 14:31:56 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Jan 2022 14:31:55 +0800
Message-ID: <b7d0e7572ce7f7958f579ac564d25cbfee497cdc.camel@mediatek.com>
Subject: Re: [PATCH][next] usb: xhci-mtk: Use struct_size() helper in
 create_sch_ep()
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-hardening@vger.kernel.org>
Date: Thu, 20 Jan 2022 14:31:55 +0800
In-Reply-To: <20220120015546.GA75917@embeddedor>
References: <20220120015546.GA75917@embeddedor>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_223205_823751_CE551F7E 
X-CRM114-Status: GOOD (  16.07  )
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

On Wed, 2022-01-19 at 19:55 -0600, Gustavo A. R. Silva wrote:
> Make use of the struct_size() helper instead of an open-coded
> version,
> in order to avoid any potential type mistakes or integer overflows
> that,
> in the worst scenario, could lead to heap overflows.
> 
> Also, address the following sparse warnings:
> drivers/usb/host/xhci-mtk-sch.c:265:20: warning: using sizeof on a
> flexible structure
> 
> Link: https://github.com/KSPP/linux/issues/160
> Link: https://github.com/KSPP/linux/issues/174
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/usb/host/xhci-mtk-sch.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-
> mtk-sch.c
> index edbfa82c6565..f3139ce7b0a9 100644
> --- a/drivers/usb/host/xhci-mtk-sch.c
> +++ b/drivers/usb/host/xhci-mtk-sch.c
> @@ -248,7 +248,6 @@ create_sch_ep(struct xhci_hcd_mtk *mtk, struct
> usb_device *udev,
>  	struct mu3h_sch_bw_info *bw_info;
>  	struct mu3h_sch_tt *tt = NULL;
>  	u32 len_bw_budget_table;
> -	size_t mem_size;
>  
>  	bw_info = get_bw_info(mtk, udev, ep);
>  	if (!bw_info)
> @@ -262,9 +261,9 @@ create_sch_ep(struct xhci_hcd_mtk *mtk, struct
> usb_device *udev,
>  	else
>  		len_bw_budget_table = 1;
>  
> -	mem_size = sizeof(struct mu3h_sch_ep_info) +
> -			len_bw_budget_table * sizeof(u32);
> -	sch_ep = kzalloc(mem_size, GFP_KERNEL);
> +	sch_ep = kzalloc(struct_size(sch_ep, bw_budget_table,
> +				     len_bw_budget_table),
> +			 GFP_KERNEL);
>  	if (!sch_ep)
>  		return ERR_PTR(-ENOMEM);
Acked-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks a lot

>  
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
