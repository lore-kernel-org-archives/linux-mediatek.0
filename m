Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37D8C04FFE
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 May 2024 14:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/o8FZDVnI5HiA6gRp5LYG7KHS1m880+Mz+IUrCObIk=; b=deR8jeZPlVRAVaDgboXPkdC46Y
	O+1PI3D+zfyke8BL6rYTiQsuHdYYdO/GRBKB/JVmFyKXgk4u2jWolAX9BTtOPahMgg69cq4+ima/m
	8WSuEE3bFoamrkMTX1KDCbzNZytldhwAbMhx5K2O4oZyB1Ycz3E9DyWtWcdzmbZEvk++3bv25e8BA
	iNeBCpcW6qz644W4a42Gnel0hKL7KTtcT5aqQEWAE9TAE655L0mR8Ux7c6+V+OSPHw01v5RVPuWj9
	C0cwbWfTtkHStWv+63o6YVVjJUZdb8GMUUdhI61axnoVrQuNRa2myF77ZdDFs01W6Hfma6wUUNCdQ
	hLj4Y5uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4i8T-0000000Fodw-0hXO;
	Wed, 08 May 2024 14:19:09 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4i8O-0000000Focf-3nuU
	for linux-mediatek@lists.infradead.org;
	Wed, 08 May 2024 14:19:07 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2e2c70f0c97so54984731fa.0
        for <linux-mediatek@lists.infradead.org>; Wed, 08 May 2024 07:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715177937; x=1715782737; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/o8FZDVnI5HiA6gRp5LYG7KHS1m880+Mz+IUrCObIk=;
        b=hWSMoHeu+tWlqprjYTrmTOj/9cU3AHwmVNGy4RwwigTnKjhOfw1xU2SQPtHolOIUkN
         NITVBo+1wkVQVuIRKqr1P923Y/M3KJD+8irjZvcdWqoZXOiQIT00S08rUn6WVWhWhFKk
         RbC3lfgvEZ+ZRGwnYYAmkglHf1Ltwxal5DfeQ0A4drIsO1YhXXpX0bN+y7D7inA2+4wc
         5HuMLAXNQxt+wsba5gqkCWiCcXdjHtQG9GQEXhzAy5M8jqfYNdPHURCeyhY4Y5p6tJ7R
         OAPJzg3kBma+4ebQsJ/31vgI4e/6EeTmBpB/qYurYVz30v1NnghzmPfuhZS1gCfXNFHB
         N/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715177937; x=1715782737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/o8FZDVnI5HiA6gRp5LYG7KHS1m880+Mz+IUrCObIk=;
        b=JmpwCRhO2UtcQfbOazRiLcD2K/gUIup6XcEp5/H8WjoiDm6Z3GFsrIG2L0wp4DwIOs
         u5T/ePmXHDQyW8LxEpjItCd016SQBqQVQMrxu3is0k7b2gP0cBfVhInngSbs5GR5TqZw
         Qg4BuMFgfMevQa6OImb+AIIHRi9+I7uV8g+SUD5Vwt8pIBMfPwnPBzbn7a6QlSPMmk6n
         7S7ULxZFdSqeXyzVW9y2CldBytveZVpaBJG2up5WyDLyJz7CpNHwkH/n/w0P++wb8ecK
         MyO95fXGZ5ka4wQwE8iXk/pvxATVbuPYXM0fFCzYKpnxBeP9nUV7Cx9sCy0DlTmN/DWo
         m9RA==
X-Forwarded-Encrypted: i=1; AJvYcCUbPmWPCcZZv218SVEU/ot+utQDpuBIDl9CCIajNu/nc3+70/3d8v03zjIq3tXzlo09El7r8FhSyCcCQNdIOJwnSYT8RtRCW4nfdpZPREoMvxj5
X-Gm-Message-State: AOJu0YwEXPWlInYXuHJsufhHWJB6J137drMv9PZbEG9S8DdkKs43e7HW
	rMXbvN+DYNdZYVLLKpthjlWZySju7eN0xKdGvVRadw9NQEz+XYDLSt9b3ef9AdfhwJHrt92R9Aj
	WLpHfj8cf8iqfBvQTjWXu9walJqU=
X-Google-Smtp-Source: AGHT+IHNN2Jg6pxtqKtrszRPpVa+3MamJp9KOJV7TV2Xe0scCtageC9Am3BgR9TNsbvf9fMR9gNXRhBjiHur8eRokC4=
X-Received: by 2002:a05:651c:617:b0:2e2:be7a:e497 with SMTP id
 38308e7fff4ca-2e447cac611mr13719581fa.49.1715177936843; Wed, 08 May 2024
 07:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240415141922.25055-1-peter.tsao@mediatek.com>
 <171328023414.16225.12939333659144302573.git-patchwork-notify@kernel.org> <0d59ae68-7552-454a-8d01-72c359496901@leemhuis.info>
In-Reply-To: <0d59ae68-7552-454a-8d01-72c359496901@leemhuis.info>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 8 May 2024 10:18:44 -0400
Message-ID: <CABBYNZK1QWNHpmXUyne1Vmqqvy7csmivL7q7N2Mu=2fmrUV4jg@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btusb: Fix the patch for MT7920 the affected
 to MT7921
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, sean.wang@mediatek.com, 
	deren.Wu@mediatek.com, chris.lu@mediatek.com, aaron.hou@mediatek.com, 
	steve.lee@mediatek.com, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	patchwork-bot+bluetooth@kernel.org, Peter Tsao <peter.tsao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_071905_087110_A5F03DD7 
X-CRM114-Status: GOOD (  17.17  )
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

Hi,

On Wed, May 8, 2024 at 4:34=E2=80=AFAM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 16.04.24 17:10, patchwork-bot+bluetooth@kernel.org wrote:
> >
> > This patch was applied to bluetooth/bluetooth-next.git (master)
> > by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:
> >
> > On Mon, 15 Apr 2024 22:19:22 +0800 you wrote:
> >> Because both MT7920 and MT7921 use the same chip ID.
> >> We use the 8th bit of fw_flavor to distingush MT7920.
> >> The original patch made a mistake to check whole fw_flavor,
> >> that makes the condition both true (dev_id =3D=3D 0x7961 && fw_flavor)=
,
> >> and makes MT7921 flow wrong.
> >>
> >> In this patch, we correct the flow to get the 8th bit value for MT7920=
.
> >> And the patch is verified pass with both MT7920 and MT7921.
> >>
> >> [...]
> >
> > Here is the summary with links:
> >   - Bluetooth: btusb: Fix the patch for MT7920 the affected to MT7921
> >     https://git.kernel.org/bluetooth/bluetooth-next/c/263296438807
>
> Hi! 6.9 is only days close and this is fixing a 6.9 regression, so allow
> me to quickly ask: do you still plan to submit this for mainline merge
> soon? Or did you already and I just missed it? Ciao, Thorsten

It wasn't marked with Fixes or stable though which is what I usually
use as an indicator to backport.

--=20
Luiz Augusto von Dentz

