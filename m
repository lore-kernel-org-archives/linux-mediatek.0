Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B457CECE564
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 05:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FftjutXCeiXVd5sNpriJUhOjNiXDvzsDr14ccTGO5ro=; b=lsZmp6Qwz6jfiGKeDmOSdQQLpN
	RslCez+6y5lSsmtQgr+gX+puoeDVSCV6QRI4vZYijbxnlf0qGVf+x9/cPv5GVJDsXzKrfBsZ4kLer
	w/RDMuikcluiEjHlarT77cmtXSLV1p+RpWSJIAb5FJExQH6U/kWYVbdCqHQnZKRnhYYAPzDmsRFSZ
	bmf+GLb9K0A0WNrg324WwSa7jwK60poELBKCMqWsuDxXNO2NlqERbL3ChqdfXA24+Bskij6milqRJ
	dIHCtkPIOzIryPJD2VTVbkdyU7wN7VsqF9Ifhrv8e9Af7rDRKI3hpd1Z+A5to+TevIan2ETtX1/yG
	+HoZzLRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sntIB-00000004JYM-2bqa;
	Tue, 10 Sep 2024 05:19:55 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sntBQ-00000004IWN-33jK
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Sep 2024 05:13:19 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-502b405abb1so1030606e0c.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 22:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725945174; x=1726549974; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FftjutXCeiXVd5sNpriJUhOjNiXDvzsDr14ccTGO5ro=;
        b=OXhj/2DBRrCAntLmy8zx62209E+GUPP7j0dzHy0tMWqY35IRw+1i+DpG3Sag3u3Q2k
         Fm6mgBeqaeoqIkNGqt7+OxFHkEc7ekkAYrL5T7BeUhC3etUMUD1Yq5lDcYsSR2z4TI/S
         rYC3GI/Z4ux2/qnI3VBX0VrezFDWfHJ8FAoB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725945174; x=1726549974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FftjutXCeiXVd5sNpriJUhOjNiXDvzsDr14ccTGO5ro=;
        b=q6fvWwj5YPQ1PrSdLDc3RtAnxh9vluybBKwR5rG5+yzwaFyIQu/iSOxwdqdl5WnFLm
         WmASjNMs8JYfwzXc92rxWg4P99/0VT4wvFZk0SA2RL13R0nRd3v6U4s9+Y6whjYA+qEv
         G4Xq2y17RBRqKKAfJ8efEqKte+6mACKGd5y7Hb6c795eR2ScpjHkAWJdpkkxr4BI0VJi
         BYgeFYzw1r9UNqoIf9MlpAqRVFlmZGsXW39SfJxHefyRUKePXd3g8/3ZO9DDXpteDyA9
         evPt4jlWKMEukoEJDLKF/+oftFQv0IuJO4ArfGMGLfOEpswOfeKkM6i6lwZrnrRFujb8
         MXDg==
X-Forwarded-Encrypted: i=1; AJvYcCWPSmizUHOYRdhejM+LlG/f+ViaPSApQ4xnmY2jj1oYygO8nBVcuwVPiOGAlWi/M8bdZAn7DwTQf4Kz/tH3HA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSpCMmBVkiOFpp/cf+JtVfcAFtTpDPO9cQJiXuVwkirFftcGvS
	QHDRC0Y/B4Cx8zPZI7SILQYZvf5g8i8IetnD118Mz8wcpBi51YRs7eFILH86hcWM7cedCFoQyVr
	/1A==
X-Google-Smtp-Source: AGHT+IGtXQ/PswjC2E1aR63va2t/VcE1UK8iYhg0ibKoWcUERzN0zGAORj4Ma/9t5lzwKfpnJ8fzzQ==
X-Received: by 2002:a05:6122:915:b0:4ec:f996:5d84 with SMTP id 71dfb90a1353d-50207af566fmr14758885e0c.2.1725945174181;
        Mon, 09 Sep 2024 22:12:54 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-502f9b1d072sm124389e0c.44.2024.09.09.22.12.52
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 22:12:52 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-49bcf6b9b64so1434907137.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 22:12:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVgleksqmbylzSWBA+yKcHOjrZS6gEvzvsbrJlVUZy1JtyHaSSfbaT5tqlAs8A7F32uGEjpov/PDiZdlQyDTw==@lists.infradead.org
X-Received: by 2002:a05:6102:304d:b0:494:4fdb:f42a with SMTP id
 ada2fe7eead31-49bde2e784amr16042770137.26.1725945172144; Mon, 09 Sep 2024
 22:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240909111535.528624-1-fshao@chromium.org> <20240909111535.528624-7-fshao@chromium.org>
 <11bc2522-bc10-4dcf-8142-708b57d181cf@kernel.org>
In-Reply-To: <11bc2522-bc10-4dcf-8142-708b57d181cf@kernel.org>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 10 Sep 2024 13:12:15 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhiJ=7yAucJsaYKUUBrwrxOVBMB2CF=bFwyLa2o-5RmWw@mail.gmail.com>
Message-ID: <CAC=S1nhiJ=7yAucJsaYKUUBrwrxOVBMB2CF=bFwyLa2o-5RmWw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240909_221256_778983_10E582EC 
X-CRM114-Status: GOOD (  20.34  )
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

On Mon, Sep 9, 2024 at 7:41=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 09/09/2024 13:14, Fei Shao wrote:
> > Use and add "syscon" in VPPSYS node names and compatible to fix errors
> > from `make CHECK_DTBS=3Dy mediatek/mt8188-evb.dtb`.
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > ---
> >
> >  arch/arm64/boot/dts/mediatek/mt8188.dtsi | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot=
/dts/mediatek/mt8188.dtsi
> > index 2900d78b7ceb..14e51a11f688 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> > @@ -1799,8 +1799,8 @@ mfgcfg: clock-controller@13fbf000 {
> >                       #clock-cells =3D <1>;
> >               };
> >
> > -             vppsys0: clock-controller@14000000 {
> > -                     compatible =3D "mediatek,mt8188-vppsys0";
> > +             vppsys0: syscon@14000000 {
> > +                     compatible =3D "mediatek,mt8188-vppsys0", "syscon=
";
>
> If this was working before, it looks like this is not a syscon and
> bindings need to be fixed.

I guess it's because the binding was later updated in commit
26bcd8a53098 ("dt-bindings: arm: mediatek: mmsys: Add VPPSYS
compatible for MT8188"), and the corresponding DT update was unnoticed
at the time.
If that makes sense then this should be a valid fix.

Regards,
Fei

>
> Best regards,
> Krzysztof
>

