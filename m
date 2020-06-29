Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA7BC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 07:38:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A28623142
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 07:38:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xLTWgCIo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hO7YgCFE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A28623142
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iF52tFdpx1HBRG8FROESVoJeQuI7TQ7i1djQ1EvvyiM=; b=xLTWgCIoU7mREzg3pgXmDGtbE
	DLcCN2OdZEeAeit2xk1irGgzk+2n1xY3byJcjLpaZdUh2oPhjAkQFycImwS543Lg0y90V53f3F81F
	LZJXNHswz4mG4f5KMymKJQIAgXECAK/QKNf4P0R+eolgjNBZvLtaEp+xReh54tp0qFgFqoU1na6S8
	UhdphOQqVDfbnWALS8WL2Dqmd0t3Nqw7FoXqAQc+oCmKltoi0QYDAkB5AcX1WfQ3Lqr5TYzMm4Smh
	inil7ExRiw1OQIUcZQxlcd5BcVFio5PxVCZM9EP6+gNscgF+GdDBUwqzHkK4ndjigDtwjr8FzPAzF
	stbt4o1aA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpoMm-0004Ex-JI; Mon, 29 Jun 2020 07:38:12 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpoMk-0004ES-SI; Mon, 29 Jun 2020 07:38:11 +0000
Received: by mail-il1-x142.google.com with SMTP id e18so2929508ilr.7;
 Mon, 29 Jun 2020 00:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zTLnTytmqwPo2QrVotAhwjgdIikFCW3Y9V9c+Ul628k=;
 b=hO7YgCFEdPYQrvp3kFZV2OXX7bnz/HWxL/I8M9F3srON/2EpwrjADVZaSmO3wpR10e
 xShjxgypbemlvSD4Bz2KZS86mWY4elE17aaWa4OOf7VRrcaMFZDnWR2kmmozvactxe8V
 vM+6Leu3iiG3sATYROu72hMLLm2MvJ+916wUcSNvcmS/VTVDrNw4lnWf+BAIOfmSaLzi
 0DWQpAEbhPYF8NHE2JoIR9A36MthArCCdlrbViQbFS8mqlUIyyL6FA3raDQc22IukKk8
 hRi7ulSD+AEVcXSzY1xkQF/eQcZYVfkoF4U4jwu4IMEjvmBXghP0hrkbuxAD1I/tQvV6
 mi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zTLnTytmqwPo2QrVotAhwjgdIikFCW3Y9V9c+Ul628k=;
 b=RpWNAtBZbylYwc2dyMXwhx3kmclYKuhx0/0wC/BtLarYwsVgUwiUoFgYmxHc/V9AVj
 FMXbqpjhesNqpSNxvLgUr7H/cFBIybw0v0Wz6nLdmBEGm4V3lHEAmvaGLACAxsGAkDbb
 C9wZeLrVgS/h/mWu6aGyG2lMU4zgzd1sOUJMuZBcMN/3eHSbQrwP6xmpZYvLdvOsu8Lg
 t2Y49bePuFfOlSSH0w8i/GjfLpBEiK12Wjg/dDCRn52kJ5Jcihl5PY/TRnkDGh84Juk5
 BDTHyrp4CPAfjOKas62VB+w+b0RyhM6skzM1YboeOHbXPgFGam4Nn/uHWXSflhqo6794
 nVBg==
X-Gm-Message-State: AOAM532vvMawtKTFzM5yK7KxBpzUcdBJD1TR0wwpnfKpxBTgBSfjgTi/
 2p3Jf5SjDWqpsmikK6m+ML71Dy48zFOhJYEE6Fo=
X-Google-Smtp-Source: ABdhPJzyfEuSvsvqAyieDmK4mMBIE5np8Cjw7UhIz6L0NfvR0InXzI9MesOfgOM7McMyA0mnJHM4y1HqDRacRIX8BDg=
X-Received: by 2002:a92:940f:: with SMTP id c15mr15673200ili.204.1593416287611; 
 Mon, 29 Jun 2020 00:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <1593410434-19406-1-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1593410434-19406-1-git-send-email-chunfeng.yun@mediatek.com>
From: Peter Chen <hzpeterchen@gmail.com>
Date: Mon, 29 Jun 2020 15:37:54 +0800
Message-ID: <CAL411-qVjxYk7f+b74XHfj7jpxALS4LYUKe0XdSfwRZcQibNfA@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: mtu3: disable USB2 LPM
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Markus Elfring <Markus.Elfring@web.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jun 29, 2020 at 2:04 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> A SuperSpeed device shall include the USB 2.0 extension descriptor
> and shall support LPM when operating in USB 2.0 HS mode(see usb3.2
> spec9.6.2.1). But we always don't support it, so disable it by
> default, otherwise device will enter LPM suspend mode when
> connected to Win10 system.

Linux also supports USB2 LPM. Besides, USB-IF CH9 test will check
LPM support if the device is USB 2.1, how could you deal with it?

Peter

>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/mtu3/mtu3_core.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
> index 9dd0216..50d6a40 100644
> --- a/drivers/usb/mtu3/mtu3_core.c
> +++ b/drivers/usb/mtu3/mtu3_core.c
> @@ -604,6 +604,8 @@ static void mtu3_regs_init(struct mtu3 *mtu)
>         mtu3_clrbits(mbase, U3D_MISC_CTRL, VBUS_FRC_EN | VBUS_ON);
>         /* enable automatical HWRW from L1 */
>         mtu3_setbits(mbase, U3D_POWER_MANAGEMENT, LPM_HRWE);
> +       /* always reject LPM request */
> +       mtu3_setbits(mbase, U3D_POWER_MANAGEMENT, LPM_MODE(1));
>
>         /* use new QMU format when HW version >= 0x1003 */
>         if (mtu->gen2cp)
> --
> 1.9.1
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
