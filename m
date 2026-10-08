Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F2ECA600A
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2026 08:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhGDVCOgQLncQuplToj/mW7JvsPvLFBB1CNf9MUb7AU=; b=S6o5QxXktZS3Ri1E++0ZS1ZWZE
	320V1j4CDntXlNMGT2gkAWHknBkPgBYvrY+k9sMqkWMyasNnu+Ex1KzEhETl3VtymenWbSEAJhLOv
	9p0X5bud2kY5t49CFxh/B3Vx1uUCCp21S1VpW3YAM3+nedN9K347q3hJJs6m7qYR/5dIN1jCZDSdb
	fvE19A+1hydubb0DjL+rY/9Pr8+81r/iQd7OwbipNd/a/GKnu4BUYOH9kQ4zuQWbovmUui0JHkAgf
	NO8ug9zbh9qgP0DhI0A4yIAYNPYzi0gw9zhSNeTk3uI2qMdmt/Gd7pXv4uLJwMk1bNVmFaYF9J5Wf
	iWeLHWRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjm9-00000003ugB-179d;
	Thu, 08 Oct 2026 08:46:53 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjm6-00000003ufY-3dQ1
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Oct 2026 08:46:52 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-4c27f0df6e8so2290381b6e.0
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2026 01:46:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791449209; cv=none;
        d=google.com; s=arc-20260327;
        b=Bsqr0DEUsOyTKQFgICRfjs1ClkneRngvq5T//9Tnj3385bfir5rCEL1wnHhklpedQe
         9OXt8KfIcmbvIDj9Syd4BDmguzVfNzp2hg0RZPvRJDp/ba9rWMycUQef7DLPCY0AU46y
         u9bZtkxbU7mN7WfG35xshgrR2CsNViOGph6k3SYu99Z3gqh8D0FR6xJO1Kpq1Q4esKXM
         Ogq8RzlXt/sif47/nIhnLORom+osBH83FpwR3UU0J/CJ6A4UtWhH2RvvpimwjDLxh3dI
         3Q9RSkhw77xuB/ISLRuPenkpwy8OtvpbtPP6QudMmSVaEkOS7IpoBbpSDK7wCyQpyiEU
         rLQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fhGDVCOgQLncQuplToj/mW7JvsPvLFBB1CNf9MUb7AU=;
        fh=9C3vwuY/e1X8I8PVuMNCxgdVZwMygf/IyYM8pStohH4=;
        b=b7ZklZpCP93bd0xkVMYl8qmUrFNnXfoGE5XtH9rJSxPUH3yCZm3S0epye5t6CLGYhR
         zZS/0biSRUg2ZlFeWpvWckDvRgHMRsCoVZggf3uFgdlLW2oD+bVevELpfSyYXDZ52LIf
         MWv9wv5pyqm2Pd9UgP7kA3Vh1hGDO3UvXCz8eHAIh3CqdbrrmNxBJ5b9NKpzPExjIpRN
         op5V7a/BusKNtPUkM4VsrIvXLyzPIF/f8U6nvASShm1IyNDaw1JEGdvjbG5llTqbiYph
         +UifVFJO67BubDa0+XQExM8f18LEJhGIFFRZT2RFWqat2C1W6hqNLZ6R8W3klluwlSiz
         Tzzw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791449209; x=1792054009; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fhGDVCOgQLncQuplToj/mW7JvsPvLFBB1CNf9MUb7AU=;
        b=Uh/xuvCi+PUZ7PI9bakU6wsN1PeCC6jqVe1K8ptS6LdfIBLp4IEDloM4Jwz8bHVF3S
         0tBQwQB8U2IPMGvhjD5mC9VNXuz5w2LJCUWNS2VFg6F/I/wsFpTgVqMTY84kkrhtUyZY
         DjB8G8mpsXlgzkjllEYxdw8wYQYDeK8NY5JLpB3KhvY+gKWNsEYhLw3n6Ta5Ks9el0X/
         bNjWJO8Kml3ACm/MRU2wHCJabpscVOrwUwx3ytDYpbdY1TNNeB/SGhk1KgFySJHQwHjs
         kHoZfy1t/kkC4OZc1gv/dIo585+3kIKobka26I2AHVUGeNeaMbQ2hCTjDtxJPqFr2yMG
         5fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791449209; x=1792054009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhGDVCOgQLncQuplToj/mW7JvsPvLFBB1CNf9MUb7AU=;
        b=NTZrWg8bxf2tmCgXuoAtJCWNU8gLt//yZseVaGv+5+wiDMTB5AuvA0NqNQS2IFjX5y
         DQ0WnN7iQp1wfEnUGj4r6h4hiCQbbc4CY6rIIKymkVKBiujjTnXpz+fzhl/XzUX5R7Gq
         H4wk2zvBRsR7FvxdRTQfzcmWBh2RgrFvxq9I83UvWcLJdfU6cYoBtqv2NJWSET6nGrtt
         5QwQGmP1iE9JX6TI8ZQHBUGHx12vDx+MuCzkNxDYu/wo2UHaHVd3ffH0FXqdUZzjeeJT
         ITayaJZHzXA+KIvJD6wnDS+cwYd7Gc2EzZ+MbXn7dkJ1OfGaGMB0UrKruATpjsPKVhKN
         Ubmw==
