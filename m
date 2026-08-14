Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70587C5CFC1
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2026 08:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ctpNRt4aHSt0ZiBATXpNUnAiZyBx5JbaM34XCPkr8lI=; b=CA8sNeRpqi2yxaF53lV2/e67ap
	M5FTOJY5OqhNARwZ+C6Zh5hsTV3V4h83wjsqsi0l4Q/zsLu3d8Q4clel/KX8x9z5iHPHMW7UTLVu5
	OoVjRFo6AxPhW75W3t89Jf/xBJjZj25iQwyX2cJ6yrJy+95zMAeWl5aWXrb4p7yi+JpoXLeTn2kpd
	GeVsGSKkOE745I7zr045NaCZCGU3KXRkGJtt35cQwCznd/GF2y/rJulG+S1sjnZXSqI+aD2fT51tX
	9RZwEZ2lltdkIkekEK559yYcZt4AJfOMoJC59lwJWm4GqJNgK6Cih0uThLF6oURPURaBrEC4cmNcD
	XYJTF7RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wunYF-00000002JO8-0f6k;
	Fri, 14 Aug 2026 08:46:07 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wunY8-00000002JLm-2LrM
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Aug 2026 08:46:02 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c2074710751so130520166b.1
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Aug 2026 01:45:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786697158; cv=none;
        d=google.com; s=arc-20260327;
        b=ddzizN9QyN15jqtlxH7lrDnKRwOZE9yQxneYd8S+h+KhZdsX4L8zOTyKmLLl4PQY84
         LMs+Txl6eXMDJwSKyN570qfKthmq6Fkwfs/gjU1HQa7QtA3NETUxdP6qufN7RxsRwmXK
         MsgYabttx8ecU2nlT19ZCTePDFokKsdpbit4zo+yOXi1yMMBkLd/BLmEf+QJcWGcnSpD
         1MhtytUSEUat7/cKfv9wlWVsHfOJR65tGqQ8ejVRDW1rwwop9fTKKblSjeKdrLAyg6lW
         eIezXV7ZwPRCA72TEhFdau+zrzEfOShU1bavrbetSXFykyti3e+oOw/KTAXeCJGuFVow
         v8HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ctpNRt4aHSt0ZiBATXpNUnAiZyBx5JbaM34XCPkr8lI=;
        fh=Bp/gkYngAk28ZfBaLD+/6+wZTdkN5kGHsqPm7pVAtOs=;
        b=jRjKjMBIBX5Jd3LLGr2JvASx4zxmfNjckIDeOG4cOTRU5eKgFYXm26zx+L/fyBZjr7
         oZvDfTQgSOJLRHLx3X/4LxZ/ccs7/j25wg8yg5v6NoFReI3qtTl4U/qzRN0ki9RVIGAX
         CKvXn8moVgDRCGQR7Q7JCxfShbJ5vM1aLE5j4VezzeElpxbp5BQiOJv5gEI63yu6O+fp
         cOi10iMMzkl5UoZVSMjkah41zv4B8+EpavyHfiq/fLQxHgSaYXUoOxiDdJvWBkG0WLFZ
         NHjF41l/IviZpWxyXNaxaQqrZQXIXb+g65+56gWTkMlBZLw7mVTFtUo0HCEfC2d3chLx
         54WA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786697158; x=1787301958; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ctpNRt4aHSt0ZiBATXpNUnAiZyBx5JbaM34XCPkr8lI=;
        b=B/4/YNJc2ljBvDWOvr+Wxf9ec1hh+9G0gwUKC4eMKUsgFQhXkJGrsnjPUytGkG0r7x
         a29rda/l7earguA5pC/esNEdVp1qbKNjmwGQrb7iGGXDEY+MCIYQUacZ4N65vQYJQK1r
         uJQixZ+xHPQ6+SwgwRX/LPHUTS1G+tNXagLv2CWc+Q19a/12coFJT64D9nx7SexXL+C2
         vKY9tVUgsOagHDr9M7/K9DifnU2i+5mKmd/ncBvVghU4CCtYOTiQ5POrjPHOKa89sDVV
         O27dsN9Oc3zbvvY32mJRvwtzbPdZSyKMgnXo0+A4S2qe21wCba7uqJmwR6/uKqBxLW1j
         qW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786697158; x=1787301958;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctpNRt4aHSt0ZiBATXpNUnAiZyBx5JbaM34XCPkr8lI=;
        b=hcUDJFHZHw8m/XkQ3toiOLJc/5hza4Ug5ltieW2Awp4p8mkO9OOPHKlaa0EdSR2ulR
         tjb+2mFRt7KfkoNgASd3y59r4C/UZ+ee+DWGEGcvH0w6jWG/TkCrga92Tg9I8aHYhjU7
         p1ZtZuEl8NmPekIOHiLJShVhBGsUfjLcMIW+4as7ipK2vpqe8JZnQvnY/Kq+RNaiBpuE
         j8C3Z09fx+HFfvRxH9bdTcuyxFkFI1FFTluNHsBA0GFlxW7fqOsRBLOj/4blq3oyvzOH
         2pn9EQr/S+QyT4reHzwt7kvNzuxsooAhDTZ/UZCBqpe3vQAO0G5IQbimB/9OAkHrEIdF
         /lug==
X-Forwarded-Encrypted: i=1; AHgh+RqA0zrQPgT+8WuxOAoTrZDE6aLCeFHFqksTaLpV6PxI4AIDBUjqOy0aDs0uxleTvCDfZxpAX+usrRon+qVt7A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5UoSvHZ5qpTjLu9tvMYPCVgWEMO4k9Aeyt/dPsn+pshzMAY/7
	BvdE3AgAeVPqqkcPnxQHZ0r7Jg9OTprbM0ju3VJpS7IyK9GJMu7sLrySiWjYOdv8D73Qo515CkT
	mThFhvNxx0TpqSBJDoqfXcCSxGc4E6UI=
