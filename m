Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E168EC5DF97
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Aug 2026 10:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQUVqT2GsNnO1vNVmJUiz/YI3RE2fLyeDnXMk0gCVEc=; b=SityOr810nkdRZA2QbCJXCI+d0
	OxHtsHKrJexB2uHj17gBA//6IjwbCZ9pQkLinzJTTyi5ttMedPvYnNk7+rWr1H94XxNXmLjLSAieL
	6tKGVM4zHOTJkX7VQpAtEBoilsAuJKMJOsOdvqdB4nhH1CFXsFmp68F6CBh3oZvzcTTuwkkpW7Hcd
	24A3rnjCencLee+oMoVlREp3YPuW2s3hlW0TTGuKrwdUavLa1C9BoO49+NNZ2ICYMCyWz7dyaFPM4
	JCC7wM3uLXRHcs0wXm+qWnbQTTPM6WNmhnyP8YTG4Jp82HlQu3tvLw17suHer4QcG/puVeebd5OYY
	Elr8JuUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy5eQ-0000000FG4g-2EuI;
	Sun, 23 Aug 2026 10:42:06 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy5eN-0000000FG40-43jD
	for linux-mediatek@lists.infradead.org;
	Sun, 23 Aug 2026 10:42:05 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6a157f90752so4189065a12.3
        for <linux-mediatek@lists.infradead.org>; Sun, 23 Aug 2026 03:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787481721; cv=none;
        d=google.com; s=arc-20260327;
        b=M6YJfp2q6P/3aZAKhEKjezNvuMy0Ff/I0aUGi8ZD2X6/1+ZioBVhVbdwGWY9Y7E3Nr
         2h5iwpVLHqzKJAF4dCp18PeVeGZ14HVS9OjPUSq6VyaP1KcnFNsTUN6t9YCdtx7we7Ma
         7rvp398Me5E4+qBZk9tczSGqQkm4j8fXn+acahPvzYKGzOTkYFyuDH9Nce5gqkuPbDMF
         tST72tEaLPpyaCQn2LM4Wvg3jFzUjnwDtxvHIXWN9KEAbdHY934mibt7BzDJp7GzELet
         yYU7S3/e74q/aOX02d8vo2QCpOxRQKqF31gS0BRqa2NMMzXPnm/+iNWkqBeTwaK8xS/R
         ZKFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yQUVqT2GsNnO1vNVmJUiz/YI3RE2fLyeDnXMk0gCVEc=;
        fh=CfoQY1KwWGujLM9MZ0GJ0Bsgib0HXO7IBn4G2c6o5eE=;
        b=CNsEosUTI/Gv1CM29sPZc86W6fC6UCnFaCeFAdjyXWbMMoWWwJHndP0gWpLWiFLxyI
         ujuOks4h2CCinANF98Vb5WMMnvmcs1hp0yK9EgSaufg4sDQ+0OOO1HiPaJwAaMEkSE7v
         PU695i13JSVJ6IlJLbEFeFqGN+Otd/vg0XjT9JLP21iW5I2vLk+YnCAspRI7BbN6pDBD
         xdFCzynSE1CL6THAI1wt/VdRqt3dQxx7BHo6gBP9MZOFUrVLa/Zp1hX5EAbmSgtxGXAO
         nAIj1qApL2CtB4a4fB7LzA2hTLNgAvZcUwmm4i0VLk3V9H7eMtQSA2vTCvgjspQO8WgS
         UQzw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787481721; x=1788086521; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yQUVqT2GsNnO1vNVmJUiz/YI3RE2fLyeDnXMk0gCVEc=;
        b=UEb/O1qF1+FrTiOmq0PZmeHWiCiyvWtHc58Z3C6L0fxRH/BB68ltpUrEWJiZmDDs40
         FUBCCVDybBI1xPjfrpZwoz56UgUtQuuGHuTlCYiM+v2zcWXJlxyW/atp0LiIoFuTgusZ
         MGr6L3l7T9m2TeD5QBEJYTDAo1YSuAIYZsclKoYWBHHdQ0TbzRs+ybrz0mj2vhT0oiod
         2lKSv9N1HqffwHFEvYplKWFdxp2tGd9Y4yXEAtJZ9JrUEsZrnasJANCoelWZbVeKjoXA
         BNtjESaDadYluGzH/MKB24EIImjkK5nhEeA2fU5NsTZwUc6/7zJfx8Ru772jAyE2+KUj
         lQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787481721; x=1788086521;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQUVqT2GsNnO1vNVmJUiz/YI3RE2fLyeDnXMk0gCVEc=;
        b=iSyxs4A16C0G+C31md32+dYbjfmTMIefqffcAlUS4s2BfQO8j/5GqM1//8dtaO0jU4
         4LdAVA9u497ohMyqScFKDTWhVN8x1tTGNT7gUkctcTpokls5V6riqg9IgcGEYxIyuhrk
         9SmbjaLx4ty5+JZyfW1le19XmBd6KkYd2UE3VOuqrNZsV7NXZNDUfPF3UBGpSUjiamw5
         aQ7khaUpNzkd1EYi8P6jL0ieSbvUNx4Q988QlmVkI+bZYpMsxW+xe9pvdQs4Q0P3yxs+
         r/6O181QR3qzKNKvD7MKSzw0dO3rk150F9i3qk1nl1U/xBGaRupkcruAdTBmK2pTcXK3
         mMlg==
