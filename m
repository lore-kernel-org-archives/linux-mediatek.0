Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2421AC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 04:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONW7pwCwlyGXd37ijro89iqfnw+jYXGvO6QktN1KnzE=; b=vUEJ/i9ltnvr0KUBm23Ho1PMDB
	e3eaCEUOqCX7hwFtsmYer18uSa9F4L41aIl3VBOp0a7sqFpipH+3OGbwB4PnQt4iEKy9n7S1c3Ik9
	thmUcGPO54MJSLoDiBlij/1CM4DL/yEfyFvypMX0C6Q1YBxC9NEGkBM3Ai4QGgJt2FYGmkJKcWA0R
	VQV84RmZntkD6IL48LVYyGN9SGkwKFw8FbplGJjU9TgwWywY9l8QjNxGyuSLOM0dvHy6JKPUOT5KK
	BdmFa+eYhyUJ3ogcRuAhcjabuth01puCM8x5htYX/ba9BsetThisBupWQhAQTryYXJ0LWzzB+GqkP
	gELnz3vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogeZ1-0074cj-7X; Fri, 07 Oct 2022 04:02:19 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogeYy-0074bj-RQ
	for linux-mediatek@lists.infradead.org; Fri, 07 Oct 2022 04:02:18 +0000
Received: by mail-ua1-x930.google.com with SMTP id p4so1319122uao.0
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Oct 2022 21:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONW7pwCwlyGXd37ijro89iqfnw+jYXGvO6QktN1KnzE=;
        b=R0eQUb2ifkNhm9A7a9ekJr6xeRJsCe9k4FPFdSRJvuvSCC3kvYNPM0A7FvfZd+1jkT
         /K9TmzB2R0/GUXenPY0dId6zMfRXw884b3zoxVzFQXvNdYTo8U0nVaji2AJGmRBJ2/2n
         vJDnRKk4bBtC0iMqBcSUiHdD92g7OYBuXu5R8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONW7pwCwlyGXd37ijro89iqfnw+jYXGvO6QktN1KnzE=;
        b=4l93a9HOELRxTn3jeBsPgiPlaNW5llNtStMHnn7OF4McwBTBu6tT3s/2iL6tj5b7kK
         orzoGKuUdExLP28AcwtN7pW9BCy/AaxM8wwS3FbGrIRk7l35Ztm+8uhrvrNwwcxu33+r
         8xIGA8myRJ3h/s/F/0kT3y1b1PpafWAVk5QuMZSl8/a0cyYTZU6V0+J0JEAanH1zrHoX
         CNiwkELSI8DrWIkRH4VuCkfGJm5LRXOALPHGWsoO3DsDCsgG8IZfZ4Efwz/RVoH/HJTK
         wGT20CZYahzyQJ46bctnEtY7HyCAnXYrnsE2j1nHUprmKwmng4wvqIclajgshoULGssM
         k8Ug==
X-Gm-Message-State: ACrzQf3v9jUFkpLT9odHyLb2qG+ywldCeIwIP2hEmot9e27u3mVYNIsG
	LZaLhZf2o1rUohCMbzO+5HwDz8EdemmF6QR9rA37YOFstFY=
X-Google-Smtp-Source: AMsMyM4l1ulp/7lmSsZbh8zin/EMci1G3NMqRlBHpokLnB623aj1PQZYjLxHUSfOPtH8F6WLdv5y+ZxfqbbrdM67/lA=
X-Received: by 2002:ab0:38c5:0:b0:383:eed8:dd45 with SMTP id
 l5-20020ab038c5000000b00383eed8dd45mr2157129uaw.11.1665115334922; Thu, 06 Oct
 2022 21:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <20221006212528.103790-1-nfraprado@collabora.com>
 <20221006212528.103790-6-nfraprado@collabora.com> <CAGXv+5GmJOYnfLsovO_+piuJ1ry1R0ZQqALRGK3MNp=nUO-TNw@mail.gmail.com>
In-Reply-To: <CAGXv+5GmJOYnfLsovO_+piuJ1ry1R0ZQqALRGK3MNp=nUO-TNw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 7 Oct 2022 12:02:03 +0800
Message-ID: <CAGXv+5HGodRWbawEpDppZWM_EiuzdvZC9h4XBoAPo=FQ7yNotA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: mediatek: asurada: Add aliases for i2c
 and mmc
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_210216_924420_157EB6BF 
X-CRM114-Status: GOOD (  20.93  )
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

On Fri, Oct 7, 2022 at 11:51 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Fri, Oct 7, 2022 at 5:25 AM N=C3=ADcolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > Add aliases for the i2c and mmc nodes on the Asurada platform DT to
> > ensure that we get stable ids for those devices on userspace.
> >
> > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> >
> > ---
> >
> > Changes in v2:
> > - Added this commit
> >
> >  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/ar=
m64/boot/dts/mediatek/mt8192-asurada.dtsi
> > index dac2d4f5e670..758ca42a6156 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> > @@ -11,6 +11,18 @@
> >
> >  / {
> >         aliases {
> > +               i2c0 =3D &i2c0;
> > +               i2c1 =3D &i2c1;
> > +               i2c2 =3D &i2c2;
> > +               i2c3 =3D &i2c3;
> > +               i2c4 =3D &i2c4;
> > +               i2c5 =3D &i2c5;
> > +               i2c6 =3D &i2c6;
> > +               i2c7 =3D &i2c7;
> > +               i2c8 =3D &i2c8;
> > +               i2c9 =3D &i2c9;
>
> You should only add aliases for interfaces that are actually enabled.
>
> Also, I think we can disable i2c6. None of the current products use it.
>
> ChenYu
>
> > +               mmc0 =3D &mmc0;
> > +               mmc1 =3D &mmc1;

Also, Spherion does not have an SD card slot. It might be better to move
the mmc aliases to the end .dts files.

ChenYu

