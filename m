Return-Path: <SRS0=VWIa=CK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75BBC433E6
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 18:55:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8040A20767
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 18:55:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZrIFzHEe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8040A20767
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s39cCChk60ALAOQZaGpw8HZNkkgfC3ZX/5QTzElOw1I=; b=ZrIFzHEeNXBXN5YMu4UgYzJgq
	q7PXgW5vJ7i2uf8ChkvvpGqiSSRQdcWiFwqhZXmHshZ6TXb31c/ZVIE1PwFELD2SZfXk4F0I+1q9H
	XcOk9O3at9Ux5zX91YnYj8ulS7sAv5hJgwT+jy0O5PWu33ZB07atb2uETQX7WS3I4iMHQjhWC8y8l
	iZNki9uOwFbOXVdZnMTs3qt0DbIzyGRwBWRYtAdIYTMnYIKdU+eyMslEXTR7e+JIjfNvMipzS5+Ea
	j/bY/45i7WP8u6dF7Wefw1zM3C/cvHAhTA4qFf8evE6tAEJilTHrYD1SJ96nDCgQIIfEqNM5cJskc
	BuC8eEhZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDBQu-0008M0-US; Tue, 01 Sep 2020 18:55:04 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDBQr-0008LB-1E; Tue, 01 Sep 2020 18:55:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C3121FB;
 Tue,  1 Sep 2020 11:55:00 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 168583F71F;
 Tue,  1 Sep 2020 11:54:56 -0700 (PDT)
Subject: Re: [PATCH v9 11/32] drm: mediatek: use common helper for extracting
 pages array
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063534eucas1p2647f5e9679f79f568e184b092f743f8b@eucas1p2.samsung.com>
 <20200826063316.23486-12-m.szyprowski@samsung.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <30f20ad6-783b-89c3-17b5-30c6a2587d23@arm.com>
Date: Tue, 1 Sep 2020 19:54:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200826063316.23486-12-m.szyprowski@samsung.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_145501_145546_EA788507 
X-CRM114-Status: GOOD (  19.15  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-08-26 07:32, Marek Szyprowski wrote:
> Use common helper for converting a sg_table object into struct
> page pointer array.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Side note: is mtk_drm_gem_prime_vmap() missing a call to 
sg_free_table(sgt) before its kfree(sgt)?

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_gem.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> index 3654ec732029..0583e557ad37 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -233,9 +233,7 @@ void *mtk_drm_gem_prime_vmap(struct drm_gem_object *obj)
>   {
>   	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
>   	struct sg_table *sgt;
> -	struct sg_page_iter iter;
>   	unsigned int npages;
> -	unsigned int i = 0;
>   
>   	if (mtk_gem->kvaddr)
>   		return mtk_gem->kvaddr;
> @@ -249,11 +247,8 @@ void *mtk_drm_gem_prime_vmap(struct drm_gem_object *obj)
>   	if (!mtk_gem->pages)
>   		goto out;
>   
> -	for_each_sg_page(sgt->sgl, &iter, sgt->orig_nents, 0) {
> -		mtk_gem->pages[i++] = sg_page_iter_page(&iter);
> -		if (i > npages)
> -			break;
> -	}
> +	drm_prime_sg_to_page_addr_arrays(sgt, mtk_gem->pages, NULL, npages);
> +
>   	mtk_gem->kvaddr = vmap(mtk_gem->pages, npages, VM_MAP,
>   			       pgprot_writecombine(PAGE_KERNEL));
>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
