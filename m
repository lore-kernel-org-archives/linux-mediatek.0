Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B3BCA0EE4
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Aug 2025 15:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5M0Qos1gNG9BhySlvlZJoHLGeHj6L3mYrNuRgeHmNM=; b=boShdAFTO/uhyDOkmEebKB42zo
	UnjLwLCdtc1Z6zDVbrHk4kpOmVTmGZNSfZkE/yTU0AtIu1lQCTl1dz/gGrrvZI8PpNvuiG7Pyq4Bv
	x7t4zKWEr2EP2UkJMESpGnpsnNsMBVEQ05A9p2ko3VSYwUODeLKABcjXYAj8PnzQYw0cztrF/KX+9
	97x0rvuZzMFLE+Qd0H0uL10mLRdvCJdkY9/ZMEh9jY1xaq9SsGsd+rzHlAFirVtlGUTLxu+eNb4+l
	P53vi54jS9qTMmpPVqXpgQ1m7e95c/o/kIInqpYyzNzjHaTrjoP9DFmVHFjdwlvhcnYVgXDJVyzeo
	ciVLhFgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZsb-0000000HRE4-1Tqp;
	Thu, 14 Aug 2025 15:28:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZ2H-0000000HHYm-2ROD
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Aug 2025 14:34:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1409D44F49
	for <linux-mediatek@lists.infradead.org>; Thu, 14 Aug 2025 14:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6CAEC4CEF7
	for <linux-mediatek@lists.infradead.org>; Thu, 14 Aug 2025 14:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755182072;
	bh=v5M0Qos1gNG9BhySlvlZJoHLGeHj6L3mYrNuRgeHmNM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lQuL1dcfA9Mh6kS+gpg/fIYiacslravvCVw6R20RG0t2oFKNFR8Nl622gdyMn6wmJ
	 knWfr+Ohdof410k4MScHUh2oM+RCxxvJFYcCG9cV4q1zE7pdO4w++3gOEcvBytXuWF
	 yuIF+9ELzArxsSVTyDi4wgrb37Bn+eq5SMH0fRZLDKLlFKKyEmqSwSgruCptRptaZm
	 KF2v42p6XWvW8BUyH1HrqzuVkmtphWs5FzzX7GbB0usgPipI0PGnwR62+U66hMRNDW
	 ExQQ4KhIZON93Vv2DqFAfTU8grgfHdZIPiolbgN8AfxyIPsYXyhR66BnepgDrpzeSH
	 /hDeXieIhlwwg==
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-32326789e06so941129a91.1
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Aug 2025 07:34:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW5/CXd6x+twHy1lEyLixHHLS5ZPBDxGSIlITxk+DgaucKkL9OhsLkgmxcObrFSHAK74HCjwnhH0R/d+85lEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZkJ3JFFpK53mFQSeEEyO9+Qjn4c3/nLpigcmva8Ckynz1EPSw
	UQwRLkcvBX6wTJ8XwjpPdOLcW9mKLeLoxzGaCtHFvWtzzszxYTKsRIIhquTh8BuVtSM+Nkq4Y4j
	75byqZlqo51v6MGD2Aqu2r6FySt/5eg==
X-Google-Smtp-Source: AGHT+IFZBGHiyx4R8I0ZtPt03HyzJ/h+SHoNTrWb26RWZtlcu/LuBo3basMRoZchAXRPaCN5XUhmJgnvc08y4GlhQHw=
X-Received: by 2002:a17:903:1ae4:b0:23d:f986:6472 with SMTP id
 d9443c01a7336-24458a65075mr40000145ad.25.1755182072478; Thu, 14 Aug 2025
 07:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <c8a64686-f1a2-44f1-9d13-fd5b4f923e0f@molgen.mpg.de>
In-Reply-To: <c8a64686-f1a2-44f1-9d13-fd5b4f923e0f@molgen.mpg.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 14 Aug 2025 22:35:41 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8vLqU30L3+ijYJPLrioRsUwVwJAeumtVYfRJ9e5tjp4A@mail.gmail.com>
X-Gm-Features: Ac12FXy0NDb8BGMAM7k-PNcb_9DgKIcM0T0DGazslGHWEE6YexmPG9CoPZcHXNE
Message-ID: <CAAOTY_8vLqU30L3+ijYJPLrioRsUwVwJAeumtVYfRJ9e5tjp4A@mail.gmail.com>
Subject: Re: MT8183: Only maximum resolution 1280x720?
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_073433_666710_B24F9B4E 
X-CRM114-Status: GOOD (  17.52  )
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

Paul Menzel <pmenzel@molgen.mpg.de> =E6=96=BC 2025=E5=B9=B45=E6=9C=8825=E6=
=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=882:01=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Dear Linux folks,
>
>
> On the older MT8183 device Lenovo IdeaPad Duet Chromebook, running
> ChromeOS with their Linux 5.10.x, connecting a 1920x1080 Dell monitor to
> a USB-C adapter using HDMI, only the resolution of 1280x720 is
> configured, although the adapter also support 1920x1080. It happens with
> all adapters, for example, LMP USB-C mini Dock [1].
>
> I reported it to the Chromium OS issue tracker [1], and the last comment =
is:
>
> > It seems the display pipeline for the internal display (DSI) has
> > higher clock rate. Also, the resolution support depends on the
> > refresh rate as well, so the claimed 2400x1080 might only work on
> > lower refresh rate.
> >
> > For the external display, the display modes are mostly rejected by
> > the pre-defined max_clock_khz in mtk_dpi.c:
> > https://elixir.bootlin.com/linux/v6.11.4/source/drivers/gpu/drm/mediate=
k/mtk_dpi.c#L940
>
> Can you confirm this? The font rendering seems not so good in the lower
> resolution, and strangely, playing movies these seem to be rendered in
> higher resolution (or the monitor or hardware does a good job in
> up-scaling).

8183 max_clock_khz is defined in patch [3] by Rex, but this is a
prepare patch for mt8192 [4].
I'm not sure that Rex has test it for mt8183.
Maybe you could try to enlarge 8183 max_clock_khz and see.

[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/drivers/gpu/drm/mediatek/mtk_dpi.c?h=3Dv6.17-rc1&id=3D44b07120291c4b7a67=
22ccb7149f6b9d938cf5a2
[4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/drivers/gpu/drm/mediatek/mtk_dpi.c?h=3Dv6.17-rc1&id=3D38eaef2dca4ec8dfb9=
ea84d9dde0f76da5c8caaa

Regards,
CK

>
>
> Kind regards,
>
> Paul
>
>
> [1]: https://lmp-adapter.com/product/lmp-usb-c-mini-dock/
> [2]: https://issuetracker.google.com/issues/295666708

