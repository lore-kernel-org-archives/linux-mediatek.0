Return-Path: <SRS0=I1M+=LI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9916EC48BE6
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jun 2021 09:44:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6384E61357
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jun 2021 09:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6384E61357
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7tp24LrUurBcPb9nXzPG3aZVS49hFwTOEiKhTCfPQRQ=; b=reTl9qPIfRFtrv
	P/j2XFITrxZ5NgB5Sxd/6qk76AF45ePbP5M41O+rin9AV0XAkLfMFa7RbXYbKmUrRmTXPepncQTWt
	p6LBMWQzA6V9aCIqnMdT5f+FN8Qwgx/kIbw4aywXK/Y7laNyGKtSecrf6D87/Hl5Z7sK7DShgVthn
	NxeQBMoBe53b+dj0iGU3jCSDRl5CCERxQC12BblzUGtuTCWZAH4U/zGdriWjmIcFhGW/nXvKjlRsV
	cvGWG+GLIzyLRyQgChbO53kQNyoQx50lCV238rlMDNyeRVso492OFrw99RdOVqoscDG5RzvoiEQku
	AB0ZKbCJQ03ebktZP+tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsj8R-00DPNM-Qx; Mon, 14 Jun 2021 09:43:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsj8C-00DPIW-SF; Mon, 14 Jun 2021 09:43:47 +0000
X-UUID: bd63ec30128e4eb4af296aa029bcb948-20210614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2A1f6XDFYkwNi91DySc3Su3T4fsohrPpjEGF06tNFnQ=; 
 b=SBUeaOmz+99G+xVqEAXLyeMecqXktYYNXnqyV1pCb4fjdhH6ppbkCx4mUJf3m0l3fGnKJesr3wTrpQt/R7Csy2wgD1gSVt3ukNjj5e05noFfdKyjdH4Zc68gu8vt7iLFK2ylo6vS4drZfX0q2vqj4qfFnVpfryXnt3L2UGDzfJM=;
X-UUID: bd63ec30128e4eb4af296aa029bcb948-20210614
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <james.lo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 180136027; Mon, 14 Jun 2021 02:43:38 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Jun 2021 02:43:30 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Jun 2021 17:43:29 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Jun 2021 17:43:29 +0800
Message-ID: <d23e965b271fea96b75bf72b888eb281e514237e.camel@mediatek.com>
Subject: Re: [PATCH] soc: mediatek: pwarp: delete confusing comments
From: James Lo <james.lo@mediatek.com>
To: <matthias.bgg@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Date: Mon, 14 Jun 2021 17:43:29 +0800
In-Reply-To: <20210611111307.29038-1-matthias.bgg@kernel.org>
References: <20210611111307.29038-1-matthias.bgg@kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_024344_975941_AD0060F0 
X-CRM114-Status: GOOD (  14.88  )
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


Thank you for your kind assistance.

Many thanks
James Lo


On Fri, 2021-06-11 at 13:13 +0200, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Comments sugguest that MT8195 arb_en_all and int_en_all values need
> to
> be confirmed. But actually these values are correct.
> 
> Suggested-by: James Lo <james.lo@mediatek.com>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> ---
> 
>  drivers/soc/mediatek/mtk-pmic-wrap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c
> b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index 952bc554f443..118eb4acdeb6 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -2047,8 +2047,8 @@ static const struct pmic_wrapper_type
> pwrap_mt8183 = {
>  static struct pmic_wrapper_type pwrap_mt8195 = {
>  	.regs = mt8195_regs,
>  	.type = PWRAP_MT8195,
> -	.arb_en_all = 0x777f, /* NEED CONFIRM */
> -	.int_en_all = 0x180000, /* NEED CONFIRM */
> +	.arb_en_all = 0x777f,
> +	.int_en_all = 0x180000,
>  	.int1_en_all = 0,
>  	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
>  	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
