Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31069EB64DC
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 12:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zoml2MpIWLs8bKpT2HwH0EJdwmZljfDIDEyba6DrERU=; b=BYB9TZkMiE/POy18lLnzv1kGzq
	e8SMA60aN/H/r0lov8zWt/DyBKhkrMWHsCwa1EOe9tDUH95H2romQMS/7ME8IoRv0JORrfZ46xzLX
	x8hOl0uG7daFHmDchq48PiKRVySFe+iYhtvR1AWY81csz+96Pwv9GCZSmxmZZlK0sVcJwzgTIbpoy
	tu9SC0TsKfKpr3S0ud44QhMhycQqkqjflqggDzO40xWUGkD7isXISTJ0f/Y2xO/3pp5H2SVpX0tiu
	+7U8ANkj3+8Si34noguioxBL1CisF5GYO2XdFTd96qS02daaKNhZGD27YA1w0BAYz64jMMPON0dvh
	jMTgRMAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHOOW-001gUd-20;
	Thu, 06 Jul 2023 12:47:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHOOT-001gSz-04;
	Thu, 06 Jul 2023 12:47:34 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0609C6606FBA;
	Thu,  6 Jul 2023 13:47:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688647651;
	bh=zXq0RxESpSkRSGtoAWJi6JGEGgsz7+mOEqGxgmgm5F0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QWRwQrxYxEJii4Oy32ULOt49iEq2NvCXfSWiYq1uVb0ISH25jO1fQqLl8XZ7p0na0
	 8W5v74OYEWDgDegmPjTOu/5iqn+Kb9WXI1KNGWOTUf1DMqn7xJoDBLh2BRXyT9suYS
	 2kMgqKdIITNXxzNuBra3luErq+Gy9f+0aN1fvHy4DH6yV0unaiwLQUlFsOXVQukhRW
	 TQqSUfpI88zRTyUVdjkv2KCos8Mh6/OlGTTT2YIEOBoq5sjlesR3FdnSs8ObjigLyr
	 iS1svXJgKtFT8XOwDk9AuxqfPPdT1flRG+LiPrmhami61Vm74IZcxr8KA45UZ0WNQr
	 hUBpKoXlctegw==
Message-ID: <be63fd1b-7659-75b8-e037-38528e8a8276@collabora.com>
Date: Thu, 6 Jul 2023 14:47:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/mediatek: Fix potential memory leak if vmap() fail
Content-Language: en-US
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230626185801.684451-1-suijingfeng@loongson.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230626185801.684451-1-suijingfeng@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_054733_188001_7DA23ACA 
X-CRM114-Status: GOOD (  15.88  )
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

Il 26/06/23 20:58, Sui Jingfeng ha scritto:
> Also return -ENOMEM if such a failure happens, the implement should take
> responsibility for the error handling.
> 
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>

This commit needs a Fixes tag. Please add the relevant one and resend.

Thanks,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_drm_gem.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> index a25b28d3ee90..9f364df52478 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -247,7 +247,11 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
>   
>   	mtk_gem->kvaddr = vmap(mtk_gem->pages, npages, VM_MAP,
>   			       pgprot_writecombine(PAGE_KERNEL));
> -
> +	if (!mtk_gem->kvaddr) {
> +		kfree(sgt);
> +		kfree(mtk_gem->pages);
> +		return -ENOMEM;
> +	}
>   out:
>   	kfree(sgt);
>   	iosys_map_set_vaddr(map, mtk_gem->kvaddr);




