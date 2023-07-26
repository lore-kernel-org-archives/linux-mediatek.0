Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10FEC001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 15:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIvg9RvPixHqfad2Kamp9kJBh4DIZcFMKZRn7pfOsNE=; b=skDEWd60aTlaS9/7X+nm9WGUsH
	DtjnFvlPaP86xhQki1AwVKLluzjiIfNLentTeyDRrQZfZ9X3cpk1LmhoLK2vkoaKwe9PCltcreFAi
	h8nEp+pFrYD/HLQceNy1Sdqbsgu/8Pm+GKVYPW4TjcnbiD4mzLxywbYmkhNMoJ2WO6BRmxECpXIj/
	iU+u3QlddEtBfIGh+Y3Hhhd+qcApp54xWEZqQuNdcgSrTXXfZ4tFtW4KM10d6tsYiik1IPhQbiM8U
	DY0n3EQywQHJBKp6Oj3gES0ULneZ+YDdoh3HuSsu+PO+9t+BbUg9jRmOt+nAmKlSa3rfUeQP6HjI/
	Ra2bM3jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOgTb-00Ar6C-2D;
	Wed, 26 Jul 2023 15:30:59 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOgTX-00Ar4d-1S;
	Wed, 26 Jul 2023 15:30:57 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-666ecf9a081so6316568b3a.2;
        Wed, 26 Jul 2023 08:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690385454; x=1690990254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIvg9RvPixHqfad2Kamp9kJBh4DIZcFMKZRn7pfOsNE=;
        b=UvNxr8eLJ9hNPoNo/nmVkgjI4LmuR9ztzcTY+8rMIzSoHv7gwljQlaHHd92gm95UVm
         nU56pgA2IgpkZ87/1SXR5DOwjHop16+wfwPEV6IS33mO1QlQi6mSJ8FVmwoSi/+kZx4P
         qanoK+6WcjuZX7MFStjdzc0nrwV3XSiclq3I9Cq47+YLuQmJjCuttPtZTA47gY8Px5VL
         M0KGCrZjA8PmkcEwyq7+BkhWwhnMHinBdCCuaa+ygSj2WTJ1OO0iLTikgnWKqb83HYA/
         7qGLhQ84+9qqmlQzBfUs/lur7fuEApadKSY61qyN9KpEKVsfsHhr/QJ2E0h+XppBvQji
         sYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690385454; x=1690990254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIvg9RvPixHqfad2Kamp9kJBh4DIZcFMKZRn7pfOsNE=;
        b=QTHfndpOuMWJiBRByW2aPnTTZfumCgnyGzbgPzfTGZ87pxAciq7cNNt0Bswe+XMUv1
         CWqbnzsCtygyvUPe0HqHnjbrjhHGf9LKjlCS8641aFP3raFxPT0fHlfksnCn97VQ8tpF
         fXEtL14aR2EnvJKfNGLdba+yBM2HN+mY4HMTOkKGykrVNtx0itVeVQAx5vsKx8KsFtEc
         2XR3F12k0accn+MQ7OdR7WEAZX+uMgqoRXFWNybKn5DaF/GmDa5+BwEawvHdzAV5XIJG
         HfTL3V5Oq1kgamU7VLKsRKrR9hNM7l4Zq2f9pdPMeuelTzeQk13PKUZZ19atf79r6xr9
         jG5Q==
X-Gm-Message-State: ABy/qLbpLsVgxGtHHBc+n8/gu7JKeHyjh1OUMo0VJpXy2gv4G6KlInQ5
	9Bt8sdPNTIemIRszgnuBCIkH4kLpd/oM24w9Eu4=
X-Google-Smtp-Source: APBJJlGsYifDPtFqieNjZSRGPJL2WJtbotBq8b23fwCEiS2YFyApRJq7zsSItWWZeZOofGURnKLE/TZxtTf3oC+7O6c=
X-Received: by 2002:a17:90b:a4e:b0:268:5620:cfc7 with SMTP id
 gw14-20020a17090b0a4e00b002685620cfc7mr1509855pjb.30.1690385453708; Wed, 26
 Jul 2023 08:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230725131258.31306-1-linyunsheng@huawei.com>
 <94272ffed7636c4c92fcc73ccfc15236dd8e47dc.camel@gmail.com>
 <16b4ab57-dfb0-2c1d-9be1-57da30dff3c3@intel.com> <22af47fe-1347-3e32-70bf-745d833e88b9@huawei.com>
