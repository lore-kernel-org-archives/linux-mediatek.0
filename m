Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03346C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Nov 2022 09:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+9vVpRoJ2yP2gAAOyuZpL8+MrKyMZP2wfmkwMOtepbc=; b=NieXLTv0bh8Ekh
	JmUXLAkCEZ0KABtIXebMNX+neRBjh8Gy/9Z5ir58T/UoMgTIxf+ZaFEJQFrUks+SoQnX/Idgy8B3s
	YoB0HpDGktrwdHxUIqs+fd4m+AZidRfY/1m1p3fd4KmPGXtwbagBIfXwKThyj/joA5oy9aTleuuAp
	zU2T5ybwJEEHPRPJsYwYju6AzPds0OKhD7dFtpgK9vCFMvPu2DD/G0BY3wbbpfdMhQibQA7KnMiGc
	39nuKcjHh+pfjtGDkRECXzstD2l33Zxp+3RS1qA3ail6j758yd7eFK5Sk5aU5jG1zGDxZdR/owc/X
	5Xei7dIfLXXSZn0OynDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxlr8-00FqP0-S9; Wed, 23 Nov 2022 09:15:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxlqv-00FqHQ-KD; Wed, 23 Nov 2022 09:15:35 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 834646602A65;
	Wed, 23 Nov 2022 09:15:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669194928;
	bh=4dlMANCcWyhN3x6ntNDLGRNwp8BpM4nQM3TDNFtBdfw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ow7d1owJRJkE2pacH5cEMLBc2rKlw90cJG1YccvOwGKSzLKNdADVUkel2QGmQuHXF
	 027zKZa25m5a1qRMqzO/Dz6mJs/9YnLmmf1VybqGG1lYAi/tcJs4TcCt2qnsXV1u8q
	 3jIQIepgAZfGinKWunqb3ilM2I76ujcJhhglMLTsmOirEm7HyCsrBb4F9nIKDxeN6+
	 i+f86bICPbPXJ8TO4w8ZAlsJVmHg9ChT4KOTqkOdIx5NpwCejhFyVigDc3wwADVioU
	 WeRvvWNhEDJV1S2rSxiOT7bVLJRz/BQCQRWlK9fAnjbtERqjzR0bEf32H2enEgLM7S
	 H1cEfIRp9L7gQ==
Message-ID: <a67594cf-eb7f-873f-1c11-ccb4317b6bdf@collabora.com>
Date: Wed, 23 Nov 2022 10:15:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] drm/mediatek: Clean dangling pointer on bind error
 path
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20221122143949.3493104-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221122143949.3493104-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_011533_854430_BD2F80DC 
X-CRM114-Status: GOOD (  17.47  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, Mao Huang <littlecvr@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, kernel@collabora.com, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 22/11/22 15:39, Nícolas F. R. A. Prado ha scritto:
> mtk_drm_bind() can fail, in which case drm_dev_put() is called,
> destroying the drm_device object. However a pointer to it was still
> being held in the private object, and that pointer would be passed along
> to DRM in mtk_drm_sys_prepare() if a suspend were triggered at that
> point, resulting in a panic. Clean the pointer when destroying the
> object in the error path to prevent this from happening.
> 
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
> Changes in v2:
> - Added Fixes tag
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

Sorry for not noticing that in v1, but I've rechecked this function and, while this
commit does indeed actually solve the described issue, I think it's incomplete.

A few lines before, we have a loop that sets

		private->all_drm_private[i]->drm = drm;

...so here you should do...

	private->drm = NULL;

	while (i--) /* a for loop will also do, your choice */
		private->all_drm_private[i]->drm = NULL;
		
That makes sure that you cleanup *everything* :-)

Cheers,
Angelo


