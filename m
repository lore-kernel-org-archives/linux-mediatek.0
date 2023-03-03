Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7C8C64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 04:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRC4YLaEQEHKXN/6JGBdTnUfCKse6BmeeCh40b97lyU=; b=BqtYGcTg8X1eRbveaWEGWdrgTn
	Xcp3Ebbmj79ShY9VIqFyXeWq4HmsT7wZLKRR2t8j0JN7TjqrYf7tJFQ4/5QS6E98S1PO7r7zy2h3y
	HhAyywEL0oXhvbfaCOGOQSdw4uc03c6UShvDXZWEWRN4gwlC99xz2qEbIYHN8+FonTD1I6e2uY9M+
	uPPCwCIJAfD8W2VsbO5pEC+H72YF/0FSesEsJ7u7NyTDaRT59mJ4qjrtoK9lHv2BRuTTyMHgMMj43
	PsNm1oZGYsutTNcEVM1aEUefDyN+fFaGlTgCJSYubpRKVEiyOfOQzA+qn5zT4HzR+v2tzw9UfpGMx
	V5X9ZraA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXwkP-004mFT-Gm; Fri, 03 Mar 2023 04:10:21 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXwkM-004mDK-IC
	for linux-mediatek@lists.infradead.org; Fri, 03 Mar 2023 04:10:20 +0000
Received: by mail-vs1-xe29.google.com with SMTP id d7so1316705vsj.2
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Mar 2023 20:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1677816608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRC4YLaEQEHKXN/6JGBdTnUfCKse6BmeeCh40b97lyU=;
        b=J0MMw125d6BUUD2+AWqFnAyv/kyC+C8t2mo+dbXO0bnEX355WlX9Q8LyZ7B1xTyhRB
         SJO0yGDk1xFfdVyMDPIL4Cpju727DBv/06HO3ZbVgKT4tqt/GT8QTL7C+CgBduekqZoX
         Y8yGhzkKeWknSRPQtmGy+02d0EXtiBZ/IGn68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677816608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRC4YLaEQEHKXN/6JGBdTnUfCKse6BmeeCh40b97lyU=;
        b=j26nkZmb7fDGjIzUYRRHMoLzXQtLdxT7XH8Uy/78l+4jiKCdOTx4KhRuQAZVRw6tCp
         1YyQU8/mrmhHZNT2ok7wnP5ldAP+OlbXvJXKy7TD465QALxgFueJio1Jf7ChMUiopF1i
         tgq5uJ+HToiUJRfWNT59A3PwBzB3tkyUP6MRxTGBGIzTOW45qRIYnngNvBmp/p3S75IL
         1wHuSNmWYRvzZl2LQhLz0MCngOqR1NB79O7w1U9IVAXVfjwBv4SvDhtyCs6Wz8u339j8
         l10EbvXhGd2+BCiSqRdWHCYEqbnmZT4TVTV8vGtpVsONPogdzXf17guENzGsC8EyAmkT
         Uspw==
X-Gm-Message-State: AO0yUKUW/e2/55Vbt9ESVFrOltR2rgWyCTTbdJLOF4/VFK16edtqhTKn
	X3wtBgCCZDrVsCEyIHXGEAtdluk4p6mjqvgaOvltfA==
X-Google-Smtp-Source: AK7set9++Bot24TdBbob3L+v00rJIcqvEsIVWfPdrz7FFzAkveckkAMrXFyxCkw7zTJ7CrHhOeb6JCtaprEtFG9gu5c=
X-Received: by 2002:a67:d583:0:b0:411:fff6:3cc4 with SMTP id
 m3-20020a67d583000000b00411fff63cc4mr328329vsj.3.1677816608206; Thu, 02 Mar
 2023 20:10:08 -0800 (PST)
MIME-Version: 1.0
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
 <20230301095523.428461-13-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GHdtbheL6wxtDo-szk+=3BGk2z93SBowd4Z=E9XupZkw@mail.gmail.com> <5dba27e1-d480-ea24-c1ba-03bb7f77b1b1@collabora.com>
In-Reply-To: <5dba27e1-d480-ea24-c1ba-03bb7f77b1b1@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Mar 2023 12:09:57 +0800
Message-ID: <CAGXv+5FwNfZ7TwKVMM5_uAjYQ6ZmhZVFsWREb_da-jxC6EUVJw@mail.gmail.com>
Subject: Re: [PATCH v4 12/19] arm64: dts: mediatek: mt8192-asurada: Couple
 VGPU and VSRAM_OTHER regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_201018_667598_EC4DF19B 
X-CRM114-Status: GOOD (  26.40  )
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

On Thu, Mar 2, 2023 at 6:17=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 02/03/23 11:03, Chen-Yu Tsai ha scritto:
> > On Wed, Mar 1, 2023 at 5:55=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Add coupling for these regulators, as VSRAM_OTHER is used to power the
> >> GPU SRAM, and they have a strict voltage output relation to satisfy in
> >> order to ensure GPU stable operation.
> >> While at it, also add voltage constraint overrides for the GPU SRAM
> >> regulator "mt6359_vsram_others" so that we stay in a safe range of
> >> 0.75-0.80V.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@c=
ollabora.com>
> >> ---
> >>   arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 9 +++++++++
> >>   1 file changed, 9 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/a=
rm64/boot/dts/mediatek/mt8192-asurada.dtsi
> >> index 8570b78c04a4..f858eca219d7 100644
> >> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> >> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> >> @@ -447,6 +447,13 @@ &mt6359_vrf12_ldo_reg {
> >>          regulator-always-on;
> >>   };
> >>
> >> +&mt6359_vsram_others_ldo_reg {
> >> +       regulator-min-microvolt =3D <750000>;
> >> +       regulator-max-microvolt =3D <800000>;
> >> +       regulator-coupled-with =3D <&mt6315_7_vbuck1>;
> >> +       regulator-coupled-max-spread =3D <10000>;
> >
> > Looking again at the downstream OPP table, it seems there's no voltage
> > difference requirement. It only needs V_SRAM >=3D V_GPU. Same applies t=
o
> > MT8195. Looks like only MT8183 and MT8186 need V_SRAM - V_GPU >=3D 1000=
0.
>
> On MT8195 we don't need any regulator coupling. There, the GPU-SRAM volta=
ge
> is fixed at .. I don't remember, 0.7V? - anyway - MT8195 doesn't need to
> scale the vsram.

Looks like it's fixed at 0.75V. I guess we're Ok on MT8195.

> >
> > Would setting max-spread to 0 work? I ask because with both regulator's
> > maximum voltage set to 0.8V, there's no way we can reach the highest
> > OPP.
> >
>
> No that doesn't work. I can raise the Vgpu max voltage to 0.88V to solve =
the
> issue right here and right now, or we can leave it like that and revisit =
it
> later.
>
> I would at this point go for setting mt6315_7_vbuck1's max-microvolt to
> 880000, as this is the maximum recommended voltage for the GPU as per the
> MT8192 datasheet, it would also make sense as we would be still describin=
g
> the hardware in a correct manner.
>
> What do you think?

If it's just to accommodate the coupler stuff, I say just set the maximum
at the lowest possible setting that satisfies the coupler constraint and
granularity of the regulator. The regulator does 6250 uV steps, so I guess
we could set the maximum at 812500 uV, with a comment stating the nominal
voltage of 800000 uV and that the extra 12500 uV is to workaround coupler
limitations.

Does that sound OK?

ChenYu

