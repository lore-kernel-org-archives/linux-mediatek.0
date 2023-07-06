Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD802EB64D9
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 11:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HiX0kM9yAvsqqQQcFgblcf3ys13s7viaphie1EL1uOE=; b=Q7jQ37vuWIGc4uQqfEd9OIcnOe
	xOMkft47W8xRivP4KVZ1GSk95RF+E9hJE9Yq9+91p95Z8kyYZGZwBcdXkS+3l8YmTERvyyDAJjqNU
	uLw/4C97KQFgcpHB0l2SE1D0Ut3s6N5JpbTL5N6aGELvXPqG0AUSfAT521Zj4HoKMcTYNUc0u38Pt
	mvw/YSi0Wvv2ELv6oT59bHB62suvgyR/jRutg4YrbAPPIboXjnP528DEyVNH7uQMVci/ljt+FHbSG
	k9WE6pEqt1elBLE9290KSYDncVEwDYgbcSKW3mfT6wzCFEvgi0ubrYqakpDeZv0BToUuN4jfhDzBY
	CbBTGvTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHNKJ-001VHj-06;
	Thu, 06 Jul 2023 11:39:11 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHNKG-001VGj-1j;
	Thu, 06 Jul 2023 11:39:09 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3112f5ab0b1so494043f8f.0;
        Thu, 06 Jul 2023 04:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688643544; x=1691235544;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HiX0kM9yAvsqqQQcFgblcf3ys13s7viaphie1EL1uOE=;
        b=pQtrCkQbZkFdoLEQ2lrwbmLRAQXkBikr+SYkCsnZJKTiV+WdTB7d/O51bih6j1gf3f
         mWBOTXXGqgnrKps5pCYHLrjeQ5cPvMIJmZSm+59Jogg1DmZcCC5r+fODIxpxR41ms2au
         qMkKw3uslXLBvg7xgPA1JQTNiZSH5MLLSHcnU1ay9HrPEf2Xdx0E1hgVadWmBCralmz7
         t2u512+TSnaDVeqLvSbJbO5llzNQttgG2HawIy0ON0MF1He+76+m1EhGq9g4q6XlOZx9
         mzBHhBdcJ38Q4OtIA7TzfFoFgOf31oVPurR4LQp0lkYxrspDM16cNMnYEV4NIentXAjs
         n/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688643544; x=1691235544;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HiX0kM9yAvsqqQQcFgblcf3ys13s7viaphie1EL1uOE=;
        b=DgTR8zJa4NPAU6GF2hf5q4lWpiLgMA7XD5kfGOq2WhglloYmuPldtjwpeVB/fLL7H5
         0yDVe6FV5q+UJ5qiCGHpDnBrBi4p5uwe8Ex3E0dofMcRqMTX0V9knhpDfexYuRcSWtEr
         4YnLZFzLkbEi1BBilCHms4zMCZyfb2Ond/JYN+k751LqJcEnBydOM3JvDVB+6rGdy9Sn
         TVpabv2562Rqqhwi01FS0uuKv5n3qI7uhV8t28lJ2w+HoKb71ATIRsZYxuyX2iNCpHET
         dkXvZeWM4Iqp4bYJgACNVyfdSa+n5amjH8Kxi/g70kfPo37pFdthUvFAC0V4OaHjB0O/
         NNlQ==
X-Gm-Message-State: ABy/qLazuaxysXOnECKWqNKLaLdr/2uhhLn+K40D43MaN1X/6f6vQvHu
	Tjnpjo7vuqE5b0JEFzgF5RE=
X-Google-Smtp-Source: APBJJlGVQmlrHpXi8l/4jbLYNHmIbdD92pYW9Owm3df69yA1z94eteFsOfVszAadDxRftyQAm4MNDA==
X-Received: by 2002:a05:6000:136f:b0:30e:3f54:f8c9 with SMTP id q15-20020a056000136f00b0030e3f54f8c9mr1158666wrz.10.1688643543915;
        Thu, 06 Jul 2023 04:39:03 -0700 (PDT)
Received: from [192.168.0.32] ([37.222.243.26])
        by smtp.gmail.com with ESMTPSA id v18-20020a5d6792000000b003063a92bbf5sm1651041wru.70.2023.07.06.04.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 04:39:02 -0700 (PDT)
Message-ID: <78b023a0-ce6d-80e2-c8d0-d3d6fde1c928@gmail.com>
Date: Thu, 6 Jul 2023 13:39:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/mediatek: Fix potential memory leak if vmap() fail
Content-Language: en-US, ca-ES, es-ES
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230626185801.684451-1-suijingfeng@loongson.cn>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230626185801.684451-1-suijingfeng@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_043908_580686_BFC27F4D 
X-CRM114-Status: GOOD (  15.39  )
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



On 26/06/2023 20:58, Sui Jingfeng wrote:
> Also return -ENOMEM if such a failure happens, the implement should take
> responsibility for the error handling.
> 
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
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

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

>   out:
>   	kfree(sgt);
>   	iosys_map_set_vaddr(map, mtk_gem->kvaddr);

