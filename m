Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61737CD5BDE
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2026 06:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vU21y0SHIUC3cwSTRp3cyIqWh6U++lSJj5SFMbybo8s=; b=vpQkzPF15H9KAYwiHw0rFETMkF
	F3t4nm8PkprjmmZd2IigDJiFiD3uZdDM6YyxfgBlVkDkevSwfWbhikccOH237edspSKFiJpiRWJLS
	lUaTGNJIUnhRbfMuM2i5rLnsqZJB9qs1TxHRRZG1vvyyTC0IE1OGPaTRR0+PwB69FP3AGaAIWz2Io
	Riwzjnsf493CzK6fO4mC4b6sy02oU9Gyu8Jfnyy1wxKE/eCCXzccVkyGmYoUtqeiqDy95yEsPAWxy
	ZmS8qHqhRXZWV2UHwLLPXzsPOJoz6E5FQMHkLni60blN867sq9dgtAyYrQb7tAnaS9/ymRYr6nAW4
	6rggmp/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS7O1-00000003NoR-11AN;
	Wed, 27 May 2026 06:05:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS7O0-00000003No3-0Grc
	for linux-mediatek@lists.infradead.org;
	Wed, 27 May 2026 06:05:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1636F600BB
	for <linux-mediatek@lists.infradead.org>; Wed, 27 May 2026 06:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB0421F00A3E
	for <linux-mediatek@lists.infradead.org>; Wed, 27 May 2026 06:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779861898;
	bh=vU21y0SHIUC3cwSTRp3cyIqWh6U++lSJj5SFMbybo8s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=S+ifHbzUmIOr+lzuAsL76dhOFNLokxqTns3dnCJjYZaUJyNrTYZhHW2pMvCK30hBx
	 AD2Gr6o+9qQeYAK30TgQUY+t009I/8Jj+JUzb5giAiLSUFYviHET/KjG4rk4hy+uhv
	 QB6kKh9sPbI6Yt99aJnky8tiHG6VydaWHdZA0PFDu0IQuc62yOSEV9sTQR4t2fZnir
	 iyFZGRgt9KyPoOfOg/c4s+K0YyPBqv5JD5FYehmUUekPj+GYIVkz6AwfrmUrU+qMGN
	 oYs07bPW9pnPDaMhQv5cWJM7b258L8Z4gmTXltdQfXyLE4khPZdDVlcBeBhvYPUbLd
	 cgSBNruWdyRjA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a40502e63bso11359682e87.0
        for <linux-mediatek@lists.infradead.org>; Tue, 26 May 2026 23:04:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/VtZl2S8RA3AaccpCPoPGtcLTkJOqQEEozAyaVLCwGg8RUNlwoAD+7RTWu0ZjuEvNpTUqgeluePNulw/K2Qg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiLJcbwmr8v5K8Mr7/iqgQb2O90vL2MyuV+ZKBQ7yxZ6XsrW53
	QRveQdZ1Ulaa+X/SrkxUvK/4Ve7FTDFOGakWWq/sa+eg3SE6YNE99vGFTDVBpuOCYGlieW3VaF9
	8b3FodAk/JyoYHyWse46YyfoEaTI+pjU=
X-Received: by 2002:a05:6512:114c:b0:5a8:ee4b:7011 with SMTP id
 2adb3069b0e04-5aa323707efmr7257719e87.17.1779861897086; Tue, 26 May 2026
 23:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260326190346.415226-1-lucid_duck@justthetip.ca>
In-Reply-To: <20260326190346.415226-1-lucid_duck@justthetip.ca>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 27 May 2026 01:04:45 -0500
X-Gmail-Original-Message-ID: <CAGp9Lzo4p6=a1rjpGrNPb8Ttk8R25e0WAgP-D_mNEFfytfW6Tg@mail.gmail.com>
X-Gm-Features: AVHnY4ITbiyF4hU0cSqL4c0GJRlAxhTxxdLEs7nBxxlGfRFFyanpVtA0JdWqcLE
Message-ID: <CAGp9Lzo4p6=a1rjpGrNPb8Ttk8R25e0WAgP-D_mNEFfytfW6Tg@mail.gmail.com>
Subject: Re: [PATCH wireless-next] wifi: mt76: mt7925: add Netgear A8500 USB
 device ID
To: Lucid Duck <lucid_duck@justthetip.ca>
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, sean.wang@mediatek.com, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	morrownr@gmail.com, stable@vger.kernel.org
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

Hi Devin,

On Thu, Mar 26, 2026 at 2:07=E2=80=AFPM Lucid Duck <lucid_duck@justthetip.c=
a> wrote:
>
> Add USB device ID for the Netgear A8500 (0846:9050) which uses
> the mt7925 chipset.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Lucid Duck <lucid_duck@justthetip.ca>

Sorry for the late reply.

I ran checkpatch.pl on the patch and got the following warning:

WARNING: The commit message has 'stable@', perhaps it also needs a 'Fixes:'=
 tag?

Could you please send a v2 that drops the Cc: stable tag and uses:
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>

to keep it consistent with the other patches you sent?

Thanks.

> ---
>  drivers/net/wireless/mediatek/mt76/mt7925/usb.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/usb.c
> index d9968f038..e44f0cafd 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
> @@ -12,6 +12,9 @@
>  static const struct usb_device_id mt7925u_device_table[] =3D {
>         { USB_DEVICE_AND_INTERFACE_INFO(0x0e8d, 0x7925, 0xff, 0xff, 0xff)=
,
>                 .driver_info =3D (kernel_ulong_t)MT7925_FIRMWARE_WM },
> +       /* Netgear, Inc. A8500 */
> +       { USB_DEVICE_AND_INTERFACE_INFO(0x0846, 0x9050, 0xff, 0xff, 0xff)=
,
> +               .driver_info =3D (kernel_ulong_t)MT7925_FIRMWARE_WM },
>         /* Netgear, Inc. A9000 */
>         { USB_DEVICE_AND_INTERFACE_INFO(0x0846, 0x9072, 0xff, 0xff, 0xff)=
,
>                 .driver_info =3D (kernel_ulong_t)MT7925_FIRMWARE_WM },
> --
> 2.53.0
>
>

