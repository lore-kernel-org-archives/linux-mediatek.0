Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8031EC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 09:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wQK6rFUoShHhGlr0hNprX/8fEbuw4qQrSI8ec4h5j8=; b=jBTTd1KPGUkAmeJyulusp7DAHA
	sW/hEEEY71XYoXAHncszEbCCcv+F+/JGe2e1eP9gMl+51bxZtHBi5z/hxLPadUrlvROsxXYRrLQIU
	8pvuZ5lcsuqideuBVkcV/Koz+lM9h1hhrbfwdyAomW02X+Z240cfuvKXXuBwY6KunBBgdWDCee0Vh
	37x2F0uw+v1Ge88mu2dPtPihx/kVGO6QPCFQYw+iuzmW5z6TD5PkRwOB8iL1ICk+URoNigDNyDDTE
	b0W3EHymTfSUyJt6XWcEo2RnBxTD6IVfnVeqhUS1hIHmwQpyDllM1pPrgI6QOJDVTwM3M9ElmWeCi
	Q0HufYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPKS-006pv7-PH; Tue, 22 Nov 2022 09:12:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPKC-006pl9-Ui; Tue, 22 Nov 2022 09:12:18 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E202B6602AC7;
	Tue, 22 Nov 2022 09:12:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669108330;
	bh=XQs9y9qnM68EyMoHPrxiDgq88Oc9TnrG2mdHxwEI2sQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CVkZzf1bm1eq3dnFoEDL8E2t9w+rllcHe6eClLcXsHRs+VHN3hKPjLV5NNgxlWMET
	 eCx0667iQP4uhsgDs0Ept2jcZ+WRzK2yvZ+iscJPNmW3/3ygNLS+BSQh90MtVLdVD/
	 MWNJoQHV0S4QC2P5aJ+ftzSDFA4sDFr9UU6JgqR+1Qse4U7PDJb3mdOK0v1Ea5O1oX
	 dYDT2WE7ySmP1NVyuln3YcUSAec7mQqv7o+88+519dSNMboAtN0GUhGifNWE0UzpW4
	 Y4O/McoElEA37GpxO7TJ9v+kFSWtsRDMXUk/tTthX6tDSzp7UWo/Uz+SgOZx2FgzhS
	 /s9t1wFc4bXNg==
Message-ID: <1ff98f52-93e1-d375-47ae-30b74068ea5b@collabora.com>
Date: Tue, 22 Nov 2022 10:12:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/mediatek: Clean dangling pointer on bind error path
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: kernel@collabora.com, "Nancy . Lin" <nancy.lin@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20221121223717.3429913-1-nfraprado@collabora.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221121223717.3429913-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_011217_137350_92FD4603 
X-CRM114-Status: GOOD (  14.65  )
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

Il 21/11/22 23:37, Nícolas F. R. A. Prado ha scritto:
> mtk_drm_bind() can fail, in which case drm_dev_put() is called,
> destroying the drm_device object. However a pointer to it was still
> being held in the private object, and that pointer would be passed along
> to DRM in mtk_drm_sys_prepare() if a suspend were triggered at that
> point, resulting in a panic. Clean the pointer when destroying the
> object in the error path to prevent this from happening.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Fixes tag please! :-)

Cheers,
Angelo

> ---
> 
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 39a42dc8fb85..a21ff1b3258c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -514,6 +514,7 @@ static int mtk_drm_bind(struct device *dev)
>   err_deinit:
>   	mtk_drm_kms_deinit(drm);
>   err_free:
> +	private->drm = NULL;
>   	drm_dev_put(drm);
>   	return ret;
>   }



