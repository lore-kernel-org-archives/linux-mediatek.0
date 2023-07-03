Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D945C001B0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jul 2023 17:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHhUcDMJ3GqqYqX8PUUmG05Gp9eg0kW+H85LcvU0FfM=; b=DK3o3c0mynPgCqyW481q7Os2rx
	a8D1pFoq3E3jQRml1wBFioI/YHJIRbFMj1JEYb1RjaTU4Y1tz1gM+04yW/ur/M8D0jGlWJpwHaLjR
	wq8YAOB/wHai8hn0v/bG5hMotXAP5NA7I16RjnA55WGBCCVWYOoq07C9HBO2kN+JHZGxcpti3FalD
	OtaHlzLNEq2BQpVL1ohgTntW4PorAcZ9bwkiG+h/CjdR92ZCJV+NPz+XaWEH3hvGYX9K0OkwVYoSI
	jDuwVnahFjbIs5C55txzLjzF/CtnHox223GTXJE2qcObRKT9J8FrghJaDjhGEHslM5ca8mVCl6SBi
	+0RTxZUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGN7I-00B4oI-0O;
	Mon, 03 Jul 2023 17:13:36 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGN7F-00B4n6-2S
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Jul 2023 17:13:35 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-401f4408955so407791cf.1
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Jul 2023 10:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688404411; x=1690996411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHhUcDMJ3GqqYqX8PUUmG05Gp9eg0kW+H85LcvU0FfM=;
        b=pcu1plunE/NwYXd0zKabq0kXC4lBKk8tohnsKuaUuvE/HlEsyL08J8Rrncb6tdHXMG
         cmz9bCoXUDR/JwJsqsmr71QjeYmcARqtrt1DQSYI9zPV/Sf5pJYJl6xLdKaxJCKOgvFr
         tnh9hlLbsw7q44xoXUaYM2Dl0zsM+CLmFGB60IzLiGOE4Gp49zPEcLGoPRuAw7HPala5
         LXBec5FoBaHgoeX5sfQUdYjUsvGaUbSYJ1wRZy1H8aMdOztF5ksEydpAKeoXbOIbsEEp
         30O8WuSAIYDTIkOI+/A0q8zA+SIzSI2JSocnTIfxpIswqs5WknnfbaYV8cHM0P31259d
         HXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688404411; x=1690996411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHhUcDMJ3GqqYqX8PUUmG05Gp9eg0kW+H85LcvU0FfM=;
        b=YgDhHRolz2FkkI/OAhAoUWjYskNZIRq1BEwPWCzuO/yY+wY3p5fkkQ+YyFfNMidyAk
         i8I/VDUC7MXchMK/MhSKUXMJiq2unuxo/a0z3rHNXTFp1nai1zEm2o+2sbGPFEgZ4u2q
         CxgavPCEAnb3Ga4um+IeqQ1zdMm8ID9b9OUOLo86PJvwZtqBCXjy0tfFDTbISPGfsP6s
         nQdvCTh1ntMROhj3HPVdUFlQ0I6wEBsPuh2YUg5nKnt2G7dRBADUWBlOrehNBm8nPung
         zppKQgyP8b1MrFZKKNh/Rl09+MfdzZWosJzTwHrNiVur0ZDLw/SajEsxfp5faZfhaVhZ
         jVpw==
X-Gm-Message-State: ABy/qLZLn8lYoC6rDJILvs1xlQjaTN15qQzmDhBkxz1rmg3z2LuMsdt5
	Jkqm1GF6o+Jcq71lg4CIfmJnHUv2Kq1e/jt+j2ra/Q==
X-Google-Smtp-Source: APBJJlGYc95qxttE9/8PAmxKfxDwWHEqgj+xMhW5O9ooJIFZZ/PHyQ6aNbFx0eU2JgiJSidSG/eG84BaW6wvypRKK3A=
X-Received: by 2002:ac8:574c:0:b0:3e8:684b:195d with SMTP id
 12-20020ac8574c000000b003e8684b195dmr44qtx.10.1688404410592; Mon, 03 Jul 2023
 10:13:30 -0700 (PDT)
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
Date: Mon, 3 Jul 2023 19:13:19 +0200
Message-ID: <CANn89iKAvrf92Fy8a_M+V9eya6OHokey2_yxQ3JiCT87fKND_w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230703_101333_795656_934A8AA2 
X-CRM114-Status: GOOD (  15.54  )
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
>
> On 7/3/23 12:22 AM, Mina Almasry wrote:
> > tcpdump is able to access the header of these skbs which is in host
> > memory, but not the payload in device memory. Here is an example
> > session with my netcat-like test for device memory TCP:
> > https://pastebin.com/raw/FRjKf0kv
> >
> > tcpdump seems to work, and the length of the packets above is correct.
> > tcpdump -A however isn't able to print the payload of the packets:
> > https://pastebin.com/raw/2PcNxaZV
>
> That is my expectation. The tcpdump is just an easy example of accessing
> the skb page frags. skb_copy_and_csum_bits used by icmp is another
> example that can walk frags wanting access to device memory. You did not
> cause a panic or trip a WARN_ON for example with the tcpdump?
>

Change for af_packet was not too hard :)

diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index a2dbeb264f260e5b8923ece9aac99fe19ddfeb62..aa4133d1b1e0676e408499ea453=
4b51262394432
100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -2152,7 +2152,7 @@ static int packet_rcv(struct sk_buff *skb,
struct net_device *dev,
                }
        }

-       snaplen =3D skb->len;
+       snaplen =3D skb->devmem ? skb_headlen(skb) : skb->len;

        res =3D run_filter(skb, sk, snaplen);
        if (!res)
@@ -2275,7 +2275,7 @@ static int tpacket_rcv(struct sk_buff *skb,
struct net_device *dev,
                }
        }

-       snaplen =3D skb->len;
+       snaplen =3D skb->devmem ? skb_headlen(skb) : skb->len;

        res =3D run_filter(skb, sk, snaplen);
        if (!res)


And a generic change in pskb_may_pull() ( __pskb_pull_tail() more
exactly) was enough to cover most other cases.