X-Gm-Gg: AR+sD13i0awXk7+EduQgNHzsItRUN2pZ4YIC2+rD7RGkJONklf2K6yYcyaXr32CYU3z
	0s/no3ExDtDHMe8etuCFqo5MnXjKIwlHXxMzgWI0r5OuZ39ebmh/8xgvDnahS9VdCCNrIQkkywP
	95GCdSXOAUcxlVYCM8q78dZdVhMzMPfxFNJyXROEMBTLP0us/gcZLF8tkEFja+EvU5EfLyIkJuS
	q5ya7s7OszL2SsELcD4KIcGvOB6mDJEaM4iHnjO1if+0jzzdnsdofXfaz7U7MtHI5pbuvNoddY/
	fB4xQDcNEcKIB+NAdxBi1oyIbuFbE7UW9R/KyzNMY8zMAlpSiNRl59S6Hd4XRZdYRyyi9/nK+Rx
	lrfb6c8qxkS74lqpP+G7wo0Hg/XphRA==
X-Received: by 2002:a17:907:c10:b0:c20:899:b8bc with SMTP id
 a640c23a62f3a-c2129ac0d66mr200128566b.6.1786697157566; Fri, 14 Aug 2026
 01:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260809152813.585797-1-pawlik.dan@gmail.com> <20260813180532.3683abc7@kernel.org>
In-Reply-To: <20260813180532.3683abc7@kernel.org>
From: Daniel Pawlik <pawlik.dan@gmail.com>
Date: Fri, 14 Aug 2026 10:45:45 +0200
X-Gm-Features: AUfX_mxwIf5bn2G0UM-Vi351-EpN5XsVbICk5ppLvaZ8AB0iHOEQezLAyICIB24
Message-ID: <CALC2ApjREyeKcddOx0TP2AghDs2BVKY6xD6mU6ToSOk2MQ4cqw@mail.gmail.com>
Subject: Re: [PATCH v6] net: airoha: npu: use coherent DMA for mailbox messages
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, win847@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_014600_654863_6E040590 
X-CRM114-Status: GOOD (  20.64  )
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

Hi Kuba,

Thanks for the feedback.

You were right to question the coherent bounce - it likely masked a SWIOTLB
path rather than fixing the underlying issue.

I tried your suggestion on Gemtek W1700K (EN7581 + MT7996, Quantum Fiber):
per-core cacheline-aligned bounce buffer at probe, map
ALIGN(len, SMP_CACHE_BYTES) with DMA_BIDIRECTIONAL, mailbox length register
still uses the original len.

Results on kernel 6.18.44:

    airoha-npu 1e900000.npu: NPU fw version: 0.1111
    mt7996e 0000:01:00.0: NPU version: 0.1111

With 6f884eb alone this board reads 0.0 (mailbox DONE succeeds). The
streaming bounce fix survives two cold reboots; PPE offload comes up
normally. Boot log shows SWIOTLB active (2MB bounce buffer).

I am withdrawing the coherent approach from v6 and sending v7 as a new
thread with the aligned streaming bounce instead. Happy to gather
dma-ranges / device DMA mask data from W1700K if that helps on the
platform side.

Thanks,
Daniel


pt., 14 sie 2026 o 03:05 Jakub Kicinski <kuba@kernel.org> napisa=C5=82(a):
>
> On Sun,  9 Aug 2026 17:28:13 +0200 Daniel Pawlik wrote:
> > Commit 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox
> > buffer") switched airoha_npu_send_msg() to DMA_BIDIRECTIONAL so
> > non-coherent CPUs invalidate caches before reading NPU GET responses.
> >
> > On EN7581 + MT7996 that change regresses probe: the mailbox completes
> > successfully, but WLAN_FUNC_GET_WAIT_NPU_VERSION still reads as 0.0 and
> > mt76 never binds NPU offload. Healthy boards report 0.1111.
>
> This sounds very odd. Is the DMA API broken on the platforms you are
> testing? The code looks correct as is.
>
> FWIW here's what GPT suggests:
>
>   Indeed, HEAD^ uses the DMA API correctly:
>   DMA_BIDIRECTIONAL map/unmap must make the NPU response visible to the C=
PU.
>
>   The important wrinkle is that, on arm64, these small kzalloc() buffers =
are
>   forced through SWIOTLB when mapped bidirectionally. DMA_TO_DEVICE did n=
ot
>   bounce them. HEAD switches to coherent memory and therefore bypasses SW=
IOTLB
>   entirely. That suggests the actual problem is one of:
>
>   - SWIOTLB memory is outside the NPU=E2=80=99s real DMA aperture.
>   - The platform=E2=80=99s dma-ranges/DMA mask does not describe that ape=
rture.
>   - SWIOTLB copyback or cache handling is broken.
>
>   Using coherent memory for a mailbox is reasonable, but this patch masks=
 that
>   underlying problem rather than explaining it. Before accepting it, I wo=
uld
>   test a cacheline-aligned, rounded-size streaming buffer with
>   DMA_BIDIRECTIONAL, while programming the original payload length into t=
he
>   mailbox. If that works, it strongly implicates the SWIOTLB/platform set=
up.
>
> We can take a revert of the patch under Fixes if it's urgent.
> The real fix requires a deeper investigation.
> --
> pw-bot: cr



--
Z powa=C5=BCaniem,
Daniel Pawlik

