Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739B8C4707C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 22:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zEBqjbWZbZ/3Uylirb4GeOi3RLFiwNvDX78phkZWD8=; b=WTbbnXjTOll/me0Fyo+wzgywGe
	/q2wUHJjAZoqNnHfplMOlN9BTVnbJFZ6U9m30DfBt83cSV+h6syo0L+NNFH+eILvnmJFX8bTObR0j
	YcB8+N7dgI/9xAppkJ0KFd91Mo7nKXw6SdGug38opUFZFkq3bEYLhf1BJlZ+/WlWYndBn0z0utMCM
	WNbckGW+ywNd5n+mr1LjGy2ZlxkvmpErqVhHgWY3I+NMpqc3YMY3mkCAR4qYU4vnQkQA9hNb9viYl
	kzs0dVeO/hyHLSDSsD3pVl0J0oEdqhHD0FmXgryJi7MZOf+ezxCTqWEAWhgzaKQc5UsuGvZgfVUPX
	1o5VGrJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOQOX-0049tU-0A;
	Fri, 12 Jan 2024 22:52:57 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOQOS-0049sY-1c
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jan 2024 22:52:54 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-553e36acfbaso4069a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jan 2024 14:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705099969; x=1705704769; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zEBqjbWZbZ/3Uylirb4GeOi3RLFiwNvDX78phkZWD8=;
        b=puH4rl4m33TJdLZ875N9+p9It9G4ILNa88KzHehBFMVbjxjSFvxcWiXzzRNE6cLPs0
         bl4TGFpLvrijiUGVfE8vitrMj7WnPV9y6fssOgw6ay47hXaASRrMt454tW98n8FG06hs
         7soBB5QWFPwoGDMHYDE8excvX9syBzlRVV6n2ReHOze7XB1EXll0Pfxq7HN5lpXE95FI
         TBIqkwm7afs9VXPPRT979GlaDCMuxGoH0TDyXiUmQlWQTw7j+liM9ZpnAPebf+5Y1hBh
         qxeTKvQxpoXc67AP2Tc8iF2tc5Ee0pVNoby0EhKrmqrzB8lbudhJvVyVjojr5PgJailU
         Ciqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705099969; x=1705704769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zEBqjbWZbZ/3Uylirb4GeOi3RLFiwNvDX78phkZWD8=;
        b=iS0lL71WXSe5Gn8CS61jhFJv8vLILVnzioVcQ+oAlU+FSXGXS9PjXxhekRWVt5AFD/
         nmGwEMnXIR0C9zVkdhybsJ5oChcLu2blKAcuQGjtEexC27BqMz87dXu5ZrE2Ra6J30c8
         BAa4a3BSMS/kMbsASszxZ6Y2cVCwdo1PMzgr15T3uZtOMmdYABDsNX1dF0wijF5+yZyb
         cdPXJTkIRWN5Cxw7YEpA6XDlTAlCppO7MaiaJ9gKVLFKAUXFcerRit31ZFJctWa/kryX
         RsZoRHkq34WMbuDmPiofFf914mA14VaijSN3ozwgEFVie/s49Cqiwa075NlhWkiPTwtu
         XslQ==
X-Gm-Message-State: AOJu0YwIgBDtItZDIG0kUUHhENhAytscJ7/xaM0JVVtS86t8DW2ViRhu
	N4c22eKWdyaMxYO3H1p606yK7N9kO8IdEDZkz2YgZDt1swQ=
X-Google-Smtp-Source: AGHT+IHkgMN1yQJBbcRo0BFB3B8pFJiDvEWeO3tE0O3jDrHXiN3BUhVwpu15ZRDxRy6MkjLufhC9Rmys7MiCAQ75PZg=
X-Received: by 2002:aa7:c98b:0:b0:554:2501:cc8e with SMTP id
 c11-20020aa7c98b000000b005542501cc8emr18281edt.6.1705099969244; Fri, 12 Jan
 2024 14:52:49 -0800 (PST)
