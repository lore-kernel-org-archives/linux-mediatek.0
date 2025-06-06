Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73E3C5B559
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Jun 2025 07:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Px7TUkiGLJQvkjO/71jKrxllILzPLzGA5siX95GH57I=; b=lWXspFgg7TmTeNkkPQ0Tcwfog6
	jUofXqwCPb++2IhI657ri6gztN6BPoVWOLqF6Day7KKu5ocL9bLWMK8ooT8srz4qzpoYocE6x9nlv
	eRIdUSkr/oLjTb9gsMNn+5ar9p69sBSXqGoAAgWanXlbcHeRbuwt9eP+m784ZvT9/LBaK+4Qmm7Yo
	hnlsaAzrldiKIByn/rSKAUZdM+eIvDW0yb9bxG8SplvJ240sduFGUzBqfRzPftEQWtoLT9w11lf3g
	QpuaONfsvefv5OxtsVl0X9YoNN7TIrlc1+jD8bkZfi6/+Z0Ts//a5qW8+kO/oIycFqo1737cU7W1O
	dVQDZbqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNRkh-0000000HKbM-3GWZ;
	Fri, 06 Jun 2025 07:44:35 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNRiT-0000000HKPR-3tYx
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Jun 2025 07:42:19 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so20203515e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Jun 2025 00:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749195736; x=1749800536; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Px7TUkiGLJQvkjO/71jKrxllILzPLzGA5siX95GH57I=;
        b=EoIHKf0vgRbwyk8XIIZGRwBBPOH2ouIv4FKsG9EGPRaZnjTrjwtKFNpnO0KlefjxyR
         xCkgA8QZ/Bqx4pYBF/3LfvAdjXhFq2zDNmGQQQoXbD9fP/cWcpihpACPO2eFzge7LcMi
         FA3y+GiOI0d20UwKebtL7aZ+UomF84M1/6jqw9dozGwim15EfO+eOsiFTM4h8h1PFCqn
         DD6EaHEQOyNW3GMoIy82mr1lumfzC6avblPZBOhNmiaNCfnQZJnPFr6/yz0oKTkI4EOr
         08/7lIL2jCF8KTK5xEHA5odZaV8yLYsqgEgttSzySJBDl7iqj/Ymckmnin6Cg4G1i1yU
         5Pfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749195736; x=1749800536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Px7TUkiGLJQvkjO/71jKrxllILzPLzGA5siX95GH57I=;
        b=MMV8L0lan5aI5WwoeilA42klMp3VbokdWbjY0OLqrjU0oKcoAX++tS+8l0NkA+T+Al
         5+rr+ZuNRvtRVPrYgaSrTIcLPuNfVDlK9fh1G3Y+l+sUQtpgyrmR6eYY+myiCS7HQs0A
         21510H+EWI3DB2Ap8YGF6k+sHa+nTN5qD81xcX0cLlxUulje1NNbtz5xXn3Ruzs/Le78
         UPyERvkiftpvPHGvLzKBUcsT5xa8fGSy6qNNDmlFvoTzUu8Mxaj+EnMxCKpMcXfRO6Km
         SRM8dQfLN3b2iPg7c+KzuEehIzcIb5jlRHG8Xm7xGKro8zDhd8jb9PYgmuzIPNSrIXoN
         nqqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVJTGJuaozToaO41888G3SmJEkRa+TjDsjtbO9VbhpSWEgXFoLANmGA3he39d9uuET76ugBFgPn5ee1+m4gQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5ChY4p2cMOTn90LS+c/1tHTT98L4Y1j5Re4eAiNgTKg3C8vb/
	r4R8smKx4NOuOErO1T48JG+sZ526Qd/xebpJd3i2x1bYUpfGvENlEHiyRwaQ7oT4uls=
