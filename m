Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46ABC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Dec 2021 01:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uOH+8tppTRFbf2HNGfsF9DzJYl2JBXj8eVDnsLA0b4I=; b=AgX3vGHVWDG8Lf
	uxU0gVVs7J3nGbix2CPGnaKg74c5BHqz/37TBUtYw3A7Vrotfqb5lAwN6Kkf6UCu3CvNh4UdIpKEO
	olEUJ+NpaXV6b0mGvuc/fnlYfqAZQ/x4BKBy4pVqYA1N1WOeqgFmkx5MdQT7s6iVCJGeE+lWW5CGr
	O4MMA6BsNzCvBiNikYH+ZvJdbUvhe6eCNNX/a2BsR2+k7fiutsIHQFbYEcFt/+E+IYBaJEtiaIVNG
	x1r1+rAbPArgOQZvVFlf7eVKfHw77DtNmGm4dTCe2omW4jyNRvw92cimp14iJ+Use36385/5qaceq
	kGNaEpKbumxdJwFiziHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2kg5-003ZFL-Ao; Thu, 30 Dec 2021 01:56:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2kg1-003ZEp-6x; Thu, 30 Dec 2021 01:56:24 +0000
X-UUID: 27270f8a0409438aba6bddb5f5bce042-20211229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=HYqS7d+eiPmGytyx8HRz1poJJR6kp79sEhVu1clfAK8=; 
 b=e/mQkyJB35YWGcso6cQkDKbtzAlDZ6IU/LwTLXiohgLdGDkpFhktMp7Y759NzlSamGle3PGj3fouwiIfm3xFtxIjxlr2Do6FIY+dxur7LQnRjJQQSP5o+ZZEzRK7mb/ixQMrPbxhTxN1noSSr0FIEe6bQO9CTvP3hU0Io+pxSAU=;
X-UUID: 27270f8a0409438aba6bddb5f5bce042-20211229
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 498774183; Wed, 29 Dec 2021 18:56:15 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Dec 2021 17:56:09 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Dec 2021 09:56:07 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Dec 2021 09:56:07 +0800
Message-ID: <33cd21877853d3f602a7403f37a30d68e9fa3e4a.camel@mediatek.com>
Subject: Re: [PATCH] phy: mediatek: Fix missing check in mtk_mipi_tx_probe
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Miaoqian Lin <linmq006@gmail.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Kishon Vijay Abraham I <kishon@ti.com>, "Vinod
 Koul" <vkoul@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Date: Thu, 30 Dec 2021 09:56:07 +0800
In-Reply-To: <20211224082103.7658-1-linmq006@gmail.com>
References: <20211224082103.7658-1-linmq006@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_175621_306515_0FFF811F 
X-CRM114-Status: GOOD (  13.07  )
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

On Fri, 2021-12-24 at 08:21 +0000, Miaoqian Lin wrote:
> The of_device_get_match_data() function may return NULL.
> Add check to prevent potential null dereference.
> 
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> index 28ad9403c441..67b005d5b9e3 100644
> --- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> @@ -146,6 +146,8 @@ static int mtk_mipi_tx_probe(struct
> platform_device *pdev)
>  		return -ENOMEM;
>  
>  	mipi_tx->driver_data = of_device_get_match_data(dev);
> +	if (!mipi_tx->driver_data)
> +		return -ENODEV;
>  
>  	mipi_tx->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(mipi_tx->regs))

Acked-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
