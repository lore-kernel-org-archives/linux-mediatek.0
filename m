Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC24C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 09:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZ1f3Q6BEnZTJT1SiGVBJeWSactvAosCQCCnwWRZCiM=; b=t8gik90uA4xvGJjhcIO7Bsm9Kz
	aVjHJrmwlvVZZgDl+CkOy2lkSVxsKVY6eE9CymgtF3Xju5AKwevb2BDz6OvkdhjHg//uM9/TNTi8+
	kpIO/YSM2WVr8qPYTvwhQVqWJinStEDeR2+vnwvshEEyEi1dMEeCFmELqbPtx2Q5HEpxNDUhafa0F
	AhPlRHfRjqXm7qn/bojp76hOFguoXhV9FkvzYe+5AdHlWVMKkuRsJRWlSXmAQCFOZguf9AaG13eB9
	ZSvOqG3D+M540c9ERzJaBXX+F6xv3TJPdbncJwrXtXlPfe+AxNJBZpsY/85GZq+DGzOTjpRll67g0
	HvZmVGvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1jrE-00000005qdC-1iyO;
	Tue, 30 Apr 2024 09:33:04 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1jrA-00000005qZw-1iHR
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Apr 2024 09:33:01 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-6001399f22bso3729341a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Apr 2024 02:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714469575; x=1715074375; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZ1f3Q6BEnZTJT1SiGVBJeWSactvAosCQCCnwWRZCiM=;
        b=Gc1+YC5QMnaB0Zvx7tnUF/PdQH5kbp70oqG228wFLsuX0iyNl5d4dpvL3O372aZPe7
         HGmSaF5c6MFXSKJMsn04j6Fi2nM67QIio1QJKepoXdW5P4apKrkrrEUSEFFNi5WbtGOb
         RcPriSpfG5Mw/qrMXK2Lj971Xq99j6+JOS+BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714469575; x=1715074375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZ1f3Q6BEnZTJT1SiGVBJeWSactvAosCQCCnwWRZCiM=;
        b=jt+ddd6Myc3Vpnb7rkW+LjLfZrQ/+3UAd5NToW4zUcmfS+p9VYZmjnZ8Akw+0XfhBt
         8+BzUyQ2l8eCApYKo2m30keqKEqKSbHBZdSFZ2N+itTD3kdGvSqtNae7lEeWvUTs0ITp
         VlDnAb9EOfBLK792YJEnGP8ZmLybggGGzOSWGZ7ZwvNVEmk06ATupHhtRrtP1WtVxtJf
         0eZxNkRMMBa/WeYFjFQMLmruSDIk1hQAIVQbxXn7u5oZ6VrnqfgT+XV5VHNH4EyWQG87
         SNPTao3TuJesvt+M0ukeOTEovMwIoBpxDMdNcdspLaMg0rCN8II2PJgM4Y3uTZjYTCqH
         AMOA==
X-Forwarded-Encrypted: i=1; AJvYcCVBDRqCJV4xyCvOsqqTH+8l+TLq246Mgp2olJG6uWXOx8d7kZwbhd+uq1tbgXCLrpdGPC4ZgDfMprWYjLgS69Wr5ZmoIZkEJqv0M9LBPtDF6lIY
X-Gm-Message-State: AOJu0YxqjghjEhOW/4y053I3ioM4m45T+LUyIh+jzcSthDpnSPNQlrwl
	Rke9xzNprcOrrlVjrEK0B1zPRAeAOo5Jzhksm1ZPo4/umKKmgc28f1dCprWSY2CMbmBaNIhbP1L
	599ITDBZKVlyEiKOCgN7RY0GIG9qoW31OzuNa
X-Google-Smtp-Source: AGHT+IHe4n3YPDXbWHUn5ncUC54LJGZHAP4fN5Liyf2K72GnMccBlNkfMj6dDGsch6IeTojaMR/TVjx0GT+KLwkPyEM=
X-Received: by 2002:a05:6a20:9c8f:b0:1ae:84b3:bb5c with SMTP id
 mj15-20020a056a209c8f00b001ae84b3bb5cmr12622020pzb.1.1714469574691; Tue, 30
 Apr 2024 02:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240429095333.3585438-1-treapking@chromium.org> <b3c69a78-78c9-4a15-829b-e4b36e16566a@collabora.com>
In-Reply-To: <b3c69a78-78c9-4a15-829b-e4b36e16566a@collabora.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Tue, 30 Apr 2024 17:32:43 +0800
Message-ID: <CAEXTbpf2HOQj_AxHGbsgOXVF_HyKttL=z7Mi8QStcmuOS+yN7g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192-asurada: Add off-on-delay-us
 for pp3300_mipibrdg
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_023300_524828_11D4F8FC 
X-CRM114-Status: GOOD (  26.06  )
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

Hi Angelo,

On Tue, Apr 30, 2024 at 4:17=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 29/04/24 11:53, Pin-yen Lin ha scritto:
> > Set off-on-delay-us to 500000 us for pp3300_mipibrdg to make sure it
> > complies with the panel sequence. Explicit configuration on the
> > regulator node is required because mt8192-asurada uses the same power
> > supply for the panel and the anx7625 DP bridge. So powering on/off the
> > DP bridge could break the power sequence requirement for the panel.
> >
> > Fixes: f9f00b1f6b9b ("arm64: dts: mediatek: asurada: Add display regula=
tors")
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >
>
> Uhm, there might be more to it - I don't think that this should ever happ=
en.
>
> The regulator is refcounted, so...
>   * Bridge on: panel goes off, but regulator doesn't turn off (refcount=
=3D1)
>     * Panel resume -> sequence respected (refcount=3D2 -> wait -> more vr=
egs, etc)
>   * Bridge off: panel is already off (refcount=3D0)
>     * Bridge resume -> refcount=3D1, no panel commands yet

The off-on-delay could be violated because the bridge driver does not
check the delay.

>     * Panel resume -> refcount=3D2, wait -> more vregs, etc
>
> Can you please describe the issue that you're getting?

The symptom we observed is that the device has a small chance to
reboot to a black panel, and we think the panel's unprepare delay (the
time to power down completely) might not be satisfied because the
bridge doesn't check that when it enables the regulator. Even if the
regulator is enabled by the panel driver, the delay can also be
violated in the following sequence:

* t=3D0ms, bridge on: panel goes off, but regulator doesn't turn off
(refcount=3D1). The .unprepared_time in panel_edp is updated
* t=3D300ms, bridge off, regulator goes off (refcount=3D0)
* t=3D600ms, panel on, the panel driver thinks the unprepare delay
(500ms) is satisfied, but the regulator was disabled 300ms ago.

Did I miss anything here? Or should I add more detail to the commit message=
?

>
> Cheers,
> Angelo
>
Regards,
Pin-yen

> > ---
> >
> >   arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/ar=
m64/boot/dts/mediatek/mt8192-asurada.dtsi
> > index 7a704246678f..08d71ddf3668 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> > @@ -147,6 +147,7 @@ pp3300_mipibrdg: regulator-3v3-mipibrdg {
> >               regulator-boot-on;
> >               gpio =3D <&pio 127 GPIO_ACTIVE_HIGH>;
> >               vin-supply =3D <&pp3300_g>;
> > +             off-on-delay-us =3D <500000>;
> >       };
> >
> >       /* separately switched 3.3V power rail */
>

