Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5486CA5FC5
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2026 13:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IzQF+Q+mst0ME7ROJtfUb5Jcpg0Z1nzhB6w2uJrJos=; b=VVz+6Ab5pBd4MVuT/h4UpYaEeH
	+AwGcMoC9BHodhyhDqxa/FDnTQn/f3Q0RDMJJ++wYQFvR1cgI6XgiJMfS7WT2p9ycdpF2YY20hu0r
	DXxrqydWoAb9rD8kFMy15opU3EEf+EfcTxOQzm5EptL0mKoaQ2gNCVoosgnn8529FsX2ZCiEi/SF2
	v94X/XFOznJJZmJLM5STbuiRyBFyXlalGqvatA3cSdufzOINQydK5IiVBSw08dHmNgD3sbnf0v9UF
	JQnLE6FNIMgJNzvgcL3b21nCYjlhaYMtxIfPMBY/9yyRsW300Mj+SYBMbSo5/By7y9f2t667ij/l7
	WJEhCp9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuF5-000000067Fw-1Oxj;
	Wed, 30 Sep 2026 13:21:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuF2-000000067FA-0K37
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Sep 2026 13:21:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7479D60252
	for <linux-mediatek@lists.infradead.org>; Wed, 30 Sep 2026 13:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B00F1F00898
	for <linux-mediatek@lists.infradead.org>; Wed, 30 Sep 2026 13:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790774459;
	bh=6IzQF+Q+mst0ME7ROJtfUb5Jcpg0Z1nzhB6w2uJrJos=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=i1QB5CNb0e4yAO69gGpeGDQ4+3cNF/GYGIwzLC+sZz6I9I5qUNqY+vCp3ouJ+Nodz
	 NNkH0b3BWs6psnkxr2EAkO8Y50PaZwvRiQ/oT7/cisZflys68yXDAvp3O4KXyejhZm
	 CH+TWTcGc0aqXK5hUciE4MvMi4+Xai6/r5lbAEcRxl94G1OFkbR7kX2mnIvVgkRCtR
	 xfYAgKo4OHuG0XwKOA8IhTMhJGYDTJM4gInwf6w+oPCC6LloOnOQQXoeq9WX9kPX+I
	 5ivLMv7eur5s+F+a2dY7Amur9JxTfXPH1+mQ0tvlciAK510abinNSr7QyCwV5qMQIe
	 VPW9P+ZOCw7Bg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8ea203e5bso4545180e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Sep 2026 06:20:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwaEveCbCQjL8sL/m8K0rP7y0W4bZObHMuSQkLFVLdLreCrfFPAVa+kyKB29qPzYfFYnJMBL3okLVFnrfAAYA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJuA5g2Z+bMHoW1F7CrJlZ1plybFzbSnCq2jTftQ4RyKJ0uEhFB
	AsqhF0F37bhlUdASIcDnY8XA9WQMvYRfx78XupZW55Dh4HBozT1L7QZiYTeMPxZFZBPB68CDrlz
	MKb6PR4Kff9lC7pDc9CdYiR9vsUkOw88=
X-Received: by 2002:a05:6512:67da:b0:5b8:d9ce:1d88 with SMTP id
 2adb3069b0e04-5ba405f5e1bmr513623e87.29.1790774457839; Wed, 30 Sep 2026
 06:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260917211323.i.101-kees@kernel.org>
In-Reply-To: <20260917211323.i.101-kees@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:20:45 +0200
X-Gmail-Original-Message-ID: <CAD++jL=sN7Pq9cyoNbv7-7WQgFzUUb7uPT99E7z4CvbkpfQuVQ@mail.gmail.com>
X-Gm-Features: AclHuK_84YC7Bc4GJIIPmMM0TRscaoNjNwKwonpkM8TVCPVhw3xp987UXfg7Btw
Message-ID: <CAD++jL=sN7Pq9cyoNbv7-7WQgFzUUb7uPT99E7z4CvbkpfQuVQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix eint->base allocation type
To: Kees Cook <kees@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>, Kees Cook <kees+treewide@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
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

On Thu, Sep 17, 2026 at 11:13=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:

> From: Kees Cook <kees+treewide@kernel.org>
>
> In preparation for making the devm_kmalloc family of allocators type
> aware, we need to make sure that the returned type from the allocation
> matches the type of the variable being assigned. (Before, the allocator
> would always return "void *", which can be implicitly cast to any
> pointer type.)
>
> This allocates the single-entry array that mtk-eint expects (nbase is
> set to 1). The assigned type is "void __iomem **", but the converted
> allocation type would be "void __iomem ***", as the size was taken from
> "pctl->eint->base" itself rather than from what it points at. Luckily
> "void __iomem **" and "void __iomem *" are the same size. Take the size
> from the pointed-at type to match the assignment.
>
> Build tested ARCH=3Dx86_64 allmodconfig with GCC 16.2.0:
> drivers/pinctrl/mediatek/pinctrl-mtk-common.o
>
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>

Patch applied!

Yours,
Linus Walleij