X-Forwarded-Encrypted: i=1; AKwUvBw276mVMzrvoLy+xSe3H25euFbG36L9WJvW13b4qT+UEpXBvOiWa1hSC4EBALa8ro37tdIbsc3fUU8bNWnuXA==@lists.infradead.org
X-Gm-Message-State: AFuF++lOGftSM2jd0hORd8X94oX/KxMH8Q/8KO5U9NIVeP9cBZ17ezMs
	dOFEd3QuAmI0fbPQVSIClGAGvYaZ14DeHexIsByikxxHev9v69XISLdNXHvM0WAGC+TQCpIqHos
	FS4demcujlUV8/0dnSks7R4T3+62HxqA=
X-Gm-Gg: AYBFou3UZO7WK85Av5DBVgXdXht909KLynHxvHN2cXivdMu1cuQaw2Afui2ORl091g8
	in6eXH6wpDM07tRuWA6S+cMDpXTGoCpxrHCvYM9gMtOBxjVCJfiZuqxo/7KrilM2frOT7NqlxFi
	f9YC1qlTIjWcckO3z0C4F+wAuPz7pojRaBwSDp32FGvUaTpxDDUk5rR7PDieb3+U4q7cdX9bAoT
	IJwZCg/I8HANLsfvUJXYPKN3G/+qEZS2MpQY27XUE9D23kXiVhIZH3VTihn4dxz20gkpNxr2OD3
	YaAKrknnUBd14YciUoc55PhSy23hxRJ9bZQg9e6INXEKqnpT5DDsbAAiSO6hwMvsFSC7P0+RMn6
	R3Yvs9F5yQ1jQclYN2MAmMMxdoj7YfwKOsI7xKENN1VK3Gma17+XZGO5XC/j9bVlj9Q9pE8eqh7
	dLyOyURHRK8gGY04n5iEwZqSTMpfpCopCKCO/B+6Ic7+lb/pbGvbc=
X-Received: by 2002:a05:6808:2e43:b0:4f3:36ff:e521 with SMTP id
 5614622812f47-4fc46c92bc4mr4767586b6e.58.1791449209535; Thu, 08 Oct 2026
 01:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-11-7b47ed6335a8@gmail.com> <31d91f44-3f16-4a4c-916c-f4d8107d371e@oss.qualcomm.com>
In-Reply-To: <31d91f44-3f16-4a4c-916c-f4d8107d371e@oss.qualcomm.com>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 8 Oct 2026 18:46:37 +1000
X-Gm-Features: AclHuK9CHquST79ZWASmiEF-eCVAGlz1SqIt2DEtZen9lPzYSl_ASrQBijUe-o4
Message-ID: <CAHgNfTy-h8m-XBBzW6jSNBz0dVe=vXL6nJ3VOqgMjCbsK_t6gA@mail.gmail.com>
Subject: Re: [PATCH v2 11/21] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_014650_909577_1A933539 
X-CRM114-Status: GOOD (  14.96  )
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

On Thu, Oct 8, 2026 at 4:33=E2=80=AFAM Ajay Kumar Nandam
<ajay.nandam@oss.qualcomm.com> wrote:
>
>
>
> On 10/4/2026 11:33 AM, James Calligeros wrote:
> > +&i2c3 {
> > +     status =3D "okay";
> > +
> > +     speaker_right: codec@34 {
> > +             compatible =3D "ti,tas5770l";
> > +             reg =3D <0x34>;
> > +             interrupts-extended =3D <&pinctrl_ap 182 IRQ_TYPE_LEVEL_L=
OW>;
> > +             shutdown-gpios =3D <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
> > +             #sound-dai-cells =3D <0>;
>
> Both speaker codec nodes reference the same shutdown GPIO. Is that
> intentional for this board?
>
> The TAS2770 driver requests 'shutdown-gpios' per codec instance, and
> GPIO requests are exclusive by default. So I would expect only one codec
> instance to own this line, while the other appears to fall back to the
> register-only path after the GPIO request fails.
>
> If GPIO181 is a shared physical shutdown line for both amps, how is the
> power/reset ordering expected to work across probe, suspend, and resume
> when only one of the two codec driver instances controls that line?

We use the new(ish) shared GPIO proxy stuff[1] and it all Just Works.

[1] https://lore.kernel.org/asahi/20260831-apple-shared-gpio-v1-0-e855b12e1=
8ce@gmail.com/