X-Forwarded-Encrypted: i=1; AHgh+RqnXm9OfibtBAht84YI2aAggKMJZGpyMlXZp7sBVxBxhKZsICikbOpkH3Uc03K6q5WGKkRHfoOljXFiRBIQIw==@lists.infradead.org
X-Gm-Message-State: AFuF++lw1v9+68N2bVOSMvLl4bq1s+U35EWL6ERF645j9VunQNunNdpC
	eaX5wVUSFkeXbXWU6Kx62yKsEEGDgmAWnYqgEkmmYzUWElu8t9Cxm7Szbc5fvFdadHD4ksiR8hw
	nJuhhU2p8WeZyF78kOyBcV0bmYI/Hsh+mOMSZnIQ=
X-Gm-Gg: AR+sD13+xrBvFSzbXiuaL8AxdFqsl6W9pIEEhb23PX2Sdo0k3ycvGYV7toFnzcbEo2D
	QPrLKUNIJt3elbG9m8NB1GhJR2YSC8a501WGgukjh0yhLmQHMXSATuonkxorJOBG8z7TGkVI7I1
	jYA4HSx16xgYfp7kyqP1wV75fqBCuckDjEKjWpTupC5IdekPgANd+TJCcwCvL7GDhfU8rH8Zk1F
	Nh/OzvWKHo5k8I1In0Bi7BvYoRPAeuEOmtqNHxlAALk8FiTncqZ3NNQrm1TvtWM2zr0n6X7RUiV
	fcpoMLaMxaJL4h/d8l8R7/UpOr9V1GGsNUDynvYPVl4TQe6hrAVIsqt13GY1/X6vHnC2fedntoI
	vamujYs7Rxo64VIB9vGBg2V6PzfpesQ==
X-Received: by 2002:a17:907:c706:b0:c20:f913:9337 with SMTP id
 a640c23a62f3a-c246a657f9fmr2290057766b.20.1787481721077; Sun, 23 Aug 2026
 03:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260820085941.380401-1-pawlik.dan@gmail.com> <20260822122727.4f437bb5@kernel.org>
In-Reply-To: <20260822122727.4f437bb5@kernel.org>
From: Daniel Pawlik <pawlik.dan@gmail.com>
Date: Sun, 23 Aug 2026 12:41:49 +0200
X-Gm-Features: AcwNN1Whb7yUsS76NaQO16mZ6ya_4eh39L6AFwo6dWX5dJOjIcUnhZ_fwDLV2K4
Message-ID: <CALC2Api8nhePvuUPsw9CE6nX-0pFOMO5qy=4fzqox8_XM4eSqw@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] net: airoha: npu: fix missing streaming DMA mask
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, lorenzo@kernel.org, nbd@nbd.name, 
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	yangshiji66@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_034204_023821_52AA32C0 
X-CRM114-Status: GOOD (  11.31  )
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

I tested both patches independently:

- Patch 1 alone (DMA mask): NPU reports version 0.0 - probe fails.
  The streaming mask is correct but 24-byte buffers still bounce
  through swiotlb, and the NPU can't write to that address range.

- Patch 2 alone (cacheline buffers): NPU reports version 0.1111 -
  works. Cache-line-aligned allocations bypass swiotlb entirely.

So patch 2 is the essential fix, but patch 1 is still good to have as
a defensive measure - without a proper streaming DMA mask, any
future sub-cacheline streaming mapping would silently break.

Dan

sob., 22 sie 2026 o 21:27 Jakub Kicinski <kuba@kernel.org> napisa=C5=82(a):
>
> On Thu, 20 Aug 2026 10:59:40 +0200 Daniel Pawlik wrote:
> > The driver calls dma_set_coherent_mask() but never dma_set_mask(),
> > leaving the streaming DMA mask at the bus default. On the non-coherent
> > EN7581 platform (Cortex-A53), this causes the NPU mailbox to hang
> > after approximately 41 calls when using streaming DMA mappings.
>
> Can you confirm if patch 2 is still needed after this fix?



--
Z powa=C5=BCaniem,
Daniel Pawlik

