Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678A2C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 13:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cj1ZMs1V56ZZNUEaZewI9vOkZv5jPO392Bp8WoFBh7w=; b=r1pwIvNm9Yn46PFx04f4HFF+31
	pqnOSFV7T6ZpvLBHt2ShEI1/w77txhdvgxwkWLrmTOBuzpuBSq4Sc55ykh47yQLx3UeXt5Cd9sjmv
	mGXWz79lXK2jZ+pNt3GIz53gviiPi854MtjTwQSFQ7NYl0QJzW2tnYI3u1rRzHOBCo5EO38DRjQp2
	e2vNWT0vo/JfFE77uRjHOjB1IhbR+Uwa4DkbXkfdOXbWoJ7Q+YjTb2On6U+x70rVl02wPvgLaHUSj
	rEGIDg86n4oTGu6ImK+Uxm5570/9WhQ9PQNmAxvJN3kQ1I1rFwPo+bhqKaxbh6HSTlQD32l0eMq1P
	VOq9OPnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPCC-00Emba-16;
	Wed, 13 Dec 2023 13:22:40 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPC8-00EmZG-1v
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Dec 2023 13:22:38 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-54c77e0835bso9678775a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Dec 2023 05:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702473753; x=1703078553; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cj1ZMs1V56ZZNUEaZewI9vOkZv5jPO392Bp8WoFBh7w=;
        b=Cr4kIkYzjfCtPIHKJkZQajqx3rBax21zF59lbDuoIFHjDJ05Aym51PzzrcHgkV7kHG
         0ZZ8dHoh1BFWiY/gR1LeA79r0aX905OKjqZ4jnW8gImvxAWM2CTzKYwQrBOnfzZCqzlH
         KUY2vs75JK4tcbX0IyH91FO87qV77v/PLgE3xPa5NwWWsqXoCNzcUm1gOUnb6vtOkGpb
         MVW2M3vh9e5di4vA6lEhFOID/Cflg0Vd919J9kwYReLEELYQPN7gPiizkT7/EORO+QTI
         DnYHp4peOijIE0Q/RPi0zxbgeuV5n0w8PtBFKdPw4XqbTtODxnY1PgEeGjvwqYEGTzLr
         nI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702473753; x=1703078553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cj1ZMs1V56ZZNUEaZewI9vOkZv5jPO392Bp8WoFBh7w=;
        b=NmkSms/4AxjXDI3LcKbF6O153BxLsKL8IRBiBcfJuIDglOS8H9AGdrcs8njbr3zafR
         u2xa73F/Kc0Ug6uPYmO3u4YQndgiFk5afV4dZ/YcrRpq9wJiSsQ3z0wZLMF7/6gDiTpt
         JrVi07VJ7EQxhG2iywxRKrss05zMqhGYrFUfdC+/HSOXWDnXDztUTrbPTr+Guy4BO6Jb
         XQ+SHPRjZgHe/vafzLwF9hoYufiuNLAkPMf5IWUqy/qXs54jTeJFbI/PM0Q1CAl084e6
         YFSnmRwq3cEwwjboBEnNhyJrxm0buzTHhYHlDvqYb9mRSkgOS2OVsuneBhdOvNJ8aIw+
         fnrw==
X-Gm-Message-State: AOJu0Yy1aTGg2gUIAekztxFE+ccZEXnCaf6+tk3qbam5R848YhUD0350
	QfC3YOEvxVJh3Lz5hzYbJBGIayA+YiXoaR3JcRfQiA==
X-Google-Smtp-Source: AGHT+IELaCU/APPH5lEyFAZu+OpT0rs0/r3NQO6C377YTW5LsGnDiFcS2/Qewp1/YjG0GmihdG0ytg==
X-Received: by 2002:a50:955d:0:b0:54f:4f7f:1a5c with SMTP id v29-20020a50955d000000b0054f4f7f1a5cmr828258eda.81.1702473752835;
        Wed, 13 Dec 2023 05:22:32 -0800 (PST)
Received: from pop-os.localdomain (81-231-61-187-no276.tbcn.telia.com. [81.231.61.187])
        by smtp.gmail.com with ESMTPSA id s28-20020a50ab1c000000b0054c6b50df3asm5921343edc.92.2023.12.13.05.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 05:22:31 -0800 (PST)
Date: Wed, 13 Dec 2023 14:22:29 +0100
From: Joakim Bech <joakim.bech@linaro.org>
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Simon Ser <contact@emersion.fr>, Yong Wu <yong.wu@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jeffrey Kardatzke <jkardatzke@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Vijayanand Jitta <quic_vjitta@quicinc.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>, jianjiao.zeng@mediatek.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
	linux-mediatek@lists.infradead.org, tjmercier@google.com,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] dma-buf: heaps: Add secure heap
Message-ID: <20231213132229.q3uxdhtdsxuzw3w6@pop-os.localdomain>
References: <20231212024607.3681-1-yong.wu@mediatek.com>
 <DPBmATfmfvSP8Cwjz99kj_JvCEiAqRfuMFJZEBF2aIgl8NZqWFR66eyPTX1E8bHyOlimBihEE3E80p9bfOJ-0SNu8pwoIzL9gD2Xae6r97g=@emersion.fr>
 <20231213110517.6ce36aca@eldfell>
 <20231213101549.lioqfzjxcvmqxqu3@pop-os.localdomain>
 <20231213133825.0a329864@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231213133825.0a329864@eldfell>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_052236_650365_5D4D58FB 
