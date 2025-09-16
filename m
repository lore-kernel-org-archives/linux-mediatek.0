Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2456CAC592
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Sep 2025 16:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxXeHLxPfTqm5VMdb4U/d3SjNLsOdUyu/UfmEVmpoBU=; b=efjpXMNLKFeM+XYtXPhUbbwkFO
	DsoRJHJKbECWdyb8lVXK93/01ue9dicyW3yRGQiVI4sFZA2trmP+giF47U53mEqSEhi+dnX9u7TIv
	6Q8S8GWOi0LP49PAtuoIGPZXuJIOSvpJKiK/O27nHt4O4gd1Wi0HeCv7nRq5B8hC2CUqi2W/zG5Mf
	kiSSZ+w0VGNAptOn8oVs2YKsjZ3Qf0OQ3/02s/a8/vUBUNTLv8PGWMxAEAwGTqT5aB5MMseu4lE7Z
	2N02L76LjaCfXUn//CWcZhPWirRXaz8V6yaGOUVkJBW2egePe/NgowfJZARTEP9dFppv7sLZAjrAm
	3jl09qDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYyi-00000008Y3B-1MZu;
	Tue, 16 Sep 2025 16:56:28 +0000
Received: from smtp-27.smtpout.orange.fr ([80.12.242.27] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYyf-00000008Y2a-1xfY;
	Tue, 16 Sep 2025 16:56:27 +0000
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id yYyWugYwOPNPdyYyWuxO1w; Tue, 16 Sep 2025 18:56:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1758041780;
	bh=KxXeHLxPfTqm5VMdb4U/d3SjNLsOdUyu/UfmEVmpoBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=COVHlHgZiQJu0vXSGCu8h560SE2GEPKVyuM25traI/yLHGjYZrafnA+mDEYAFiAN0
	 Ql8lCne8c0zz5uCsgQHg0S5p8v56D5eb9mQIbvquYxx9trNJ2sCKjfsmX9iRXq5eTq
	 wUMBCpBoVxlwPzQkBA4h7mTk905D0Zx4RPjefzdTBulkax9UyagZKleI00E/a3Oc24
	 vz3iF0qP+60XJWCqEW1kWcx6IbxgFBiz0cUPyCuVupJEm1NKNwFTUCzAW+mUO5JbTs
	 s06r3M0V8pPrC+StU+evUxWMGIAm6P20X7jSovxvu4qNO5Mc1w0Er0qMQMy5WiMXsD
	 oEKLaKR1SF1hw==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 16 Sep 2025 18:56:20 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <a9b8f7bb-5704-48b0-9a33-e1470b222688@wanadoo.fr>
Date: Tue, 16 Sep 2025 18:56:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mtk-mdp: Fix a reference leak in mtk_mdp_probe()
To: Haoxiang Li <haoxiang_li2024@163.com>, minghsiu.tsai@mediatek.com,
 houlong.wei@mediatek.com, andrew-ct.chen@mediatek.com, mchehab@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 hverkuil@kernel.org, eballetbo@kernel.org, eizan@chromium.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
References: <20250915125248.181608-1-haoxiang_li2024@163.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <20250915125248.181608-1-haoxiang_li2024@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_095625_909819_3C08E030 
X-CRM114-Status: GOOD (  15.42  )
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

Le 15/09/2025 à 14:52, Haoxiang Li a écrit :
> vpu_get_plat_device() increases the reference count of the returned
> platform device. Add platform_device_put() to prevent reference leak.

Hi,

I think it is also missing in the remove function.

And while at it, mtk_mdp_unregister_m2m_device(mdp) seems to also be 
missing in the error handling path of the probe.

Just my 2c.

CJ

> 
> Fixes: ee18fc7b0b95 ("media: mtk-mdp: handle vpu_wdt_reg_handler() errors during probe")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>   drivers/media/platform/mediatek/mdp/mtk_mdp_core.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
> index 80fdc6ff57e0..6aedb6033010 100644
> --- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
> @@ -198,7 +198,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>   				  VPU_RST_MDP);
>   	if (ret) {
>   		dev_err(&pdev->dev, "Failed to register reset handler\n");
> -		goto err_m2m_register;
> +		goto err_vpu_get_dev;
>   	}
>   
>   	platform_set_drvdata(pdev, mdp);
> @@ -206,7 +206,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>   	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>   	if (ret) {
>   		dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
> -		goto err_m2m_register;
> +		goto err_vpu_get_dev;
>   	}
>   
>   	pm_runtime_enable(dev);
> @@ -214,6 +214,9 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>   
>   	return 0;
>   
> +err_vpu_get_dev:
> +	platform_device_put(mdp->vpu_dev);
> +
>   err_m2m_register:
>   	v4l2_device_unregister(&mdp->v4l2_dev);
>   


