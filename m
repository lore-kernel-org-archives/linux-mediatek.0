Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB146C77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 11:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSo0y9CU6JHSsniPLuWjZnH8Pywoh9MjPxBwO/oPayE=; b=HWrFeEjHj6NX5tnm4FKs2+utw2
	9+tmmgNw+t9oktFInN2d9oqKDxfEOIjuwC0pzfRGoLODb5oGQEA6f5ja/DO457BMHqmzwOFeVv3DW
	CpsJP4YUJgIjO2o4yIwV9fmS7kF8V9+6ubuG9IVMEimbX3NfsTsCkr1Kl5XT+PX2kP5FdvS/dcL8j
	SeVe4CgjT2JEjzjh8OlWofI3upq+kXzwuu3aFsDEEZrH0UHwMc7iB+LchVQ1aBRqJmONLVzN37uFh
	MvjJ92ZrJnG5x1UMn/DMBaPhBqkAu9SXnogsEC+R1YTrgIQkMM8svP/E8agiHxoXITGIqvPJ2LtTa
	D5PxFGRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pojq5-00211n-2L;
	Tue, 18 Apr 2023 11:49:37 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pojq2-0020zy-20;
	Tue, 18 Apr 2023 11:49:35 +0000
Received: by mail-wm1-x32f.google.com with SMTP id eo4-20020a05600c82c400b003f05a99a841so4855wmb.3;
        Tue, 18 Apr 2023 04:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681818568; x=1684410568;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hSo0y9CU6JHSsniPLuWjZnH8Pywoh9MjPxBwO/oPayE=;
        b=iYzCdFVpoMYIAY6TP9UzJhtj8UgzcAGZErudc9XqV/BMHdaAksha9j60H8OBXL6Xmj
         GA/sZHJitcsxf4vg37R1pKtl4ntCxyzve/dwfADMZDANIoIQUUqGCo7lBtjHiKTm87p8
         aMac/vux03EsWvEGqeX2pI44ydhjz6un1qy0qgO6jM9y1mSalZdrdN6YUnwiQtnc0ICp
         W4Spp+a3BMpOZZ8JBFOGcMbmDNRxKewd8C1UUT9JCfCjGQePuOW2cZWw6fUjR5PXB7rW
         R6yT75ej7rKjgR+Hs994NKnfjmVKqQvyzwK2Gh3xY9IBfRXzFxGg2mlJaWyMjpfyazXh
         8J3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681818568; x=1684410568;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hSo0y9CU6JHSsniPLuWjZnH8Pywoh9MjPxBwO/oPayE=;
        b=KRDTM5R32xGfbjz03DS7vUmVp9t1k085vhd6S+cxqfPNC0AxPUsI0Z5iFI+JUNhAml
         Xn1kBawrxw7dPk2WPh8kGU3KybmiS+PAnEpcRaVCDPSyLokAsKtiB0ZEiuz5vJnEwdPp
         A9QcvZ1dNqgozeKCuRb7LcJ9jgzoiJqHKqGIY4xPDvhWXC37v8NIlQHKZNTb78S3RU5k
         NgohyMdrutA+BZkLDioRG+tIaHroDBxpzwZNFxyb4bhnjvXGgnIn0gsxqg8RKvatbJ3m
         wqRvIAT0jiu9VLVyTTAcE/LuIrMSSHqYeKgqPR81ifxYalU1eP5WP4SEP6jeje1PCpfp
         9I5g==
X-Gm-Message-State: AAQBX9cKURs/Kav4E8MVn4DGt5hFtSpyhs3rIsjMkjieCPU7ksKKgXVx
	pxWrP83vmrSPbSiS3ZcCT1w=
X-Google-Smtp-Source: AKy350Yw0P9E+LEmNEiXhXkFoVPpmOWwCwTlmkd1a6rpkMkfR5iRtWzbGGhV7W7Y15b6BUq8S6gO4g==
X-Received: by 2002:a05:600c:45ce:b0:3f1:7619:f0f6 with SMTP id s14-20020a05600c45ce00b003f17619f0f6mr3636747wmo.9.1681818567943;
        Tue, 18 Apr 2023 04:49:27 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id s9-20020a05600c45c900b003f09d51a4edsm18674280wmo.48.2023.04.18.04.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 04:49:26 -0700 (PDT)
Message-ID: <34acf346-a3d8-6f75-8d4f-0c68cda19506@gmail.com>
Date: Tue, 18 Apr 2023 13:49:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] media: platform: mtk-mdp3: work around unused-variable
 warning
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Moudy Ho <moudy.ho@mediatek.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sun Ke <sunke32@huawei.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230418091555.2605961-1-arnd@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230418091555.2605961-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_044934_656083_00C5FEAD 
X-CRM114-Status: GOOD (  18.57  )
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



On 18/04/2023 11:15, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When CONFIG_OF is disabled, the 'data' variable is not used at all
> because of_match_node() turns into a dummy macro:
> 
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c: In function 'mdp_comp_sub_create':
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c:1038:36: error: unused variable 'data' [-Werror=unused-variable]
>   1038 |  const struct mtk_mdp_driver_data *data = mdp->mdp_data;
>        |                                    ^~~~
> 
> Remove the variable again by moving the pointer dereference into the
> of_match_node call.
> 
> Fixes: b385b991ef2f ("media: platform: mtk-mdp3: chip config split about subcomponents")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> index 75c92e282fa2..19a4a085f73a 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> @@ -1035,7 +1035,6 @@ static int mdp_comp_sub_create(struct mdp_dev *mdp)
>   {
>   	struct device *dev = &mdp->pdev->dev;
>   	struct device_node *node, *parent;
> -	const struct mtk_mdp_driver_data *data = mdp->mdp_data;
>   
>   	parent = dev->of_node->parent;
>   
> @@ -1045,7 +1044,7 @@ static int mdp_comp_sub_create(struct mdp_dev *mdp)
>   		int id, alias_id;
>   		struct mdp_comp *comp;
>   
> -		of_id = of_match_node(data->mdp_sub_comp_dt_ids, node);
> +		of_id = of_match_node(mdp->mdp_data->mdp_sub_comp_dt_ids, node);
>   		if (!of_id)
>   			continue;
>   		if (!of_device_is_available(node)) {

