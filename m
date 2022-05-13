Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4F5C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 12:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yjuAZlZvOy+9Pj9YyduJwQSYAlb1UV1XiOqorQMskm0=; b=Ru5yy/tv/bWS1R
	oiYCnULrWJAq/GPAJTNqW6MK8pVsB+k52c0AjSIlf6LCBa4mYg+qnoLAShBtu+Ikvw6XzEALNtijC
	neZuZYwd2qNK+Fzn047QJcXtJGz4yZPaCtduh4/B83UtgHIA8m1e0YdjSLJVJV1CuqsAjgqquWcwX
	lK6bwakdmk4Ae8qs528KIywepvo/0d0dAXxCsvh3tzH/aeVlH3d7d7UCkGti2npPE9z7LxDb4sSNM
	jW5I6gqAPI3V5/1OYSLdKSNjbyMfT1dyv8d2Qa3dNc+2T9VImii/93VrF6tsyislKtZAs4xVE4cu9
	9nM6KU5TW0LPVkWc21fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npU5T-00Fw0d-Ma; Fri, 13 May 2022 12:08:03 +0000
Received: from mout-u-107.mailbox.org ([80.241.59.207])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npU5I-00Fvwq-Fa; Fri, 13 May 2022 12:07:53 +0000
Received: from smtp202.mailbox.org (unknown [91.198.250.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4L06pl62Lhz9spV;
 Fri, 13 May 2022 14:07:43 +0200 (CEST)
Message-ID: <1da97e8e-c819-c089-1fe1-07915ec37898@denx.de>
Date: Fri, 13 May 2022 14:07:42 +0200
MIME-Version: 1.0
Subject: Re: [PATCH -next 2/2] i2c: mt7621: Use
 devm_platform_get_and_ioremap_resource()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Cc: matthias.bgg@gmail.com, wsa@the-dreams.de
References: <20220513100819.2711845-1-yangyingliang@huawei.com>
 <20220513100819.2711845-2-yangyingliang@huawei.com>
From: Stefan Roese <sr@denx.de>
In-Reply-To: <20220513100819.2711845-2-yangyingliang@huawei.com>
X-Rspamd-Queue-Id: 4L06pl62Lhz9spV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_050752_696802_B6FBC74E 
X-CRM114-Status: GOOD (  13.21  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 13.05.22 12:08, Yang Yingliang wrote:
> Use devm_platform_get_and_ioremap_resource() to simplify
> code.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   drivers/i2c/busses/i2c-mt7621.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
> index f117c3d9ca19..0d849379a236 100644
> --- a/drivers/i2c/busses/i2c-mt7621.c
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -270,18 +270,15 @@ static void mtk_i2c_init(struct mtk_i2c *i2c)
>   
>   static int mtk_i2c_probe(struct platform_device *pdev)
>   {
> -	struct resource *res;
>   	struct mtk_i2c *i2c;
>   	struct i2c_adapter *adap;
>   	int ret;
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -
>   	i2c = devm_kzalloc(&pdev->dev, sizeof(struct mtk_i2c), GFP_KERNEL);
>   	if (!i2c)
>   		return -ENOMEM;
>   
> -	i2c->base = devm_ioremap_resource(&pdev->dev, res);
> +	i2c->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
>   	if (IS_ERR(i2c->base))
>   		return PTR_ERR(i2c->base);
>   

Reviewed-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