X-CRM114-Status: GOOD (  54.72  )
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

On Wed, Dec 13, 2023 at 01:38:25PM +0200, Pekka Paalanen wrote:
> On Wed, 13 Dec 2023 11:15:49 +0100
> Joakim Bech <joakim.bech@linaro.org> wrote:
> 
> > On Wed, Dec 13, 2023 at 11:05:17AM +0200, Pekka Paalanen wrote:
> > > On Tue, 12 Dec 2023 16:36:35 +0000
> > > Simon Ser <contact@emersion.fr> wrote:
> > >   
> > > > Is there a chance to pick a better name than "secure" here?
> > > > 
> > > > "Secure" is super overloaded, it's not clear at all what it means from
> > > > just the name. Something like "restricted" would be an improvement.
> > > >   
> > > 
> > > My thoughts exactly. Every time I see "secure" used for something that
> > > either gives you garbage, refuses to work, or crashes your whole machine
> > > *intentionally* when you try to do normal usual things to it in
> > > userspace (like use it for GL texturing, or try to use KMS writeback), I
> > > get an unscratchable itch.
> > > 
> > > There is nothing "secure" from security perspective there for end users
> > > and developers. It's just inaccessible buffers.
> > > 
> > > I've been biting my lip until now, thinking it's too late.
> > >   
> > The characteristics we're looking for here is a buffer where the content
> > is inaccessible to the normal OS and user space, i.e., Non-secure EL0 to
> > EL2. I.e, the content of the buffer is meant to be used and accessible
> > primarily by the secure side and other devices that has been granted
> 
> s/secure side/proprietary side/
> 
I'm using the nomenclature as written by Arm (other architectures have
other names for their secure execution states).

> I presume nothing of the other side can ever be in any way open?
> 
I'm sure there are lots of examples of things running on the secure side
that are open. The OP-TEE project where I'm a maintainer has been fully
open source since 2014, to give one example that I'm familiar with
myself.

> Maybe the other side is even less secure than the FOSS side...
> 
> > access to it (for example decoders, display controllers if we're talking
> > about video use cases). However, since the use cases for this exercises
> > the whole stack, from non-secure user space (EL0) all the way to secure
> > user space (S-EL0), with various devices needing access to the buffer at
> > various times, it makes sense to let Linux manage the buffers, although
> > it still cannot access the content. That's the overall context.
> 
> Yes, we know all this (except for the exact meaning of EL0 etc.).
> 
Great!

> > As for the name, it's always difficult to find a name suitable precisely
> > describing what it is. "Secure" is perhaps vague, but it might still a
> > good choice, if you carefully describe what secure means for this
> > particular heap (in the source code and the documentation for it). For
> 
> Carefully describe, as in, re-define.
> 
> > example, the definition of "secure" for a secure heap as here could mean
> > that buffer content is inaccessible to the host OS and user space
> > running in normal world (using Arm nomenclature). I wouldn't have any
> > problems with calling it secure if, as said it's defined what we mean by
> > saying so. But I'm all ears for other suggestions as well.
> > 
> > Safe, protected, shielded, unreachable, isolated, inaccessible,
> > unaccessible, fortified, ... would any of these make more sense?
> 
> "Restricted" sounds like a good compromise to me. The buffers' usage is
> severely restricted.
> 
Yes, restricted isn't a bad choice. We would still need to describe what
we mean by saying it's restricted, i.e., what is it restricted from,
since I'd guess that "restricted" by itself also could be a bit open
ended for a lot of people.

> It is the opposite of "safe", because accessing the contents the wrong
> way can return garbage or intentionally crash the whole system,
> depending on the hardware implementation. One example is attempting to
> put such a buffer on a KMS plane while the connector HDCP state is not
> high enough, or a writeback connector is connected to the CRTC. It is
> really fragile. (Do KMS drivers fail an atomic commit that would
> violate the heap rules? Somehow I doubt that, who'd even know what the
> rules are.)
> 
I believe one of the goals with reviewing the patches is to highlight
issues like this and try to figure out how to avoid ending up in
situations like what you described by suggesting alternative solutions
and ideas.

> It is protected/shielded/fortified from all the kernel and userspace,
> but a more familiar word to describe that is inaccessible.
> "Inaccessible buffer" per se OTOH sounds like a useless concept.
> 
> It is not secure, because it does not involve security in any way. In
> fact, given it's so fragile, I'd classify it as mildly opposite of
> secure, as e.g. clients of a Wayland compositor can potentially DoS the
> compositor with it by simply sending such a dmabuf. Or DoS the whole
> system.
> 
I hear what you are saying and DoS is a known problem and attack vector,
but regardless, we have use cases where we don't want to expose
information in the clear and where we also would like to have some
guarantees about correctness. That is where various secure elements and
more generally security is needed.

So, it sounds like we have two things here, the first is the naming and
the meaning behind it. I'm pretty sure the people following and
contributing to this thread can agree on a name that makes sense. Would
you personally be OK with "restricted" as the name? It sounds like that.

The other thing is the feature and functionality itself offered by this
patch series. My impression from reading your replies is that you think
this is the wrong approach. If my impression is correct, what would you
suggest as an alternative approach?

> "Poisonous heap" would be fitting but politically inappropriate I
> guess. After all, "poison" is data that is not meant to be read by
> anything normal.
> 
> 
> Thanks,
> pq

-- 
// Regards
Joakim

