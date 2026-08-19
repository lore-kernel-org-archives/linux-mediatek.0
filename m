Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17377C5DF86
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2026 12:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLw7yk5kNbZMeTw+UMLOAwK7lyRv1aw53p64YFqkg7g=; b=rVZ6asW7u+oW7AdrSJ7T9tUdiG
	se3tFUS2bRQzaeB7fVSdE6tm4P3YrqMuwP/w28Y3YXOTXwd7sTpesBongxi5QCJvtrXVo4VN6MYkl
	57p2ucVVQ3g7iK7VNm581vW83Hal9qMuQXp5Xv2EyMx7i/he6kUL2WmuNrOLqM4IL/TvRewzqZA70
	XfcrzDbaD9wpiwsoopIkuZNpal9EcNp4AXqGDu6R4/Ia/hD3B6WPGSxEw735XnlEWLuDgtQT4aBSJ
	0KpexhyKDfiXf9BAwJYjEvhCwadbgNpcTVynmfal5+3XTz8Nfew4zKnaerVeADEKIWG8i3/ijjSJh
	Q8X83WCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfOY-00000009kBb-18Iu;
	Wed, 19 Aug 2026 12:27:50 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfOV-00000009kAL-1JUw
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Aug 2026 12:27:48 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c207cb16cf5so155018866b.1
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2026 05:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787142465; cv=none;
        d=google.com; s=arc-20260327;
        b=gzaIM/PPjYgr4DMyKBf3zDdEz4nHRfSj8wJtPYeT8fxzw6QXG8wXqdLWDMh9/9nnHx
         346FSzXHLBvDbgS0di4AAKxfB0vf55iMwaXNrtWrQHg4wrVou0Rl+jkAClBt+4vnjXGU
         vMPjt/IcMTew5IAt4IXlmswqVDyJdSgXCruY2XTo8coytI/j6oN4PfICe/uf5WSs1z9f
         y6LBSsEP9/2Nk/5uJV66n19SpoqQstesml+bALlh3KcaS3E+6Yi4v0VZEYwmRdz07ls+
         jKv0HCW6Ppfr7HwDCQZcj9vr8Vf/rofapHS2ZyJ6OXzUKmObZWggQ7YfD5cTgPuq/sMm
         h3zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oLw7yk5kNbZMeTw+UMLOAwK7lyRv1aw53p64YFqkg7g=;
        fh=WoMjqpduLMvPvLJKzho9mjMwoyNuj3bjijiX+TJhF1A=;
        b=BGXaLg0ap4+3Y3IrPwjISmIh1qHlU4nF5t5V4QCQvqutDLaIUODKY8AzvFX5Vk8Rpn
         5oe+mk9A/9CtSNxsJIufIry7YHhHmkRnyv4SdyT6MKgusw4fuRR/VV3xLz11gUplGEiN
         U8vi4EA6pq4iUa6WaSSaLCwV9EnHf/kzOX/KxAPK7LLDMy/ZtvSlAu4gBi7ACNT5L/IN
         XSnK7Qwn0x/8ACvN5hf1prPKe/LH+9QptrlZ9slMTshjk7LWFsu5ioWsZxL42mrBVmKL
         KqGwXSzYdfE+IxwtPG99EQIDfG7tl4u4hcxrOIrAPmgPXS3mTk0/hXZqIl5NtjX9W0rm
         8X7g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787142465; x=1787747265; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oLw7yk5kNbZMeTw+UMLOAwK7lyRv1aw53p64YFqkg7g=;
        b=cPK4tyuofU79qlOnWG0gK8vCni7KJkdGV5LeQ4IKKFdYAbxw7z0bSMmbi4zkTLuG+j
         Vebn0Oy4hSNUQLbZgRZrKwEPJc7js4ZPZalwZ2BOoJ2eDe0LQDbNZEt4jPNqcgLtDy1M
         tck2UiTtft65zHXzWOAInmzxHGtGMpcT4NKibU5b0SsHKsqILaYJj527qSEZXQYzvrkM
         anj24Tm7YMD/A93fhG/Sy/JEWo1ivvtdDEmcRXxP6dpUjlZKgS2XJxkRL2bpcbeLf57q
         IgitJ8g1uviMjsWTy7zuid+QUw1eH45jc4bSFzUELiQdM9E2iTEV2p3V5G0b5/Mm0aRy
         JYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787142465; x=1787747265;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLw7yk5kNbZMeTw+UMLOAwK7lyRv1aw53p64YFqkg7g=;
        b=E4zQbWJ0jujdyXav39DX0yMSGw8Vu5JDuU4hcMi8zkvshKWb3ThE1w/j0Gz0oCYl38
         sKXYtwtDoTD/BIth8kc1KP4WlK8RIRYRte2jchr+3heUst7rM1iqHrOUwChg3QX1kAsk
         WcySqDYf29br/zwdX2vI8jxRKMCKa5oCMQ/25Dm58PdQc1mxdWTpTPGeeqLYJYzVM8BA
         YLxkDFbBt2NxN7t0DDG/zjWe9ISarMWtIttiyqFLev2txn/LF8twTxf7zcXfQt40CNsO
         D1egxPoMmD6ye5+oXHqOUO5qwRahgsy2LZOUornh6CkgijfvZdPfqGA9QEuuMwTbCmIq
         6f+w==
