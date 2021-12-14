Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDB2C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Dec 2021 07:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6LzYGOnR+rgFsaJc0Fc/iw5psJByuXmTth69TimKm6c=; b=Ev3siFLhFHR9qA
	PNAVAfA+CuI4U+LM0hM1/C6mF6OjbSIEIeKErBbxMulFEEoQ6yDv7+wZPwwTcSOu1GXXx2fyuBoyD
	3lkkRrtcEM74qobyX0y2yk1PPvd0Qc8sM7BbDL/8KTQuVaNm7k50HEJ5YQEi6jmaTB2aRt60PQjzu
	hbi8R1Iyjrv4SvHs/KBq2tJpOnpGNmR9/sbOmoCIs9iRaMxMzJpLRpFibVQNW79+3SXoJj0eG+DL1
	RWY3jMU/xKpAlLPjAkCuU/NuiW5EXOzLA2P+IRsh2OrBmkCxItOhGhZ6IRwmT9YnLkaf9YWxnLjx+
	hw3CmzkdThZKgvio5Bgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx2JL-00CtWk-ST; Tue, 14 Dec 2021 07:33:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx2Hb-00CsrF-3w; Tue, 14 Dec 2021 07:31:34 +0000
X-UUID: 492aa416ff234738b5789b2f8a423136-20211214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=R+nhhrrFvU6d39143ONNN4FTrr1zECW086ooZ3Zhwow=; 
 b=A7UlTyAoFZZku6bzYofOVBm2hZA7ZKJXeL5ZGSRVeGZAAnGu4E3PhC2hru0QO16ch5B7FFoizmO/vzVInSfZLUn44hzg6p1yWv01fWSXdFPmQ83iE63bmlwD6HafRU+kVOvtUEImF5CXDSDH7eL7n0WZmAhI7gvhZx7lkl5+Ags=;
X-UUID: 492aa416ff234738b5789b2f8a423136-20211214
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 452698508; Tue, 14 Dec 2021 00:31:27 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Dec 2021 23:31:26 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Dec 2021 15:31:24 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Dec 2021 15:31:23 +0800
Message-ID: <ebf58066a131f92c68e83a1ef56b88f435fa0d08.camel@mediatek.com>
Subject: Re: [SPAM][PATCH] iommu/mediatek: Validate number of phandles
 associated with "mediatek,larbs"
From: Yong Wu <yong.wu@mediatek.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <iommu@lists.linux-foundation.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>, "kernel
 test robot" <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Dec 2021 15:31:25 +0800
In-Reply-To: <20211210205704.1664928-1-linux@roeck-us.net>
References: <20211210205704.1664928-1-linux@roeck-us.net>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_233132_641308_5EA71310 
X-CRM114-Status: GOOD (  23.91  )
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

On Fri, 2021-12-10 at 12:57 -0800, Guenter Roeck wrote:
> Since commit baf94e6ebff9 ("iommu/mediatek: Add device link for smi-
> common
> and m4u"), the driver assumes that at least one phandle associated
> with
> "mediatek,larbs" exists. If that is not the case, for example if
> reason
> "mediatek,larbs" is provided as boolean property, the code will use
> an
> uninitialized pointer and may crash. To fix the problem, ensure that
> the
> number of phandles associated with "mediatek,larbs" is at least 1 and
> bail out immediately if that is not the case.

From the dt-binding, "mediatek,larbs" always is a phandle-array. I 
assumed the dts should conform to the dt-binding before. Then the
problem is that if we should cover the case that someone abuses/attacks
the dts. Could you help add more comment in the commit message?
something like: this is for avoid abuse the dt-binding.

> 
> Cc: Yong Wu <yong.wu@mediatek.com>
> Cc: Tomasz Figa <tfiga@chromium.org>
> Fixes: baf94e6ebff9 ("iommu/mediatek: Add device link for smi-common
> and m4u")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/iommu/mtk_iommu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 25b834104790..0bbe32d0a2a6 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -828,6 +828,8 @@ static int mtk_iommu_probe(struct platform_device
> *pdev)
>  					     "mediatek,larbs", NULL);
>  	if (larb_nr < 0)
>  		return larb_nr;
> +	if (larb_nr == 0)
> +		return -EINVAL;

Just assigning the larbnode to NULL may be simpler. In this case, it
won't enter the loop below, and return 0 in the
of_parse_phandle(larbnode, "mediatek,smi", 0).

-       struct device_node      *larbnode, *smicomm_node;
+       struct device_node      *larbnode = NULL, *smicomm_node;

>  
>  	for (i = 0; i < larb_nr; i++) {
>  		u32 id;
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
