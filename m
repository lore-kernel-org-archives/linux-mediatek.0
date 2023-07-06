Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17695EB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 01:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gG5qEwxagC4+ySUQRGnCqzQVgx8YJDmgKYEwBwBbHi8=; b=VQGQ827dHqJRiqXqzlvesqzPYt
	gGO8lU8GTMDC0m2qIEI92ABoyxwTc+ktrF0/v0KJhIv20cnXJXvHZzD4jt0ME5lnq3nTIplpn5CT5
	JX3uldEXHCxxtJgY0bCE9b+P0Jom4xLXLlYYR2n8h5fHjV6kKqpvMKbDAAFTQbZDHqJtzc+yKVCjp
	SJUVptuGsGhfZ3+7IXU8pt2QdLHwpK0Rm1hLcyEq5lPFOM1T439XFlT/5BIkTStB9PvX97M0ND75A
	PNoqTqQSElaDjXGs8CLyu04DPmtNf+MA7VluBx4sAIKbEYETh3I/cCYW4lGSM1rHSVW0P6LOR6kNb
	OiMQnQAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHDeP-00HYO1-0Q;
	Thu, 06 Jul 2023 01:19:17 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHDeL-00HYMx-1C
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Jul 2023 01:19:15 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-440c368b4e2so55267137.2
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Jul 2023 18:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688606351; x=1691198351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gG5qEwxagC4+ySUQRGnCqzQVgx8YJDmgKYEwBwBbHi8=;
        b=WMb9JUkj68NIqA151cJeWq+K4uPDzjvVMzwUNQ7V4uLik7F/mwPqb/9E7uaaVRzJL0
         0M3W+l5Wpg0NYKNut4knANvMOjAKPnUYPjvDyDIHQFnFHedjDJQwlvzVdCtfTKIXcA0G
         cFwY++6voTGFWrrbQDYteX0eT/EnnSZjfyyd3g6fjfrkkXoYRonL+Da3UeqGgWhFXHYg
         oW1v42NaF0AE5lnAh7MhvFF9ChNcLvl9h2zEoae33BSI4GvprdIhWxlQzumISRkjVFJ3
         kugXVSyaSsJBiJzwPFA2NFjjIoo85T3VCqcRJB1qMAYJ6Py2B6ZA5ytZTNSXX4WAKvsA
         +KhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688606351; x=1691198351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gG5qEwxagC4+ySUQRGnCqzQVgx8YJDmgKYEwBwBbHi8=;
        b=a9ULtsIu/tJdIGyPBYrS39OOpWcWU4uu1hNHQt1EXernLsdJTMSz2fubo+W+PgZvEW
         egmWN9rJDTV81FBYnaIBR2EfAqpDxgJ+ioAdO1lz5T1O9cydGB6lZHMsabtG9mcVhUbQ
         KKYYjMFENFWA46yO+ggHgE2BZsSR+NVtxOHXngKjVOy5xsqaEG8G/Cjs4lSWXmr/V0cq
         IFqCcxRd5Ek3PbcAf6njJ3TqRxO4Z1kHWTFHLMaUTLFxPJjAaCrmIXuAlfL0wVtHJoi2
         gYp8cyyaCUHt0Fiv1dbuJbhHHI4mV+eV0oeFbOnjoPSW7whPblmViGKCQmJ6kKZnhSdS
         FytQ==
X-Gm-Message-State: ABy/qLYZ2mqIKPD9aBiQYiHo6PWXjmSjzHWLD+1+u/HnIsIf3J22E6hl
	9987ihumv5UzkyOkZ5Z3CRP1689tvR7lX/qPEFybdw==
X-Google-Smtp-Source: APBJJlHTpxzJQ8qMkls8/kIG3QOBs1ceFkXZ5NSrihcQZjqbTz7tGm96dN/xChDtfBDJkv3zbfLFcn2Iuq8tSQKFcC4=
X-Received: by 2002:a67:e989:0:b0:443:90ff:c691 with SMTP id
 b9-20020a67e989000000b0044390ffc691mr600930vso.13.1688606351586; Wed, 05 Jul
 2023 18:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230612130256.4572-1-linyunsheng@huawei.com> <20230612130256.4572-5-linyunsheng@huawei.com>
 <20230614101954.30112d6e@kernel.org> <8c544cd9-00a3-2f17-bd04-13ca99136750@huawei.com>
 <20230615095100.35c5eb10@kernel.org> <CAKgT0Uc6Xoyh3Edgt+83b+HTM5j4JDr3fuxcyL9qDk+Wwt9APg@mail.gmail.com>
 <908b8b17-f942-f909-61e6-276df52a5ad5@huawei.com> <CAKgT0UeZfbxDYaeUntrQpxHmwCh6zy0dEpjxghiCNxPxv=kdoQ@mail.gmail.com>
 <72ccf224-7b45-76c5-5ca9-83e25112c9c6@redhat.com> <20230616122140.6e889357@kernel.org>
 <eadebd58-d79a-30b6-87aa-1c77acb2ec17@redhat.com> <20230619110705.106ec599@kernel.org>
 <CAHS8izOySGEcXmMg3Gbb5DS-D9-B165gNpwf5a+ObJ7WigLmHg@mail.gmail.com>
 <5e0ac5bb-2cfa-3b58-9503-1e161f3c9bd5@kernel.org> <CAHS8izP2fPS56uXKMCnbKnPNn=xhTd0SZ1NRUgnAvyuSeSSjGA@mail.gmail.com>
 <47b79e77-461b-8fe9-41fb-b69a6b205ef2@kernel.org> <CANn89iKAvrf92Fy8a_M+V9eya6OHokey2_yxQ3JiCT87fKND_w@mail.gmail.com>
 <011d3204-5c33-782c-41d1-53bf9bd2e095@kernel.org>
In-Reply-To: <011d3204-5c33-782c-41d1-53bf9bd2e095@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 5 Jul 2023 18:19:00 -0700
Message-ID: <CAHS8izPF7WjMKLA82fy5LjE9XzUWNVMgs9tD7JM5UY3xfw93Yw@mail.gmail.com>
Subject: Re: Memory providers multiplexing (Was: [PATCH net-next v4 4/5]
 page_pool: remove PP_FLAG_PAGE_FRAG flag)
To: David Ahern <dsahern@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
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
X-CRM114-CacheID: sfid-20230705_181913_417382_9426EAF5 
X-CRM114-Status: GOOD (  11.81  )
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

On Mon, Jul 3, 2023 at 10:23=E2=80=AFAM David Ahern <dsahern@kernel.org> wr=
ote:
>
> On 7/3/23 11:13 AM, Eric Dumazet wrote:
> > diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
> > index a2dbeb264f260e5b8923ece9aac99fe19ddfeb62..aa4133d1b1e0676e408499e=
a4534b51262394432
> > 100644
> > --- a/net/packet/af_packet.c
> > +++ b/net/packet/af_packet.c
> > @@ -2152,7 +2152,7 @@ static int packet_rcv(struct sk_buff *skb,
> > struct net_device *dev,
> >                 }
> >         }
> >
> > -       snaplen =3D skb->len;
> > +       snaplen =3D skb->devmem ? skb_headlen(skb) : skb->len;
> >
>
> Ok, so you expect a flag on the skb noting the use of 'untouchable'
> memory. That aligns with my expectations based on POCs.
>
> Based on the above: 1) skb->head is expected to be host memory, and 2)
> the flag is a global for all frags, so no mix and match.

Yes, both are correct (i.e. what I plan to propose).

--=20
Thanks,
Mina

