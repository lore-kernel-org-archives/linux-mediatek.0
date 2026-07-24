Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8335C531D0
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2026 00:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjacPsdtNV1p4l/sQfaVOtYLfOgONtMJVT+kTLVOtKI=; b=pw8wat1+BbAi2qSzjyk6S4TLgx
	MYSrICxYqJW5N1YGwu9cRK8Hnwgn5aY81APbfY70XearHjI+k639H008eSTaW2KOJyK5cw5xgQwpD
	/2oo6espRXZgyeY3h/TVQ8FiaakrkxgGCdtqJnzHxRomkrBKPHHcNt3Hut164zJPsFkJlXUnbvPmn
	z3RULpA5Q+HYYPuYpmqMIUxe/m07gcJdTOCgB5XycPHaBi2x+anykBfmnzZf38YtzkxuTxCOIRftu
	ofrBIUPO6S4PvoVt1ErJDKCDXXeEUDitewTx7t/ADRkYaLYhcB093Wm9LCS1CrzaoGa2dJEHoUqXp
	3h6Q+d+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn3V3-0000000FHep-1Blp;
	Fri, 24 Jul 2026 00:10:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn3V2-0000000FHeg-11j3
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Jul 2026 00:10:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B456A43DC8
	for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 00:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C241F00ADB
	for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 00:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784851847;
	bh=LjacPsdtNV1p4l/sQfaVOtYLfOgONtMJVT+kTLVOtKI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dGJ9B1HGGr9MTYXoXXfILTJqaNWoaeaD6lEYSc1YBjJvZ6yLjbxkSHOpxrnvf8OVZ
	 aWWICcJ9JNVuXbLTVL1Xnkz05JKqxTFpWdIgociO3UZTOX3G6INvnh2CPaBDh7z2hY
	 0BKOrbqqPlkLRqgU/ssukTWRdWc9wPFVW+7N69pblRtxf6u7ct7fLM9UmqMKl1QTPq
	 pbAxq04PLyG454o0qSi7RPqT+LrcmxmTqYckUQ9M/J6OVxy1DoBHJImXz4PvsG72yR
	 NXpQ4p1uhqnik1c5FV/Nn21nNDs+C00R7MGtPgNapsd9BodOAfrHNdWX6nGPCp4ldU
	 sO1OLLEIKs8AA==
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-383cb94f742so1204458a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Jul 2026 17:10:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr0RiG+sKbVk7tuzJGnso41BFyGVKO9ZLnX9c0XWG9Jg44tBBjvOW8KXwQ3wpQ8v/HPa2iiyuMhCb3Ue7WX/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBCBezYcba11DRZ16jyFp7R8Ot6fyUEGei3ZfJfE4s0E3z6CAE
	EMAVWXZHHcYn/nLX2rABpuOt8EUYUk9LF3QC5xNLG5G3ZO+3PnsmfxVLw24pR1QPYsDRWPq/lNX
	q50gVFfaWOb3BHESUUH0NguMkSnIbRw==
X-Received: by 2002:a17:90b:1642:b0:37f:f4ae:5f25 with SMTP id
 98e67ed59e1d1-38ec6a51c61mr4741746a91.20.1784851847244; Thu, 23 Jul 2026
 17:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260716132103.1564995-1-johan@kernel.org>
In-Reply-To: <20260716132103.1564995-1-johan@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 24 Jul 2026 00:10:34 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8+u-yswp+Gsj1ZnaJWh3fZ6Ndxd=JeUie7ZVG1pBYyeA@mail.gmail.com>
X-Gm-Features: AUfX_mwvrzL8b4TzBdDrdHDueSyF33BvYJFwjoUH9n9UYcfPUact2O614SD6X6A
Message-ID: <CAAOTY_8+u-yswp+Gsj1ZnaJWh3fZ6Ndxd=JeUie7ZVG1pBYyeA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_hdmi_common: take i2c adapter module reference
To: Johan Hovold <johan@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Johan Hovold <johan@kernel.org> =E6=96=BC 2026=E5=B9=B47=E6=9C=8816=E6=97=
=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=881:21=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The i2c subsystem currently blocks during adapter deregistration
> whenever there are consumers holding a reference.
>
> Switch to using of_get_i2c_adapter_by_node() which also takes a
> reference to the adapter module so that an attempt to unload the module
> while in use fails gracefully instead of blocking uninterruptibly.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---

