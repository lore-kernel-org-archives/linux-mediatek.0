Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9821FC5AD55
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Feb 2026 18:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brWaA6cS9nnxcx7TnhC5xTkVkOlNT9sYmXd5f9+hT/Q=; b=ZftsnPEwpBCacjtzS661t7CroQ
	lAbaqxqyb4Z7LCve5xq09hbFIRt1a1h5smE8I20aHHelX+5LDgYF9O0KiAIR6gFg6T5O1jTynEmRb
	JoVurXUd5FTLtCgqowebZ2+qZUM3LhhRmlF5lRxQkie2ZiCa2myL0ChQJNcdTybpCeTwekLnlEmaQ
	Ii02oKjbgwM/yt/5huCfOKLPJRom4MwiE9IerEoDWc9SCTvzLqrEwnw5VMx8hf/aFzcaZJM+YRXaf
	l+lKNE3XcjQER0NMBlE5NCAGYRxUVSGZoJfIUoPIVT4gBvkaQLSmdUNwuR4twzRzbCbdy4S9wRv0t
	TrQVLN5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtVHY-0000000FSB2-1qTb;
	Fri, 20 Feb 2026 18:31:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtVHU-0000000FSA7-37Re
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Feb 2026 18:31:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 594EF44461
	for <linux-mediatek@lists.infradead.org>; Fri, 20 Feb 2026 18:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 367CAC19424
	for <linux-mediatek@lists.infradead.org>; Fri, 20 Feb 2026 18:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771612270;
	bh=jtxdnsFoaJ7ZZ3Cqn+tSp7m5G53dJk4cSH6H7At3v18=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a6uJkrPwgYJUifSyCTS6qLRblT3UuP8pQhDCmNAd2ogqq5vgBEsHwq8dslg95Fr1M
	 QE1qEwpPqLbgGyGBKdPG/vP4VNWVDlhs9IYK06sSbep9fCo3MBIK+S5fNuzsKmGmWL
	 h2/G71sxc2mVMfFqbdMY7IclfV225a4CVo51pykG11YGDk2h68oBqoWRHwrOTXN+eB
	 HsbrO5uBlRdRKmL/zJwkT1bbPqJYSawCm7Zz78cgYbavZ+KUnACdpmbZj5IO+i0aRE
	 XNBFYKoaXBvfdKZOJURklibqI4NNg3hc/C/o8ekrxP3QxYh6KF4Kdav65dJaAoaVfg
	 nEz+gA8l7HzDQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-385bc6910eeso22887051fa.2
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Feb 2026 10:31:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVcXchyrAEgmfG91roukYDy4VxiuZxRx5iaxfjxB6J/bJPEBdiQndY32slcmaYLzu1KwCiegk2wWLCtcTLthg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHzgsvssIyW6dKs0l9PdsXzMCkgCrNvqR/4B97iESJffM6FNIY
	KSVzTh2bmDB6FwBdY3dS2l9FsePTAfxTZPRTygZwEcN1lchKAgOdngizgU1gmq/2snLeGS7sn2m
	9g2F+fe2yiq9nqWinkPFGkvfT75T+QPk=
X-Received: by 2002:ac2:4f0d:0:b0:59d:f2a4:3e98 with SMTP id
 2adb3069b0e04-5a0ed88d733mr123595e87.4.1771612268567; Fri, 20 Feb 2026
 10:31:08 -0800 (PST)
MIME-Version: 1.0
References: <20260219231624.8226-1-sean.wang@kernel.org> <0cb6c45b-a5a4-46bf-a73d-97c482da9339@molgen.mpg.de>
In-Reply-To: <0cb6c45b-a5a4-46bf-a73d-97c482da9339@molgen.mpg.de>
From: Sean Wang <sean.wang@kernel.org>
Date: Fri, 20 Feb 2026 12:30:56 -0600
X-Gmail-Original-Message-ID: <CAGp9LzqYB=xPfAuL61xi-ve=f6PZWWaa2gpf50-75yXWee-ZHA@mail.gmail.com>
X-Gm-Features: AaiRm50CGzZAUpdHBs8DARRVcPhWLB2FVeLnVfyzVg436zGF1NWQ8dHO4F1lG6w
Message-ID: <CAGp9LzqYB=xPfAuL61xi-ve=f6PZWWaa2gpf50-75yXWee-ZHA@mail.gmail.com>
Subject: Re: [PATCH 1/4] mmc: sdio: add MediaTek MT7902 SDIO device ID
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, ulf.hansson@linaro.org, 
	linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-mmc@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_103112_824260_7CCCB079 
X-CRM114-Status: GOOD (  14.73  )
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

Dear Paul,

On Thu, Feb 19, 2026 at 5:28=E2=80=AFPM Paul Menzel <pmenzel@molgen.mpg.de>=
 wrote:
>
> Dear Sean,
>
>
> Thank you for the patch.
>
> Am 20.02.26 um 00:16 schrieb Sean Wang:
> > From: Sean Wang <sean.wang@mediatek.com>
> >
> > Add SDIO device ID (0x790a) for MediaTek MT7902 to sdio_ids.h.
>
> Tested how?

Tested on real hardware with successful card detection, driver
initialization and the connectivity.

>
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > ---
> >   include/linux/mmc/sdio_ids.h | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/include/linux/mmc/sdio_ids.h b/include/linux/mmc/sdio_ids.=
h
> > index 673cbdf43453..97cc834fb3d5 100644
> > --- a/include/linux/mmc/sdio_ids.h
> > +++ b/include/linux/mmc/sdio_ids.h
> > @@ -112,6 +112,7 @@
> >   #define SDIO_DEVICE_ID_MEDIATEK_MT7663              0x7663
> >   #define SDIO_DEVICE_ID_MEDIATEK_MT7668              0x7668
> >   #define SDIO_DEVICE_ID_MEDIATEK_MT7961              0x7961
> > +#define SDIO_DEVICE_ID_MEDIATEK_MT7902               0x790a
>
> Please sort it.

I will address the sorting in v2.
Thanks for the review.

>
> >
> >   #define SDIO_VENDOR_ID_MICROCHIP_WILC               0x0296
> >   #define SDIO_DEVICE_ID_MICROCHIP_WILC1000   0x5347
>
>
> Kind regards,
>
> Paul

