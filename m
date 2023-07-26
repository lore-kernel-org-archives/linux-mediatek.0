Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8F3C04A6A
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 16:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KCv8whutDfLJorKpUOqJ8+KkOpc2kOBhY8hTu1PhHvI=; b=OJNastu8O8rSrRVBQ//gsGmcho
	8jzWjM9RdOBICKr4bszRuMZCBY4CvkeuveZsH36Bnmt+soOlS5kVDXcztC9vKUXj8jEAop5MmCEt/
	FwDTEvzYvwvshM7lolwFYWzSvx9l59KSZsEyETq10MZjTxltBsTC21VnR4XQD4B0avd2UoLywJETM
	lM+vL3AT4LHgnwyKuEj4ibzlxlg0LxTrbU3/sZEsOUmli73y1lRJT4IPeqdRvVrAxQas3hKMSJJPO
	Zn5Tnbb5o56SZCiag1bIT5BAeYJtNw4OM6RHixcbnA44V9tDxHyxn643l6R87CrbqqkZT8QgGcR8e
	Tb1en4NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOhba-00B2ZV-0f;
	Wed, 26 Jul 2023 16:43:18 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOhbX-00B2X7-1G;
	Wed, 26 Jul 2023 16:43:16 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1bbd2761f1bso4597695ad.2;
        Wed, 26 Jul 2023 09:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690389792; x=1690994592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCv8whutDfLJorKpUOqJ8+KkOpc2kOBhY8hTu1PhHvI=;
        b=QMUznHOLJYfI3Cg1OGbvbUK2zwN4Xs54ZJ3JbZrw4JhdF1uxPQBZ3HVCSn31MYAgdc
         Q3UdwouTq+Mcv+ne7ujpatnJtig71lQqScyMfCpcd4njFTx2RrYTuWYS75n+F8Ub+lJb
         sgYnZK0m3NpEEtpkxeXqvlCQL5FyNn9joXe4bALGP92MnaPs+jHcAWAHXearGlrCz8vp
         NiOWaE+mGvO2zNT5aJxPyQVlYzpIxZgun8DIiMsIyNzjTELMbe8K/8SOPkhf+s3/lXjk
         II5NtI1EzZjw6UkqZdZsvukqb8KGZBLOTuS3MfVf02FYRvI+M5kRxGwBzEWcbh/IBuyC
         WI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690389792; x=1690994592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCv8whutDfLJorKpUOqJ8+KkOpc2kOBhY8hTu1PhHvI=;
        b=RRYFq/gBC8Q00EiCjR7ttKbUnUQlSVYgz8rSDv8jBP3wQxF819VVT+K49S6S88Xply
         L2obqP7BQLzlVZiXzAfkPZRa3RcM3BxvZEGYdN7NwTHFZNkExY+RotPVXJKxetzRi8Uw
         zMafCEHT4GyF9wfpw0qDOhsUoJqHqZuWYSEaeifQZodQZbIqrsh28HbDGFT2NlbLIzUa
         bUjDfGapBrSPZyyUzPWQ62Q8oHCVaVxRokVgtX4jXBqGKvnw2uPaehes+qg5CN2DIQBa
         BgZlT6l/KNrKrHA5fKs8pie1Vv756cgR+5pPsPnHUfLpnQVW0/bBYCvTYsTFJNwIKWwz
         lH5g==
X-Gm-Message-State: ABy/qLat6ZDPIZm7f6Nc01+Sgi0STZSh305MpY+1iyRFNA6uUF/Wd+0g
	WgAZICmrA/2e/IcAILWt5vxakKlgvIucLZxseck=
X-Google-Smtp-Source: APBJJlExta4H2GjqFCFJjAPMwlKu75pRye0RG2yh6z7/8hWP5WKagkLUkY7X/mJhBRsTApJB/W2FhSG2fN3oUXYQ7wA=
X-Received: by 2002:a17:90a:c714:b0:263:f643:4bd3 with SMTP id
 o20-20020a17090ac71400b00263f6434bd3mr2209207pjt.27.1690389791855; Wed, 26
 Jul 2023 09:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230725131258.31306-1-linyunsheng@huawei.com>
 <94272ffed7636c4c92fcc73ccfc15236dd8e47dc.camel@gmail.com>
 <16b4ab57-dfb0-2c1d-9be1-57da30dff3c3@intel.com> <22af47fe-1347-3e32-70bf-745d833e88b9@huawei.com>
 <CAKgT0UcU4RJj0SMQiVM8oZu86ZzK+5NjzZ2ELg_yWZyWGr04PA@mail.gmail.com>
 <CAKgT0UfL4ri-o7WifeewpezGQY1UQKwcBEUSSY80DyKoE8g-0w@mail.gmail.com> <20230726085049.36b527a4@kernel.org>
In-Reply-To: <20230726085049.36b527a4@kernel.org>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Wed, 26 Jul 2023 09:42:34 -0700
Message-ID: <CAKgT0UddT2CY_HrQ-d+5vPbpguuscsfF=oUVW02AFy0JAYet3w@mail.gmail.com>
Subject: Re: [PATCH net-next v2] page_pool: split types and declarations from page_pool.h
To: Jakub Kicinski <kuba@kernel.org>
Cc: Yunsheng Lin <linyunsheng@huawei.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, davem@davemloft.net, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
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
X-CRM114-CacheID: sfid-20230726_094315_434596_B349F2F2 
X-CRM114-Status: GOOD (  24.27  )
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

On Wed, Jul 26, 2023 at 8:50=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 26 Jul 2023 08:39:43 -0700 Alexander Duyck wrote:
> > > > I suppose the above suggestion is about splitting or naming by
> > > > the user as the discussed in the below thread?
> > > > https://lore.kernel.org/all/20230721182942.0ca57663@kernel.org/
> > >
> > > Actually my suggestion is more about defining boundaries for what is
> > > meant to be used by drivers and what isn't. The stuff you could keep
> > > in net/core/page_pool.h would only be usable by the files in net/core=
/
> > > whereas the stuff you are keeping in the include/net/ folder is usabl=
e
> > > by drivers. It is meant to prevent things like what you were
> > > complaining about with the Mellanox drivers making use of interfaces
> > > you didn't intend them to use.
>
> FWIW moving stuff which is only supposed to be used by core (xdp, skb,
> etc.) to net/core/page_pool.h is a good idea, too.
> Seems a bit independent from splitting the main header, tho.

It seems a bit independent, but I was reacting only because I feel
like this ijust adding to the technical debt on this. Basically before
we can really just go ahead and split it the header file itself should
probably be cleaned up a bit.

The reason why it occurred to me is that I noticed things like
page_pool_use_xdp_mem and the forward declaration for xdp_mem_info was
being picked up and moved into the types.h file in the move. The whole
block was in a #if/#else statement w/ definitions for the PAGE_POOL
and non-PAGE_POOL cases.

We also have functions that don't really need to be included such as
page_pool_unlink_napi which is exported but not used outside of
page_pool.c from what I can tell.

