Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072A3C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 03:07:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7F79611ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 03:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7F79611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qtHsXdCSkBSQqwnjVeBBIv9lwrC53MXhAoGxSyz3cXo=; b=Ivp2GWvDJN6SnD
	1wws979APxsIIW2fVXBtIaFVncDZN61GZVN0BLuATTcnPaVgagHxuOvmAKzQsryy9ZPfMJ/IOvhbI
	rrBtRl/wg5nfEvXf52ubf2f4PGHcl2YBGs0bPdbDvRmE2xND1YbMLEK5NnC0EWnDOxGzrnu/p46FE
	issWI0KML+xF0QaQf7JONyxQaJAM4AiOPYNH/wzFTLLwrR9p5MbN9EP2ehTIRAXm1TqYuRWfh+fsc
	ta+hJ8o8vMNO/Kf7XWfBarKMcwPKzCerVxIIJh9vppABbt4N3l7meneN/UWerkxeThZk13BZ1HlAT
	vEEcK0ht3lhlJ9oe/nmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQLGa-007vqQ-B3; Wed, 15 Sep 2021 03:07:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQLGW-007vph-BK; Wed, 15 Sep 2021 03:07:19 +0000
X-UUID: 3d7fb2eb30e6432880dbf8ac8d649e2a-20210914
X-UUID: 3d7fb2eb30e6432880dbf8ac8d649e2a-20210914
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1769125344; Tue, 14 Sep 2021 20:07:11 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Sep 2021 20:07:09 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 15 Sep 2021 11:07:02 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 15 Sep 2021 11:07:02 +0800
Message-ID: <7a1af556bf3b7dda9f1be848d2631448a1155ec6.camel@mediatek.com>
Subject: Re: [PATCH -next] ASoC: mediatek: mt8195: Add missing of_node_put()
From: Trevor Wu <trevor.wu@mediatek.com>
To: Bixuan Cui <cuibixuan@huawei.com>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <matthias.bgg@gmail.com>, <alsa-devel@alsa-project.org>
Date: Wed, 15 Sep 2021 11:07:02 +0800
In-Reply-To: <20210911081246.33867-1-cuibixuan@huawei.com>
References: <20210911081246.33867-1-cuibixuan@huawei.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_200716_471957_57CAC688 
X-CRM114-Status: GOOD (  18.94  )
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

Hi Bixuan,

Thanks for catching that.
I found there are other usages of of_parse_phandle() in the file.
Will you handle them together?
If not, I will prepare a patch to fix them after this patch is merged.

Thanks,
Trevor

On Sat, 2021-09-11 at 16:12 +0800, Bixuan Cui wrote:
> The platform_node is returned by of_parse_phandle() should have
> of_node_put() before return.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
> ---
>  sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
> b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
> index c97ace7387b4..8cd8450409e8 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
> @@ -1041,8 +1041,10 @@ static int
> mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
>  	}
>  
>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> -	if (!priv)
> +	if (!priv) {
> +		of_node_put(platform_node);
>  		return -ENOMEM;
> +	}
>  
>  	snd_soc_card_set_drvdata(card, priv);
>  
> @@ -1050,6 +1052,8 @@ static int
> mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
>  	if (ret)
>  		dev_err(&pdev->dev, "%s snd_soc_register_card fail
> %d\n",
>  			__func__, ret);
> +
> +	of_node_put(platform_node);
>  	return ret;
>  }
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
