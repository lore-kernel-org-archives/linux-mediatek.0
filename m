Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DA8CA0ECA
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 10:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PqZA61AZZwHHDn1nGNrzumQDR9UPMkG/AB0OITt853E=; b=hoJslsH6jWXxgeMgoTQ2/8MBK/
	+WHXFbNrF84b6G/Eu4Op8+pW6XRKcKT4NA6cGzeAWTlLKJqKlEGOwsyD/SISp91Ats8haKlJR9eeD
	BPVs9v6EimOIr6ZlOe9iYL+ZkfL1KTgR7yzrylPVeRNTSUPBt5EW+Lap+kIoUBQx/ZdX9uIKb0uZO
	7EgNmGLkcoHFHmr0QqRGZF+bOEiwCA8sMilV1GdAf16Svk7hNp4NjJP2JRnG+Uc0Og9hTM3/Ohkgs
	Yl6IsefmFv8R6OmRYCMymAi6Qf/BKz5bTtsOozPE5liMW5m0q3SnMDLg61dccsaVR8YRtIzdagv82
	MCMXi36w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0dc-002xpu-2z;
	Tue, 12 Sep 2023 10:28:56 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0dZ-002xnH-13
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 10:28:55 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-501eec0a373so8824144e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 03:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694514524; x=1695119324; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqZA61AZZwHHDn1nGNrzumQDR9UPMkG/AB0OITt853E=;
        b=V0hA/+LjHu4pXJUPRlooZf46xyCxBdd5gCcbXqcDX46FafMBjP3Ff1uwiBSW3Bjhpp
         pimTFCdvjxqV5XMaN3VzX70rjntAmpf0dCmKq2ti4uGla9PYythuttufzlDzWFKoAoGz
         vB8DdWarjCJbwPGJNNrj9dUov5qLG25wo1Kns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694514524; x=1695119324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PqZA61AZZwHHDn1nGNrzumQDR9UPMkG/AB0OITt853E=;
        b=wvXiZKLc30SeHwTHEv+Uf1cXTa0AEKZOGSZ6eZ54ZUs42ofQVTKQtkQvvi04CZ/Faz
         Ec6AHPw5U6Shm4ae+NgTC1W2H+27MDaZ1UGiwtLXDa0DtiM/vAKC9TUSdDqKT/djI0QT
         Zs8XXl88cshTCYdPFxA3PoUYFTs1VzVqyrv7E+vgBenE4uf9iaYDLvnbJ2OY1oRtWQ3R
         lKrfikm2Xxjn3J5VxIbdREyWwnJuDDclhd/pXlj/ezEyladdbR57exxH677TKCLx2BzH
         38+DpKjmZYyFUvTs5kRmmIzmweYz59jvkyVsagpX7E8k7qvUdUavb7lWFlV3bwjfBfyg
         0pqQ==
X-Gm-Message-State: AOJu0Yx//xIzBJ9khQoiJDd1s0kTKLcM+sUXsWtNlEFFlPO8dw6n3Ire
	1j1fX7z3nrRyt2fpoo9mTpMJufo4MKYZcdvbLExaWA==
X-Google-Smtp-Source: AGHT+IGnsct1TtXsCOP9NVgGwPzYUd7tgDEeTfBIGRUc5NUgd7ZgNlHQ3BbdTYL88E8XR22jOxrW/3zQp9aoCA0z7sA=
X-Received: by 2002:a05:6512:2016:b0:500:a368:a962 with SMTP id
 a22-20020a056512201600b00500a368a962mr7798675lfb.43.1694514523798; Tue, 12
 Sep 2023 03:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230912075805.11432-1-moudy.ho@mediatek.com> <c0bd7428-1330-58c5-64d2-78af479dfcf4@collabora.com>
 <CAGXv+5FhsKVGwoJxLP=-gV+rSHbQ8DUX0YACy0mPxYw+MC85=g@mail.gmail.com> <d8bfbb5f-07a7-4beb-ac1c-049825caf934@collabora.com>
