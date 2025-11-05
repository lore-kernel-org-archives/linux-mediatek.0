Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEBECCFA0D
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 23:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D0kokU5//KWLv46Qc8KmXBDCAx+wArTKEtJNhKO1Ny8=; b=Gaf4gpa1XeWM2xtfoK/9s/hEps
	1voogHx1nJIQ4MvA7nCSiEwNTG2QdOpvMRAmCb/AdEQmVhU2JMidbgpfqhLTngsMUyXONHC/0+gDn
	NWqQy0TS6bet1jAlXYf2hYMd3E/idfg4ABZMpMK0Xv+3STOsTZSKBzNa3Twxbt0vYhiqNEzoC3GqI
	n1UZHsKKM/UBwrG8oGyAezQvPwduC+bFiPECEuvyKy0OMPC3JDzwahQ06X6ReQFv5uu+Br+mqkNYp
	C+LQI5pjjUgbQZZKyMXfUPiMypHWUQ3XLGFlek5OD90H6LLiwdVR2JpVMIu5oe75lu6htQRRZfr1j
	tSDLaKzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGnCR-0000000Eckm-14J1;
	Wed, 05 Nov 2025 23:45:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGnCO-0000000EckO-3aHk
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Nov 2025 23:45:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 432BB40842
	for <linux-mediatek@lists.infradead.org>; Wed,  5 Nov 2025 23:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258E7C16AAE
	for <linux-mediatek@lists.infradead.org>; Wed,  5 Nov 2025 23:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762386356;
	bh=kmlw6NJFheSDcopMkyos4Z17yXYv5U4n7W4OWmXt4sM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H99/wWL4ywwfvfthpM3NszId1H2YuUeo6zvkhZOeAySAW/5NchyHwxXRqllmwqz1i
	 cmpMNS36gxbTBAo3HiKCb0N26fMYN0atZ08VSjczy6nrxohi+obc+O3GmKqLXd2gKF
	 dX8uCb3Is8c2q30XccOYmcLkuewxiTbWbxNa+tSHXZw4mwbqloRVNlNYrpIGNzy8yi
	 qnIedvz019BYMe6iRxJ2uXU5W+OuwtqUze5WopHlMYgy0xhiPiypmaNCGUSFrqWt8s
	 lgxaA3xcsFvHj+cFdGKqTdW6qk38/Lc96g56Fh3zSCORpaNY31VLUsFEuZ1xVb55OW
	 cpkbONV1TKRsg==
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7a9cdf62d31so558112b3a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Nov 2025 15:45:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXv7wcMmaxcuXPsfM8b73/uez9ylci4at45GycBlYRWklqW7238zeIxU1Wy9C+GtCtEuSzG8R7QHVmOMB/5Xg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2eG2gqhv3voZA0n9qlL/udMgX7B7OqGOTIPJTPoB30wl+sl8W
	2czaxOmern1tmWgjgu0stgdFz34lS3IM7navZoq+9VQ+ckKGR64Ls1Njy+g+/E6pww3c+pfVZ2y
	TSjfkD340MZoIKzjujrmwIEk6b9cR3Q==
X-Google-Smtp-Source: AGHT+IE5EO4UpE8S0+YO1+WGotybDTqSJIt+1Z2T6glgMpYBqoAX7IdmXZPLPEmNGHkEgbnaXMCloII3b/yhWYPJdxU=
X-Received: by 2002:a05:6a20:3d8e:b0:34f:28f7:ed79 with SMTP id
 adf61e73a8af0-34f83f04a23mr6525532637.19.1762386355745; Wed, 05 Nov 2025
 15:45:55 -0800 (PST)
MIME-Version: 1.0
References: <20251105151443.3909-1-chunkuang.hu@kernel.org>
In-Reply-To: <20251105151443.3909-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 5 Nov 2025 23:45:43 +0000
X-Gmail-Original-Message-ID: <CAAOTY_-=fAta1rHe=4P+vDwuG46hHJ4Fn1TR-fxT_94bw6ggLA@mail.gmail.com>
X-Gm-Features: AWmQ_bn-Dqm0KiWoV_ruhiTNsTDA36HWqkX0RUySrxeI1IZE3ad0qjUgj-CvtTc
Message-ID: <CAAOTY_-=fAta1rHe=4P+vDwuG46hHJ4Fn1TR-fxT_94bw6ggLA@mail.gmail.com>
Subject: Re: [GIT PULL] mediatek drm fixes - 20251105
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Simona Vetter <simona@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, 
	"Ariel D'Alessandro" <ariel.dalessandro@collabora.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_154556_960407_6ED8C0C5 
X-CRM114-Status: GOOD (  11.19  )
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

Hi, Sima:

Sorry. I don't know you have changed name.

Regards,
Chun-Kuang.

Chun-Kuang Hu <chunkuang.hu@kernel.org> =E6=96=BC 2025=E5=B9=B411=E6=9C=885=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=883:14=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Hi, Dave & Daniel:
>
> This includes:
> 1. Disable AFBC support on Mediatek DRM driver
> 2. Add pm_runtime support for GCE power control
>
> Regards,
> Chun-Kuang.
>
> The following changes since commit 926d002e6d7e2f1fd5c1b53cf6208153ee7d38=
0d:
>
>   drm/mediatek: Fix device use-after-free on unbind (2025-10-28 14:56:16 =
+0000)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git =
tags/mediatek-drm-fixes-20251105
>
> for you to fetch changes up to afcfb6c8474d9e750880aaa77952cc588f859613:
>
>   drm/mediatek: Add pm_runtime support for GCE power control (2025-11-01 =
14:14:56 +0000)
>
> ----------------------------------------------------------------
> Mediatek DRM Fixes - 20251105
>
> 1. Disable AFBC support on Mediatek DRM driver
> 2. Add pm_runtime support for GCE power control
>
> ----------------------------------------------------------------
> Ariel D'Alessandro (1):
>       drm/mediatek: Disable AFBC support on Mediatek DRM driver
>
> Jason-JH Lin (1):
>       drm/mediatek: Add pm_runtime support for GCE power control
>
>  drivers/gpu/drm/mediatek/mtk_crtc.c  |  7 +++++++
>  drivers/gpu/drm/mediatek/mtk_plane.c | 24 +-----------------------
>  2 files changed, 8 insertions(+), 23 deletions(-)

