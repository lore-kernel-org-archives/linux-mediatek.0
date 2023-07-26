Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9591AC001DE
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 15:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qd0XKEVIQ26IMlUHdhjMjbO51vNzIsVA3nwslw/F47k=; b=O/pV31sXVri+MzEDtcl4EBe9oq
	QGu5RN3jaMcFRs3lhnyo0CoY0fVeNgIiY+mPuEZv54QRPEZ3sPZ6PAePlne4l/Y6KQB5FsdoWYxDk
	0rJ+YDQvKdtnVXMN2E34b2Ln2uMKk6n2EqPfIAlVk4o0WD38BiSI6lIWmIotv6KVZhspTjkEuqROa
	cYBDEmYpabHodTU5X6ra95/SiaxOk1MkpV28LMJgvlKESHGSi4T/IToszg5BIWHC88V6B2PVrrJqX
	z6xiSrKdh7Pxlo+0oNJ7evALCEgoKB+YnALVempC318K4VBZcAL24QQo3HooSNjipP1T2bFW6qdQr
	idqp+79Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOgcl-00AsG4-1K;
	Wed, 26 Jul 2023 15:40:27 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOgch-00AsDg-2q;
	Wed, 26 Jul 2023 15:40:25 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1bba2318546so26891425ad.1;
        Wed, 26 Jul 2023 08:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690386020; x=1690990820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qd0XKEVIQ26IMlUHdhjMjbO51vNzIsVA3nwslw/F47k=;
        b=R3ofZwIXsE8fcjEtK5ct6jjzVfEwbXsiXorqCg/0MJ41yfH0Ezm0yJV/3R41uTpXfK
         fEeR3wRS9gVVTnMqh6Lw26h6pk9S6Z+UX3nAaWah3vF4CTjM3sKcBxuln6Z04saaFvaI
         fSqRP48YkQGIljCDAMG5VJ1IGiin0Cx3DQxBQUMgqgMAyxboAdh8Jpcc66TQdWlAoZPa
         FUjEhVM2EXFVDV+ea3Lph23zPMmCp6ZAqXlstTClAM/oysB20UaYPoESRfS5ExjvMjZL
         +6StNfcQC7e2AF1/XYZ5vrE+qmSVGDMbrU/4SxrNv2nYTMc1gySHXjS/G5jfuljGV4/m
         tc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690386020; x=1690990820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qd0XKEVIQ26IMlUHdhjMjbO51vNzIsVA3nwslw/F47k=;
        b=Iavo6MEbEw8DifvaYga1lrtTPSBxMmBSyrtYNksEeX74Y0y+Ro0T75XM6evqTwnf6k
         wHvdIPMyaOgy8MjXpV+K4sN01TaisbMsahmfX2QMAXDcQgrKE9hLZgsKt7q77AfDtsJi
         r3S7WA3pHCJ1gJDmy5HU8eDfi5NMpGC+sU3kUUnR+R+3zAKK6Yv333ph46hObRlH5Jcp
         O5C56AQz2o/Ouvt8YmRUKXgwlCS/y3P+QE+gONrPhsLGiF/bJ8hJRXwrYWD+ltPohXmy
         2rOGmN1iNGCFNwk21KEsF/SACvwgA1JYNLmmnboN5eMeykVrygfrFbR4SZNWuxre6/Cd
         O43A==
X-Gm-Message-State: ABy/qLZr669AsV1Y7udjsTSjULDsMaHKzxmojpyYh0QlEmYkwFflgP1E
	wXtYXCTUz9ZdhFa0H0vdBlxFcol7UHxwqHRjDBc=
X-Google-Smtp-Source: APBJJlGeBHTbhBX3m8Vmy0hhZqIvHH7U05vuFuDvBQ17u45lpSAHPWcH5x81Dz31f9TlEz+Hn+yoakrE5n19qB9A1bE=
X-Received: by 2002:a17:903:1108:b0:1b5:2fdf:5bd8 with SMTP id
 n8-20020a170903110800b001b52fdf5bd8mr2953334plh.8.1690386020390; Wed, 26 Jul
 2023 08:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230725131258.31306-1-linyunsheng@huawei.com>
 <94272ffed7636c4c92fcc73ccfc15236dd8e47dc.camel@gmail.com>
 <16b4ab57-dfb0-2c1d-9be1-57da30dff3c3@intel.com> <22af47fe-1347-3e32-70bf-745d833e88b9@huawei.com>
 <CAKgT0UcU4RJj0SMQiVM8oZu86ZzK+5NjzZ2ELg_yWZyWGr04PA@mail.gmail.com>
