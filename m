Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10F0CD13D2
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2026 11:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9oMGzN03CHJLCXRmF2kf9hbHZWYmgAo98CZVUtghVsQ=; b=gTCc5HvVALhJ6zRtlVzrU+FjI8
	UUoeC5s4WJuCrd0fitrmLxvIHcfL031deTIZWBQx2/XJwUOPSEyvce9LF7YAioWT50ZCGzHdfFl7g
	C5HMSIjpei/r8kFSrH8CcE8kR4mH2ChVypSooIlJOTT7TdTSKJil41pzFY1J9dzhXH1kx5FhvD4W9
	5ytJAxcf/0nXov76hBP5NpDa3hOKqFQqCTSb93w9hcl2aVKLhVhCrZ8f02oRHia8WiPjzg2gE048x
	YzySBOilB945JVfgDKmszU4V9lUKBU6Bwe/oe8lQxOgYA1wYZx+Vg9d7Dg3KCyo6kMJNbVqmqONDn
	8rzFsi6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPMl-00000005LAw-1QBI;
	Thu, 30 Apr 2026 11:15:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPMg-00000005L7n-21cc
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Apr 2026 11:15:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AA234436C
	for <linux-mediatek@lists.infradead.org>; Thu, 30 Apr 2026 11:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71298C2BCF7
	for <linux-mediatek@lists.infradead.org>; Thu, 30 Apr 2026 11:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777547729;
	bh=WbVGwnhMK3bVP2dooowUwCI372Q+68vRv53kKfxGrKw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pJDvayFIFBrQ48FV6k0MBJTE7omjJhnCiCKI627UOkdRQaAlxmgxjw/VBYEY2TFZh
	 M75KGSB6FdqISbX8ea1mMWiz+u4xP/OMeXC9zsm1gApiA8nigQ0ib1TzQvamF82WMS
	 gZaidfIliv/1zOe7DntZ9niRlR9DFGCcKjHCxBUVHJzaqOMLqhnCZsZXZG3xgOiu42
	 eIRRcQ0GilVVk2LUHKddLLkgzL8D6e3EiyYzNkzR0MMZXghLMs1iM1sZOx9bS55d7x
	 BY22wMlZaVFDU8tEhDKpCLHrDllX34Ui7ck037ifV8eZvSteD/xP+xRkLC0K1x6PqD
	 jUIkfuOTEZ+/A==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a74ac8b40aso891749e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Apr 2026 04:15:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9TR3EkMmbesqsvVuaEDW2HdJ+sfgM39lbPhuj9xf8Ktilr5FCTMsppdle33P3u332RYTeZxDxrzx4ZrNuDHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVI5vnBAP00w4Lx19BEvBAe1aC5eejY4LYHPhRkUJm+Y9KtpOu
	KSE31scSB57FGHETQKn7tFjRjDdp8msa91BhzCjQp6fspzgzesw32AcTtVu6SVNT8Wovhd5fNLh
	0v9Z3wdhMlPfU50pxCuQvjxSUHfo0KMw=
X-Received: by 2002:a05:6512:3b14:b0:5a4:a4c:658b with SMTP id
 2adb3069b0e04-5a8522dd8f1mr808421e87.40.1777547728018; Thu, 30 Apr 2026
 04:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260427021148.2049555-1-wenst@chromium.org>
In-Reply-To: <20260427021148.2049555-1-wenst@chromium.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 30 Apr 2026 13:15:16 +0200
X-Gmail-Original-Message-ID: <CAD++jLnKC4o6e2p0qJ6_2s2CfK6y+yKTw8gcGAJQnpOOmML_QQ@mail.gmail.com>
X-Gm-Features: AVHnY4Ink9nKnmzrWklC6PMDhHtyVmdHrdEJDfXlUWMPbQa8lwjP3yaXXRPJm1Y
Message-ID: <CAD++jLnKC4o6e2p0qJ6_2s2CfK6y+yKTw8gcGAJQnpOOmML_QQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: eint: Drop base from mtk_eint_chip_write_mask()
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hao Chang <ot_chhao.chang@mediatek.com>, Qingliang Li <qingliang.li@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_041530_558140_46531AE5 
X-CRM114-Status: GOOD (  10.03  )
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

On Mon, Apr 27, 2026 at 4:11=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:

> When support for multiple EINT base addresses was added in commit
> 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple
> addresses"), mtk_eint_chip_write_mask() was changed to write interrupt
> masks for all base addresses in one call. However the "base" parameter
> was left around and now causes sparse warnings:
>
>     mtk-eint.c:428:44: warning: incorrect type in argument 2 (different a=
ddress spaces)
>     mtk-eint.c:428:44:    expected void [noderef] __iomem *base
>     mtk-eint.c:428:44:    got void [noderef] __iomem **base
>     mtk-eint.c:436:44: warning: incorrect type in argument 2 (different a=
ddress spaces)
>     mtk-eint.c:436:44:    expected void [noderef] __iomem *base
>     mtk-eint.c:436:44:    got void [noderef] __iomem **base
>
> Since the "base" parameter is no longer needed, just drop it.
>
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple ad=
dresses")
> Cc: Hao Chang <ot_chhao.chang@mediatek.com>
> Cc: Qingliang Li <qingliang.li@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Patch applied because looks correct!

Yours,
Linus Walleij