X-Gm-Gg: ASbGncuFT4zpFEEKVh32Q37B9k2/7AfnOR+TTi7vITnUJpFGxfa8RqCAnjfkiR63g+y
	T52U0H1bFa9MntYwNKkIq+BtpnwZYXD+JufThtX4xIBD5Xksw7rhRVt0Sa1TWaYcbe0O1chPn2c
	WGN3qLevLrX65Bmx9GnCDkXvafnzNVQXOrym5zlUvHWZGKPGSOSS2e4DXLSu82kR7yV78w36DqH
	WzfOiIeueQTAhgcaJhky/sb2n6ZlMGJKaDlCoq4V8+d53JuSptqjmRbAdlJ2dcNGfmy8Qs3R2Hj
	tdBV8WQMHiBREnEmv3M11lFZYt3jjVno3PtkR2P46cYvU9C+9abY+MabnF39OkRFWf3QgC/O/rR
	NPJY8
X-Google-Smtp-Source: AGHT+IEDJ6Qm0Ur3ac3Ih5jAsMWLAgYjL99/0S8sUsnqlAT4/rYCzrAkgc1FBvTgHlungYhO6iFY8w==
X-Received: by 2002:a05:600c:4f90:b0:44a:b468:87b1 with SMTP id 5b1f17b1804b1-45201506dd3mr20374865e9.4.1749195736011;
        Fri, 06 Jun 2025 00:42:16 -0700 (PDT)
Received: from [192.168.1.221] ([5.30.189.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056138sm12622585e9.5.2025.06.06.00.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 00:42:15 -0700 (PDT)
Message-ID: <ff77f70e-344d-4b8a-a27f-c8287d49339c@linaro.org>
Date: Fri, 6 Jun 2025 10:42:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: mediatek: Fix a flag reuse error in
 mtk_cqdma_tx_status()
To: Qiu-ji Chen <chenqiuji666@gmail.com>, sean.wang@mediatek.com,
 vkoul@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 baijiaju1990@gmail.com, stable@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20250606071709.4738-1-chenqiuji666@gmail.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <20250606071709.4738-1-chenqiuji666@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_004217_989170_D2B3B212 
X-CRM114-Status: GOOD (  13.70  )
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



On 6/6/25 10:17, Qiu-ji Chen wrote:
> Fixed a flag reuse bug in the mtk_cqdma_tx_status() function.
> 
> Fixes: 157ae5ffd76a ("dmaengine: mediatek: Fix a possible deadlock error in mtk_cqdma_tx_status()")
> Cc: stable@vger.kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505270641.MStzJUfU-lkp@intel.com/
> Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
> ---
>  drivers/dma/mediatek/mtk-cqdma.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
> index 47c8adfdc155..f7b870d2ca90 100644
> --- a/drivers/dma/mediatek/mtk-cqdma.c
> +++ b/drivers/dma/mediatek/mtk-cqdma.c
> @@ -441,18 +441,19 @@ static enum dma_status mtk_cqdma_tx_status(struct dma_chan *c,
>  	struct mtk_cqdma_vdesc *cvd;
>  	struct virt_dma_desc *vd;
>  	enum dma_status ret;
> -	unsigned long flags;
> +	unsigned long pc_flags;
> +	unsigned long vc_flags;
>  	size_t bytes = 0;
>  
>  	ret = dma_cookie_status(c, cookie, txstate);
>  	if (ret == DMA_COMPLETE || !txstate)
>  		return ret;
>  
> -	spin_lock_irqsave(&cvc->pc->lock, flags);
> -	spin_lock_irqsave(&cvc->vc.lock, flags);
> +	spin_lock_irqsave(&cvc->pc->lock, pc_flags);
> +	spin_lock_irqsave(&cvc->vc.lock, vc_flags);
>  	vd = mtk_cqdma_find_active_desc(c, cookie);
> -	spin_unlock_irqrestore(&cvc->vc.lock, flags);
> -	spin_unlock_irqrestore(&cvc->pc->lock, flags);
> +	spin_unlock_irqrestore(&cvc->vc.lock, vc_flags);
> +	spin_unlock_irqrestore(&cvc->pc->lock, pc_flags);
>  
>  	if (vd) {
>  		cvd = to_cqdma_vdesc(vd);

If the first spin_lock_irqsave already saved the irq flags and disabled
them, would it be meaningful to actually use a simple spin_lock for the
second lock ? Or rather spin_lock_nested since there is a second nested
lock taken ?

Eugen


