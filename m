Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DF4CF2597
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Nov 2025 08:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5j+PVmz1ThbmMU8zEKanJG/8MyZ6W6XB53wlJvy8v2E=; b=gTBU+5wrn0V9Xn2Y6Ajs4ftv7a
	yuSh7g9gUU5/Xyfa/wfK4XYny+EGdy6LghZBoJsC6PQ+mbBMyw/AKMkrGyA0imRV6uR91M/6obrlB
	ijp6BA7CM653Viv8XH8OrEkm0wdFIYKPnqxMLRI2oYXhsMcMIqoyShv+r9SwABP5r7H/zIGLLPA/r
	MkB9ARDCstBy8wKwIs7xQsMwlZYWa9qrgmpnDpMuhOwy37trwiplXvphngqaV3OPl5bPgUTuHU43+
	xP8UXEvFwtgyMrLQGrrgq7tPD3tPeQhceonagjj1my7/yHETNXgJ1LSx7mItFNNQhrYAnkOEkwQ2F
	a4CQgq9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdkx-00000002oIC-1j3b;
	Wed, 19 Nov 2025 08:41:39 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdku-00000002oHK-2YwS
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Nov 2025 08:41:38 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5942a631c2dso8043916e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Nov 2025 00:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763541694; x=1764146494; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5j+PVmz1ThbmMU8zEKanJG/8MyZ6W6XB53wlJvy8v2E=;
        b=FL8pUhkx97Yy7FUeFe7xJ7U72eJRV+UXaQ5odoHIr3KXhgnpT/QH+x93gwf9Havvy2
         P0NE9NXMf0CIHzhwNeVRdBi6EB8f9fRNNTU7JyqcqrfZngnVtZsVddbS/o+VJv3XejQS
         HtgwUzSmyZhloKLrEG10BfkJblaw4xzlAWzCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763541694; x=1764146494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5j+PVmz1ThbmMU8zEKanJG/8MyZ6W6XB53wlJvy8v2E=;
        b=I5Dyzy2ff7fnaLPY2lXN4PccE+0A0CMw801MeN1O7ykcrjPYg2ihSyediDHsPLbHe+
         QZhi1giv/sGEXxq6XHC65uxs5W9ML2P9f2AIfsdOiTm8WD209bvrSdG7YpeytVBgx3Ig
         pclWUVrOxitEfAq646DdcjO+T8X+2O9Zsg0oSA/i69TXvk28QLxYW7vGKpcKWG0ncMaf
         eRI5chZR/jmPceujtZv1WyD9H6Naxn3ZVOOtu6Z20etPcLGlgMeE64ctY89n8GXbIiOb
         PpefaefeSi3vyQPiTCJK3MXfaSxorNRjwgvdULkKJB205XFLwIHGdeI1B9luIprV2UtP
         fZyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkIW0AZyNF7K/EOmKFj3kx/WFi8b8wivMZ2hORHbEWkJaeMHa7GjysJX7g3ZidwsfI4c6PPfKYMxREubWNgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9Pm5FRw9cn2jGbTVR6gQlUdCHvUxQBz+eCaQ8oie/XO4hAV3k
	yX42xZwbSK4rTFQsF8r51MbTiqzr1c/ohJQJ6dR6BsEExy5xcewDKU1z4pAmu4EDZVN5+XCG+RS
	r3nzCXCDF3CRbPnXEtgTs43H7s3SaE/4TwU77blgQ
X-Gm-Gg: ASbGncsMSM2bCgys7qQyM4sVcvdvzkhI9DolTzwdgyfhKreNiBDGUZQUU30mviDxyRr
	4i8+HYvK6OezWCjwYz/zNGFhA8LMojNRGIE/l8PEsHxdIl12gHnT043Eo4vFXv3eba0EZ1SvAnr
	Gd0eOjsh5EKkvp9tTOVDrpU/aFHQIBXrxlFcUpmjRMSNrAtsVZ2mW3Jb/8dz22tw6yD5LAauqnG
	Dr+asMAe4Fu7Ezr7xELrwZ3rfsvx8VLbdkDJ799H0k0/V/XEDxprZPMR1LYwZgkWOfl85iD4e8h
	m/5KVECbu7pfcid0NN9hgFEN5vtx+UDYNSbRN5UllRsB558=
X-Google-Smtp-Source: AGHT+IFQrP/i43BRhijnwjgkcRa7OAPKQ47ycdJ6Y9winLF07YK7XNLrMlityx7sOAiSK2CbDbRJMbbPsGbnrHHqS5w=
X-Received: by 2002:a05:6512:3b22:b0:595:76aa:8e with SMTP id
 2adb3069b0e04-595841f7d84mr6219364e87.38.1763541693273; Wed, 19 Nov 2025
 00:41:33 -0800 (PST)
MIME-Version: 1.0
References: <20251119070230.1716418-1-wenst@chromium.org> <66693e69-7ad8-4067-9bd3-ef1454e3ec18@collabora.com>
In-Reply-To: <66693e69-7ad8-4067-9bd3-ef1454e3ec18@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 19 Nov 2025 16:41:21 +0800
X-Gm-Features: AWmQ_bkZdxwhlKh-aCeAiAApl_fYKJMVFMF18ypbY25Gza-xyZhDFbzK5dIIIps
Message-ID: <CAGXv+5HOrP=hj8qxZmjq+ozeppXrzFKh=kq2Cb+QqWEx9n83Bw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: drop firmware-name
 from first SCP core
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_004136_953938_BBFCB699 
X-CRM114-Status: GOOD (  25.68  )
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

On Wed, Nov 19, 2025 at 4:31=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 19/11/25 08:02, Chen-Yu Tsai ha scritto:
> > Arnd pointed out that having firmware-name in the device tree is wrong.
> > Drop it.
> >
> > Fixes: e36be19823f0 ("arm64: dts: mediatek: mt8188-geralt: Enable first=
 SCP core")
>
> Fixes here is .. well, right, but wrong - as if you "fix" that in previou=
s kernel
> releases, you will create regressions :-)

This is a fix because the commit in question was merged in v6.18-rc1
and v6.18 hasn't been released yet. So you should pick it now for
v6.18.

> For all of the currently supported boards, I was planning to temporarily =
leave the
> firmware-name properties in place for one kernel version (v6.19) and remo=
ve it from
> all of them at once, for kernel v6.20.

OK. So I guess the plan is to have MT8188 SCP working in v6.18 based
on the current name then?

> I'd be okay if you send a commit or a series removing firmware-name from =
all of
> them, without any Fixes tag and without any "fix" word (so that we avoid =
autosel
> backports at all costs!), but keep in mind that I'd pick that in the next=
 merge
> window, and not right now.

We can avoid autosel with:

     Cc: <stable+noautosel@kernel.org> # reason goes here, and must be pres=
ent

(See stable-kernel-rules for the whole paragraph.)

After the blobs in the firmware repo have been renamed, we then explicitly
backport the change to stable. I think that works out better? And the only
one that needs to be timed is the MT8188 change anyway.

How does that sound?


ChenYu

> Thanks!
> Angelo
>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 1 -
> >   1 file changed, 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm=
64/boot/dts/mediatek/mt8188-geralt.dtsi
> > index 7fedbacdac44..8e423504ec05 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > @@ -1166,7 +1166,6 @@ &scp_cluster {
> >   &scp_c0 {
> >       pinctrl-names =3D "default";
> >       pinctrl-0 =3D <&scp_pins>;
> > -     firmware-name =3D "mediatek/mt8188/scp.img";
> >       memory-region =3D <&scp_mem_reserved>;
> >       status =3D "okay";
> >   };
>
>

