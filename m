Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E945C2BD09
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 18:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+ruGPETppbEAZdscNhJIuUHT64dVUBzmWwyvnp1b7w=; b=BE4DeiOP13Q5zxmgq5/E+SrhJf
	AouaRh/X4inmfjViO4g64wWX83arR043I0TSMc1jXUwfFalLo5LNTvVKgYvAKsSzda/Dklgk5EYpZ
	GNwMxGGuIwGGWNFdKPsSZCNcldJpGbYk4FfSUcn7CmCJIr+nrc3jWBUJVA/p+AnOyjBsFIuUDInjT
	TR9NVC7i4XV+ZYNa6FMi23LgVMuygVZOx2wZSw96hXIDQX1lqqn6e/Kcpai+LZNfwM0gw3itgcg+g
	j01jq4k9D7QDq2v0n7v1ZZll7dIjHcoDLwCLZ0hLo63p3Qi0l+75WXWir8OCYiW2m+0T0R43CN6UW
	FKv3E2EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNFxj-0000000EZdQ-39MV;
	Fri, 28 Jun 2024 18:04:43 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNFxZ-0000000EZZ7-0ttV
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jun 2024 18:04:35 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1fa07e4f44eso5687015ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Jun 2024 11:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719597872; x=1720202672; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H+ruGPETppbEAZdscNhJIuUHT64dVUBzmWwyvnp1b7w=;
        b=VkmY19ypvy9myetvIIuYD478puTVJlc89YauZnLEUmMc6CP+sFuFkjTH06rhgljRb/
         7GBfHxdjUNxvqkM+i3wsm3PVe0lhua/vGyXw9hT7IBx/VZxnLn8Sw519LDhVY5No7sIf
         tyvXeJTbYRQBYZx6h1cQtYtFUjuzwnbCPTmP2VTzhl1C64irlvb+qYbbYmLJTUllfs0c
         1PBON+HLqCvN4TdMhhS8gKDh9S5pK20Wsy5xJ9LjpEQbnwjrOcWiaj9Zd9rEjFXBRpp2
         hSKla9+mVdq2RniXKg15Zh4rpjiAFWZOMK7d4otzFgWIgCiJunp/5OXJqhA21XGjnrYB
         ul7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719597872; x=1720202672;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H+ruGPETppbEAZdscNhJIuUHT64dVUBzmWwyvnp1b7w=;
        b=IWp/U3woIU7iGvtasDArRak02llc+xMuzh3QyaB/Pq1Qy+oqCuSjZCeGoy3I1GY/PY
         gyx92Tjuj81o/2q1rUX1ty3klISNbzyhIbA1mSpiKLyCWDQk5AuSXbcSYUbtl0dldiwQ
         y+sCQW7sseTF//4bGhT0cH7o+I4AY2AaZx6Eh433fbmvp6X1H1lx47N2o6FKCgfLsJX/
         dywn8Svn5o4CaGkIR7Mt2bo+zVF/w4qrSNEXPBCUJsG21LwLypoTnfhSD5puCcgd8bAY
         mA9daneoO1aQAaVwgtEpVnHJxDEP3eE89IuyXdWifjB8eEpPHOa3ULCfMfrpDqhhzgyT
         289A==
X-Forwarded-Encrypted: i=1; AJvYcCVNZLuxMM1IwHFErpf7EzUUhSDYEwl8T7/luo+pLX+aewKh0aqiW5sxDnOYaOKUfAZgyurs3g7AsViI2gRe+jPn6KJ8FAqVuO7jhWFFNiSCoYWF
X-Gm-Message-State: AOJu0YxwmGGvyxYaqKaMBd07lzkjHk+Fb2D6hmsYEg9OAGZbkoiBM51a
	3r1AkLlVRfeLZvetnGRTvua+lJib8jfswfrllZgXFnEoVCujORORNzJtQRphrfE=
X-Google-Smtp-Source: AGHT+IGCvLrXWzySAlrNqbCAvh3eBYrqwRFPdz21iCBkv/nqIVi2SUvaRkJ9vc+Fe8iroSuxGmGXCw==
X-Received: by 2002:a17:902:ce81:b0:1f7:2bed:226 with SMTP id d9443c01a7336-1fa23ecee77mr197498935ad.36.1719597871540;
        Fri, 28 Jun 2024 11:04:31 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e53e:a53d:f473:181e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac11d8695sm18341165ad.109.2024.06.28.11.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:04:30 -0700 (PDT)
Date: Fri, 28 Jun 2024 12:04:27 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>, kernel@collabora.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc: mediatek: Don't attempt to remap l1tcm
 memory if missing
Message-ID: <Zn77K/nny10G4sXN@p14s>
References: <20240627-scp-invalid-resource-l1tcm-v1-1-7d221e6c495a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240627-scp-invalid-resource-l1tcm-v1-1-7d221e6c495a@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_110433_280745_06E4C010 
X-CRM114-Status: GOOD (  23.62  )
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

On Thu, Jun 27, 2024 at 05:20:55PM -0400, Nícolas F. R. A. Prado wrote:
> The current code doesn't check whether platform_get_resource_byname()
> succeeded to get the l1tcm memory, which is optional, before attempting
> to map it. This results in the following error message when it is
> missing:
> 
>   mtk-scp 10500000.scp: error -EINVAL: invalid resource (null)
> 
> Add a check so that the remapping is only attempted if the memory region
> exists. This also allows to simplify the logic handling failure to
> remap, since a failure then is always a failure.
> 
> Fixes: ca23ecfdbd44 ("remoteproc/mediatek: support L1TCM")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index b885a9a041e4..b17757900cd7 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1344,14 +1344,12 @@ static int scp_probe(struct platform_device *pdev)
>  
>  	/* l1tcm is an optional memory region */
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
> -	scp_cluster->l1tcm_base = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(scp_cluster->l1tcm_base)) {
> -		ret = PTR_ERR(scp_cluster->l1tcm_base);
> -		if (ret != -EINVAL)
> -			return dev_err_probe(dev, ret, "Failed to map l1tcm memory\n");
> +	if (res) {
> +		scp_cluster->l1tcm_base = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(scp_cluster->l1tcm_base))
> +			return dev_err_probe(dev, PTR_ERR(scp_cluster->l1tcm_base),
> +					     "Failed to map l1tcm memory\n");
>  
> -		scp_cluster->l1tcm_base = NULL;
> -	} else {

Much better - I have applied this patch.

Regards,
Mathieu

>  		scp_cluster->l1tcm_size = resource_size(res);
>  		scp_cluster->l1tcm_phys = res->start;
>  	}
> 
> ---
> base-commit: 0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
> change-id: 20240627-scp-invalid-resource-l1tcm-9f7cf45c17e6
> 
> Best regards,
> -- 
> Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