X-Forwarded-Encrypted: i=1; AHgh+Rol4wPiZ5KFcrYPQnZj70SmvaHiNW9KRdQgo7w+0K7XVVHEIirUGyblDMYwxahduE3S0HQIr/3hi0jRrklo3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4POCQn3hD2giLY/eSDDiLjx7fekimYMz76I+CLOmMKZIiCW0S
	bPhJXMousDyHErjW4AvU0uFotVTCiCMrLwQ5LzMRhNk/6rAP0BzUbtUgNxPGkhNhcH9BGaPc2Qs
	Ffgjc5tqfyAAj1lk/XAriGYEnDFzQ3KZ4dQ==
X-Gm-Gg: AR+sD11O8954eZr35EWRXhVaNDUARVyD6BmF9fmT/yCBFqNAzDQAzwEJNJbI7vzOWio
	qLnhSvXVh040sG8jPW6noy84xIhwmu82rhNxgnAGEAm+Y/ukMSNbOWO65TnUT1rGnuRaPz7Je1d
	3he+9nwdC2h65utIxe4MKeabOJOPTktjpxQ6n5W6e6uoR/Lhp53kFSaqo3mX04ly0r4bBWqGlAE
	X6UxTBR9bavoCwceY30SNWXuuAouIuKwVUqP9aVJPLFDP+0DOxF5iFhsE//iUonvmSzhfb1D5fc
	fQSSq6yWCjMTMCzqFy2ZR6xBAAdCGDVN+B9B4zWlA6oPe+5GF3/3OrvJDs+Vx8GuADQEAJvZSrU
	gf+uo39sTOFtB6pmXNM+KQrtP/TJjww==
X-Received: by 2002:a17:907:a892:b0:c1c:5c90:1bb0 with SMTP id
 a640c23a62f3a-c23f92d6210mr244553366b.8.1787142464393; Wed, 19 Aug 2026
 05:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260817090601.1256389-1-pawlik.dan@gmail.com>
 <20260817161756.5fd2185a@kernel.org> <CALC2Apj7rQv=6uUqaqBjfJ9yO+VCddQqHB=yDhXH7+QUCh2JyA@mail.gmail.com>
 <20260818082933.28b5c9d1@kernel.org>
In-Reply-To: <20260818082933.28b5c9d1@kernel.org>
From: Daniel Pawlik <pawlik.dan@gmail.com>
Date: Wed, 19 Aug 2026 14:27:33 +0200
X-Gm-Features: AcwNN1VrJEfvg5ZvmKtuPToUsD-4XONBWJ61vlul_aZ3nC7ZUbLE5WyISNTim7I
Message-ID: <CALC2Apj-KLB5CVbSvoZWvA4Oan7dmAerK=VP7W86jmErWW8OdQ@mail.gmail.com>
Subject: Re: [PATCH v8] net: airoha: npu: use cacheline-sized buffers for
 mailbox DMA
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, win847@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_052747_383944_007FCFD7 
X-CRM114-Status: GOOD (  18.37  )
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

