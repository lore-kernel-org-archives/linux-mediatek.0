Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C01C3063F
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jul 2023 17:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2iHJSmnnxF29Ro2K2lEBKDHBSEStuWZBVC+tagVTag=; b=V/y39iq5DwN/ki0/dVQaMYIbD0
	ogHKlJadq4kKgDoRHE2Fn9FBGdyV+Qn+TWKRE94CBOkVuJdcRVVDv8u3ALV/qM9HLXxqyOGpavKYk
	E+Bz+TEUptdttd1wP35Ro1RoYQGGXQXJo2PhWI+8ESPYmI2shFdiAb5gwXDXy0ZJcRBBCyUmu69Ql
	ryURMSi8ENoJnxYjS7eBq0PxFGWGRTlH28/PiqhkXRJIpipNBGJ6N+okQJweKDd8qPtgjgcOMyDpr
	eBUobnZ0MLwT1PXAxzQ2OQ86cepIFkjqdt+cuteuXwvbfSijb70PciUx+pGqm/BOOcKxkb9B61kNh
	41BR+fZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGN9f-00B59H-1j;
	Mon, 03 Jul 2023 17:16:03 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGN9d-00B58T-1R
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Jul 2023 17:16:02 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4036bd4fff1so50251cf.0
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Jul 2023 10:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688404560; x=1690996560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2iHJSmnnxF29Ro2K2lEBKDHBSEStuWZBVC+tagVTag=;
        b=47XOYlRJzFahe96ZqkfTmm/uIVH9PurvYcuJt2zic5EN3cnyH18zDOC2xCQbsXHg/L
         MBr2Jj89/s10fPaBK8ONh/qVH7j/ATWqW393YNi0265BIjkPPQxvp0lulXWG6lYjJqxC
         pfOCD5aZyBHRVyZZI92JMrnVt0yKXjXbRkEMQhxo2ndkUYajECq2IgK3/Yeev3o88h4B
         24jQ5T4PDeaC4UtHsgrlhTBPZhU3OyR0pIvCwYtTELkRIwrF6BeyujE8LAs0acdbgI10
         eF2YyczJpJLr4KQdLu9GkOkIA7zyBQifyhaI4Rcvmthi7Yoz5I+Z6u6bhZvZL5cOaCNq
         g4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688404560; x=1690996560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2iHJSmnnxF29Ro2K2lEBKDHBSEStuWZBVC+tagVTag=;
        b=ji3LhGn+YKsBbFE9rZUoKs/du5uGhTjjHWrsraf5VPo8VK1GpghrZTStPOtPWdeaC4
         dE0bBJO3NZBiGiIBv1xbzrFxkAQBxS5eZyUsR2iJVzg7zk2TWuCEJtgIMJJf62MQK423
         yLOjtosmT/8m1Wv5jIW7fzYSbvYaE/6R9Nlyr4JWDdhRBDgdOGor2FOGZf6Nc2+swtpM
         Qap+O+B9lPdn0yxLAPv065fa0RQF+/WxTPiT8at3YmwxmuDn8WVrHeHDXd/oEgBVW+Az
         yOGDm+wFoHm2jwfmsGuTYuQJtCbBlOllO5wLNVnmdZ1R7isB/cEOhckvAc6n/eDFq1Cy
         XlKA==
X-Gm-Message-State: ABy/qLZaVl7/FxAxUsv7X4PbtUar1S0V1Dj4r/zBS/yOTjSvFb82LfV1
	yAlbEa3X1s3ms8ES9iWNFsr72HL1BR9agPtR02i8OA==
X-Google-Smtp-Source: APBJJlEAkEot4YdZ7WBMguqh2+qizaqMNrvnDRoFX8TWve6Wd/8zmhq/dGKscf1MYzgs71C4RNIb3wdeASZ6Vhyhjvc=
X-Received: by 2002:a05:622a:1705:b0:3fa:45ab:22a5 with SMTP id
 h5-20020a05622a170500b003fa45ab22a5mr298105qtk.27.1688404559885; Mon, 03 Jul
 2023 10:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230612130256.4572-1-linyunsheng@huawei.com> <20230612130256.4572-5-linyunsheng@huawei.com>
 <20230614101954.30112d6e@kernel.org> <8c544cd9-00a3-2f17-bd04-13ca99136750@huawei.com>
 <20230615095100.35c5eb10@kernel.org> <CAKgT0Uc6Xoyh3Edgt+83b+HTM5j4JDr3fuxcyL9qDk+Wwt9APg@mail.gmail.com>
 <908b8b17-f942-f909-61e6-276df52a5ad5@huawei.com> <CAKgT0UeZfbxDYaeUntrQpxHmwCh6zy0dEpjxghiCNxPxv=kdoQ@mail.gmail.com>
 <72ccf224-7b45-76c5-5ca9-83e25112c9c6@redhat.com> <20230616122140.6e889357@kernel.org>
 <eadebd58-d79a-30b6-87aa-1c77acb2ec17@redhat.com> <20230619110705.106ec599@kernel.org>
 <CAHS8izOySGEcXmMg3Gbb5DS-D9-B165gNpwf5a+ObJ7WigLmHg@mail.gmail.com>
 <5e0ac5bb-2cfa-3b58-9503-1e161f3c9bd5@kernel.org> <CAHS8izP2fPS56uXKMCnbKnPNn=xhTd0SZ1NRUgnAvyuSeSSjGA@mail.gmail.com>
 <47b79e77-461b-8fe9-41fb-b69a6b205ef2@kernel.org>
In-Reply-To: <47b79e77-461b-8fe9-41fb-b69a6b205ef2@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 3 Jul 2023 19:15:48 +0200
Message-ID: <CANn89iJLAnnvFfkmJbQ=ZFMwaqiYDOTD3-P+NpkEMzP9aKV-ig@mail.gmail.com>
Subject: Re: Memory providers multiplexing (Was: [PATCH net-next v4 4/5]
 page_pool: remove PP_FLAG_PAGE_FRAG flag)
To: David Ahern <dsahern@kernel.org>
Cc: Mina Almasry <almasrymina@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <jbrouer@redhat.com>, brouer@redhat.com, 
	Alexander Duyck <alexander.duyck@gmail.com>, Yunsheng Lin <linyunsheng@huawei.com>, davem@davemloft.net, 
	pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Yisen Zhuang <yisen.zhuang@huawei.com>, 
	Salil Mehta <salil.mehta@huawei.com>, Sunil Goutham <sgoutham@marvell.com>, 
	Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, 
	hariprasad <hkelam@marvell.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Jonathan Lemon <jonathan.lemon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_101601_486161_CC481A66 
X-CRM114-Status: UNSURE (   6.95  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jul 3, 2023 at 4:45=E2=80=AFPM David Ahern <dsahern@kernel.org> wro=
te:

> That is my expectation. The tcpdump is just an easy example of accessing
> the skb page frags. skb_copy_and_csum_bits used by icmp is another
> example that can walk frags wanting access to device memory. You did not
> cause a panic or trip a WARN_ON for example with the tcpdump?
>

ICMP packets do not land on the queues having devmem buffers, for
obvious reasons.

Only chosen TCP flows are steered to these queues.

