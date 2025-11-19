Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CCBCF34AB
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Nov 2025 13:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eH934FPkcFZsDsZ+8WMIiblkJpGaRFveAvHRwpG5vZE=; b=sRERdYIzDQEbj0uTvi1nQWVo15
	Zz+TzarhFDP7fn2eanla4Y6qSIpTJn2q70ck3hAwabMwuu/kA+wH45epmBbYYuOfCmTlaAMqwpWdb
	JeO5khlWyoNSg38TvE5fTAnqRhInG8HzFpWtDb6uxZpL+5wDCC4SD6LmwtMAvgh3sbzSvxEWXBTsK
	LO4ecgDZ44JSH8iweZVjB8i1vBtN3vwo5qddnvqP1c1/BE90BxbuziASXrV9jpVhFYbGlli0P/lPy
	INsFKjMaK+Q2FndAWlxDISpaS08FsFfo2FKOiCtlr6nN7ysrUq1tdZB5+R54iiklaLIu4So4w4jYS
	R6F1/NTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhoH-00000003DL0-0OlL;
	Wed, 19 Nov 2025 13:01:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhoD-00000003DKJ-3vMI
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Nov 2025 13:01:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CA4D4328A
	for <linux-mediatek@lists.infradead.org>; Wed, 19 Nov 2025 13:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC3DC19424
	for <linux-mediatek@lists.infradead.org>; Wed, 19 Nov 2025 13:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763557277;
	bh=eH934FPkcFZsDsZ+8WMIiblkJpGaRFveAvHRwpG5vZE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kJhuBq90hbnrfjiLIEnrjlGYvgfFVzKoxLuJc0sHUzU3vc2lkabxmi9+JI3QbNyxq
	 TlBoSy+epAskTx06hyCGZO3B7HI/xn1JL4Aeg6q9J0Th02CbQENDBYYJ5859w4UmS3
	 dQqIzF1Ne7DoIp/n8iYSZlcsYsQIKVBKbqjKXos2xI8kBGISw+F7/XrEpuiyw5OQQX
	 A6D1STew66Dl2Bm2EDabPrbwfcCx69NyLuOg2Flxjl1ImGl3IaHJEwLRFXCMXc+mFJ
	 z/kbv0wSthpCY9fkUXoiHU4ALQmstFiTfveoCoi30LU4TXU4JXzxsyGFk9vsSXEVZm
	 HxlcsW6MmWFzw==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-644fcafdce9so3582521a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Nov 2025 05:01:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUW17g/IA6+baRLwYQHAsP+fFuyjVWwgLrbqwi1hnmRb2vCpbhLUNX/dphxOmwDCaqUaaqOjasAgPgWZ4TVhQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzSxmL/2H72CKVp4KVSegXVJCgKlUg0vaETH26v9QKsB6P5GbO
	WqfKQxUle7y+3rkNZYa7ij/y/upGP9NNzTxed6pmbJ8pFeqc1r7houqkuewi6xjUWVL0fip4Mf2
	KgrVfW8srWc1EwVOECg+WuFVmnD6E+g==
X-Google-Smtp-Source: AGHT+IEGTDYC90AsYi97BZnIB9BW3G+p/VlGw5hEVN7/6LImP73EZAq1WJ9UEaSQR4uzxHPiWCGEsrS4Y4GhSjMkTdk=
X-Received: by 2002:a05:6402:2355:b0:643:4e9c:d164 with SMTP id
 4fb4d7f45d1cf-64350e050eamr18399479a12.2.1763557274937; Wed, 19 Nov 2025
 05:01:14 -0800 (PST)
MIME-Version: 1.0
References: <20251117211306.725678-1-robh@kernel.org> <679c1f30-7c62-484e-b4e5-7351a23f15e5@collabora.com>
 <CAL_JsqK4jvZQTQAXCjPgxBCUiENGKgkgaDgZ680QqL1XpS6bbw@mail.gmail.com>
 <trinity-dfca2931-a7e8-4b33-b722-c22105569d82-1763485361461@trinity-msg-rest-gmx-gmx-live-56d984c6fb-85gcg>
 <bd64ace0-b4c5-46e0-870b-e62f950f4199@collabora.com> <81BC8F8F-91A2-4414-9847-292D974042B6@public-files.de>
In-Reply-To: <81BC8F8F-91A2-4414-9847-292D974042B6@public-files.de>
From: Rob Herring <robh@kernel.org>
Date: Wed, 19 Nov 2025 07:01:03 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+2ZoYYUiZF=ZXdM86Mh=zofnr8-v6hMc6mVwW0G7aTqg@mail.gmail.com>
X-Gm-Features: AWmQ_bnPhPA-Qi7HZmObYeKlsTJrM8CGadg676OBl4gMqQ4WRjkk7EtLhmc-KQ4
Message-ID: <CAL_Jsq+2ZoYYUiZF=ZXdM86Mh=zofnr8-v6hMc6mVwW0G7aTqg@mail.gmail.com>
Subject: Re: Aw: Re: [PATCH] arm64: dts: mediatek: Apply all DT overlays at
 build time
To: frank-w@public-files.de
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, matthias.bgg@gmail.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_050118_012758_71831665 
X-CRM114-Status: GOOD (  17.18  )
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

On Wed, Nov 19, 2025 at 3:26=E2=80=AFAM Frank Wunderlich
<frank-w@public-files.de> wrote:
>
> Am 19. November 2025 09:39:07 MEZ schrieb AngeloGioacchino Del Regno <ang=
elogioacchino.delregno@collabora.com>:
> >Il 18/11/25 18:02, Frank Wunderlich ha scritto:
> >> Hi,
> >>
> >> this looks similar to my attempt i did here
> >>
> >> https://patchwork.kernel.org/project/linux-mediatek/patch/202406080805=
30.9436-2-linux@fw-web.de/
> >>
> >> But in my case i added full dtb with 2 overlays as there can be 2 devi=
ces (1 mmc + 1 spi) at one time.
> >> So usable as dtb for bootloader config without overlays, not only for =
validation...
> >>
> >
> >Please don't top post :-)
>
> Sorry for that :(
>
> >That said, for the target of what is done here, I think yours is nicer t=
o the eye
> >compared to Rob's (not his fault at all, most of the times overlays cann=
ot be
> >applied together, he can't possibly know if that is possible in this cas=
e).
> >
> >If there is really no other solution to that... well, at this point I pr=
efer to
> >have something nicer to the eye, with all of the necessary "evil" that c=
omes with
> >it.

Use 'dtb-' if you don't want to keep the targets (or can't agree if
you want to keep them or not).

> If my version is ok for rob (afair he did not replied on that yet),i woul=
d resend it again with similar for R4 and R4Pro.

Yes, please do.

Rob

