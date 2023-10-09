Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1995EE95A91
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 12:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ylmy6LNqxUWWWrFeJBvKNuZU/HtEg184Ps2X/ZKITwc=; b=ESAPV8w+LdZ+6i
	eoKBnyF9+TNgDW00QuJVZkjb8a9EHSDzauFVmeAUtbkcHXAThxR8X4QKuVwaVK0rsRrNCeKSJxqCO
	OF3Zj0cb9+aN8s7ygnCHyDLvbbfPhbNNupcZuBJfEx6EEbMBvGG633sINU72piJ+5x608ie4ktItq
	YIcK0uMRY0lgniKsHvO4VwMW5SdWitUUf0CNt8DOGEbLJEAI/fzk3rF8p3KQWh52FB8pwCXCLAT2y
	0NHUIOCrDVBBj8L4CfC/i6C5jv6tgwtW5itdGHjAXDQaDAC3qpTWhFzatrndwlli1lvckWhKqNRCI
	0j55tVRk27c5O1yzo96g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpphS-00AixP-04;
	Mon, 09 Oct 2023 12:49:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpphN-00AiwT-2m;
	Mon, 09 Oct 2023 12:49:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A665EB811A2;
	Mon,  9 Oct 2023 12:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B48C433C8;
	Mon,  9 Oct 2023 12:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696855763;
	bh=RdL6X0IuEzq5DEkk1aRpGDbJ8Q3AWlt3Q8VCAAvNqO8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:List-Id:Cc:
	 From;
	b=jsrw4uc2mS1Y+BHxwA1cXtrSn5LJ66eBKR+DweBzZ3RKITTXC/V/p+o650TDlfMyr
	 TMnrN97zAidct8tJxgnqXR11mGUA1SuzbCnht1BYQl2HdVw6he77+meiDZ4wR8mEM5
	 xjWRBwcQBCvX1GXNcUg5uq4me7/3tQoRSBLMVNrMlJU0tlLVgkhD9YEn5ZHWWVzhF9
	 SEBykP4a31cFWyRXoIgQdX1k672a9zOkL7iixtKjF24Nux/lszFd0jQJkg1ne+KYt/
	 b7HFoQ6fR4zgYpSsfvbELPs9qoxcdvGrNKfUIFdmotgQbF/tZ3xafs/TaNICte24cz
	 BJGf7XLC8sl7A==
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2774f6943b1so3349264a91.0;
        Mon, 09 Oct 2023 05:49:23 -0700 (PDT)
X-Gm-Message-State: AOJu0YxsXXTe3gRRGQjzUoPJNQ6ebVvmZuZS04Cf6x7jvBYfI4qljepS
	1wzBXfC/AxxLf4CeMiIBPFsrWyCvkNdQtq6bDbI=
X-Google-Smtp-Source: AGHT+IEJPw/0KZYbTJdgEW1q+YmISj7VyjqzNA2U4u8ZeIq5MgOTrzeUi6ddE86G+8a3/ieeXbfmWIQMdiu7KQ1K8r8=
X-Received: by 2002:a17:90b:3784:b0:276:ba43:a863 with SMTP id
 mz4-20020a17090b378400b00276ba43a863mr13678662pjb.41.1696855762601; Mon, 09
 Oct 2023 05:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <7a877ad9-481f-bad8-5cad-5d013c6cd70d@gmail.com>
