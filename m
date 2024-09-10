Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147DAECE564
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 11:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9FpI4bl+ZGfp9SIboAslOt3vHYJy01BUP4KB+ndZUo=; b=pHTvSvK6RAlvAx0isTLkonaZXz
	DKBvJ5CVreWs25br3qi0tMv2cx8fM5P1BhncS5uKBgZgyrWwYGUK0PMjKng5SiytFLrb5onzvnhHu
	a0TD/PWt0zXmv12yyR+zw9rPuJrIG3Vv/YSXHzlRk33QaQI2vetVoZ5bIo3aR+YQLnMDBsCdkhRtw
	lx0CVUeZkxA3q66uitQ6O2wOUGEEugCqf2eDuJokyK80MWNoKq93teUdsCEprV0hiwX1Tb0UpncZd
	4/onFDGp0Ie6j/itqm4uTemzMy2ACY7qmQPuyTBFSq9OPeNEK5n4IItee2WfDQcIOImHptlvZrMuK
	KpjKQsCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snyjU-00000005LAV-2r7d;
	Tue, 10 Sep 2024 11:08:28 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snyiS-00000005L2w-0NlE
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Sep 2024 11:07:26 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5e1c65eb5bbso1474483eaf.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Sep 2024 04:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725966442; x=1726571242; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9FpI4bl+ZGfp9SIboAslOt3vHYJy01BUP4KB+ndZUo=;
        b=Zx37EhpTInEHCGjmiFL68NxKt3Dv5SOIfaJEYtlpa4AeRRqxdCHe37hQgvKN9HCJSu
         QbeBF1pdw1G2v5coM7L+nZ5v046QenKaPInpAff3PHz8mGSBx/myS8kzimFmLxlodjxC
         bW6EAlnKaODlgRNdIL+LPeJm/VvHwBy6/nia8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725966442; x=1726571242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9FpI4bl+ZGfp9SIboAslOt3vHYJy01BUP4KB+ndZUo=;
        b=P7dwmJ9wgMDcSplcZ9+lrePsiqZAK+cXj7F7QSjGSoWLXOh9gJQe0BVmJC+8/QosqR
         uBbzPqziPzTUfuwd97tETEc5M5zlU6ssALttqrHNvQUZKQVJC9j0T7x5ebO9mImeRLMW
         50FoMExXJcnmVSdpX2QBjNXRGv4ZoM/379nOsYDSgpqDchJqPs9dqvSrbtIUfhZRGI3i
         N/9N/olWp9Zw56ES6giKbJgIX7HEhqeVY0uAeT+LEJgZT9ISWDS2tmhl5MT0sauMxlXE
         NWu2i2SHJ+wQqd+3epnu6A5gQNJZUxUpjGV5T/PMB7lWbAOk3ok+94ilCp1ADki1bgBe
         GSEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9fumIx9TGi8di/IuTFSI7YEX7CALFnrnDJgI5P3aZpYH3qwrVmCXDC7XN2VhUV48Og0uW931W+TFkjxApOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YygM8gdUgU0dpazFvOF8Ihu391NlyQWW/+ziyMvpKtUFe8HddmH
	B1mJ53q2RLQs1p1F63G6sw7mOpjID3rKOiwHK0GoKB//oWA4tS4MvWfMzEqMNiIAmY8D1US+09Y
	Xdg==
