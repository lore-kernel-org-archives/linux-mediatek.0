Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C539CC3DA59
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jul 2024 03:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUQ9SOJBhew070r/TnrnXwfyJonEGUyPXY5zsdc2e5w=; b=hTmmMNKKpQrGv8fmnPt7RGNuFP
	EGp0XtQ53NzDgjAXCPP+ksqWG5H+OLJ2dbORBybXOTJZdrJEv0QQsSEhJFp38DbQfVmOca896lcq2
	1FawBM2P/916H1gYQ1wWho9tQ2c/WrtA7bVxii/7tgKjOxTMast0LWrr4rIvjS8EGuOF2364rDZ/4
	sA0Zvlvz6ZKs9Hositx7SKngQ95aB56Th2vKyAS/8GOazFqTgMwqnScycQzN1WFe7bzVIAacXRvsc
	wxhUYUh7UH5kqiMBSS4hGdAfcT+OKp8InXAiSidWH53BnkgfHdGrkrScH1tEFIK3g+LDY978CakQG
	bQEK5unw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVjsa-00000008DY3-1E0z;
	Mon, 22 Jul 2024 03:38:28 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVjsD-00000008DTD-2A3G
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Jul 2024 03:38:06 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-4ef2006dcdbso1256588e0c.3
        for <linux-mediatek@lists.infradead.org>; Sun, 21 Jul 2024 20:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721619483; x=1722224283; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUQ9SOJBhew070r/TnrnXwfyJonEGUyPXY5zsdc2e5w=;
        b=MIr850ZmlLcdgXyPOsAbHHTdIut/Ozh1sCgSunGAA+1Cv1P9v9ZHD/bDhB81cB2asc
         pmUgAt2WTh8tD9OceYLqpJ3tY9ivdWzZwAdwGrnoNWwbhP2KcStVgrxxbJyNOB3XTfjd
         6nbx69lkHnqx9Hs5O7mm6pdGOOdbpcF1ED7dI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721619483; x=1722224283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cUQ9SOJBhew070r/TnrnXwfyJonEGUyPXY5zsdc2e5w=;
        b=gMK1k+96ArXuBuu1Etan7IKQ0PChVGv+qO0/iFpzpLIqTTZaLyMiOcgSMLnpm3qk99
         X/KfGQkoxBJU1j7LADWofi1fn4VafBDQudmQ+RXBySjNPWs5AP6d1IGosBQuxdie0mxO
         f1tDkoqDqkU6WJ1tZVXg86R09bm3VED2/usZ1M6iCItA5HiVxip0rfZ3i3WN0y/HSotN
         dgOla1gFA/6Bl8FTM4d4XjSPYTBkzFXllI4KWJ3b87Dr/bxISIKLeM/yCakVofaCciIr
         3gRsvZvl/SmQLihQRURx2g/aY/NnlfbwO4QAUl5bRrGbMQVPy5zXv00RDw1dKYrhqdtd
         qaEw==
X-Forwarded-Encrypted: i=1; AJvYcCULJEOe+dbvCRg7JpbqGwUjI6fNrlxESmvHf4XNbDvb2vItNgH0aX+gJw8Vvs/wLXaWg9a2tX2uaQ3HNjrZ8oRkWdiwfqpgbV7CY+pMjtQ6rVn5
X-Gm-Message-State: AOJu0Yy3Rv6rBjNP8GpjAJj1/V2gpEBaCyDBQt8EujwDx06jvsZliNl4
	tUFNHnkxx/5s4444WXn/z0NMy/yl+HIY0zYFQdq61UdRXwHKHZZy5GjoSG0u7gGEE16Wi3tjOUw
	=
X-Google-Smtp-Source: AGHT+IGrzSIb35vDzjUuCiCpg+CWqbbPlUjdQG6mUtaXSHK7oJ7giD1FsGSzRniTeWvvjUmp1/i0sw==
X-Received: by 2002:a05:6122:1699:b0:4f5:2276:136d with SMTP id 71dfb90a1353d-4f5227618d8mr2523569e0c.1.1721619481907;
        Sun, 21 Jul 2024 20:38:01 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-4f51aeea5aesm471799e0c.37.2024.07.21.20.38.01
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jul 2024 20:38:01 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-827113c1fb4so753546241.1
        for <linux-mediatek@lists.infradead.org>; Sun, 21 Jul 2024 20:38:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVeo6QfURq5oTNFbYSryCFnEoiA5+w0GRTrBA9fLm+zoIh6KCITjL/a64g4eA9q7M1edtdO0RH1eDaUJVTlw9r3UCzS+dzNHlpWKR0MgUmTchnd
X-Received: by 2002:a05:6102:800e:b0:492:9927:a5c6 with SMTP id
 ada2fe7eead31-4929927a897mr4197274137.12.1721619480758; Sun, 21 Jul 2024
 20:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240719045823.3264974-1-fshao@chromium.org> <7edb3361-9e53-44ad-82ec-b2c81834b2ea@collabora.com>
In-Reply-To: <7edb3361-9e53-44ad-82ec-b2c81834b2ea@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 22 Jul 2024 11:37:23 +0800
X-Gmail-Original-Message-ID: <CAC=S1nh0c4HL2uUcz_zMmtuJvk7+3iWT5mEtmtpDrp1+nWp2cQ@mail.gmail.com>
Message-ID: <CAC=S1nh0c4HL2uUcz_zMmtuJvk7+3iWT5mEtmtpDrp1+nWp2cQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186-corsola: Update ADSP
 reserved memory region
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_203805_563418_44A6E7DD 
X-CRM114-Status: GOOD (  20.07  )
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

On Fri, Jul 19, 2024 at 5:22=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 19/07/24 06:58, Fei Shao ha scritto:
> > Corsola firmware reserves the memory region of [0x60000000, 0x61100000)
>
> Sorry but if the region is supposed to be 0x1100000 long....
>
> > exclusively for ADSP usage.
> > But in fact, a 6 MB "hole" of [0x60A00000, 0x61000000) didn't get
> > assigned to the ADSP node in the Corsola device tree, meaning no audio
> > tasks can access and utilize that memory section.
> >
> > Update the reserved ADSP memory region to fill the gap.
> >
> > Fixes: 8855d01fb81f ("arm64: dts: mediatek: Add MT8186 Krabby platform =
based Tentacruel / Tentacool")
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > ---
> >
> >   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/ar=
m64/boot/dts/mediatek/mt8186-corsola.dtsi
> > index afdab5724eaa..0c4a26117428 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> > @@ -169,7 +169,7 @@ adsp_dma_mem: memory@61000000 {
> >
> >               adsp_mem: memory@60000000 {
> >                       compatible =3D "shared-dma-pool";
> > -                     reg =3D <0 0x60000000 0 0xA00000>;
> > +                     reg =3D <0 0x60000000 0 0x1000000>;
>
> ...why are you making it 0x1000000 long?

Because 0x61000000-0x61100000 belongs to another existing region,
`adsp_dma_mem`.
It's slightly confusing because the diff doesn't show that directly...
here's its snippet for ref:

adsp_dma_mem: memory@61000000 {
        compatible =3D "shared-dma-pool";
        reg =3D <0 0x61000000 0 0x100000>;
        no-map;
};

Regards,
Fei
>
> Cheers,
> Angelo
>
> >                       no-map;
> >               };
> >
>
>

