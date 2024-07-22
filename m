Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079CBC3DA59
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jul 2024 18:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLVIduvSyccDga4xJI9V3U/42Lv/6UsR4iyO6Z8QOb4=; b=D8FZL0OcF6FW25Y+gMBB+7Aq6m
	bD3lQKEe9U6NGCiRZjqFcOixisOpGRsmRRcQWcXxojPaFgeY084abm2Hy50yBw/CdYgiHMDX4VXjw
	WDZnMdi96sFzTCY1Td6VFfpo1tD1Kxf8IlbdWG5KM6+QknPD4QCvX6vNDQsyWiuVqv2cguJRdupDx
	t6uuGLqvAt3NQ3WMUW4wMmlAqYEkJYIRZViHNkH4hSlx4aWmab01eqRybWakSZr2saF5iSB+Sd04d
	6+JM2vXnSC7s8sS/OOLk2IB/+ugwVTnWwTb62C3WNnmlo96AuYA2moFNP35qN+u9fyxZ7VAKNbe6e
	TEGURPww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVxPT-0000000AFmU-10e8;
	Mon, 22 Jul 2024 18:05:19 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVxOW-0000000AFfK-1w1Q;
	Mon, 22 Jul 2024 18:04:57 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-36865a516f1so3294226f8f.0;
        Mon, 22 Jul 2024 11:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721671458; x=1722276258; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLVIduvSyccDga4xJI9V3U/42Lv/6UsR4iyO6Z8QOb4=;
        b=JUdhQKWwgoe7hc06zuJil2f9Z+ygV/llAs9QsKEqrIw3uh9YWwFukwRYlk5CiO1Y7g
         gwcVFaIEe9QG5v53qFR08kbP8wGBxh3/ompYqOps/iYcRBO5IMy273MnwGJLJ9bGuij9
         gE/jvGN7yHgtMw7yHlZsCG2WzQ7WvLk42wjnB1VOEov54E1Hjb6oRzChLbZaJvrEnuw6
         dvwB1GgyM/Dh8EMd773P9p4d0zuX2W1GntMjPi7KMNl+F2jD+Gg0zXvIW7CDUe5XKMZd
         tr/m9wBtVKAfQCm0NCfNdglQyRU1iWQKiWVYDW0LE6K0tTxmuztYHIDPGYbjpxsqTPax
         O5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721671458; x=1722276258;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLVIduvSyccDga4xJI9V3U/42Lv/6UsR4iyO6Z8QOb4=;
        b=DuuHqdffiporRL2DQLInV5n0VlcefuxS6oNmLVX6cqDV3/WWlKigltFxuxmiznBBM7
         G0MVALbc3bePcbL82wcBecjldn2PMV6v08Nzt4o1bzOowxI+aTfSCDsgTjr8ERZ6uHLn
         hM4KR0Pnse5MOyQLwhyS40MWPMANcfzSdfAn/M2e4/h3pGa2QDk1CveMwI6NfbKoZrse
         VI7tQnwefnHkbXHM2LTS3XbsBgexeUKZ3aAey1wNRyWlIir7C9kVjm/bYeuJY24SNauu
         6qfUOlwUbM5KnqZP8mFzJlgiv2OhTa4hxYU9OY6wm1MYd74mY2OW+OCsF8IgzbSPZb0I
         NUKg==
X-Forwarded-Encrypted: i=1; AJvYcCX/gWWeKBwooMkuYhgFo/7Q23dehUf+uGQ+CP15Smd/mVUK/tw3Jjrx+pUqOv4Wc/T0ac31t8XHeXzigf4QTnDKc/jOIP56ezODNePXNPhVQfkOk6Ku6wMisbYN0wCJG4oN+BCO5FDmHGAbqYqODhfOBemEotWZJdg=
X-Gm-Message-State: AOJu0YzKGOFw7xUVzQ6LLdQPJ+SG38i0BKZTFcd4FRfIGLgQQCWQhH/v
	xNZLPtMV6LnlkPriHlXvZtzY+fVxkeSWEBHzu2/2bx6ABhgp5dCJ1IwSBNbEXqP64eEWnJKhX1F
	hdkAn2oZzsjeiGCDdWuLMCAOwjGY=
X-Google-Smtp-Source: AGHT+IE4vI9A8GBpVSPi+BnMQiSe4a0uGFG/x/jx2/SR+6iulB+qLxDUN2RaS5XLm90zL8I76Ptwz9BU/GV0ix7UadY=
X-Received: by 2002:adf:f303:0:b0:368:3ef7:3929 with SMTP id
 ffacd0b85a97d-369bae4cfdbmr5402428f8f.22.1721671457404; Mon, 22 Jul 2024
 11:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240720164621.1983-1-eladwf@gmail.com> <Zp6GGzaJXhBcnGkC@LQ3V64L9R2>
In-Reply-To: <Zp6GGzaJXhBcnGkC@LQ3V64L9R2>
From: Elad Yifee <eladwf@gmail.com>
Date: Mon, 22 Jul 2024 21:04:06 +0300
Message-ID: <CA+SN3soUH9dxAkKD8AB64Ay48T=Dj-QFftMoMLZfVGH+Q1mjzA@mail.gmail.com>
Subject: Re: [PATCH net-next RFC] net: ethernet: mtk_eth_soc: use prefetch methods
To: Joe Damato <jdamato@fastly.com>, Elad Yifee <eladwf@gmail.com>, daniel@makrotopia.org, 
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
	Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_110420_522196_B428E3EF 
X-CRM114-Status: GOOD (  16.61  )
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

On Mon, Jul 22, 2024 at 7:17=E2=80=AFPM Joe Damato <jdamato@fastly.com> wro=
te:
>
> On Sat, Jul 20, 2024 at 07:46:18PM +0300, Elad Yifee wrote:
> > Utilize kernel prefetch methods for faster cache line access.
> > This change boosts driver performance,
> > allowing the CPU to handle about 5% more packets/sec.
>
> Nit: It'd be great to see before/after numbers and/or an explanation of
> how you measured this in the commit message.
Sure, I'll add iperf3 results in the next version.

> Is there any reason to mix net_prefetch (as you have below) with
> prefetch and prefetchw ?
>
> IMHO: you should consider using net_prefetch and net_prefetchw
> everywhere instead of using both in your code.
You are right, honestly I didn't notice it exists.
I'll replace all prefetchw with net_prefetchw.

> > @@ -2039,7 +2040,7 @@ static int mtk_poll_rx(struct napi_struct *napi, =
int budget,
> >               idx =3D NEXT_DESP_IDX(ring->calc_idx, ring->dma_size);
> >               rxd =3D ring->dma + idx * eth->soc->rx.desc_size;
> >               data =3D ring->data[idx];
> > -
> > +             prefetch(rxd);
>
> Maybe net_prefetch instead, as mentioned above?
This is the only case where I think prefetch should be used since it's
only the descriptor.

Thank you for your suggestions