Hi,

I instrumented airoha_npu_send_msg() on EN7581 (Gemtek W1700K) with
DMA_BIDIRECTIONAL and the original unaligned 24-byte payload. Here is
what I found.

1) Every dma_map_single() call lands in swiotlb bounce buffers.
   The driver only calls dma_set_coherent_mask(DMA_BIT_MASK(32)) at
   probe but never calls dma_set_mask(). On this non-coherent ARM64
   platform that appears to force all streaming DMA through swiotlb.

2) The NPU permanently hangs after ~41 mailbox calls.
   The first 41 PPE SRAM-init calls succeed (mbox_status=3D0x7, ~10ms
   each). Starting at the 42nd, the NPU never sets the DONE bit =E2=80=94
   every subsequent call times out at 100ms (ret=3D-110,
   mbox_status=3D0x1), including the WLAN version query that triggers
   the "failed getting NPU fw version" probe failure.

3) Response data is never synced back through the bounce buffer.
   post-sync and post-unmap hex dumps are byte-identical to pre-map
   for both successful and timed-out calls.

4) Buffer pointer is 64-byte aligned (p_aligned=3D1), size is 24
   (sub-cacheline, cache_align=3D64). The swiotlb slot size is 2048,
   so the bounce buffer itself is always page-aligned.

5) dma_alloc_coherent mappings (shown by DMA-API debug dump) map
   P=3D=3DD at addresses around 0x91xxxxxx, bypassing swiotlb entirely.
   The mailbox works reliably through that path.

Representative trace (last success / first failure):

  [19.541] func_id=3D0 p=3D...dfc0 size=3D24 cache_align=3D64 p_aligned=3D1
  [19.545] mapped: dma=3D0xff765000 dma_aligned=3D1 is_swiotlb=3D1
  [19.541] mbox done: ret=3D0 mbox_status=3D0x7      <-- last success

  [19.588] func_id=3D0 p=3D...dfc0 size=3D24 cache_align=3D64 p_aligned=3D1
  [19.618] mapped: dma=3D0xff765800 dma_aligned=3D1 is_swiotlb=3D1
  [19.728] mbox done: ret=3D-110 mbox_status=3D0x1    <-- first timeout
  (all subsequent calls also timeout, NPU never recovers)

My working theory is that the missing dma_set_mask() is the root cause.
Without it the kernel bounces every streaming mapping through swiotlb,
and either the bounce-buffer sync path on this non-coherent platform
has a bug with sub-cacheline transfers, or the NPU firmware cannot
handle the latency/address-range change that bouncing introduces.

I plan to test next with dma_set_mask_and_coherent(DMA_BIT_MASK(32))
to see whether that eliminates the swiotlb bounce and restores the
mailbox. If it does, that narrows the bug to either the swiotlb sync
implementation or the platform DMA ops for non-coherent devices.

Debug instrumentation patch (applied on top of OpenWrt's 6.18.44):
https://github.com/openwrt/openwrt/commit/13ea79d9a411dc497882e820e4c881443=
457bd97

Full dmesg from the instrumented boot:
https://gist.github.com/danpawlik/b351e8a06218a3aaf68a2cb31a32ea8f

Thanks for help,
Dan


wt., 18 sie 2026 o 17:29 Jakub Kicinski <kuba@kernel.org> napisa=C5=82(a):
>
> On Tue, 18 Aug 2026 08:23:33 +0200 Daniel Pawlik wrote:
> > v8 does not switch to coherent DMA; it only rounds up mailbox payload
> > allocations (dma_get_cache_alignment() in v9) and maps the same rounded
> > length with DMA_BIDIRECTIONAL, while the mailbox length register still
> > uses the original payload size. On this board, mapping only the payload
> > size regresses probe back to 0.0 even with the larger allocation, so th=
e
> > rounded map length seems required here.
>
> Please trace into the dma API implementation on this platform where the
> alignment makes a difference. The "unaligned length" path must be buggy.
> We should fix it there, not in all the drivers (my concern being that
> this is not the only driver that hits the issue).



--
Z powa=C5=BCaniem,
Daniel Pawlik

