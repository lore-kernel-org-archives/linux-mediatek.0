Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1DCCA0EC0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 21:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+2toErZ/FOMNzBI7y1aGkT9OwiifNgmOZWGXsshpp0=; b=ExqT3rRIrx2PyvFzlMUBadh43H
	3mFrkZ0HKtEDlaAnesi5D9coKf8VQuBVpRy5MplrFtMFvDxPt7CaQm61Vou/FBqnqFhoyTUtFbffc
	Y0kyrhIXjiuLsOcVfH62VpBtKhDqd4/hLvggl9I5gRawN4yReifwH3qh6SZpFBejF+MHDFGJeZjGQ
	+7hblt9ywJyiSikrDldMbbrVieIAGLiWJtgdqVOLyyssozVr3VwJgNh1X46WIswZMRhlYwC/7GkoS
	Rsb3ZIYaBGuQMLrceEixR5gCpd5smqRf3sahlmGy5VnNWD4ST4dKx+iYpWsjwgZ1p7z5il1Wcs7KA
	QZ4JSvRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfo7A-001LHI-0s;
	Mon, 11 Sep 2023 21:06:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfo77-001LGc-0p;
	Mon, 11 Sep 2023 21:06:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D355B613C5;
	Mon, 11 Sep 2023 21:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7C5C433B8;
	Mon, 11 Sep 2023 21:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694466391;
	bh=emY+8OOcII6sxAHBz/ueLAdDUaQM+gjoMKh7SHfBk1M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Tfe97YsfXcfKG5h/8G4yZP+eRv0qt8cCoMlRBYzI0MAfyU4DdQKymBPxuPSEvuPyB
	 NyC0hnNLkbs5Xs860kSiFKoD1O2W84hsUijA9DTiJASMNBiq/3de5qPC8geSoEVkRh
	 SOfkxgUYfuplCjC8lFKGCdKsBWZx0wUj1yxHCvvPupYNdxSflhB/yvVNrBC5LG9KW0
	 5RpQhlAzzCN6IIeJnUGhm+FyS/qgBH9LkYKRnYkOFZEr9T8o9eFhtADqBv5xIUvccf
	 45ua3df6Lrc7W2v1XbZqdzyaREJIExUwp3zVzXT5fvES8+qwNRnEJ9AQSwd0BH7X8I
	 v1AsIuZW5dzIg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-501bd7711e8so8473196e87.1;
        Mon, 11 Sep 2023 14:06:31 -0700 (PDT)
X-Gm-Message-State: AOJu0YybJYjDHUJbRbrZ4y1Qs4z0eT3QF/eXPbrFjuiN/SiI73XJ0nSP
	i4qnz3jlFUlPDiOb1D3parM8QLRprnEd5L5p6A==
X-Google-Smtp-Source: AGHT+IFIlnCjhKkjK04xViV3+eFz0aY5IAvCPJkUT/P8yaXEYd0nahR4SLre1VfiOPhvbszphcoq47BjPmOBQ6Yktoc=
X-Received: by 2002:a05:6512:3496:b0:500:863e:fc57 with SMTP id
 v22-20020a056512349600b00500863efc57mr7380863lfr.25.1694466389428; Mon, 11
 Sep 2023 14:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230901072730.13571-1-linux@fw-web.de> <CAL_Jsq+f9bq5Mab9m1pzDeiw304TMeNDmJk+ofG6M8J9QD3cvQ@mail.gmail.com>
 <76060BF0-B432-4BB8-A5C8-39EFF3D628EA@public-files.de>
In-Reply-To: <76060BF0-B432-4BB8-A5C8-39EFF3D628EA@public-files.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 11 Sep 2023 16:06:16 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJSi=kJSix=f3787ULZnaCy_Y26Phdhy5y9fat_vkDuUw@mail.gmail.com>
Message-ID: <CAL_JsqJSi=kJSix=f3787ULZnaCy_Y26Phdhy5y9fat_vkDuUw@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: mt7986: add overlay for SATA power socket
 on BPI-R3
To: frank-w@public-files.de
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_140633_407609_02CC37F3 
X-CRM114-Status: GOOD (  23.41  )
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

On Mon, Sep 11, 2023 at 3:11=E2=80=AFPM Frank Wunderlich
<frank-w@public-files.de> wrote:
>
> Am 11. September 2023 21:51:42 MESZ schrieb Rob Herring <robh+dt@kernel.o=
rg>:
> >On Fri, Sep 1, 2023 at 2:27=E2=80=AFAM Frank Wunderlich <linux@fw-web.de=
> wrote:
> >>
> >> From: Frank Wunderlich <frank-w@public-files.de>
> >>
> >> Bananapi R3 has a Power socket entended for using external SATA drives=
.
> >> This Socket is off by default but can be switched with gpio 8.
> >>
> >> Add an overlay to activate it.
> >>
> >> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> >> ---
> >>  arch/arm64/boot/dts/mediatek/Makefile         |  1 +
> >>  .../mt7986a-bananapi-bpi-r3-sata.dtso         | 39 ++++++++++++++++++=
+
> >>  2 files changed, 40 insertions(+)
> >>  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-=
r3-sata.dtso
> >>
> >> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/d=
ts/mediatek/Makefile
> >> index c99c3372a4b5..822d3e36d3df 100644
> >> --- a/arch/arm64/boot/dts/mediatek/Makefile
> >> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> >> @@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bp=
i-r3-emmc.dtbo
> >>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nand.dtbo
> >>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nor.dtbo
> >>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd.dtbo
> >> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sata.dtbo
> >
> >The requirement for overlays is they have a target base dt in tree and
> >that you apply the overlay to it. All these existing overlays have the
> >same problem which I pointed out when you submitted them. Please fix
> >the existing ones before adding more.
> >
> >
> >Rob
>
> Hi Rob,
>
> i do not understand the problem as there is a target base dt...mt7986a-ba=
nanapi-bpi-r3.dtb.
>
> Do you mean that overlays should be merged with basedt at compiletime?

Yes, because we want to know an overlay can actually apply to what's upstre=
am.

> We pack the base-dt and all overlays into one fit image and let uboot dyn=
amically select the combination to apply. E.g. check if emmc is available, =
if yes apply emmc overlay else the sd one,same for nand/nor.

That's irrelevant.

Though do you really want to wait until that point to find out you
made some mistake in your overlay that it doesn't apply when you could
find out much sooner?

> Else i do not know *how* to fix as i don't see it as broken.

You need what I pointed out last time[1].

Rob

[1] https://lore.kernel.org/all/CAL_JsqK_3xxD0DFwipXO85P=3Dq=3DEYjUdjE1_8g1=
MKtvw3vVzx5A@mail.gmail.com/

