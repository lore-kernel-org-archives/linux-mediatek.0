Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC02C77B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 07:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcKgMqBaVIqZoOwjyxizzLY6i35d7PAbT8GtOYflIfk=; b=2IV2j7DBqAi8R2X7SIY7T4pM9o
	Ow/DT3bbBgRYxMo3RfcTUjcmckItrUKxxBSf04p1PSSVxiFuY0GZ32EnwYtV/fftnOLE4r8fNAdEV
	M+ye7YbBhmNrSM0OW1rjpHCkooclt4DJm18V/o9wAeE/Xdle6g44fAgTameEueG/IMS4EtImHTJcm
	NreGvj7kf/hvq+cS/0Q2FcQVkChl+T1DuU6AVKhL7l1v3gFbNJIXgRRlFj3FvFXpCSB+TxHffon0N
	5pLu6fsJZYxvFi+MzHf9XxbnsuSKXVqmodjE9fFZMr3JCwjvOg3GE/JDNTFcKP5zYjEEPkAklEFMX
	l3YRWfug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzBga-008gj7-0y;
	Wed, 17 May 2023 07:35:00 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pzBgY-008gi7-04;
	Wed, 17 May 2023 07:34:58 +0000
Date: Wed, 17 May 2023 00:34:57 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Xiaoming Ding <xiaoming.ding@mediatek.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, fei.xu@mediatek.com,
	srv_heupstream@mediatek.com, linux-mm@kvack.org
Subject: Re: [PATCH] tee: add FOLL_LONGTERM for CMA case when alloc shm
Message-ID: <ZGSDoVKKVqCkbaCB@infradead.org>
References: <20230517031856.19660-1-xiaoming.ding@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517031856.19660-1-xiaoming.ding@mediatek.com>
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

> +	u32 page_flag = FOLL_WRITE;
>  
>  	if (!tee_device_get(teedev))
>  		return ERR_PTR(-EINVAL);
> @@ -255,9 +256,11 @@ register_shm_helper(struct tee_context *ctx, unsigned long addr,
>  		ret = ERR_PTR(-ENOMEM);
>  		goto err_free_shm;
>  	}
> -
> +#if IS_ENABLED(CONFIG_CMA)
> +	page_flag |= FOLL_LONGTERM;
> +#endif
>  	if (flags & TEE_SHM_USER_MAPPED)

If this mapping is long live it should always use FOLL_LONGTERM.

The ifdef does not make sense.