In-Reply-To: <d8bfbb5f-07a7-4beb-ac1c-049825caf934@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 12 Sep 2023 18:28:32 +0800
Message-ID: <CAGXv+5EJ6W6XCJR3busZ0HVQjLytZvzMMjUhhpR5g6Jc8sJQ+A@mail.gmail.com>
Subject: Re: [PATCH v5 00/14] add support MDP3 on MT8195 platform
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_032853_386234_5B764F4D 
X-CRM114-Status: GOOD (  25.96  )
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

On Tue, Sep 12, 2023 at 5:43=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 12/09/23 11:37, Chen-Yu Tsai ha scritto:
> > On Tue, Sep 12, 2023 at 5:00=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 12/09/23 09:57, Moudy Ho ha scritto:
> >>> Changes since v4:
> >>> - Rebase on v6.6-rc1
> >>> - Remove any unnecessary DTS settings.
> >>> - Adjust the usage of MOD and clock in blending components.
> >>>
> >>> Changes since v3:
> >>> - Depend on :
> >>>     [1] https://patchwork.kernel.org/project/linux-media/list/?series=
=3D719841
> >>> - Suggested by Krzysztof, integrating all newly added bindings for
> >>>     the mt8195 MDP3 into the file "mediatek,mt8195-mdp3.yaml".
> >>> - Revise MDP3 nodes with generic names.
> >>>
> >>> Changes since v2:
> >>> - Depend on :
> >>>     [1] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-media=
tek/list/?series=3D711592
> >>>     [2] MDP3: https://patchwork.kernel.org/project/linux-mediatek/lis=
t/?series=3D711618
> >>> - Suggested by Rob to revise MDP3 bindings to pass dtbs check
> >>> - Add parallel paths feature.
> >>> - Add blended components settings.
> >>>
> >>> Changes since v1:
> >>> - Depend on :
> >>>     [1] MDP3 : https://patchwork.kernel.org/project/linux-mediatek/li=
st/?series=3D698872
> >>>     [2] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-media=
tek/list/?series=3D684959
> >>> - Fix compilation failure due to use of undeclared identifier in file=
 "mtk-mdp3-cmdq.c"
> >>>
> >>> Hello,
> >>>
> >>> This patch is used to add support for MDP3 on the MT8195 platform tha=
t
> >>> contains more picture quality components, and can arrange more pipeli=
nes
> >>> through two sets of MMSYS and MUTEX respectively.
> >>>
> >>> Moudy Ho (14):
> >>>     arm64: dts: mediatek: mt8183: correct MDP3 DMA-related nodes
> >>>     arm64: dts: mediatek: mt8195: add MDP3 nodes
> >>
> >> Please send the DTS patches separately, those go through a different m=
aintainer.
> >
> > I thought most people prefer the _full_ view in a patchset?
> >
>
> Yeah but those going through a different maintainer makes it more straigh=
tforward
> to pick; besides, essentially, you can also get a full view with dt-bindi=
ngs
> patches instead of devicetrees, as the latter are "constructed from" bind=
ings
> anyway.

Sure, but testing, especially by people not in the recipients or CC list,
is a bit painful when the full set of patches isn't bundled together.
Having them bundled together shows what the submitter tested and makes
it easier for others to reproduce.

AFAIK other ARM platforms have been sending patches all grouped together.
It's MediaTek that has been different, as they normally have (for Chromeboo=
ks)
a system integration engineer handling the device tree stuff, while compone=
nt
driver owners just handle the drivers, and by extension, the DT bindings.

> Moreover, it would be definitely nice to add a link to the devicetree ser=
ies
> in the cover letter of this series, so that people *do* get a full overvi=
ew
> by checking both series :-)

Most maintainers seem to know what to do: apply the subset destined for
their tree. At least the subsystems that frequently deal with DT-based
platforms anyway.


ChenYu

> Cheers!
>
> >> P.S.: The dt-bindings patch can be sent inside of this series, please =
do that.
> >>
> >> Thanks!
> >> Angelo
> >>
> >>
>

