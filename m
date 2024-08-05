Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D67C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Aug 2024 13:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqu7bGkFRyONJ595ZHT2dPa2sQS3elnU8rD7fvADtto=; b=dnLr6drJdt6emnKjiKCv8AvbKc
	cr27WTsK3j5Ne99kwQ1L+0nMgkmKYz3K9fTEgWUi7QniykIcydG1MJNFaJbycZoNq+yK5Nsxynmjd
	zTss1sBduhwLB1rT/dggNG7w9747CRO10UsYNA1sa+wLWcfKN4Plo4dLfVqSt3nnCJc1UtigHIdHO
	RIJwciq4I642PivR/1gYR+97m0geLhVjr1hAZnJcW8/frKUXQdkx/+8nQ9vYf2piBIqIvWxhq+/K6
	GE0dXmV/uN8V3I4gFev5hlnmF5RQ8K2DNef8ccalGpayP3l7DYbg/b9VPfU99oMedezpUInDPWVVe
	sY3bndFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saxWi-0000000Fuaz-1zeg;
	Mon, 05 Aug 2024 13:13:28 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saxV4-0000000Fu8C-02kX
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Aug 2024 13:11:48 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7a1da036d35so627224485a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Aug 2024 06:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1722863504; x=1723468304; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wqu7bGkFRyONJ595ZHT2dPa2sQS3elnU8rD7fvADtto=;
        b=Iv8A0Y4cWnDSEcF9eoKOSfm3ZK8aoiBsHv72Yleafmc08ImqC0VY4kY5y/HAnvFrLq
         a5pIAwgiiB4zvPQrELBdE186ogcnZR38pKyhC2GAR3Vy64eZAHkVUgs31vPegysPgVJP
         XAKIfzSnhHCe1BM5599oJvH7eIL4vO2sWFElfQLNV+lgTOIE/Vb8dWG18jNmWfTQFgme
         pAXF+7MDFhXA+IQ878Ut8VQIfO78PeoUApJWhPrag++5xJPopysITUmxSTdnjbG2kuPb
         Y/0mK/rrfsjeGirvmvoNkk9GCfQD4Ryrh9oJA/7Egtf44cVg5LRLb0KfoLRD+Z7FrAi9
         a5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722863504; x=1723468304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqu7bGkFRyONJ595ZHT2dPa2sQS3elnU8rD7fvADtto=;
        b=RgZozTb1AMh9cthkX3VAL3E9vesHGnfqimpthsoSbByHqQA304okax31QUuv6NyT5D
         Jo+Hl4JJ0fmiU7HxnJj4T6IwF2HEUA4uGxSJbkIOof4vtzDZcGwuDWgsYCjzZZpv4CLU
         +iEb0SsOY0X6X6NOVeKFhY/pbEXFTRKd4x0q+PPEr9EA0E6mGXjUkce52JHkgZEUxTzV
         JYMKDdxYWWgChGNf/dU1z9XxuQk7EZJE+xsj+vSb5O3D5Dkm9YdoWkIxE9X7FWtDefUx
         lGFv+aq/JTW2gtdKSV+TikrjwiNapQPSfMd3WsozmTx4V0mC0w7UhOpRpXRFccGC6PXo
         r+Fw==
X-Forwarded-Encrypted: i=1; AJvYcCW1mHDf8zI6hkHDQEGpIYWWMjbni/k9N+xx3Wvv9YvkVc5y6sk08/71K7WJhBs5P4KBUQkq8CCdgsU9nSzG9Bi55ywoA/huQrImawO1bCn/TC5a
X-Gm-Message-State: AOJu0YwFSA/9VSKLLR4stU12FEmQ6ehcB2B2ycpKNfVnYDKtNSVYSidX
	RpyELlYzw2HoWfesRa7a+abj8VAFblPecRTx1xrwlcZtcBvwjT8UKiWVB56ZPeWnutHFY+158VM
	JqrEwhM2kObMdBiaY88w204eYXc3EcpWKLaDJ/g==
X-Google-Smtp-Source: AGHT+IF/O5ePVsP9F9/4LdJgMcHnbAiRBVz6rWucn4L0+VzzRP1U+YIN/SKoA9Ocbj/mAccdLjT4/BuXBtCo084/sM8=
X-Received: by 2002:a05:620a:24c6:b0:7a2:e6c:41e7 with SMTP id
 af79cd13be357-7a34eeb959dmr1463955085a.9.1722863504285; Mon, 05 Aug 2024
 06:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240730021545.912271-1-vignesh.raman@collabora.com>
In-Reply-To: <20240730021545.912271-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 5 Aug 2024 14:11:32 +0100
Message-ID: <CAPj87rOYVCG2A10ruyYan9y6NmMY0fUM6Z5-9ht7dEp_THYmNw@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] drm/ci: Add support for GPU and display testing
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, 
	robdclark@gmail.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com, 
	dmitry.baryshkov@linaro.org, mcanal@igalia.com, melissa.srw@gmail.com, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_061146_278944_450DCF35 
X-CRM114-Status: GOOD (  14.03  )
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

Hi Vignesh,

On Tue, 30 Jul 2024 at 03:16, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> Some ARM SOCs have a separate display controller and GPU, each with
> different drivers. For mediatek mt8173, the GPU driver is powervr,
> and the display driver is mediatek. In the case of mediatek mt8183,
> the GPU driver is panfrost, and the display driver is mediatek.
> With rockchip rk3288/rk3399, the GPU driver is panfrost, while the
> display driver is rockchip. For amlogic meson G12B (A311D) SOC, the
> GPU driver is panfrost, and the display driver is meson.
>
> IGT tests run various tests with different xfails and can test both
> GPU devices and KMS/display devices. Currently, in drm-ci for MediaTek,
> Rockchip, and Amlogic Meson platforms, only the GPU driver is tested.
> This leads to incomplete coverage since the display is never tested on
> these platforms. This commit series adds support in drm-ci to run tests
> for both GPU and display drivers for MediaTek mt8173/mt8183, Rockchip
> rk3288/rk3399, and Amlogic Meson G12B (A311D) platforms.
>
> Update the expectations file, and skip driver-specific tests and
> tools_test on non-intel platforms.

Thanks, series looks sensible and is:
Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel

