Return-Path: <SRS0=VWIa=CK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C89C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 18:44:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8458420767
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 18:44:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DteFUKGU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8458420767
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JnYVteEDlnadPBPChIvQrl9+3Om3ZeMGJEIo8JY+JbM=; b=DteFUKGUAB4/Bh8ziCzh86GUr
	9baQvEGxLYAv0tFZ8a2ganXVA0IhPKYGR8JStBS/aVNekyBgZFjSLTXr1kBltPeOGdxtJx+GGZGfn
	a3IKxyJAGCIuJgIYaYZz35qR5DiY5hw3MaWwUmeIg1C3r2Jf2TYyKe9t36F4Nrcmd/yHeZ0330isb
	wwQ+Oik0wxg6SqkszMgI1aUKpo7bdbrDSwJPw3TE6JmMAkj4DtAeBmm5bm+f2mSL0+FOi9LyRNd1B
	TvcxNdL5D4mmFg/3jcVyriyphC0eBGs4Wq6spaY2BObnPs6igSosZFOiTB+k5KnFZKrahy5JvQSlW
	WHOh14nPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDBGx-00077B-7N; Tue, 01 Sep 2020 18:44:47 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDBGs-00075W-Lv; Tue, 01 Sep 2020 18:44:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AAB81FB;
 Tue,  1 Sep 2020 11:44:40 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82E493F71F;
 Tue,  1 Sep 2020 11:44:36 -0700 (PDT)
Subject: Re: [PATCH v9 10/32] drm: mediatek: use common helper for a
 scatterlist contiguity check
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063533eucas1p1fad2f2afb117b026081468d2d840ab0f@eucas1p1.samsung.com>
 <20200826063316.23486-11-m.szyprowski@samsung.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <0fda65b1-1755-9e18-7c84-3156f5124752@arm.com>
Date: Tue, 1 Sep 2020 19:44:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200826063316.23486-11-m.szyprowski@samsung.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_144442_816689_FB0F712C 
X-CRM114-Status: GOOD (  23.17  )
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
> Use common helper for checking the contiguity of the imported dma-buf and
> do this check before allocating resources, so the error path is simpler.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_gem.c | 28 ++++++--------------------
>   1 file changed, 6 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> index 6190cc3b7b0d..3654ec732029 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -212,37 +212,21 @@ struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
>   			struct dma_buf_attachment *attach, struct sg_table *sg)
>   {
>   	struct mtk_drm_gem_obj *mtk_gem;
> -	int ret;
> -	struct scatterlist *s;
> -	unsigned int i;
> -	dma_addr_t expected;
>   
> -	mtk_gem = mtk_drm_gem_init(dev, attach->dmabuf->size);
> +	/* check if the entries in the sg_table are contiguous */
> +	if (drm_prime_get_contiguous_size(sg) < attach->dmabuf->size) {
> +		DRM_ERROR("sg_table is not contiguous");
> +		return ERR_PTR(-EINVAL);
> +	}
>   
> +	mtk_gem = mtk_drm_gem_init(dev, attach->dmabuf->size);
>   	if (IS_ERR(mtk_gem))
>   		return ERR_CAST(mtk_gem);
>   
> -	expected = sg_dma_address(sg->sgl);
> -	for_each_sg(sg->sgl, s, sg->nents, i) {
> -		if (!sg_dma_len(s))
> -			break;
> -
> -		if (sg_dma_address(s) != expected) {
> -			DRM_ERROR("sg_table is not contiguous");
> -			ret = -EINVAL;
> -			goto err_gem_free;
> -		}
> -		expected = sg_dma_address(s) + sg_dma_len(s);
> -	}
> -
>   	mtk_gem->dma_addr = sg_dma_address(sg->sgl);
>   	mtk_gem->sg = sg;
>   
>   	return &mtk_gem->base;
> -
> -err_gem_free:
> -	kfree(mtk_gem);
> -	return ERR_PTR(ret);
>   }
>   
>   void *mtk_drm_gem_prime_vmap(struct drm_gem_object *obj)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
