Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C241C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 15:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MAqLoi+55aml5N6fFSPK1rUqMXnOHduR/XoxC2k56IQ=; b=NwOwm/GIHGhp7z+4k4Lzo6bYvc
	HjpZP0dN0YZGAJD8va+Nc0WLDJ2Ash+lRaeKNmsbqv+jOifyWLOKKH9na7PZml2Dm4gw8lfmfyobC
	0zIY5QnjETzDiMgrRXnZsVjBhAaBv6LkMrOmJ1GxBYa/GAVzw/lUIUwNKsr1NUy/okmh6TU3uKbq0
	tJPcs1tWOPz4g0V3puWbzVJm7NPsMArwQ+wUL8cFZEWBSarj+T4wwnMO+KjRvx9KHBPKj3wd+iW/v
	iXySdacziLmIMilHs2VjNL4cbYzqwnd/jxcK9KM8YQJAWcqDKLFnDoI+Y3wLLKNZVnavh1wqUWN3B
	xUXBnP6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9pzv-004Nqz-Ju; Fri, 08 Jul 2022 15:34:27 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9pzk-004Nmj-C3; Fri, 08 Jul 2022 15:34:17 +0000
Received: by mail-wm1-x32c.google.com with SMTP id o19-20020a05600c511300b003a2de48b4bbso13365wms.5;
        Fri, 08 Jul 2022 08:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=MAqLoi+55aml5N6fFSPK1rUqMXnOHduR/XoxC2k56IQ=;
        b=aBInTkdfKEbuCecWBfZTYBsX4pUvITVCPZg6LYSP+R7TTijdbEIlhjuLniqz7iqDLT
         N9lputlg96scgD8vmFch3VKZPdBFs/4Rtus1IKiZdq3vIYYqOuH+FgGK9SGDdxSHfaMx
         tVd+lRAUvCiR9C356gGavD38VLJr+ahNtI8b4EjlHmpeL4swe+YMSW03QZzPf/6kiNCz
         Z76F1yjmN02kgpKeQiRhk6CBIIldbqJJRfvkzyrmsamXW4Qdc2KyCsov3mK3lpg8pQ8G
         zN8jifKQG265+LEqfqGKruL1+PJ5STxAxnRHHeQ+PLfPJqFxaZHc+Wr5fQKPnID194vE
         +wUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MAqLoi+55aml5N6fFSPK1rUqMXnOHduR/XoxC2k56IQ=;
        b=U6xvZAfzOAM+hogKFQFSC3pIXINg6ncJ7p4zVJl+lUOfn/BHVdIPlZlsYK8Pv64yP+
         eV2LzyJic22cYvV6GkGvsPbZ8UP72Xfdd4owVPuOoUsseboAGJ9kb2ddVh9RBbpgwPIH
         KxxHUq3Vg4zwCBIgwkKo5eouPtkpUoCBIx61Q4aUd9ABWn4J2Qy4D5DmTTAmG5qT9HrO
         sa3MYHUmGBHZKoi2QCu9125kFQ8eC2q6uDck5dXfR7DELN4LLiIAc241eD+Mg1+Y5njh
         lnYM4xathxhR2p0HOJrcr3K47JhJSGvtbEXOlX9bnoEry4iMihbn8m+5FpIAH83iHC9K
         O61w==
X-Gm-Message-State: AJIora+VE3jNARzwBVt92i1kUtRXMrzsxfxtNskfPBCdbDhJEGNkqbGe
	8rFTama8oxnBplwZh1fP+kU=
X-Google-Smtp-Source: AGRyM1vJh5BBswMOyUfeUEhKlXJeDvX61sP0BSyfepc6oJN5VGNdZqaoBvRL8zEWyyEan5Yznxgl1A==
X-Received: by 2002:a7b:cd94:0:b0:3a1:7c5c:b11d with SMTP id y20-20020a7bcd94000000b003a17c5cb11dmr393698wmj.87.1657294453162;
        Fri, 08 Jul 2022 08:34:13 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id c3-20020adfef43000000b0021bab0ba755sm42956689wrp.106.2022.07.08.08.34.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 08:34:11 -0700 (PDT)
Message-ID: <d1a93418-587b-a03d-ed9b-01646345deeb@gmail.com>
Date: Fri, 8 Jul 2022 17:34:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v24 04/10] soc: mediatek: add mtk_mmsys_update_bits API
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux@roeck-us.net
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220622130824.29143-1-nancy.lin@mediatek.com>
 <20220622130824.29143-5-nancy.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220622130824.29143-5-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_083416_454200_B7214F5A 
X-CRM114-Status: GOOD (  19.56  )
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



On 22/06/2022 15:08, Nancy.Lin wrote:
> Add mtk_mmsys_update_bits API. Simplify code for update  mmsys reg.
> It is a preparation for adding support for mmsys config API.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-mmsys.c | 37 +++++++++++++-------------------
>   1 file changed, 15 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index a74c86197d6a..ca5bf07114fa 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -192,22 +192,27 @@ static int mtk_mmsys_find_match_drvdata(struct mtk_mmsys *mmsys,
>   	return -EINVAL;
>   }
>   
> +static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
> +{
> +	u32 tmp;
> +
> +	tmp = readl_relaxed(mmsys->regs + offset);
> +	tmp = (tmp & ~mask) | val;
> +	writel_relaxed(tmp, mmsys->regs + offset);
> +}
> +
>   void mtk_mmsys_ddp_connect(struct device *dev,
>   			   enum mtk_ddp_comp_id cur,
>   			   enum mtk_ddp_comp_id next)
>   {
>   	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
>   	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
> -	u32 reg;
>   	int i;
>   
>   	for (i = 0; i < mmsys->data->num_routes; i++)
> -		if (cur == routes[i].from_comp && next == routes[i].to_comp) {
> -			reg = readl_relaxed(mmsys->regs + routes[i].addr);
> -			reg &= ~routes[i].mask;
> -			reg |= routes[i].val;
> -			writel_relaxed(reg, mmsys->regs + routes[i].addr);
> -		}
> +		if (cur == routes[i].from_comp && next == routes[i].to_comp)
> +			mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].mask,
> +					      routes[i].val);
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
>   
> @@ -217,15 +222,11 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>   {
>   	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
>   	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
> -	u32 reg;
>   	int i;
>   
>   	for (i = 0; i < mmsys->data->num_routes; i++)
> -		if (cur == routes[i].from_comp && next == routes[i].to_comp) {
> -			reg = readl_relaxed(mmsys->regs + routes[i].addr);
> -			reg &= ~routes[i].mask;
> -			writel_relaxed(reg, mmsys->regs + routes[i].addr);
> -		}
> +		if (cur == routes[i].from_comp && next == routes[i].to_comp)
> +			mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].mask, 0);
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>   
> @@ -234,18 +235,10 @@ static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned l
>   {
>   	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys, rcdev);
>   	unsigned long flags;
> -	u32 reg;
>   
>   	spin_lock_irqsave(&mmsys->lock, flags);
>   
> -	reg = readl_relaxed(mmsys->regs + mmsys->data->sw0_rst_offset);
> -
> -	if (assert)
> -		reg &= ~BIT(id);
> -	else
> -		reg |= BIT(id);
> -
> -	writel_relaxed(reg, mmsys->regs + mmsys->data->sw0_rst_offset);
> +	mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id), assert ? 0 : BIT(id));

Let's be this a normal if (assert) else but calling mtk_mmsys_update_bits().

Other then that patch looks good.

Matthias

>   
>   	spin_unlock_irqrestore(&mmsys->lock, flags);
>   

