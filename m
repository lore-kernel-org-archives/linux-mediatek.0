Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D85CC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 13:31:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9007208E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 13:31:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tMR5vnHZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="D8Qo80RO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9007208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e2EQftC9ZqAV9AM7+oYxMDpQbetPcmF6YhImAQWgHxc=; b=tMR5vnHZb3lbUQW1KFVnoVnqJ
	NRRm8H3wXvFUz0VHTrNWtWZtBxjSSe3vE+WukDf4i7FXF/2/4bkts0xe7FJ2ocrupL3ATl8xNIbpB
	R0wr+KMi/ae9JCurhOwj8BCzshOK0RZi/pStgunPnyC4PtEvZqiT34y3t4XzkD8f2N1H3ICDCVBKQ
	vJirFr0D1KbgYlfKGrYbd7utTa7ut2CP1Rdh+vQHeo9vUSjQcG6316DhjBwiJbT6r0yuf56IqSD5M
	kQ2/o5NXM7b/wUfzN0Z/GjC6xyaX24PRd0uvn98iFsA3p4WWt4JdvYeagld4f/Xbfrrd7rjfCbo6Y
	W9J007P3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAvWI-00070B-TZ; Wed, 26 Aug 2020 13:31:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAvWG-0006zE-Lr; Wed, 26 Aug 2020 13:31:17 +0000
X-UUID: dd09d2c50c744845a60e9760d3b1c3a1-20200826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=03acJo/Im0QezgGzNXuxpYDJ+zjBjETD20zLt87IkE4=; 
 b=D8Qo80RO3as1IxFATP06pxn1c2gA24MFACFEz8djSUrxIORXzYQiHDgWEy7eOvkci1+S9Ff3dWodQIjCDwZlRlKdqvlO0MCopG8xvteHKnUkdxukcMoFc3OqUih+9QpGBTMQDKC+RTz5MQfdC8l5WUbTeDNZZJBJcZgrKjV8h7A=;
X-UUID: dd09d2c50c744845a60e9760d3b1c3a1-20200826
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <andrew-ct.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 736801143; Wed, 26 Aug 2020 05:31:12 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 06:31:09 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 21:31:07 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 Aug 2020 21:31:07 +0800
Message-ID: <1598448669.18394.8.camel@mtksdaap41>
Subject: Re: [PATCH v3] nvmem: mtk-efuse: Remove EFUSE register write support
From: andrew-ct chen <andrew-ct.chen@mediatek.com>
To: Chih-En Hsu <chih-en.hsu@mediatek.com>
Date: Wed, 26 Aug 2020 21:31:09 +0800
In-Reply-To: <20200826083943.810-1-chih-en.hsu@mediatek.com>
References: <20200826083943.810-1-chih-en.hsu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_093116_952193_A465EB92 
X-CRM114-Status: GOOD (  17.35  )
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
Cc: srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Michael.Mei@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Chih-En,


On Wed, 2020-08-26 at 16:39 +0800, Chih-En Hsu wrote:
> This patch is to remove function "mtk_reg_write" since
> Mediatek EFUSE hardware only supports read functionality
> for NVMEM consumers.

Acked-by: Andrew-CT Chen <andrew-ct.chen@mediatek.com>

> 
> Fixes: ba360fd040e3 ("nvmem: mtk-efuse: remove nvmem regmap dependency")
> Signed-off-by: Chih-En Hsu <chih-en.hsu@mediatek.com>
> ---
>  drivers/nvmem/mtk-efuse.c | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> index 856d9c3fc38e..6a537d959f14 100644
> --- a/drivers/nvmem/mtk-efuse.c
> +++ b/drivers/nvmem/mtk-efuse.c
> @@ -28,19 +28,6 @@ static int mtk_reg_read(void *context,
>  	return 0;
>  }
>  
> -static int mtk_reg_write(void *context,
> -			 unsigned int reg, void *_val, size_t bytes)
> -{
> -	struct mtk_efuse_priv *priv = context;
> -	u32 *val = _val;
> -	int i = 0, words = bytes / 4;
> -
> -	while (words--)
> -		writel(*val++, priv->base + reg + (i++ * 4));
> -
> -	return 0;
> -}
> -
>  static int mtk_efuse_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -61,7 +48,6 @@ static int mtk_efuse_probe(struct platform_device *pdev)
>  	econfig.stride = 4;
>  	econfig.word_size = 4;
>  	econfig.reg_read = mtk_reg_read;
> -	econfig.reg_write = mtk_reg_write;
>  	econfig.size = resource_size(res);
>  	econfig.priv = priv;
>  	econfig.dev = dev;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
