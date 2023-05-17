Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E20C7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 07:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WyFLOiSt+FtzfE39FeHW08WFhb9J+jn2vWhFKPP6Mwg=; b=NQW8K3HgkuNI5FHq7Opurl99sw
	u4o1Mady8X8yJ3mLV+fgEgFiEt4LZxA21EX8yPQXZJ5il396RKTidRwIwRhkziVn7PdfmCpzdgQoY
	dAbZlj36G2Gqd3VaZNBgYx5ens+LXoKfmgMneDlr1PDFGrVBuZpI18X5c/lMzfllukh2l3bYcjB33
	kgD2+55S4Z6m9USDT2lgVTGO/yKvKTbU99ZT8+q1MJdZGOQ9UhFORgAouA+NonOkApkVxJVhvfVQq
	zchGkGL2AqhIAiCCcIaKFtA6qrH0stFhue72+Z2sLjqIhoqLutrEDQlAZ17/UwnRf6iOXAsvZAk1+
	RRxxFQaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzByI-008kEt-0p;
	Wed, 17 May 2023 07:53:18 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzByF-008kAu-0j
	for linux-mediatek@lists.infradead.org;
	Wed, 17 May 2023 07:53:16 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-783f7e82f2aso100093241.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 May 2023 00:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684309982; x=1686901982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WyFLOiSt+FtzfE39FeHW08WFhb9J+jn2vWhFKPP6Mwg=;
        b=q8TwWLY79Hyh3bjyTmB1ysfHFO1zMQYNMRu8iCGOMn/jUkAXM80ceXbdrj9PIy6Npf
         Kid149tAN7SKvMEEGX+yt3CRBD6/EBuIrXa/6RNYjdX2u69WObMU6SMdqGb++SKhp12X
         hgVFwidPFtTj16pO3vGJbt8a+gh8aKF6OwStMms+fAcsGHQtD8FWiZ8lt3zA0lZ18Wbo
         saA/ZZNAhj3k3j17r5MPynbxkPMengIXzx7uSDqD/sxLXKZiK6h+1UqVgr9biHPD7MOY
         +W2gTmQ+lO24NaFgCVi9NAIuzNEQP0SCbyzaq06Iljhb95I+fVKP1DxFAfwb3DdkW1D2
         4EMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684309982; x=1686901982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WyFLOiSt+FtzfE39FeHW08WFhb9J+jn2vWhFKPP6Mwg=;
        b=EmiovJF+jarf7NaC3dpbbKWDwhwvU7eBz0+tVVUhHozeO6hwtkuYrlDgf19tve0SDo
         LGsxy4yutl4L7tLsFbP/9PqF9A+byy6+kl5E3b01i9ot7qnNNOiQjz/wItPT7FWJ5OYb
         7CxI/fUzlOu2O6L7SvPfktC7rTQksEDsDDxGdEq6978VCnLqSex3ZkMED5KqxEcGDKI6
         2jkv45Vf7CqNjYNMsD6wxsZI6BednS/Ye0HsnKs+lX+ZKFVmHtEBntQ97AkjAEfSCU3c
         C0pVjCYutW4h/SgCbUacs3Pmgk7juI44Ice2XSD8muN0fSZIzkKzuL4wFa7fOG84/CLi
         Tbvg==
X-Gm-Message-State: AC+VfDzq7vDcDtwb/VwrVdoigYrl0z9sdHS2aE9yOq0G92TIhHn7I+mH
	2A04J/3VyBV9GkstAMTtuW8QalD0Cqx/bje6wzbi6w==
X-Google-Smtp-Source: ACHHUZ7kdvCoiYGUDRXA0VpQ2rWsFU9JNMqBnmgZ0GZ6s8Q8KbJFCObn7U8FF6wlDvvnPZKguwQbMHKXd0vg3TnGxSE=
X-Received: by 2002:a67:fc05:0:b0:436:105d:91f9 with SMTP id
 o5-20020a67fc05000000b00436105d91f9mr12642224vsq.21.1684309982106; Wed, 17
 May 2023 00:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230517031856.19660-1-xiaoming.ding@mediatek.com> <ZGSDoVKKVqCkbaCB@infradead.org>
In-Reply-To: <ZGSDoVKKVqCkbaCB@infradead.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 17 May 2023 13:22:51 +0530
Message-ID: <CAFA6WYO+AvnbuAdWyBAQ8HkLaOno7PXdsPb9SubxrGNvAm4UnQ@mail.gmail.com>
Subject: Re: [PATCH] tee: add FOLL_LONGTERM for CMA case when alloc shm
To: Christoph Hellwig <hch@infradead.org>
Cc: Xiaoming Ding <xiaoming.ding@mediatek.com>, Jens Wiklander <jens.wiklander@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, fei.xu@mediatek.com, 
	srv_heupstream@mediatek.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_005315_289650_90AC291A 
X-CRM114-Status: GOOD (  12.39  )
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

On Wed, 17 May 2023 at 13:04, Christoph Hellwig <hch@infradead.org> wrote:
>
> > +     u32 page_flag = FOLL_WRITE;
> >
> >       if (!tee_device_get(teedev))
> >               return ERR_PTR(-EINVAL);
> > @@ -255,9 +256,11 @@ register_shm_helper(struct tee_context *ctx, unsigned long addr,
> >               ret = ERR_PTR(-ENOMEM);
> >               goto err_free_shm;
> >       }
> > -
> > +#if IS_ENABLED(CONFIG_CMA)
> > +     page_flag |= FOLL_LONGTERM;
> > +#endif
> >       if (flags & TEE_SHM_USER_MAPPED)
>
> If this mapping is long live it should always use FOLL_LONGTERM.

It depends on the userspace application needs. However, I think it
should be safe to use FOLL_LONGTERM by default to serve cases like
secure media playback.

>
> The ifdef does not make sense.

Agree.

-Sumit

