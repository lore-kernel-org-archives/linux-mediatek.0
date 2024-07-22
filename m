Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681B2C3DA5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jul 2024 18:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWBanF7ancu1eZNKQrcMwj3+MkIgAZbQm2LNdRgEOCs=; b=SphVaAomwK068wN4rWJ4Qt1JKy
	nhVm1460C6sK/3rg7/wK5lv5enONldqvwaHgiI7cE/8f2ykyhoU3HQsjyfDBFVe0kkz2DjPoOj1zX
	agRKuPw3Hc6/wdhDf2vaGhaJuvBr6niX3ildHOHzn4A4dAkmtEvHd/4/SuXHCsvbSnv/mKqAoU50B
	+KnNnzvWtwwhPGQoEGIMX4Bl4oS0BaJI+9M8WdlHX0GvH7eCLO7USUTqky6oVkU0XaOjFphDGJOeD
	dgnLIPbqNMJJTA8esCKrlDjoQv7WLDVU0pnQbDd0/m0bLkX4v008epOJu+iv15TlY4Y7MAXBQ5eUu
	eAIb+pBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVxw3-0000000AI66-3B58;
	Mon, 22 Jul 2024 18:38:59 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVxvz-0000000AI5C-3gOI;
	Mon, 22 Jul 2024 18:38:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1721673507; x=1722278307; i=markus.elfring@web.de;
	bh=ZWBanF7ancu1eZNKQrcMwj3+MkIgAZbQm2LNdRgEOCs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=I4iTSIAobGyOd+AymvOsGwuGnjZUqOv/TqDFglY00EC4Nkc3lIJVgH5Q1ouSe2br
	 45pPLt3Uu9z3WboNK7hNKOGBRvEYo0WGIoHTO5CulEhiNpkU0LoboFH0erUEgpH91
	 nCFBdPhy542VWyRoNy30j5R/tryZQ80XbE1u7ZXVE0EAPMxYA9wXlBvMNCMaw2W39
	 QSMyYTjAM4/cXvH5ohnuNS48foxkbUqAz7fYC6eHfUH/GZgLpXEC8a3djDJf+xGnA
	 88PbcOn7Lk2+0OvN20lkoYJPCPe6wAxxXy+CTCxtyTvGd2OZBy5EXdGgLjthYBXmN
	 UjGruqdPANY4d/6Ecw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MxYbD-1s7zzu1CqP-00xc8g; Mon, 22
 Jul 2024 20:38:27 +0200
Message-ID: <7c0e8a0e-3282-4d4e-a5b8-bcd979da3bfa@web.de>
Date: Mon, 22 Jul 2024 20:38:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/28] dma-heap: Add proper kref handling on dma-buf
 heaps
To: John Stultz <jstultz@google.com>, "T. J. Mercier" <tjmercier@google.com>,
 Yong Wu <yong.wu@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nathan Hebert <nhebert@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Tomasz Figa <tfiga@chromium.org>, LKML <linux-kernel@vger.kernel.org>,
 Brian Starkey <Brian.Starkey@arm.com>, Chen-Yu Tsai <wenst@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Fritz_K=C3=B6nig?=
 <frkoenig@chromium.org>, Hsin-yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Steve Cho
 <stevecho@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>
References: <20240720071606.27930-6-yunfei.dong@mediatek.com>
 <2f5e5e81-21e1-421d-94ac-e4507b323680@web.de>
 <CANDhNCqzme0q7vey1jc84T0HJPiOSQF2fkyBfBLntdiyafEzYA@mail.gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CANDhNCqzme0q7vey1jc84T0HJPiOSQF2fkyBfBLntdiyafEzYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GUZxA/Aux5PMQCDi3hxau4Wsl2vvcaVXo8wngueekGYUSpLKpTZ
 SZ+IkMcGhDyOu7j4TOaus2e6WUeeytvl7jOYhQjntSgL0UusCDupvyPI0aSvEzrhTH+t2k1
 e1NVUTk+FeAJcAzHmGE9z+kk0ieRGaYH5NxGNR3jGF/f2iK9INYl2UO+y1UbNctEegCUcue
 ZHTwISnzOUpyr5bexuTFg==
