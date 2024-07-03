Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54D1C2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 13:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t41696Co/4Aqay9lh3cy0Z97c8p28xz1Kmsph/kFogE=; b=gAKXEWm22afkEUZa0mZWG4W5Am
	Ci66X2Eq5BP4QEUOq2sY2nBmqUcWK7UHFVCL0wHIdxMuRJBU9YWHQJpMtdNxR1B3rs2x82F8/1Jp1
	szxyM0bhxNYuowGe61yFYpcLMfOBO09KO1wCLQhljpK4P8JkOY3bgvv99FA9sYSJsHloMgPYIQLsU
	r+ulwKxB/M71LAS8JC3QELNw/JpqxOR826CqwhX5f+1WbhIuJ+aJc6nYnGWDKLNLETK2yFoqo6Kam
	V1+aqjiJbJGsbCpX1pwALA46eTZEsMO8Pg4KBPA+rjNuK+mZKq8ySEwXspJ14zt94XJcjxq1EjZ/I
	cnMN4opg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOzd5-0000000AF2c-0w2d;
	Wed, 03 Jul 2024 13:02:35 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOzcp-0000000AEx3-3Ysp;
	Wed, 03 Jul 2024 13:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720011738;
	bh=U7o86Tzjl5rNpCoW+Rril6FhOJHsZrYDpqqOuEg+aL8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VabEia4WzYXeIl+dydiNkvL7svyzEy6Kvg26UTjdNAD9lXvGZtbFsPX0NCzCERqDp
	 0H7CYL8ft1eyBkmxtcMzpF0bqvo0OYHlfA+jAnDtiEzO6XovgmiO2Q4ceuuNTMZuG4
	 6id5pHEIg6UjAw6ODPThkMw/cm2iebkxSehoOpNcOokB4l3HMrHqHsXXNkKBePpZ2c
	 a/n7zTyzTysGIx9Co7F7D7cUo2/Hu9LCQxD3Fk9zsk1o0ZrZwOeqhc2kjRNtB3N9aY
	 V3jXVYhwONBmxs7e/PUb54NRM9XAnc8yEciFwc8KehIZjSZrHiVO7GWbIWQb++SkQe
	 FbqblFX7cIIxg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id ACBBE3782194;
	Wed,  3 Jul 2024 13:02:17 +0000 (UTC)
Message-ID: <c85ed66d-6a9f-43e3-9ab3-740551f34f7c@collabora.com>
Date: Wed, 3 Jul 2024 15:02:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] soc: mediatek: pwrap: Constify struct
 pmic_wrapper_type
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 matthias.bgg@gmail.com, fparent@baylibre.com, fchiby@baylibre.com,
 s.hauer@pengutronix.de
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <cover.1719652155.git.christophe.jaillet@wanadoo.fr>
 <ee3160978ac6564663d044815f24cf79e2e0744e.1719652155.git.christophe.jaillet@wanadoo.fr>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <ee3160978ac6564663d044815f24cf79e2e0744e.1719652155.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_060220_058259_4F82D525 
X-CRM114-Status: GOOD (  14.74  )
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

Il 29/06/24 11:19, Christophe JAILLET ha scritto:
> 'struct pmic_wrapper_type' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>     text	   data	    bss	    dec	    hex	filename
>    45336	   8724	     16	  54076	   d33c	drivers/soc/mediatek/mtk-pmic-wrap.o
> 
> After:
> =====
>     text	   data	    bss	    dec	    hex	filename
>    45528	   8532	     16	  54076	   d33c	drivers/soc/mediatek/mtk-pmic-wrap.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> Compile tested-only
> ---
>   drivers/soc/mediatek/mtk-pmic-wrap.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index efd9cae212dc..0da0cdec5050 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -2397,7 +2397,7 @@ static const struct pmic_wrapper_type pwrap_mt8183 = {
>   	.init_soc_specific = pwrap_mt8183_init_soc_specific,
>   };
>   
> -static struct pmic_wrapper_type pwrap_mt8195 = {
> +static const struct pmic_wrapper_type pwrap_mt8195 = {
>   	.regs = mt8195_regs,
>   	.type = PWRAP_MT8195,
>   	.arb_en_all = 0x777f, /* NEED CONFIRM */
> @@ -2423,7 +2423,7 @@ static const struct pmic_wrapper_type pwrap_mt8365 = {
>   	.init_soc_specific = NULL,
>   };
>   
> -static struct pmic_wrapper_type pwrap_mt8516 = {
> +static const struct pmic_wrapper_type pwrap_mt8516 = {
>   	.regs = mt8516_regs,
>   	.type = PWRAP_MT8516,
>   	.arb_en_all = 0xff,
> @@ -2435,7 +2435,7 @@ static struct pmic_wrapper_type pwrap_mt8516 = {
>   	.init_soc_specific = NULL,
>   };
>   
> -static struct pmic_wrapper_type pwrap_mt8186 = {
> +static const struct pmic_wrapper_type pwrap_mt8186 = {
>   	.regs = mt8186_regs,
>   	.type = PWRAP_MT8186,
>   	.arb_en_all = 0xfb27f,




