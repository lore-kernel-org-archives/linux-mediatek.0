Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2403C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 17:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wFTXwb6Z1kkFm2K1NVbhztTCfF3worZxBUKjCMRONY=; b=wmjj3zxCjpk2bQtXrYr9g29dO1
	DY/p3fQ6UlGFAjDqnuwzeUW1pNJ5O+j5n0nudl9HVS2GuQs0hyVFiaXNPy8fpx0jhbH+BgZZgTroa
	HPvTbgYIFBe7oOdNjCcjjAQI0kOZDbfwLznPeyZazmk6lE7Nap2vUPHpyzgVKkfkfNNZhOp3keyIq
	K8tv6NkR/sSBuSiNnisT+Wzy8p+o3YV9KcnsyysalfX/hLGFcpz+iueBQOhYc2q+xH/24G3zEKYcM
	LmEA3n9U7GnhKkO64tmzjoBGLhcqbS+j20JtxeLiRJVnoSrIIOAFcRvgqw54oP9Y4+K7BYdBt/r2W
	pnCW4bqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVke-000000003iY-2evV;
	Wed, 08 Jul 2026 17:08:00 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVkb-000000003g7-0R49
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 17:07:58 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cc73e322dbso9487715ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 10:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783530476; x=1784135276; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7wFTXwb6Z1kkFm2K1NVbhztTCfF3worZxBUKjCMRONY=;
        b=SvdwXFHEnXNu9TnAImbOMyuAHzfIWGFmmbtMFW2ahs6zlz4r66oOCNf6u6PMX3N5KC
         PtNfHPsZp1YDkcqC12Y9y9k+kLXB1Hqmcdo5ja6zWEb1z1LPb5phBEWnfuzsdaGJZ/Gz
         Fp0VH9bRfV/F9dRitcTbwFX82pdFHEJGWi4y2elLVa2cn6crfpVwcas98taw8ht99xOd
         nrnQ9HXx/YdMT6WmS2iByRYG/LMRK61wV6zp2g2nRhOAbojlFlKBRKCaqRTpFvkglRe6
         y1WiNVNg0MTRG5vCPRwnKzGrqg7ULN5h02R+zqVlNg9sN2LYnjZvLdYFY3fLChs1B6xS
         uyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783530476; x=1784135276;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7wFTXwb6Z1kkFm2K1NVbhztTCfF3worZxBUKjCMRONY=;
        b=k0XB3lp+CTdtZkuE73ODdYRClE5OTpzhMhorHk669Ptfdp/VSn6goxMQwXKToh1uKy
         zMHHmLbGCbvj4DSG7TQuG1EhA0aWOyD2LYuE1HnFOgU65UoiGDOb+slRpnIFzmzHl3G+
         h0W0yt6aYSMtT5cnjpxILAJw0k7HwQhvsC3SGwNdhnDwLOFIyGU/yUnVnDTOK6TPgAu1
         w9eznsGL2edG0sHDGq1UhXk9uSmltgj5OuNKMNGpUyYsnSup5WI3Eh+YZV3/NLgQQHm6
         nJxdqTjYRPgXyVbe8NOc1nyVSTVxjXV3ZOp6Tr5Iwxkv1yNUeZD9XtyU+HkNmvNLiwZC
         KFHw==
X-Forwarded-Encrypted: i=1; AHgh+RpFDCK0jhjOe4Esv+wDSPp46DXO15t7f2R2I17tLKeItoqndAij8vYL1ppHOCQS0uph/gOxQOxHv3w09cIajQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj978gDiwEE/NiPZj+PffmOv8Dmu7Cw0vi/A3ZIrhCd1DGZ1oB
	pAjm6LhoPqny2uQ0PqfoP7YOBhMbAU+vh6n4/fliNhErkVSAuqbd8peEwdDxMg9TVyY=
X-Gm-Gg: AfdE7ckzpfl7aNvN5DWdKsieShJ6ewODrXC75PgWaKWLsdyz0l/43xWOt8Xrwfo4Nmo
	ZWnG5tJQZ3N9jh6l3Ssk7uWSM8pteyZQeCitN1HXxVS8luMsZCpXmDpSo22qcNhswMgz8rTbSpc
	r8HsV+bBfAL2Eaq4idiEX3TjFysyGMAyVucIzlNxn5Ub+4JiDRQOu+o28K/TnUmSfKaUkHA9Sw1
	/fhothIO3oYrtQMmlqhQRgZRCarzgyzDj0GxFpOtRUG8MClQizxvKw3i04BUrNTR50qid8ukEl0
	EMcf9uU3XovwtlpBUQYWatBQRGYAe7QmScDYdKvrVpzSDi7RGpZkXnKlgCduNCzmq8J0VcR/j9R
	owKjU0Z8KRDVLFaIrdoG1bfwVZslK5JByKLajmHGK7L3SKYmZ/9y8cI0l7opHzG2LpcNIwdKT7u
	L3ZLTf6N0jRMc1Vbyz
X-Received: by 2002:a17:90a:d88f:b0:37f:ef32:d444 with SMTP id 98e67ed59e1d1-3893fe5bb10mr3499928a91.1.1783530475481;
        Wed, 08 Jul 2026 10:07:55 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:da71:a4fe:1ac2:9750])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-388fdaa2c73sm1084089a91.1.2026.07.08.10.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:07:54 -0700 (PDT)
Date: Wed, 8 Jul 2026 11:07:52 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Erin Lo <erin.lo@mediatek.com>
Subject: Re: [PATCH] remoteproc: scp: fix device reference leak on failed
 lookup
Message-ID: <ak6D6JX1jP1NxNUh@p14s>
References: <20260706065614.389412-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706065614.389412-1-johan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_100757_165924_4A2B5FE8 
X-CRM114-Status: GOOD (  21.16  )
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

On Mon, Jul 06, 2026 at 08:56:14AM +0200, Johan Hovold wrote:
> Make sure to drop the reference taken to the SCP device when attempting
> to look up its driver data before the driver has been bound.
> 
> Note that holding a reference to a device does not prevent its driver
> data from going away.
> 
> Fixes: 63c13d61eafe ("remoteproc/mediatek: add SCP support for mt8183")
> Cc: stable@vger.kernel.org	# 5.6
> Cc: Erin Lo <erin.lo@mediatek.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/remoteproc/mtk_scp.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 85a74c9ec521..436656bdfa8b 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -36,6 +36,7 @@ struct mtk_scp *scp_get(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct device_node *scp_node;
>  	struct platform_device *scp_pdev;
> +	struct mtk_scp *scp;
>  
>  	scp_node = of_parse_phandle(dev->of_node, "mediatek,scp", 0);
>  	if (!scp_node) {
> @@ -51,7 +52,13 @@ struct mtk_scp *scp_get(struct platform_device *pdev)
>  		return NULL;
>  	}
>  
> -	return platform_get_drvdata(scp_pdev);
> +	scp = platform_get_drvdata(scp_pdev);
> +	if (!scp) {
> +		put_device(&scp_pdev->dev);
> +		return NULL;
> +	}
> +
> +	return scp;
>  }
>  EXPORT_SYMBOL_GPL(scp_get);
>  
> -- 
> 2.54.0
> 

