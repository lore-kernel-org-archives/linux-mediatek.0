Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AECEE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 18:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVbKwjvYsKayRQfQqnfoMhqs1+0fnsR+3Q13ar61kcQ=; b=qZOf0vTKtNVA4I4Lz0pe6pAn+A
	wZrfyAoRRXw0uRgh+kNIyXOe8N5x+uIcVphVmSk1TYA3MfkGWsIAdCiFhd74TeYwhCXuuxqjXA6rC
	H5V7AZ8GOlTpeY8NC/TiwpdJWLNiZgdcQnT0Jtq0ljJX7Hrq8oXJDXn7vi9QzlXPdA6D4wO5s5WDx
	rzMjTx19VZ06Cd7T5rBd6hOhz4/cKLbwI5eiwnE+wtaznNI2GE2mF21b9zVvmmYTh8SAret9Fm1RH
	v443CLFRTVnqM7P5gP9VfyM9YdO17vl0fHTAByacxHElhbVECeHtbrajd+CwhxTSkR3idKC+NGQ40
	u1CA68Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qflfE-0017tu-2z;
	Mon, 11 Sep 2023 18:29:36 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qflfC-0017su-26
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 18:29:36 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-402c80b71ecso15625e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 11:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694456967; x=1695061767; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVbKwjvYsKayRQfQqnfoMhqs1+0fnsR+3Q13ar61kcQ=;
        b=xljycJy5RPZK/0YtdrB9tWQJXXHAe9Emxn30EOzXeB43lWvmWDSSx/99B33lUxIk8w
         XtoAfUaJUc/mITHtyFdckcu9yWuiiHHTpqqvfPmR9XVgJKXrYb18JAmtyjCfuS8puKpL
         LpQbEmUzFbrhTIRT4wPTPUDwshbUS5hgPhD3/xGgOPRnMo+Yxv/iKBof4/TXrAb8SJGY
         hMxlN9ceVJ2/1BQqehy7cVL6fCfePuuZccMPPerECrOeVPEEY72DUoKy7jp8Hq+oNq+L
         4rEw56EKxOTZCornGvHNbQEsxoWSLVt/lypxMGXSMjIa9XrkKa3dXAxKGs0mYDpvbOZ6
         n2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694456967; x=1695061767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVbKwjvYsKayRQfQqnfoMhqs1+0fnsR+3Q13ar61kcQ=;
        b=aQHU8tVa0utDkitwelO8C69lVx8joW2rKnPkzVWVuA8PcYLHxTz6ZnL3k2UfUpE4pq
         6oHkDKIQQjB6OqNaIe3qeqsFUOveMdEq5AkKmfxL7WjXiSrH7mWOD9OC8qRw/pwVsP38
         cZ93QtJG5j87NV8SqP6ZE0cLy6OUgT4rmFGbCqecQaOUJm9MK84azj1FxMGUcNnwPZOL
         x/dIBI/nMzn2D0Kaqj3Q93LhPUmcfGs4mUyHAojQsnZL0ZqQVej56YylE3jYP8SZEuiW
         fB87c5lOXqmk4YKKfUyqFhB4ubGgYTd+zFKSyvxyo96OZAFq2LyZ3tAIdogi0KODr7UG
         D9OA==
X-Gm-Message-State: AOJu0YwrhTnVjD29mV8bs3EwFLkleSJ7vW2/ENaMzn0miVaPNWm3wyi3
	k0EYT77lfSFAViDvoPcaIKHBWOkzD/bV7mKI2s2J
X-Google-Smtp-Source: AGHT+IEip61urvwgkKVc4TSjTz4WJ07S5AZ9xWSZrK/2bf3DpFU4C+CemgJRrVeWgKwkbH4wpHkmoqEHFh/enFx67/Q=
X-Received: by 2002:a05:600c:5122:b0:400:c6de:6a20 with SMTP id
 o34-20020a05600c512200b00400c6de6a20mr18298wms.3.1694456967402; Mon, 11 Sep
 2023 11:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230911023038.30649-1-yong.wu@mediatek.com> <20230911023038.30649-4-yong.wu@mediatek.com>
 <803846bc-fd1d-d2ec-2855-456af22c82f8@amd.com>
In-Reply-To: <803846bc-fd1d-d2ec-2855-456af22c82f8@amd.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 11 Sep 2023 11:29:15 -0700
Message-ID: <CANDhNCrQyiFZ+8DnG0iyKBXC0H1698K1a9d2AxOq4whDsZBn+Q@mail.gmail.com>
Subject: Re: [PATCH 3/9] dma-heap: Provide accessors so that in-kernel drivers
 can allocate dmabufs from specific heaps
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	tjmercier@google.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	jianjiao.zeng@mediatek.com, kuohong.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_112934_719963_FEC04FAA 
X-CRM114-Status: GOOD (  27.27  )
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

On Mon, Sep 11, 2023 at 3:14=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
> Am 11.09.23 um 04:30 schrieb Yong Wu:
> > From: John Stultz <jstultz@google.com>
> >
> > This allows drivers who don't want to create their own
> > DMA-BUF exporter to be able to allocate DMA-BUFs directly
> > from existing DMA-BUF Heaps.
> >
> > There is some concern that the premise of DMA-BUF heaps is
> > that userland knows better about what type of heap memory
> > is needed for a pipeline, so it would likely be best for
> > drivers to import and fill DMA-BUFs allocated by userland
> > instead of allocating one themselves, but this is still
> > up for debate.
>
> The main design goal of having DMA-heaps in the first place is to avoid
> per driver allocation and this is not necessary because userland know
> better what type of memory it wants.
>
> The background is rather that we generally want to decouple allocation
> from having a device driver connection so that we have better chance
> that multiple devices can work with the same memory.

Yep, very much agreed, and this is what the comment above is trying to desc=
ribe.

Ideally user-allocated buffers would be used to ensure driver's don't
create buffers with constraints that limit which devices the buffers
might later be shared with.

However, this patch was created as a hold-over from the old ION logic
to help vendors transition to dmabuf heaps, as vendors had situations
where they still wanted to export dmabufs that were not to be
generally shared and folks wanted to avoid duplication of logic
already in existing heaps.  At the time, I never pushed it upstream as
there were no upstream users.  But I think if there is now a potential
upstream user, it's worth having the discussion to better understand
the need.

So I think this patch is a little confusing in this series, as I don't
see much of it actually being used here (though forgive me if I'm
missing it).

Instead, It seems it get used in a separate patch series here:
  https://lore.kernel.org/all/20230911125936.10648-1-yunfei.dong@mediatek.c=
om/

Yong, I appreciate you sending this out! But maybe if the secure heap
submission doesn't depend on this functionality, I might suggest
moving this patch (or at least the majority of it) to be part of the
vcodec series instead?  That way reviewers will have more context for
how the code being added is used?

thanks
-john

