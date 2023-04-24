Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEA7C77B61
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Apr 2023 07:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ge7dQFFEMhRd1pxTKgcmbYY3WTN/xziTD121Ud2oaVQ=; b=i0y6RvYl+40qjW7wFf1+yDbW/q
	6nXD/NIklCk5Uys6Fujse4SU+DEI9IKVqq4MP7vbv4IhSc0h/gEO2L4CVhHZiQyHIJvARm+s8zab8
	fvveC85bIfjGQsmyXxAdHwY+5dSsBk7zvlcGa2EWMIpqb6FjtNufFjMso4RkwAIPoAI5YJo1baiLC
	4DzIf99Pd9I/fI6wAk8RZODwILAqUJo0BbbWnkEcEKXSfRxpn4FlB8AwCkyrOCw8oatVQ7bUydhvz
	zvzEkC4siLkRDw6r06GNdg64UOkQptC7469QY1S1cKjh6b5SnpKf5cCduVGLKMPsvdv9fjQt67KoC
	adSFuXuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqqSJ-00FYd7-0l;
	Mon, 24 Apr 2023 07:17:47 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqqSF-00FYcF-0D
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Apr 2023 07:17:44 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-4409786dab8so1276856e0c.1
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Apr 2023 00:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682320661; x=1684912661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ge7dQFFEMhRd1pxTKgcmbYY3WTN/xziTD121Ud2oaVQ=;
        b=cSkBgzqvPTydLZcyBhk4Id8IebsD++8p0XWv0CRPMhhvjM8e6GJDGrZUU/CQ2PhGdt
         iyzvVz3O38Us70736sYxoO/kRdFx8DTtWeNFe+7Fv19Dt/fISvOaSlGTZ5z7sHc+CJRa
         5ucxvGoEsTZ4/BYa/Go421GPw0g/z/tP1aLs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682320661; x=1684912661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ge7dQFFEMhRd1pxTKgcmbYY3WTN/xziTD121Ud2oaVQ=;
        b=GZUYClK0rPKhd1dPitA+auLlupg0arzESKhghH5cZ2jb1NsS0Iunojgg+uuU/7Chhv
         ukmCYHX1c0CXmecNBDPvmZpwIMA2AKneUX6JrJwCvVWod8Y+YFBYNbMSOhW8l4O3I4ug
         msHJq1Cmk34/AZTkJ9+xRkqVpUOgz+DQxnqOoHRklgYCIAaWTOIKc6N3BWNt+Qw/x8mr
         D9WNkCFNmBXKQ3EYIkHB3eKi16aJ13YX6cLrCgw+G+jlyOtIEtXDWOuiF5nMw9vfaL9S
         +3J628qLFnCFgvfjoQEQD0zzHb+AOy7o5MtQUeHv+HR5y3EZxOhumuJ5yNDJcUpNOSrL
         RJ9w==
X-Gm-Message-State: AAQBX9c0rVU++LVZBDqGB3opiwlc8LdVr0UkjDIHM8qGSr6ojETJrUoK
	QoRs1IsRfe/dAXZuzW5StgXbXmj6V4FDGXuN48sR4w==
X-Google-Smtp-Source: AKy350ak24vjEnQyf0VlLd50kDFe/R+sOZneUhtLyU8sTqVPCOaSD1kQ2pVXtC6jt8v1o67tkU1EoehcilxF9yiwqdM=
X-Received: by 2002:a1f:c546:0:b0:43f:b28e:d481 with SMTP id
 v67-20020a1fc546000000b0043fb28ed481mr2607614vkf.11.1682320661059; Mon, 24
 Apr 2023 00:17:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230420094433.42794-1-angelogioacchino.delregno@collabora.com>
 <20230420094433.42794-3-angelogioacchino.delregno@collabora.com>
 <CAGXv+5EtCdpXtq6q2Cv+QAZPUE6yJiSZhngSc0sftz-_uDrZXw@mail.gmail.com> <0a0917f9-756f-6926-8ede-2b087cb0b716@collabora.com>
In-Reply-To: <0a0917f9-756f-6926-8ede-2b087cb0b716@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Apr 2023 15:17:29 +0800
Message-ID: <CAGXv+5FMEphksTSLAy8=hDPGjC364dxD4_9qmw6aV4en-2d3ig@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: mediatek: cherry: Assign dp-intf aliases
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_001743_102597_C066E970 
X-CRM114-Status: GOOD (  22.23  )
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

On Mon, Apr 24, 2023 at 3:03=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 21/04/23 08:46, Chen-Yu Tsai ha scritto:
> > On Thu, Apr 20, 2023 at 5:45=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> On Cherry boards, the IP at 0x1c015000 (dp_intf0) is used as primary
> >> dp-intf, while the other at 0x1c113000 (dp_intf1) is used as secondary=
:
> >> assign them to dp-intf{0,1} aliases respectively.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@c=
ollabora.com>
> >> ---
> >>   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 2 ++
> >
> > This should be applied at the SoC level. The display pipeline is fixed =
in
> > MMSYS, so it applies to all MT8195 devices.
> >
>
> It's fixed in the MMSYS configuration/driver but - as far as I remember (=
I can
> recheck on the datasheets) - the dp_intfX function can be inverted meanin=
g that
> the MMSYS paths can be configured such that DP_INTF0 becomes secondary an=
d the
> other becomes primary: this is why I am putting that into mt8195-cherry a=
nd not
> mt8195.dtsi.

Maybe that's possible, but the diagram in the datasheet suggests a fixed pa=
th.

Either way, it's not actually the problem. My original reply is probably
inaccurate. AFAIK the aliases are used to identify the individual hardware
blocks, which otherwise have the same compatible string. So the numbering
should be the same regardless of the design and/or routing.

Ideally this should be described with a proper graph though.

ChenYu

>
> Regards,
> Angelo
>
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/ar=
m64/boot/dts/mediatek/mt8195-cherry.dtsi
> >> index 0820e9ba3829..918380697a9a 100644
> >> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> >> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> >> @@ -10,6 +10,8 @@
> >>
> >>   / {
> >>          aliases {
> >> +               dp-intf0 =3D &dp_intf0;
> >> +               dp-intf1 =3D &dp_intf1;
> >>                  i2c0 =3D &i2c0;
> >>                  i2c1 =3D &i2c1;
> >>                  i2c2 =3D &i2c2;
> >> --
> >> 2.40.0
> >>
> >>
> >
>

