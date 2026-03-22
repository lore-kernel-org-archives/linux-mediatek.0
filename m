Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341FFFC72AD
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Mar 2026 13:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgyMy2hQLKznZrbyYfmh+EZtwjOUXGpz7osuSEWQEio=; b=CfbgamewrfSkpbrSdMP4axBKpO
	0o1kmb6UE5kb4Q6reisJknVr1d5hZCUh+UB/gX6wFNxOiAL2qAwLr+iPedZ5yE3Iyj4NX7n3Wm0Un
	KKldPhGuzq0qEGjwpekkvvdCr1SCVyV81zxK7ZM043xDBARKKHPT4Of06U+aAODksHSc6UNq4CZx+
	HERREldND8NC+RDkFcxMcyDZgYygSWqE1+W4b2xw26a/YN7iDV+GwamDP/qD9BXrAwP9jWoW6C62e
	WgXMjIJy9hX19zx/3k352vVRbgYr8yxenvcdwivrAoO5J613p76+7FrxO3TIyDzPJfQEmUdNEGA3K
	55KyPdaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4JJg-0000000FO0p-33m9;
	Sun, 22 Mar 2026 13:58:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4JJd-0000000FO06-41ck
	for linux-mediatek@lists.infradead.org;
	Sun, 22 Mar 2026 13:58:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4AE8C44528
	for <linux-mediatek@lists.infradead.org>; Sun, 22 Mar 2026 13:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F03AC2BCB4
	for <linux-mediatek@lists.infradead.org>; Sun, 22 Mar 2026 13:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774187885;
	bh=mgyMy2hQLKznZrbyYfmh+EZtwjOUXGpz7osuSEWQEio=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sGfYkYhrSR/a3HIae86Azb73dfrYupxBwZ9YiGV38yk8JbNelSnNPHP1oGRuaNuG2
	 4uutQnvVybt3z+XTRpusu+gKAo5pxPPohTzooquIzASMZbQpX0ZUwWxuJWHlxYyBIm
	 HQqnnv+zYoW9E4p4j02CEIdhUXsh2WnQIQB9CiwjVVmckJNemFaPgqLWCEsxG8BMhQ
	 3hQaRUoCX5E8u3i+UTXjkqdjB4r+cAL+6mEj/pPNFeEvZr9HUfRBH7HLDlukqewmuB
	 nH0QTD0MKNPYwCe3CxuSJPtuEmg879BcT/8CxW3kLuCqEIEZTuBOiiUoFcJ1fC5/bF
	 c7D6a+ZC2Mp8Q==
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b6b0500e06so3806427eec.1
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Mar 2026 06:58:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURBo7/OW/iBFqbAbVDRPH+PqkspNz+vBwL237H9f6k5fB3HVNtPcNJ1Tq6WIOSfCNMuXiPNaN2zREC7SlUVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxK5Vs2hOf3UOvtBBR2kOD1WutZvy5ybTYpcMkYuK6J6/rONcxC
	g0FaWnad9J9WhkxndrvGppCO176t/ANjGhY5cWJEpRnHE34SZ4yqttcjChR8u2eUhYyzFiu4R7V
	gSUx3qPv/kFofsq1hxatqO9LzCgYNpQ==
X-Received: by 2002:a05:7022:31a:b0:128:d24a:a5ba with SMTP id
 a92af1059eb24-12a726cafe2mr3483365c88.20.1774187884248; Sun, 22 Mar 2026
 06:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260311094929.3393338-1-wenst@chromium.org> <20260311094929.3393338-4-wenst@chromium.org>
In-Reply-To: <20260311094929.3393338-4-wenst@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 22 Mar 2026 13:57:52 +0000
X-Gmail-Original-Message-ID: <CAAOTY_86VxSUmNisk5aiapTNUGFGUu0gHr76E0RKKT0pd1mr-Q@mail.gmail.com>
X-Gm-Features: AaiRm51YKpNxHHSZ_HLZmjHIKksalh8pxeIcHKSYGkrLrVcQdpuypJr4oUdO1Tc
Message-ID: <CAAOTY_86VxSUmNisk5aiapTNUGFGUu0gHr76E0RKKT0pd1mr-Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/mediatek: Set dedicated DMA device and drop
 custom GEM callbacks
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-sunxi@lists.linux.dev, 
	Paul Kocialkowski <paulk@sys-base.io>, linux-mediatek@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_065806_068492_4394A856 
X-CRM114-Status: GOOD (  15.40  )
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

Chen-Yu Tsai <wenst@chromium.org> =E6=96=BC 2026=E5=B9=B43=E6=9C=8811=E6=97=
=A5=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=889:50=E5=AF=AB=E9=81=93=EF=BC=9A
>
> In commit 9b54a32c7c6a ("drm/mediatek: mtk_gem: Partial refactor and
> use drm_gem_dma_object") the MediaTek DRM driver was refactored to use
> drm_gem_dma_object, but custom callbacks were still needed to deal with
> using the first device of the pipeline as the DMA device, instead of
> the MMSYS device that the DRM driver binds to.
>
> Turns out there is already partial support for dedicated DMA devices in
> the DRM subsystem for PRIME imports. The preceding patches add support
> for dedicated DMA devices to the GEM DMA helpers.
>
> This allows us to just set the dedicated DMA device for the DRM device,
> and drop all the custom GEM callbacks. Also drop the .dma_dev field
> from the driver private data as it is no longer needed.
>
> There are slight differences in the mmap helper: the VM_DONTDUMP and
> VM_IO flags are no longer set. Both were lifted from drm_gem_mmap_obj().
> VM_IO probably doesn't make sense since the buffer is allocated using
> dma_alloc_attrs().

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Also remove reference to mtk_gem.c from the Makefile
> ---
>