In-Reply-To: <22af47fe-1347-3e32-70bf-745d833e88b9@huawei.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Wed, 26 Jul 2023 08:30:17 -0700
Message-ID: <CAKgT0UcU4RJj0SMQiVM8oZu86ZzK+5NjzZ2ELg_yWZyWGr04PA@mail.gmail.com>
Subject: Re: [PATCH net-next v2] page_pool: split types and declarations from page_pool.h
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Eric Dumazet <edumazet@google.com>, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Sunil Goutham <sgoutham@marvell.com>, 
	Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, 
	hariprasad <hkelam@marvell.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-rdma@vger.kernel.org, 
	bpf@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_083055_496139_016624F1 
X-CRM114-Status: GOOD (  32.65  )
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

On Wed, Jul 26, 2023 at 4:23=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei.co=
m> wrote:
>
> On 2023/7/26 18:43, Alexander Lobakin wrote:
> > From: Alexander H Duyck <alexander.duyck@gmail.com>
> > Date: Tue, 25 Jul 2023 08:47:46 -0700
> >
> >> On Tue, 2023-07-25 at 21:12 +0800, Yunsheng Lin wrote:
> >>> Split types and pure function declarations from page_pool.h
> >>> and add them in page_pool/types.h, so that C sources can
> >>> include page_pool.h and headers should generally only include
> >>> page_pool/types.h as suggested by jakub.
> >>>
> >>> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
> >>> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> >>> CC: Alexander Lobakin <aleksander.lobakin@intel.com>
> >
> > [...]
> >
> >>> +/* Caller must provide appropriate safe context, e.g. NAPI. */
> >>> +void page_pool_update_nid(struct page_pool *pool, int new_nid);
> >>> +
> >>> +#endif /* _NET_PAGE_POOL_H */
> >>
> >>
> >> This seems kind of overkill for what is needed. It seems like the
> >> general thought process with splitting this was so that you had just
> >> the minimum of what is needed to support skbuff.h and the functions
> >> declared there. The rest of this would then be added via the .h to the
> >> .c files that will actually be calling the functions.
> >>
> >> By that logic I think the only thing we really need is the function
> >> declaration for page_pool_return_skb_page moved into skbuff.h. We coul=
d
> >> then just remove page_pool.h from skbuff.h couldn't we?
> >
> > This patch is not to drop page_pool.h include from skbuff.h.
> > This is more future-proof (since I'm dropping this include anyway in my
> > series) to have includes organized and prevent cases like that one with
> > skbuff.h from happening. And to save some CPU cycles on preprocessing i=
f
> > that makes sense.
>
> The suggestion is from below:
>
> https://lore.kernel.org/all/20230710113841.482cbeac@kernel.org/

I get that. But it seemed like your types.h is full of inline
functions. That is what I was responding to. I would leave the inline
functions in page_pool.h unless there is some significant need for
them.

> >
> >>
> >> Another thing we could consider doing is looking at splitting things u=
p
> >> so that we had a include file in net/core/page_pool.h to handle some o=
f
> >> the cases where we are just linking the page_pool bits to other core
> >> file bits such as xdp.c and skbuff.c.
>
> I suppose the above suggestion is about splitting or naming by
> the user as the discussed in the below thread?
> https://lore.kernel.org/all/20230721182942.0ca57663@kernel.org/

Actually my suggestion is more about defining boundaries for what is
meant to be used by drivers and what isn't. The stuff you could keep
in net/core/page_pool.h would only be usable by the files in net/core/
whereas the stuff you are keeping in the include/net/ folder is usable
by drivers. It is meant to prevent things like what you were
complaining about with the Mellanox drivers making use of interfaces
you didn't intend them to use.

So for example you could pull out functions like
page_pool_return_skb_page, page_pool_use_xdp_mem,
page_pool_update_nid, and the like and look at relocating them into
the net/core/ folder and thereby prevent abuse of those functions by
drivers.

