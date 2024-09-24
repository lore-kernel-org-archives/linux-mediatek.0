Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4EFCF9C6B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Sep 2024 22:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsZrdsG+uwrLVvS5FWIhBRuHHog4+l/Yf5EAxQLtzhs=; b=AcFyq85SOaVCNvw/TZW311ssFo
	PuuF/BgMxHHQPiBUadhJnsi5ctsTIdesVk4JfHJNr3li4cfUV+axbhurhnaeI8+karBV1MCgF6hP+
	40ASsw1ujCsy5hO0Kv4XPKICvp6223aW/fha6N2PCaKOwo9M7YPt24I8LxVl9J/UbDIj26qxus6Fx
	TPntzNOIO1uCD0FbuFla2858APBLb8IaUgZwU2vrZArZDAqMUhfOf8cKLdJrqccOWkMa3DX2pNL6w
	f+rOuTdIkb48RCGtba5Y+5BHDhODl998GV1WGmUZ4P39FAvE6V1DGDv/GvCtyW1OtVzprTnHCW+7A
	Ddc10gJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stDdX-00000003OYz-3Oez;
	Tue, 24 Sep 2024 22:03:59 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stDci-00000003OQt-1aV9
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Sep 2024 22:03:09 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7a99e8d5df1so604054085a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Sep 2024 15:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1727215386; x=1727820186; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NsZrdsG+uwrLVvS5FWIhBRuHHog4+l/Yf5EAxQLtzhs=;
        b=jNx8hzOPp0H6qwGfhoI+GoQ7vjF9Io/SAniHe7EDc/9aovASG+iRuxVCl778OhrO23
         BkJtt8Kzw/GRBnyJ9da4zxTmHCsG4pbGoKBZT9CA35oypeaeNTNTjKSmgPmuP3zMmi6u
         Q7VCsB6MSVRBngWOPEP0U//nd11CZJt+SoIZP09/Xy2SR8+Sn5y6YaGC6cs/45qN0z9x
         Hj9uCsJ10IEg0cHLkPF9OSQm0VHpWLBLq8DFpYMnqbKDbnilIb5mGfi3YYh2A1J1nu+v
         4uIemj6IEaBfZql+ZWlph9VKhVFM3AtOw3gNRmol2qwYxIIrDSTU5QvQQ3qY7gHmVkPA
         Nbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727215386; x=1727820186;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NsZrdsG+uwrLVvS5FWIhBRuHHog4+l/Yf5EAxQLtzhs=;
        b=rloQ+KxYLFd39llw9WlNsvFGRdqHyeXm46tlInaXVudPQ43IyQ8pkh/mEEQ91XuOqx
         HZUofrccEWkusqX47h5ItB2rLrNdstvEAUgpjdyjbFjwp8BwC2an505aILLBy4IRaurC
         PPvsUfyLjou3EH34qnplQgA0KXH/E4yOWe+d/4nucyW6dSru0tFprj3dE9xJmPIPNvbb
         y4tAFk50jYSLw0Y1PfkpPEdrEkVPB/joNO/UQpH+gtRVNoPG3a+kDn7kDNgpJBtmXNWJ
         rdR7VCz8jmM90TZLSl84SV/TzJxGCBxC3HOEqcQ6ySVUOja1lUn128wSj4ShHr9cOS0S
         sLNA==
X-Forwarded-Encrypted: i=1; AJvYcCXU8hce2ztEtwCAwpv6anzljbHMZjrje4LRv9GQ04z4doYTKX9tKW3Bc5iu7ywh7UfYyjIvYL9NLUlQXrrX7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yztm3PExidOxThxeNFbkMzTPpP/y+NcnZFjSfD1LwKViTau3YdR
	AmAOuJPscXXvoKzQ9sR5Az+HliHpD1AadZnbYzgjmx4ZJ1VDQqGK1n0lEuP6y2vjVj85mthPw2M
	plkVuR/73C8jbuX830imIZRelnKJuV/qM6kXTCw==
X-Google-Smtp-Source: AGHT+IElqfXPuPng8AojlDDF2C6GLMgjgq9uYfkfDW9uAzUUN373GhIZBRXCnSZ4eftp7Scr+RM/AU3bO+2aPn4itIQ=
X-Received: by 2002:a05:620a:179e:b0:7a9:be7a:9220 with SMTP id
 af79cd13be357-7ace745d94emr87761585a.60.1727215386507; Tue, 24 Sep 2024
 15:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
In-Reply-To: <20240830070351.2855919-1-jens.wiklander@linaro.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 24 Sep 2024 23:02:54 +0100
Message-ID: <CAPj87rM5LSBEdMECyh0WTkjWWySDv2_eyqj7ew_qU7xQ5LEdgA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Linaro restricted heap
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_150308_562551_1A1AF58C 
X-CRM114-Status: GOOD (  10.14  )
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

Hi Jens,

On Fri, 30 Aug 2024 at 08:04, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> This patch set is based on top of Yong Wu's restricted heap patch set [1].
> It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].
>
> The Linaro restricted heap uses genalloc in the kernel to manage the heap
> carvout. This is a difference from the Mediatek restricted heap which
> relies on the secure world to manage the carveout.

Calling this the 'genalloc heap' would be much more clear.

Cheers,
Daniel