MIME-Version: 1.0
References: <20240112092014.23999-1-yong.wu@mediatek.com> <20240112092014.23999-4-yong.wu@mediatek.com>
In-Reply-To: <20240112092014.23999-4-yong.wu@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 12 Jan 2024 14:52:37 -0800
Message-ID: <CANDhNCrxpeqEhJD0xJzu3vm8a4jMXD2v+_dbDNvaKhLsLB5-4g@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] dma-buf: heaps: restricted_heap: Add private heap ops
To: Yong Wu <yong.wu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, christian.koenig@amd.com, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	tjmercier@google.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Robin Murphy <robin.murphy@arm.com>, Vijayanand Jitta <quic_vjitta@quicinc.com>, 
	Joakim Bech <joakim.bech@linaro.org>, Jeffrey Kardatzke <jkardatzke@google.com>, 
	Pavel Machek <pavel@ucw.cz>, Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>, 
	jianjiao.zeng@mediatek.com, kuohong.wang@mediatek.com, 
	youlin.pei@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_145252_585371_1FCB6BDC 
X-CRM114-Status: GOOD (  25.13  )
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

On Fri, Jan 12, 2024 at 1:21=E2=80=AFAM Yong Wu <yong.wu@mediatek.com> wrot=
e:
>
> Add "struct restricted_heap_ops". For the restricted memory, totally ther=
e
> are two steps:
> a) memory_alloc: Allocate the buffer in kernel;
> b) memory_restrict: Restrict/Protect/Secure that buffer.
> The memory_alloc is mandatory while memory_restrict is optinal since it m=
ay
> be part of memory_alloc.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/dma-buf/heaps/restricted_heap.c | 41 ++++++++++++++++++++++++-
>  drivers/dma-buf/heaps/restricted_heap.h | 12 ++++++++
>  2 files changed, 52 insertions(+), 1 deletion(-)
>

Thanks for sending this out! A thought below.

> diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/he=
aps/restricted_heap.h
> index 443028f6ba3b..ddeaf9805708 100644
> --- a/drivers/dma-buf/heaps/restricted_heap.h
> +++ b/drivers/dma-buf/heaps/restricted_heap.h
> @@ -15,6 +15,18 @@ struct restricted_buffer {
>
>  struct restricted_heap {
>         const char              *name;
> +
> +       const struct restricted_heap_ops *ops;
> +};
> +
> +struct restricted_heap_ops {
> +       int     (*heap_init)(struct restricted_heap *heap);
> +
> +       int     (*memory_alloc)(struct restricted_heap *heap, struct rest=
ricted_buffer *buf);
> +       void    (*memory_free)(struct restricted_heap *heap, struct restr=
icted_buffer *buf);
> +
> +       int     (*memory_restrict)(struct restricted_heap *heap, struct r=
estricted_buffer *buf);
> +       void    (*memory_unrestrict)(struct restricted_heap *heap, struct=
 restricted_buffer *buf);
>  };
>
>  int restricted_heap_add(struct restricted_heap *rstrd_heap);

So, I'm a little worried here, because you're basically turning the
restricted_heap dma-buf heap driver into a framework itself.
Where this patch is creating a subdriver framework.

Part of my hesitancy, is you're introducing this under the dma-buf
heaps. For things like CMA, that's more of a core subsystem that has
multiple users, and exporting cma buffers via dmabuf heaps is just an
additional interface.  What I like about that is the core kernel has
to define the semantics for the memory type and then the dmabuf heap
is just exporting that well understood type of buffer.

But with these restricted buffers, I'm not sure there's yet a well
understood set of semantics nor a central abstraction for that which
other drivers use directly.

I know part of this effort here is to start to centralize all these
vendor specific restricted buffer implementations, which I think is
great, but I just worry that in doing it in the dmabuf heap interface,
it is a bit too user-facing. The likelihood of encoding a particular
semantic to the singular "restricted_heap" name seems high.

Similarly we might run into systems with multiple types of restricted
buffers (imagine a discrete gpu having one type along with TEE
protected buffers also being used on the same system).

So the one question I have: Why not just have a mediatek specific
restricted_heap dmabuf heap driver?  Since there's already been some
talk of slight semantic differences in various restricted buffer
implementations, should we just start with separately named dmabuf
heaps for each? Maybe consolidating to a common name as more drivers
arrive and we gain a better understanding of the variations of
semantics folks are using?

thanks
-john

