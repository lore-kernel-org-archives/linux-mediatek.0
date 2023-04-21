Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47C8C7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 09:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnz+CeyBg3xSNr9PqiNTHXQ+dbZ0EMgPRiV2a5GlAR4=; b=b+Uh9tSxz27BsBGIwiiSHn6Uxi
	w7MIjjpC6TchiqWVzm1AAlbyi6P2A9dlmOGTI6aCSLtv9OEjeA+x591DVEa815p+FCnv0E+MdCIBO
	F9WJeJ/DNVYwP+wPvKdYLDbJixIv3jyAkKvqr//5Dm7jCz5aM6WQcfC7optB7ZsmiiPWZ1KZUDWQ8
	vfh4ust8IIhtjxQp1YYRHj3ienV3uaBi5fFhxzRdRkfRYooSU8H3UFSX/CTAvinoCrlKvZ4e0Fbr4
	pSydSnFEaAScKfV03DWviog8UOjoeA81sHkZHazl/LgvbE/yRvW3aU/U+xBf7geU6Xonw5m4n3gJY
	XBKiAuOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppnJf-00AM1k-1G;
	Fri, 21 Apr 2023 09:44:31 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppnJY-00ALze-0q
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Apr 2023 09:44:25 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-329518648ebso15958495ab.0
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Apr 2023 02:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682070262; x=1684662262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnz+CeyBg3xSNr9PqiNTHXQ+dbZ0EMgPRiV2a5GlAR4=;
        b=Mf3FCqEwPMRSpsLwD4QJyC1MOjG++hHgSdPevq7QToxICdA6dcGVeopRVwgQCugdhi
         kIarRuJAILYtURSdH1hSmCVg8jaJltsqWidIdP0dWXxJ8a7fbBHxJ/GbtXC1ErEn1sLs
         1GCCx9nX3Z9y2QDmlBaenF3xrtHBa0Xsn9Ttw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682070262; x=1684662262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnz+CeyBg3xSNr9PqiNTHXQ+dbZ0EMgPRiV2a5GlAR4=;
        b=b74eaSe4QI6O3s8MtzFjMypgCHl5NwRfbq5QKxMurKT/il9UxyNyvc5zkouKTIF7Ax
         3UcrGBz7gmEUzvy0w+zkaC4m8KqC/dFC9SGIfrZ0wckFeGCNdANKIF+Gk+wmJiGaDIYC
         QlVZI+zpEZx8sGmRz0wbwgC81JwmvEQBUAiUG+RxfQZpT8rZZxkBFw3KLrcPw8D0ZNIb
         6lQ5UBRFNPeg6eXIPDCeepow0vkzRmKE/RPDz+gM1FugPo8ZpGp9hwYLM07+bX5LYG53
         E3CXl1eNlRMhnFNSk7QP7isKYdo97xjCV30h/31IpwQfVGn93gUjx4xhMxJ84GoKr4tF
         /OlA==
X-Gm-Message-State: AAQBX9dYTwET7xSHdblKFgRtweb+Zz/aNL+rXv3lEQQTpIXasII7yTVq
	ZQM/eDmwNo0LvZ857dCxRcnP6efr2i93rmHcD0TWWg==
X-Google-Smtp-Source: AKy350YCslq6VFKPwWNjtIByK+QV1czrNdIgADjG+fb48UYdiq7mGNUbqkwSJjjdr55Cf+8MIwM+FGPck1Oz1wvgN6g=
X-Received: by 2002:a92:ce0f:0:b0:32b:13ad:3e48 with SMTP id
 b15-20020a92ce0f000000b0032b13ad3e48mr3885678ilo.14.1682070262628; Fri, 21
 Apr 2023 02:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230315041107.2886940-1-treapking@chromium.org> <e15eac65-94d4-6a70-cab1-4fdb550116f7@collabora.com>
In-Reply-To: <e15eac65-94d4-6a70-cab1-4fdb550116f7@collabora.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 21 Apr 2023 17:44:11 +0800
Message-ID: <CAEXTbpevkMte1Oa1Z174SYi0Frvyg9fHxqUyphK=0PecHU933w@mail.gmail.com>
Subject: Re: [PATCH] Revert "arm64: dts: mediatek: mt8173-elm: Move display to
 ps8640 auxiliary bus"
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_024424_319470_F4928F4A 
X-CRM114-Status: GOOD (  21.53  )
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

Hi all,

I would like to drop this patch because 102e80d1fa2c ("drm/bridge:
ps8640: Use atomic variants of drm_bridge_funcs") breaks the
ps8640_bridge_get_edid function. The atomic helper requires an atomic
state to do the chain enablement, but we don't have that in the
.get_edid callback.

The latest ChromeOS tree uses the "aux-bus" with "edp-panel"
compatible string, and it seems to be working well. I'll upload
another patch to update this.

Best regards,
Pin-yen

On Wed, Mar 15, 2023 at 6:34=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 15/03/23 05:11, Pin-yen Lin ha scritto:
> > This reverts commit c2d94f72140a28d0f516b7c5e8274a9c185a04ff.
> >
> > The `lg_lp120up1_mode` defined in panel-edp.c is not working for some
> > panels used on elm/hana devices. Move the panel node out of the aux-bus
> > subnode so the driver only uses the modes retrieved from the EDID.
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >
>
> This commit was sent to fix display functionality on MT8173-Elm (Acer Chr=
omebook
> R13).... apparently this should get fixed with [1].
>
> Investigating if this is the case.
>
> Regards,
> Angelo
>
> [1]:
> https://patchwork.kernel.org/project/dri-devel/patch/20230315035508.28749=
15-1-treapking@chromium.org/
>
> > ---
> >
> >   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 26 +++++++++----------=
-
> >   1 file changed, 12 insertions(+), 14 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/=
boot/dts/mediatek/mt8173-elm.dtsi
> > index d452cab28c67..d45a2aeb0eb1 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > @@ -90,6 +90,18 @@ switch-volume-up {
> >               };
> >       };
> >
> > +     panel: panel {
> > +             compatible =3D "lg,lp120up1";
> > +             power-supply =3D <&panel_fixed_3v3>;
> > +             backlight =3D <&backlight>;
> > +
> > +             port {
> > +                     panel_in: endpoint {
> > +                             remote-endpoint =3D <&ps8640_out>;
> > +                     };
> > +             };
> > +     };
> > +
> >       panel_fixed_3v3: regulator1 {
> >               compatible =3D "regulator-fixed";
> >               regulator-name =3D "PANEL_3V3";
> > @@ -282,20 +294,6 @@ ps8640_out: endpoint {
> >                               };
> >                       };
> >               };
> > -
> > -             aux-bus {
> > -                     panel: panel {
> > -                             compatible =3D "lg,lp120up1";
> > -                             power-supply =3D <&panel_fixed_3v3>;
> > -                             backlight =3D <&backlight>;
> > -
> > -                             port {
> > -                                     panel_in: endpoint {
> > -                                             remote-endpoint =3D <&ps8=
640_out>;
> > -                                     };
> > -                             };
> > -                     };
> > -             };
> >       };
> >   };
> >
>