In-Reply-To: <CAKgT0UcU4RJj0SMQiVM8oZu86ZzK+5NjzZ2ELg_yWZyWGr04PA@mail.gmail.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Wed, 26 Jul 2023 08:39:43 -0700
Message-ID: <CAKgT0UfL4ri-o7WifeewpezGQY1UQKwcBEUSSY80DyKoE8g-0w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230726_084023_920336_A71419B0 
X-CRM114-Status: GOOD (  37.80  )
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

On Wed, Jul 26, 2023 at 8:30=E2=80=AFAM Alexander Duyck
<alexander.duyck@gmail.com> wrote:
>
> On Wed, Jul 26, 2023 at 4:23=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei.=
com> wrote:
> >
> > On 2023/7/26 18:43, Alexander Lobakin wrote:
> > > From: Alexander H Duyck <alexander.duyck@gmail.com>
> > > Date: Tue, 25 Jul 2023 08:47:46 -0700
> > >
> > >> On Tue, 2023-07-25 at 21:12 +0800, Yunsheng Lin wrote:
> > >>> Split types and pure function declarations from page_pool.h
> > >>> and add them in page_pool/types.h, so that C sources can
> > >>> include page_pool.h and headers should generally only include
> > >>> page_pool/types.h as suggested by jakub.
> > >>>
> > >>> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
> > >>> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> > >>> CC: Alexander Lobakin <aleksander.lobakin@intel.com>
> > >
> > > [...]
> > >
> > >>> +/* Caller must provide appropriate safe context, e.g. NAPI. */
> > >>> +void page_pool_update_nid(struct page_pool *pool, int new_nid);
> > >>> +
> > >>> +#endif /* _NET_PAGE_POOL_H */
> > >>
> > >>
> > >> This seems kind of overkill for what is needed. It seems like the
> > >> general thought process with splitting this was so that you had just
> > >> the minimum of what is needed to support skbuff.h and the functions
> > >> declared there. The rest of this would then be added via the .h to t=
he
> > >> .c files that will actually be calling the functions.
> > >>
> > >> By that logic I think the only thing we really need is the function
> > >> declaration for page_pool_return_skb_page moved into skbuff.h. We co=
uld
> > >> then just remove page_pool.h from skbuff.h couldn't we?
> > >
> > > This patch is not to drop page_pool.h include from skbuff.h.
> > > This is more future-proof (since I'm dropping this include anyway in =
my
> > > series) to have includes organized and prevent cases like that one wi=
th
> > > skbuff.h from happening. And to save some CPU cycles on preprocessing=
 if
> > > that makes sense.
> >
> > The suggestion is from below:
> >
> > https://lore.kernel.org/all/20230710113841.482cbeac@kernel.org/
>
> I get that. But it seemed like your types.h is full of inline
> functions. That is what I was responding to. I would leave the inline
> functions in page_pool.h unless there is some significant need for
> them.
>
> > >
> > >>
> > >> Another thing we could consider doing is looking at splitting things=
 up
> > >> so that we had a include file in net/core/page_pool.h to handle some=
 of
> > >> the cases where we are just linking the page_pool bits to other core
> > >> file bits such as xdp.c and skbuff.c.
> >
> > I suppose the above suggestion is about splitting or naming by
> > the user as the discussed in the below thread?
> > https://lore.kernel.org/all/20230721182942.0ca57663@kernel.org/
>
> Actually my suggestion is more about defining boundaries for what is
> meant to be used by drivers and what isn't. The stuff you could keep
> in net/core/page_pool.h would only be usable by the files in net/core/
> whereas the stuff you are keeping in the include/net/ folder is usable
> by drivers. It is meant to prevent things like what you were
> complaining about with the Mellanox drivers making use of interfaces
> you didn't intend them to use.
>
> So for example you could pull out functions like
> page_pool_return_skb_page, page_pool_use_xdp_mem,
> page_pool_update_nid, and the like and look at relocating them into
> the net/core/ folder and thereby prevent abuse of those functions by
> drivers.

Okay, maybe not page_pool_update_nid. It looks like that is already in
use in the form of page_pool_nid_changed by drivers..

