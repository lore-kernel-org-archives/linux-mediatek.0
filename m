Return-Path: <SRS0=oumW=7L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB92C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 17:26:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80EA8208B8
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 17:26:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qB4IU0y6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="N4jmxuBR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80EA8208B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8a9ggItxT7oWg4ivUc1bwmUKRw1WfrgXQufSIF5PUw=; b=qB4IU0y6MwWCyC
	uS1g5oMPmBO9VryliVLpxzJnoWEgGB6x/ruu5rc3WPqqRH4RnD5wgV3YhkMNo9kYN8hufTUdzcPWO
	6zucbeA3xpegG0wqVa9HygVHcRYKxcaLRNimqLNmibpCVH31YHVbkxCuBpHWVRdVrCdSBAwEIoHV5
	zfPJA0sEGdFlely7kByDoBuemzi6sIw0s965GbEdwBv6kb4JcHaFPoa3iTkbFEU6jS2eCtE/TwScU
	ewSzSqztkS9enPAoYk/9k38FF2aRLA5n3lDBv3W1I7JzvcAglRbQnW8jct86qf2mdhsw+NVkfm9gV
	ZMiL7J8PUV1dLhcjqrzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeimB-0007nc-P5; Fri, 29 May 2020 17:26:35 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeim9-0007mz-8R
 for linux-mediatek@lists.infradead.org; Fri, 29 May 2020 17:26:34 +0000
Received: by mail-io1-xd42.google.com with SMTP id q8so160049iow.7
 for <linux-mediatek@lists.infradead.org>; Fri, 29 May 2020 10:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z8OACykXjIzxNzzYJDcQomDu+bSaXx9nM76v7J1rnOc=;
 b=N4jmxuBRHu9i+7FFNASFaQjN4abnqiZo4PhPXmtm959rzOBOSm+7Huvel2yMZOGL6J
 L3YDrdL0zD8zpqbQ04ZWiR4x4O3kagbBm6APPFB13kSMk3H1QROQY+2vIF1ZldyGqRDF
 bAqJl18vR4TiVZQr/619DbLOoqewiS/BKYAMfJOp9Jj+S+C/J3VS8STRCBBSmsSkaksb
 ApY3WPl8R/Eic5rKAOi0eDW1pnrW2e+US63v/lpJ9u7BBUa2IFu/beqHQ72ET5FqhBIi
 lt/RcnyklXiCgf7y8HknKN3BSNFEwTssq3fjHwaUyqIQmXDKR6d1H5VWpqgkblSyq2n9
 SueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z8OACykXjIzxNzzYJDcQomDu+bSaXx9nM76v7J1rnOc=;
 b=X4mAj+C7wfsf0+SWC8hj39yFCvDABP+ilIMPJCiSbnH27THIRlwk4yCDnsjtyI2RQU
 9E14VUbRQXEAKvbEIVWGTtt5CobP5hKziIy58IFF//YnQ4Xr0gsdNZx5jTnlXXhznpJk
 jsv0uWrs4Ht+IDknmPVnvHnfKDs0PmQHKyR6qAA/tZcAEVvPO8HIRy4ZMdd3SpQCSbJc
 6ZxKfC43/oFzpJ27nXO7xHEwb8y6Id5zIfV235oV4rjbTW2o0oZ0jTruZ8362j5o7h+S
 ZEuNFK7gOFJ9tTNWqQsUZnm36KRw6yGesBMyijdH7vgFWXb5UN6G9IG/sM6L5VysQXQt
 TH6Q==
X-Gm-Message-State: AOAM533MsNxN5UfcZkCoQ+1HLRO4dRYMEc9mUfysMzlmBcaK4poEb8z5
 e8h9vORP3dpwfwxIDA3xfN074MSmNc8h6RhVJsPEiw==
X-Google-Smtp-Source: ABdhPJwbz0o/jI3+dVTtyWVPjpigszAYMfgQJZaWm9/WbEOU+YXtNt0QJXWVbd3dmvHCuLQo0DqWifEdtyW1qHfQRg4=
X-Received: by 2002:a6b:38c4:: with SMTP id f187mr7311468ioa.205.1590773192031; 
 Fri, 29 May 2020 10:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <1590750293-12769-1-git-send-email-jiaxin.yu@mediatek.com>
 <20200529110915.GH4610@sirena.org.uk>
 <CA+Px+wVSwJK-=75chKLjSEe3bPRtV2wD95W5D_pdR0Pw0G470A@mail.gmail.com>
 <20200529130539.GK4610@sirena.org.uk>
In-Reply-To: <20200529130539.GK4610@sirena.org.uk>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Sat, 30 May 2020 01:26:20 +0800
Message-ID: <CA+Px+wVhXoU=BdBmMW0sdPtUrnQH+Kn6dkFdW-n67qEDGceCEQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt6358: support DMIC one-wire mode
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_102633_307938_5D56C182 
X-CRM114-Status: GOOD (  10.45  )
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
Cc: Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 howie.huang@mediatek.com, Takashi Iwai <tiwai@suse.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, May 29, 2020 at 9:05 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, May 29, 2020 at 07:22:43PM +0800, Tzung-Bi Shih wrote:
> > On Fri, May 29, 2020 at 7:09 PM Mark Brown <broonie@kernel.org> wrote:
>
> > > What is DMIC one wire mode?  This doesn't sound like something I'd
> > > expect to vary at runtime.
>
> > It means: 1 PDM data wire carries 2 channel data (rising edge for left
> > and falling edge for right).
>
> I thought that was normal for DMICs - is this selecting between left and
> right or something?

Not sure what is the common name but use the same context here.

MT6358 accepts up to 2 PDM wires for 2 DMICs.
If one wire mode is on, MT6358 only accepts 1 PDM wire.
If one wire mode is off, MT6358 merges L/R from 2 PDM wires into 1
I2S-like to SoC.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
