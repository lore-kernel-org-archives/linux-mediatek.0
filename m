Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B62BCA5510
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 08:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6OWBjAU1cxgbQTAWQU05/QpiwZ7u1WWxVUcWDMnlOc=; b=08pyy/+8FKrhXTpFj+QY2VkWzc
	XMqdejiX6ERZiIq0se2/6nlpAqsdi/rl0WSfkWUPlnNSTrXtJyseqd9linzYCnh735NQDl6LiaR+p
	JZOOc8jU7Upo1VYPMhJGFaLvWeI53Wb5QB1mAPFPzmCaJrV9WH4znOHnXR8/NuinZv0D+zzm/mqDT
	bzqS8c6akCVidBrQUmi+BVZv6dCdLQ1vi/KHtHZbu04P0Au8nJBm/aZ7XChx8A7f4ntZbkDP6ioXf
	0JEb33vVtgfndOaFzJwZKq66+vLU5YAUrh1UmMSFUx7bjeeo39rqHSVlzGwWnPFGcD1aV3blGO70d
	2bW0FtKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLZO-005BeW-0v;
	Wed, 13 Sep 2023 08:49:58 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLZL-005Bb7-2o
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Sep 2023 08:49:57 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50078e52537so11115773e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Sep 2023 01:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694594986; x=1695199786; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6OWBjAU1cxgbQTAWQU05/QpiwZ7u1WWxVUcWDMnlOc=;
        b=h/bd9vZdyfRPzzjLkFB+ICjntEHabFj8qkxgX/swTSUGNyH55NuLRz4g414Rnir4Cl
         El3NEhcf3JZI9SsMPwB50307IRXKhtXEVBRD92WSEY6nJ7mMhitfvNmxQz47tzaGLeRQ
         IyxOyybCEx1KssacoNDEKANj8PUiNdkyq7iqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694594986; x=1695199786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6OWBjAU1cxgbQTAWQU05/QpiwZ7u1WWxVUcWDMnlOc=;
        b=fr0w5qbXSXFPyfmCs2ItgurF6cHAElKPRQkTFUuVEwLARvzoWk96FXhKe31QnUVDJ5
         cUdYW8rpHt1m5tvSIxSzp0WHRFCjemcfeqafoEbeUi1ODya9oz+ncC3nZT6HY5TMAtbw
         VxFeBRxOTS0AgOojqQUa9CGH8VS2GJmaiFqMIgAx2ZpFJjBSzJXcboi4GuYEEeV7ket8
         WlyHEplAntqXaeZaFED7cexj7TzgCO6AE+qd8EQOiGNZANoHc422+dVB8eT/YXdXft2R
         9oIGLjLYnbu/ij6lQ0fHkpeo+VSWaYBsVOKGvis+wzVAdL4cNuiXZVi2ZLOJY4tW+dJl
         V2QA==
X-Gm-Message-State: AOJu0Yxg/HKHAaTM59l8S1JIwkFMn0/BcNPQ5iK5xdNS6I3n2EpvH7Ue
	YUNj78WUy00f96ts/xH+PzSy9mQdRFqQgBqx1WT+/A==
X-Google-Smtp-Source: AGHT+IF326eu3RL07fH01eFNOizyYWT0naK68BbkFy0V0EwYECudUIkcOek+Rh5jKTj4V8DX9iBXAl4EHd5E1HbBXZE=
X-Received: by 2002:a05:6512:32aa:b0:500:94c3:8e3b with SMTP id
 q10-20020a05651232aa00b0050094c38e3bmr1304740lfe.57.1694594986120; Wed, 13
 Sep 2023 01:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230804225813.12493-1-robh@kernel.org> <f8759d51-f808-8082-ceaf-6c6dcaebe2d9@collabora.com>
 <4c99c180-3b79-6aef-6ff2-d430e575957d@baylibre.com>
In-Reply-To: <4c99c180-3b79-6aef-6ff2-d430e575957d@baylibre.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 13 Sep 2023 16:49:34 +0800
Message-ID: <CAGXv+5FWhEab_wHs9+Q3begEBXCVrE4fK1S3sntDuRRE9iGFpg@mail.gmail.com>
Subject: Re: [RESEND PATCH] arm64: dts: mediatek: Fix "status" values
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	soc@kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_014955_937300_04282A67 
X-CRM114-Status: GOOD (  27.88  )
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

On Tue, Sep 12, 2023 at 9:10=E2=80=AFPM Alexandre Mergnat <amergnat@baylibr=
e.com> wrote:
>
>
>
> On 12/09/2023 14:54, AngeloGioacchino Del Regno wrote:
> > Il 05/08/23 00:58, Rob Herring ha scritto:
> >> The defined value for "status" is "disabled", not "disable".
> >>
> >> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> >> Reviewed-by: AngeloGioacchino Del Regno
> >> <angelogioacchino.delregno@collabora.com>
> >> Signed-off-by: Rob Herring <robh@kernel.org>
> >> ---
> >> Arnd, Please take this directly I guess. I think Mediatek maintainersh=
ip
> >> needs some help. Maybe AngeloGioacchino should be co-maintainer as
> >> that's the only response I seem to be getting.
> >
> > Sorry but I've seen this message just now as I've been on holiday in
> > August.
> >
> > Thing is, the MediaTek scene is starting to see more and more code,
> > bringing
> > an obvious increase in the amount of reviews to be done and in the requ=
ired
> > efforts to maintain the MTK bits - and we will possibly (hopefully) see
> > even
> > more of that.
> >
> > If Matthias needs/wants a co-maintainer for MediaTek I'm here and I wil=
l be
> > proud to become one.
> >
> > Cheers,
> > Angelo
> >
>
> I started reviewing MediaTek patches for some months now, so I'm still
> new. From my PoV, I'm agree with Angelo when he say the amount of patch
> is increasing. I support Angelo if he wants to become a co-maintainer
> and continue to do my best to review patches. ;)

I might not have enough time to do a lot of reviews, but if help is needed
for administrative tasks like queueing patches and sending pull requests,
that's something I can do.

ChenYu

> >>
> >> I think for future .dts patches I will not bother splitting them up by
> >> sub-arch because it's a pain to chase down the maintainers to apply
> >> stuff in a timely manner. /rant
> >>
> >>   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> >> b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> >> index e4605d23fdc8..86cedb0bf1a9 100644
> >> --- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> >> +++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> >> @@ -585,11 +585,11 @@ &pwrap {
> >>   };
> >>   &sata {
> >> -    status =3D "disable";
> >> +    status =3D "disabled";
> >>   };
> >>   &sata_phy {
> >> -    status =3D "disable";
> >> +    status =3D "disabled";
> >>   };
> >>   &spi0 {
> >
> >
>
> --
> Regards,
> Alexandre
>

