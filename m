Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E761CFA746
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 04:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQJli9cYBSHQhmqFSBnQ/Z74/l32FKm9tuU98/RCsm0=; b=o98J0iKFrNV2oN7rAj6N/G8qxT
	atLDPgKgobgydod+T/NM5SQ6DxKh+Isya/jZI7J7RXa73wkP4EXIlK+Y3vJnKyu9qlCITM38drc0I
	Go8dxUOPfw+NTSfRZkK9i3fSWiule4KA0Sfn4V6O1AAk1lOrP1WLf93YrsMYXWsD6gifoka1cPPzK
	wUC6UyVDsKYMAwB13yyI7q7Oda3bLVuxAa1W4oreVOKflUzyU3aWrxAvcYe6n1IMfZ2OiCz2aR+3E
	2bPxsXThR+tPRGZpa099S92+e/Y1H/QrQImQACP9oSDsszDDsBConnnhomETO14iDfgORVBv9hTQm
	w55LGvRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swZr4-0000000AzkA-15yB;
	Fri, 04 Oct 2024 04:23:50 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swZr1-0000000AzjN-2MlB
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Oct 2024 04:23:49 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-4a3a62bfda2so491100137.2
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Oct 2024 21:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728015825; x=1728620625; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQJli9cYBSHQhmqFSBnQ/Z74/l32FKm9tuU98/RCsm0=;
        b=S7fj6SFI2ZKWDkBKCg5FKrKG8dK7d4sEVZj1Sd4rFZ+i1wi4WRQN+JGfQY89fIyxX+
         0GHuk746r3ldU1ZSwgQXBuZyuGrNz3KhMVUFM+XkW47h8v69Lh4c2MLRVT9u/fr2cbUt
         Es9H8mLk+Ejx1R/BRz7luCXOIoXApro612VEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728015825; x=1728620625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQJli9cYBSHQhmqFSBnQ/Z74/l32FKm9tuU98/RCsm0=;
        b=LuMDJGX3b/zRRKfgOuh37Izbyvsq/OBEjGdirNSJikCRp0YqaivYaYbTzdhUoVG1/T
         CQhALQ6F/uHxrjfsKuqEQXWjrVJWF0PSR069uV8Ax2fbOv5/7QLE9iCDuWfyUR9cvRV4
         B6d/B3Uh+bUOjG/Xu/CVWmLTsqEzhcmgX92WY8wwT/Rifzxi28L3Cv1lHmXPZXmSlDxV
         mD98gutws8h5I9OfSzyP4BaA2ralF4Aw3ZHFa+89r3Iu1cIgdvKAM9/DQhWHo8A8W3D3
         R7kpmhmkeJfOi/m2HfDB8VVt8dl24EKqPGJ0dB1zXyup1XZQiv47bpo+ooVemwhMs7vK
         Z8zw==
X-Forwarded-Encrypted: i=1; AJvYcCWkcx+qN32x9rKdsM6NxhijheDQEvd5uKkk2buOCkRMlaMQwY1COqBfyLaSEKSOVyrrOtDDfrJxQfM/VeFRvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgxlTWOjFD/8eWV5xQ1oKay52h6SMJPlis/zPozhmETfATFc3W
	Ce+HrW0S8FRboy1LwozYkmK7/JBs3SkU14i90EHFdrejvjJfXEDu8D2SUGmnzHp1aygggn2ThCC
	xvQ==
X-Google-Smtp-Source: AGHT+IFUkTv3yErZj6PunldoEtAIdO1Cghpb5S4RMCJ1xmWRvTVszq9tZ2EEzwjkwMAX5A8K8aPLLQ==
X-Received: by 2002:a05:6102:b07:b0:4a3:a0b1:b94 with SMTP id ada2fe7eead31-4a4057620eemr1229752137.9.1728015825260;
        Thu, 03 Oct 2024 21:23:45 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4a3f9be48b8sm394669137.19.2024.10.03.21.23.44
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 21:23:44 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-84e88c2ce05so460479241.3
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Oct 2024 21:23:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXwcpUgANgUwLj1ihiI+yUJv4UMRV0dfW5DXON7U2+xns5WvDUN2Qzr3p0YjZ4PIRCLEFU/ggw72SK/8rVVAw==@lists.infradead.org
X-Received: by 2002:a05:6102:3594:b0:4a3:aa99:5ef1 with SMTP id
 ada2fe7eead31-4a4058f7e87mr1271634137.25.1728015823875; Thu, 03 Oct 2024
 21:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <20241003070139.1461472-1-fshao@chromium.org> <20241003070139.1461472-4-fshao@chromium.org>
 <d3052eb4-bfcb-4ee2-9b4b-a4845238c765@collabora.com>
In-Reply-To: <d3052eb4-bfcb-4ee2-9b4b-a4845238c765@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 4 Oct 2024 12:23:06 +0800
X-Gmail-Original-Message-ID: <CAC=S1njNEZvu=ay9+4qXQ0xYN+CQjCbr2oV+1RvAK9q5oRRDjw@mail.gmail.com>
Message-ID: <CAC=S1njNEZvu=ay9+4qXQ0xYN+CQjCbr2oV+1RvAK9q5oRRDjw@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] arm64: dts: mediatek: mt8188: Add MIPI DSI nodes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_212347_629188_058C1D75 
X-CRM114-Status: GOOD (  17.63  )
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

On Thu, Oct 3, 2024 at 4:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 03/10/24 08:59, Fei Shao ha scritto:
> > Add MIPI DSI and the associated PHY node to support DSI panels.
> > Individual board device tree should enable the nodes as needed.
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > ---
> >
> > (no changes since v1)
> >
> >   arch/arm64/boot/dts/mediatek/mt8188.dtsi | 26 +++++++++++++++++++++++=
+
> >   1 file changed, 26 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot=
/dts/mediatek/mt8188.dtsi
> > index 23101d316c4e..719d2409a7db 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> > @@ -1839,6 +1839,16 @@ pcieport: pcie-phy@0 {
> >                       };
> >               };
> >
> > +             mipi_tx_phy: dsi-phy@11c80000 {
>
> There are two DSI PHYs, one at 0x11c80000 and one at 0x11c90000
>
> > +                     compatible =3D "mediatek,mt8188-mipi-tx", "mediat=
ek,mt8183-mipi-tx";
> > +                     reg =3D <0 0x11c80000 0 0x1000>;
> > +                     clocks =3D <&clk26m>;
> > +                     clock-output-names =3D "mipi_tx0_pll";
> > +                     #clock-cells =3D <0>;
> > +                     #phy-cells =3D <0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> >               i2c1: i2c@11e00000 {
> >                       compatible =3D "mediatek,mt8188-i2c";
> >                       reg =3D <0 0x11e00000 0 0x1000>,
> > @@ -2224,10 +2234,26 @@ larb19: smi@1a010000 {
> >                       mediatek,smi =3D <&vdo_smi_common>;
> >               };
> >
> > +             disp_dsi: dsi@1c008000 {
>
> And there are two DSIs, one at 0x1c008000 and one at 0x1c012000

Thanks for pointing them out, I'll add them for the second DSI.

Regards,
Fei

