Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF29DC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 10:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m71FV5vGmPVywWzxoFuxmmARDOatcoG5xbVNtimxsKM=; b=Ydb80o/ashUPOubhahaB10/13o
	xrkj95d2BmeZH/HmVg2qW38Q/9UuldxyUXPD5DVKesbi8mT4S+oM3wxNF3JP+0f/qveX2mxqBfORS
	l+K5sQ+EsFI2pA0vGbagz7KrahRByfd5vUnNbM++7ecs6LCo8UQb57FNaLkd9+hr3O1wtMgHFNMls
	lYhwXu4WcU2iCavzFx+u9/Uo/tbdOb1EDC5Jgn+Jf1eWt2LUkStGofCDQ55JWCDCnM32i8kz6IHJM
	4uI2PWCi0/XJ+jomlJfkEvEFL4KohN+NNjpBEKahI3Y4RrB67090zC5OALqpljgc/W0szScYO1uYi
	oyBZjBGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDMHY-00EE2C-1w;
	Wed, 13 Dec 2023 10:16:00 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDMHU-00EE0w-2c
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Dec 2023 10:15:58 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a22deb95d21so259695266b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Dec 2023 02:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702462554; x=1703067354; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m71FV5vGmPVywWzxoFuxmmARDOatcoG5xbVNtimxsKM=;
        b=jkEXNyKOFiDpaddXZ4y3nDadjIzHM6+Rp57fkHMwsIMM1GuZbvyyL6xkXq+Q2m8IZS
         APOXhqzK2mUc/QCH4SUrV7sa+WFws3J2O7OQWYnQYaJgJsR8DxhTXeTAovj6jwhOgYiw
         V1ycrLG8qoG/atY/yGs4Mtb4GrpjB2rM0mo2JDKkiZi0oFRX9YqCJjES/DRmPVEzub1N
         bVTWgkM7SjHC2VziCmEJwpRpU9nlUvxAgVnOKDUPjzS23qES854pS3CnhXsz+0V2VuMU
         YgQhQdvB0u9jLLwxAimGirbdCBtCS/IZCs7Ke2gZ4r5Yk7fboyWml/rCoeIZiSTC+uXy
         8DMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702462554; x=1703067354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m71FV5vGmPVywWzxoFuxmmARDOatcoG5xbVNtimxsKM=;
        b=Sm6uCVk/KC61wwY4reImsJl6KKMJqa5231vrAxOqiPIqpdebfeQok4L+iaW2TrEf1O
         508hrjY4aqtqjAT3bfOg7ZFQEK0m46+4sZFX/o0OYFFJHO/jn38+FM2kyaZtTWz3X6rc
         838pU07Jt/BurByAY/zzPwJ5VzLg6D95HqBw1tuCWov8/fDuDeI/irvzwTf6GnDCtHzu
         ZRBVvrzQ1eg+Vo8fIsPWMAxMbi67+1eO0w448JM2m30U9lT4cwo6fkn2fA8y1HnjiEP7
         Q6FPaLQ4kI64Ck8Sm/5PBOG2RGdFZM7HdTDK/mtxTwbbUPMqDTZzFu4ACGP59C1kP5dH
         pT8A==
X-Gm-Message-State: AOJu0Yy/Er7DMOOjwt3vtPepFsGsrmdqflogbRPRmAYUuHbw90HE1p26
	6bfRtLkI/adfoft8UEJzFrtlaA==
X-Google-Smtp-Source: AGHT+IFLhx9mrchCh5E2ylqHbgPhyi2ITVUtOX/P4qGORrsYs/M4rF8Vci+B58KQG68twiIyDl6XRw==
X-Received: by 2002:a17:907:9905:b0:a1c:f745:e0b3 with SMTP id ka5-20020a170907990500b00a1cf745e0b3mr3808358ejc.97.1702462553820;
        Wed, 13 Dec 2023 02:15:53 -0800 (PST)
Received: from pop-os.localdomain (81-231-61-187-no276.tbcn.telia.com. [81.231.61.187])
        by smtp.gmail.com with ESMTPSA id q18-20020a17090676d200b00a1d9733f2d9sm7400403ejn.209.2023.12.13.02.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 02:15:52 -0800 (PST)
Date: Wed, 13 Dec 2023 11:15:49 +0100
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
Message-ID: <20231213101549.lioqfzjxcvmqxqu3@pop-os.localdomain>
References: <20231212024607.3681-1-yong.wu@mediatek.com>
 <DPBmATfmfvSP8Cwjz99kj_JvCEiAqRfuMFJZEBF2aIgl8NZqWFR66eyPTX1E8bHyOlimBihEE3E80p9bfOJ-0SNu8pwoIzL9gD2Xae6r97g=@emersion.fr>
 <20231213110517.6ce36aca@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231213110517.6ce36aca@eldfell>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_021556_848754_DDCBE1BF 
X-CRM114-Status: GOOD (  25.69  )
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

On Wed, Dec 13, 2023 at 11:05:17AM +0200, Pekka Paalanen wrote:
> On Tue, 12 Dec 2023 16:36:35 +0000
> Simon Ser <contact@emersion.fr> wrote:
> 
> > Is there a chance to pick a better name than "secure" here?
> > 
> > "Secure" is super overloaded, it's not clear at all what it means from
> > just the name. Something like "restricted" would be an improvement.
> > 
> 
> My thoughts exactly. Every time I see "secure" used for something that
> either gives you garbage, refuses to work, or crashes your whole machine
> *intentionally* when you try to do normal usual things to it in
> userspace (like use it for GL texturing, or try to use KMS writeback), I
> get an unscratchable itch.
> 
> There is nothing "secure" from security perspective there for end users
> and developers. It's just inaccessible buffers.
> 
> I've been biting my lip until now, thinking it's too late.
> 
The characteristics we're looking for here is a buffer where the content
is inaccessible to the normal OS and user space, i.e., Non-secure EL0 to
EL2. I.e, the content of the buffer is meant to be used and accessible
primarily by the secure side and other devices that has been granted
access to it (for example decoders, display controllers if we're talking
about video use cases). However, since the use cases for this exercises
the whole stack, from non-secure user space (EL0) all the way to secure
user space (S-EL0), with various devices needing access to the buffer at
various times, it makes sense to let Linux manage the buffers, although
it still cannot access the content. That's the overall context.

As for the name, it's always difficult to find a name suitable precisely
describing what it is. "Secure" is perhaps vague, but it might still a
good choice, if you carefully describe what secure means for this
particular heap (in the source code and the documentation for it). For
example, the definition of "secure" for a secure heap as here could mean
that buffer content is inaccessible to the host OS and user space
running in normal world (using Arm nomenclature). I wouldn't have any
problems with calling it secure if, as said it's defined what we mean by
saying so. But I'm all ears for other suggestions as well.

Safe, protected, shielded, unreachable, isolated, inaccessible,
unaccessible, fortified, ... would any of these make more sense?

> 
> Thanks,
> pq

-- 
// Regards
Joakim