UI-OutboundReport: notjunk:1;M01:P0:bhFioqfY1wU=;Kv7lhJ+Q4TRnO+ldpI1Gz2iy26A
 pANDVEbpH4EydeHjXK71eW28xjh18xq5JfjQvHCQl+F17L4AyXNPsC6GcFLS9VFgb7kdjE5em
 QnAMeV/0La7mktwt+cl8iJS+dRSbb5ItdlNCUNGVB86sfJs4gCwhxWGZjXqV7x54GbJbMq0Kf
 fIqbNQE6vaxgOFXiyqSz+jqgfgVUhJqtZiW7erQpdiXSlthth7tMRQ9wkPjG5kcj2xEhudjOg
 pcmRtMhLRL9ti202DzpemmZkXAnYdvd3Vt/2dJuQ10ysPsHPEPweRmNVdHQlWATkm61WPn2PD
 3KNyabzkSPAfHhIYDNKthb6N53EGpdEzmwVUCtIW2L2CW4+8Eyx8+Z/hNqwcsaHTGpHBbC7yg
 J0EOTOf/UqYoldI6LRKEjAWa+Un6X/BcSVGZiNPcyl5yY3Zoph64mlx8ptMjkm5NuqquJtukc
 YY7eDBFUkjUla+LYRuqiZTrube6fLqXb53czu/NilHVb0h0qbFwGKR7+CewhgqzYTZSYWNTta
 InM0lpqFxLJiZQWUcoFAp4xDPOD3MmCwUvs+0F0w7FoOd0cNdQ2WsVkS26ghFSJxYClfsXgq6
 BTCkzzJmjGwr2oHuFwHLM/Nlbx3trNTCQd2dIzm0yhwYSbPO9z1hb+NYxgoBCCGYNgtY6PN2C
 rDWGoLwKUpU7sVQJkOzTDxC+0o+Bp/rhKvsFXBQQC/hibLG+XHEa8g7d/nt7oyTzGs5zjs8EZ
 EKOVs9AH/OHOlWZYic6+E4pKHnqG1cFaq7ZJuZJ9iigQ595a6AP0AyEsk0lr5SOf2PS0Kx8/8
 28KGCtFSpm6jv+2f2bDFVfaQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_113856_234184_5FD97615 
X-CRM114-Status: GOOD (  11.29  )
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

>> =E2=80=A6
>>> +++ b/drivers/dma-buf/dma-heap.c
>> =E2=80=A6
>>> +static void dma_heap_release(struct kref *ref)
>>> +{
>> =E2=80=A6
>>> +     mutex_lock(&heap_list_lock);
>>> +     list_del(&heap->list);
>>> +     mutex_unlock(&heap_list_lock);
>> =E2=80=A6
>>
>> Under which circumstances would you become interested to apply a statem=
ent
>> like =E2=80=9Cguard(mutex)(&heap_list_lock);=E2=80=9D?
>> https://elixir.bootlin.com/linux/v6.10/source/include/linux/mutex.h#L19=
6
>
> This strikes me as a strange place to apply it, as it seems like it
> would grow the lock hold time to the entire scope of the function
> unless one created a subscope for just the list_del, at which point
> you're not saving much or really improving readability.  I definitely
> think guard usage is very interesting in places where locks are
> released in multiple exit paths, etc. but this is a very trivial and
> straightforward lock/unlock usage, so I fret I don't quite understand
> the suggestion.

I propose to take further design possibilities better into account for
applications of scope-based resource management.
Additional compound statements may be constructed on demand by adding
extra curly brackets.
You might occasionally find scoped guards more appealing.
https://elixir.bootlin.com/linux/v6.10/source/include/linux/cleanup.h#L137

Regards,
Markus