X-Google-Smtp-Source: AGHT+IFEESWyuTXKj7jbAoW0Cavfh1YnKvIsl7xy1Y1WK5XXPwtlOuXRvXvKLP7occ62IJaxLiQJpA==
X-Received: by 2002:a05:6808:1513:b0:3da:ab86:bfd7 with SMTP id 5614622812f47-3e037a64d5fmr7070004b6e.3.1725966441749;
        Tue, 10 Sep 2024 04:07:21 -0700 (PDT)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com. [209.85.167.175])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e039a6c857sm1572469b6e.20.2024.09.10.04.07.20
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 04:07:20 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3e039889ca0so1495788b6e.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Sep 2024 04:07:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzh8fsezX5+91wZ6UJnz5PuBtgyj4RX1k44qPSMT9x5FVUnJNrGJI34hR1v5Gbq9jXs6O2y2EQC80m70wVsQ==@lists.infradead.org
X-Received: by 2002:a05:6808:2dce:b0:3e0:3ead:2480 with SMTP id
 5614622812f47-3e03ead28efmr7407710b6e.12.1725966440393; Tue, 10 Sep 2024
 04:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240909111535.528624-1-fshao@chromium.org> <20240909111535.528624-7-fshao@chromium.org>
 <11bc2522-bc10-4dcf-8142-708b57d181cf@kernel.org> <CAC=S1nhiJ=7yAucJsaYKUUBrwrxOVBMB2CF=bFwyLa2o-5RmWw@mail.gmail.com>
 <64cc35c8-30df-4882-a933-f42119270f48@kernel.org>
In-Reply-To: <64cc35c8-30df-4882-a933-f42119270f48@kernel.org>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 10 Sep 2024 19:06:43 +0800
X-Gmail-Original-Message-ID: <CAC=S1ni+pJJZhbjvVqhba5u1JqGv=dZTv8+KH4xburea2AG4Qg@mail.gmail.com>
Message-ID: <CAC=S1ni+pJJZhbjvVqhba5u1JqGv=dZTv8+KH4xburea2AG4Qg@mail.gmail.com>
Subject: Re: [PATCH 06/13] arm64: dts: mediatek: mt8188: Update VPPSYS node
 name and compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_040724_145243_446EEAB2 
X-CRM114-Status: GOOD (  23.72  )
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

On Tue, Sep 10, 2024 at 3:19=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 10/09/2024 07:12, Fei Shao wrote:
> > On Mon, Sep 9, 2024 at 7:41=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On 09/09/2024 13:14, Fei Shao wrote:
> >>> Use and add "syscon" in VPPSYS node names and compatible to fix error=
s
> >>> from `make CHECK_DTBS=3Dy mediatek/mt8188-evb.dtb`.
> >>>
> >>> Signed-off-by: Fei Shao <fshao@chromium.org>
> >>> ---
> >>>
> >>>  arch/arm64/boot/dts/mediatek/mt8188.dtsi | 8 ++++----
> >>>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/bo=
ot/dts/mediatek/mt8188.dtsi
> >>> index 2900d78b7ceb..14e51a11f688 100644
> >>> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> >>> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> >>> @@ -1799,8 +1799,8 @@ mfgcfg: clock-controller@13fbf000 {
> >>>                       #clock-cells =3D <1>;
> >>>               };
> >>>
> >>> -             vppsys0: clock-controller@14000000 {
> >>> -                     compatible =3D "mediatek,mt8188-vppsys0";
> >>> +             vppsys0: syscon@14000000 {
> >>> +                     compatible =3D "mediatek,mt8188-vppsys0", "sysc=
on";
> >>
> >> If this was working before, it looks like this is not a syscon and
> >> bindings need to be fixed.
> >
> > I guess it's because the binding was later updated in commit
> > 26bcd8a53098 ("dt-bindings: arm: mediatek: mmsys: Add VPPSYS
> > compatible for MT8188"), and the corresponding DT update was unnoticed
> > at the time.
> > If that makes sense then this should be a valid fix.
>
> Not necessarily. Why not fixing bindings? Prove that bindings are
> correct, not DTS, first.

MediaTek's mmsys doesn't merely control clocks, it also provides
display pipeline routing control and other misc control registers, so
it's appropriate to categorize it as a system controller over a clock
controller.
As for vdosys and vppsys, they are likely variants or aliases of mmsys
introduced in their newer SoCs.

That description was updated in commit 1a680aa888d6 ("dt-bindings:
mediatek: Update mmsys binding to reflect it is a system controller"),
so I just assumed it's correct without thinking much...

Regards,
Fei