In-Reply-To: <7a877ad9-481f-bad8-5cad-5d013c6cd70d@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 9 Oct 2023 21:49:12 +0900
X-Gmail-Original-Message-ID: <CAGb2v64-9o7ukZqOtmDTDjngn62Rw6Nseg13LtZ=6O4dx=Hm5A@mail.gmail.com>
Message-ID: <CAGb2v64-9o7ukZqOtmDTDjngn62Rw6Nseg13LtZ=6O4dx=Hm5A@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: mediatek: Updates for v6.7
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_054926_225120_85C3599C 
X-CRM114-Status: GOOD (  23.68  )
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
Reply-To: wens@kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Oct 9, 2023 at 7:35=E2=80=AFPM Matthias Brugger <matthias.bgg@gmail=
.com> wrote:
>
> Hi Arnd and Olof,
>
> Please find below a few patches for the 64 bit DTS files targeted for v6.=
7.
>
> The patches were picked up with the help from Angelo.
> With these changes we have now support for the Genio 1200 EVK board for I=
oT
> applications. Also the MT8365 from the same business line has much more s=
upport
> of peripherals.
> Also support for the new 4th revision of the Acer Chromebook 514 was adde=
d. The
> difference with older board is the audio codec used.
> On the Mobile phone side of things, support for the Helio X10, which is u=
sed by
> the Sony Xperia M5 got support for the display.
>
> Happy merging,
> Matthias
>
> ---
> The following changes since commit 8a749fd1a8720d4619c91c8b6e7528c0a355c0=
aa:
>
>    Linux 6.6-rc4 (2023-10-01 14:15:13 -0700)
>
> are available in the Git repository at:
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git=
/
> tags/v6.6-next-dts64
>
> for you to fetch changes up to 252d6a178ee3df2984194b3579851b00cbe8cdbd:
>
>    arm64: dts: mediatek: cherry: Configure eDP and internal display (2023=
-10-06
> 11:10:18 +0200)
>
> ----------------------------------------------------------------
> MediaTek ARM64 DTS updates for v6.7
>
> - Add support for SMI/IOMMU/LARBs, power domains and multimedia
>    related subsystems for the MT8365 SoC
> - Add support for MediaTek Genio 1200 IoT evaluation board
> - Add support for newer revisions of MT8192 Chromebooks
> - Add support for internal eDP display on MT8195 Cherry Chromebooks
> - Add display and display backlight support for the Helio X10 SoC and
>    for the Sony Xperia M5 smartphone
>
> ----------------------------------------------------------------
> Alexandre Mergnat (7):
>        arm64: dts: mediatek: add mmsys support for mt8365 SoC
>        arm64: dts: mediatek: add camsys support for mt8365 SoC
>        arm64: dts: mediatek: add apu support for mt8365 SoC
>        arm64: dts: mediatek: add power domain support for mt8365 SoC
>        arm64: dts: mediatek: add smi support for mt8365 SoC
>        arm64: dts: mediatek: add larb support for mt8365 SoC
>        arm64: dts: mediatek: add iommu support for mt8365 SoC
>
> AngeloGioacchino Del Regno (4):
>        arm64: dts: mediatek: mt6795: Add support for display blocks and D=
PI/DSI
>        arm64: dts: mediatek: mt6795-xperia-m5: Add display backlight supp=
ort
>        arm64: dts: mediatek: mt6795-xperia-m5: Add DSI Display and its vr=
egs
>        arm64: dts: mediatek: cherry: Configure eDP and internal display
>
> Chen-Yu Tsai (1):
>        arm64: dts: mediatek: mt8183-kukui: Add PMIC regulator supplies

Could you also pick up the following patches?

- arm64: dts: mediatek: mt6358: Merge ldo_vcn33_* regulators
  https://lore.kernel.org/linux-mediatek/20230913084457.1638690-1-wenst@chr=
omium.org/
- arm64: dts: mt6358: Drop bogus "regulator-fixed" compatible properties
  https://lore.kernel.org/linux-mediatek/20230928091415.3253698-1-wenst@chr=
omium.org/


Thanks


> Macpaul Lin (2):
>        dt-bindings: arm64: mediatek: add mt8395-evk board
>        arm64: dts: mediatek: add device-tree for Genio 1200 EVK board
>
> N=C3=ADcolas F. R. A. Prado (5):
>        dt-bindings: arm64: dts: mediatek: Add rev5-sku2 of hayato
>        dt-bindings: arm64: dts: mediatek: Add rev4 of spherion
>        arm64: dts: mediatek: Remove asurada-audio dtsi files
>        arm64: dts: mediatek: Add hayato-rev5-sku2
>        arm64: dts: mediatek: Add spherion-rev4
>
>   .../devicetree/bindings/arm/mediatek.yaml          |  16 +
>   arch/arm64/boot/dts/mediatek/Makefile              |   3 +
>   .../boot/dts/mediatek/mt6795-sony-xperia-m5.dts    | 101 +++
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi           | 253 +++++-
>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |  28 +
>   .../mt8192-asurada-audio-rt1015p-rt5682.dtsi       |  19 -
>   .../dts/mediatek/mt8192-asurada-audio-rt1015p.dtsi |  26 -
>   .../dts/mediatek/mt8192-asurada-audio-rt5682.dtsi  |  21 -
>   .../boot/dts/mediatek/mt8192-asurada-hayato-r1.dts |  19 +-
>   .../dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts |  64 ++
>   .../dts/mediatek/mt8192-asurada-spherion-r0.dts    |  19 +-
>   .../dts/mediatek/mt8192-asurada-spherion-r4.dts    |  77 ++
>   arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi   |  28 +
>   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi    |  33 +
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 210 +++++
>   .../boot/dts/mediatek/mt8395-genio-1200-evk.dts    | 901 ++++++++++++++=
+++++++
>   16 files changed, 1749 insertions(+), 69 deletions(-)
>   delete mode 100644
> arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt1015p-rt5682.dtsi
>   delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt=
1015p.dtsi
>   delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt=
5682.dtsi
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r=
5-sku2.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion=
-r4.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.d=
ts

