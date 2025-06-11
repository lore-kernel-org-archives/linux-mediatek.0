Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972B4C71144
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 17:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3R09Iyu+oVEvrLJByqrLxu4/r9hm8EBVtdwnnJnPEk=; b=u3/ibq6SVP+RYh43n/YGj8kXyE
	+8uy6bT3BcEnxb0JBmoB/Rpkw4Md6IJmiCE1FVMJ4domVv/Dw00Wv549UQa2ABfBfON10UIDQvusm
	jmE6nb7vo9yuWNxoGjsSjC9yu/ltOYGqTubmNDFOP12aJM6OKtiNTnX54RSJirKgn4JIUFcsccSto
	2lpepTrYz0DtPXS8RXB8bCbvIsLhdpKCrF9Q7pImzL8zW2QNzhriS26zqgQk2eeZGfOYoGCc+tAcl
	R2E3+P72BEg9EJ9FPKaglBTNrTeh5aPgVN4Wj4rsFTx8xrD4C6apLX4pucDqGAnsozkxO1DPFQpqS
	wQ1d5azg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPje-0000000Aljx-2bG7;
	Wed, 11 Jun 2025 17:59:38 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPL97-00000009ut2-3p2h
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 13:05:39 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so5245425e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Jun 2025 06:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749647136; x=1750251936; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X3R09Iyu+oVEvrLJByqrLxu4/r9hm8EBVtdwnnJnPEk=;
        b=kjKMhsnaCRi4P1QcBPripVAF01ABcVOdY1qdGSfkjaJW4t91OBKjFrjNDYC9PeAnCE
         nMBGRffJDXueLsXbm5ROT6UiCafCoHHNQtFQC2zRdliXIoFG4Uw5b2dEEx8jZ1HswUO7
         QCBtI1gUOn+Uf4/qqA/fNxJYLeg/bwwE4Q/Uclt77cfnRvExMvTOz0jpcZJcNsgJSHwV
         g7HEcuaw50wvOaHozbO4dt3DUJg/xpBt8I0iaVr70TmCENvzhgBHpt+OIipGUMeqyh7K
         wC8uVMVpp7nR7Zy68miZfOlz8pJpL9mSIDnceXfKFkLaUFOU2TGLLme5FtTRdcK6kXB8
         GD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749647136; x=1750251936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X3R09Iyu+oVEvrLJByqrLxu4/r9hm8EBVtdwnnJnPEk=;
        b=plq58OPntu6Ot6K00eKoKgrrhae12MrZryAoBlSFaGMRnHDICrf7uoMMZjz7jtFdOZ
         hIlWsY5J7810iSS33cyombLksbQYgHBSAQE01/U37PYcs2m3ZQGynkjtdx5cae9xbW7e
         OboJxhUvy8kYIPEDqRHMEv5Vxx/HTrVLeC0SgcqZuo080HIjZGTsH1zXL9Hcf/Kv68SU
         p/VlKDqn59Bv3S6HruH2J2ojILuEhFnNNuyA1BvPtsXPctW1VmR9RmG3lMb2xpxM1Omk
         u3jZSoc1C3kyIXGE8/l+ZFJbpPR9WWi26AoLaVs+kSPctgMg20u5Dpkg5PxoHvz3emn9
         lCxg==
X-Forwarded-Encrypted: i=1; AJvYcCVsYRJEyB3ojroTCHbn28iuZifIc72YtW85J19m9X98wS1HUzFBM77riw4LyLZrwBWfK0yDM5Om+HhBY/9QZg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn3Xm1uovUguQkMcmJD9GaOMLw7StkVYB5IJdfCWxrvOBQ6d68
	FbkZMq2gdg7jFySey4qwMCPxdPKlYVTo9+U+sLnijlhyfDaAJhaFHr/sK4PTiEy72m2ApaSkm4B
	TE6Fg9dL76g==
X-Gm-Gg: ASbGncuo2HYuo7ufkUBT/TwXAGWkXYu60mTMLxZtoWFTN8kqK1mcYhAjBiuMyBIe2dh
	xtC4GXjEoaX4OaaVpk7pWdz2pYgxfgVa4zB1tYFVKI2bQqk3pkesCTSVfeW5u3x8QldcEeTXupx
	Au7lIAAv9cbPDlFVNnr943eGIQs8ejODt9w05Oefrs9N3JtjdkzKLzQEyI55brG7mMf5URxSjMR
	v894cp0hDBidhL1KqivczPdGB4su+xYPo2oV09jQwOKl1okb5jku2XW7XoW6IsglEpgSwf9ChJd
	V8U8w9FghF3rz+f4pCgoqn6AV626dNlD4DKztUPLijyXVcZ9hu8SQQ1+pbtHEUSDfIBnq9FeK/R
	LDgIsDCAo54bFQ2Ozwd+OTIwc0Y73BhsPUSHhPaFeyNeI5Lyo5qVP13eV
X-Google-Smtp-Source: AGHT+IE/+ZF0202H2gGrgjMZ/XMTAOBrohuHjeBubUtp7vBfdN9DADireHyArZ8FK4FEDHt2MkhIeg==
X-Received: by 2002:a05:600c:314c:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-453240b0e39mr34289735e9.3.1749647136238;
        Wed, 11 Jun 2025 06:05:36 -0700 (PDT)
Received: from [192.168.1.105] (92-184-112-57.mobile.fr.orangecustomers.net. [92.184.112.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45325141397sm21364185e9.8.2025.06.11.06.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 06:05:36 -0700 (PDT)
Message-ID: <0e1ae53e-e2a9-44ec-a59b-432bbf8d4b49@linaro.org>
Date: Wed, 11 Jun 2025 16:05:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dmaengine: mediatek: Fix a flag reuse error in
 mtk_cqdma_tx_status()
To: Qiu-ji Chen <chenqiuji666@gmail.com>, sean.wang@mediatek.com,
 vkoul@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 baijiaju1990@gmail.com, stable@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20250606090017.5436-1-chenqiuji666@gmail.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <20250606090017.5436-1-chenqiuji666@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_060537_948602_B1B1C723 
X-CRM114-Status: GOOD (  12.74  )
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



On 6/6/25 12:00, Qiu-ji Chen wrote:
> Fixed a flag reuse bug in the mtk_cqdma_tx_status() function.
> 
> Fixes: 157ae5ffd76a ("dmaengine: mediatek: Fix a possible deadlock error in mtk_cqdma_tx_status()")
> Cc: stable@vger.kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505270641.MStzJUfU-lkp@intel.com/
> Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>

Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>

> ---
> V2:
> Change the inner vc lock from spin_lock_irqsave() to spin_lock()
> Thanks Eugen Hristev for helpful suggestion.
> ---
>  drivers/dma/mediatek/mtk-cqdma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
> index 47c8adfdc155..9f0c41ca7770 100644
> --- a/drivers/dma/mediatek/mtk-cqdma.c
> +++ b/drivers/dma/mediatek/mtk-cqdma.c
> @@ -449,9 +449,9 @@ static enum dma_status mtk_cqdma_tx_status(struct dma_chan *c,
>  		return ret;
>  
>  	spin_lock_irqsave(&cvc->pc->lock, flags);
> -	spin_lock_irqsave(&cvc->vc.lock, flags);
> +	spin_lock(&cvc->vc.lock);
>  	vd = mtk_cqdma_find_active_desc(c, cookie);
> -	spin_unlock_irqrestore(&cvc->vc.lock, flags);
> +	spin_unlock(&cvc->vc.lock);
>  	spin_unlock_irqrestore(&cvc->pc->lock, flags);
>  
>  	if (vd) {


