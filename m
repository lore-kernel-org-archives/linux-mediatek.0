Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E8DD18138
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 17:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YvCyiEJtr+qUymKfrJxjmgWzjTOTfJ/IGHyNlcHtGg4=; b=VDygQ+EhS58LwKtKQIeN8BOJIs
	xUOa2rAP6SwPk4Ni12iZigl0n9ylXHNCYl/uiotSbBfXJPUYsPmnnP05dvofIHDaDtnx0EOpUmLg9
	8d8eSAGq7XXX3JAgXweBARmeu4oCHx8aOyWoz/oa8VENDSexDoFNY5AlLs9FTnSSDy6GRYJGwpQpu
	rI9tmm+lZX45yey6BPrtOLhWPDKGtFbw8lNSsW7D+AxJEpuOBJNkmNiKbkHeVb18PeKWE27lLiFTF
	m2YgFQSN6/kv+nrowWfZY5OYXVg7C7DurCnRvIZ38rgxZ3S4Agh5DEvMFCn5khfJgxE9Joq6cB9Yw
	RNVhci+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0P3c-000000064X2-3Qvu;
	Mon, 14 Oct 2024 17:40:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0P2C-000000064Jg-2UCg;
	Mon, 14 Oct 2024 17:39:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B1125C5AFA;
	Mon, 14 Oct 2024 17:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C85BC4AF0C;
	Mon, 14 Oct 2024 17:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728927547;
	bh=GSdP32UvF/3OTOvTrKWKCdA75fPSJyT8cZYVq5WuII0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=g+xzqXacBIPl7JsHeHXFLj46QLlo9TKTjIvSkI1GrCtwWtFRROuWaru6uv/EvqxOP
	 MBhWelqJUWvMayRlYGmZ28yzBFtnqgu1lGm0iJa4/4gBUnlXLUVeluB6fu98b1xR2G
	 Cptlvy86kNxFJn1HKS0ZjwBeXdlFwoKUWe0Cc+6NROfnosjfLL71o5CO2gKti9i+d/
	 IY2fvdAi9fKqZb3V8UvLgqn2rzW06i5T8i76C2s20EdpMKkXQ4CJhO9s7tYonv2NZ3
	 lDgbM0YVplpA60w/3Z4EMLs/o4haWCCUVDFBA3KivRurCaW0fNE+YXZSTuCPOdaN8j
	 CJ0HoiN543cbw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so1309903e87.1;
        Mon, 14 Oct 2024 10:39:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVcOhoHdDiXXbWCXBEFN048xyWbgvVFsmYKW0ltUKEnpIf7ITjqNTD3/MFoOBYyTg0f5imqMeE83ylqyY41cXA=@lists.infradead.org, AJvYcCXRwWLvfPYkCnaF6m2LhsFnbkeOlRS3KSb+8bL0xT3f7YPDfEeyjkDBw4YQhM+wHdC1RcEhHiz5wAdCiCiIq10X@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcyymkd1yXA+m9X1I8UoNj6gpyGz7HuUHxSkyIajAvhFukcF/S
	VgRbtf1YWyjYqgdWqKEvjfVjXFalsjZ/NJHx4b4EpOHfdYjqpggNX5uQOCL1Ib5b/bp/XEVKwc1
	Gcw4cf4BOGRvszsrDxmnnKlQe4w==
X-Google-Smtp-Source: AGHT+IGsfTRPyPm9+84ee+96fBbvWyKCzmA8qytZEXkaEUVRTaFfm7J3+vzBiqPzmo8azDKt+aN/qJ+sYpgh7e2h65c=
X-Received: by 2002:a05:6512:10cc:b0:539:e97c:cb12 with SMTP id
 2adb3069b0e04-539e97ccdadmr3183668e87.34.1728927545757; Mon, 14 Oct 2024
 10:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240912144430.3161717-1-treapking@chromium.org>
 <20240912144430.3161717-3-treapking@chromium.org> <CAL_JsqJngFLbNtT3m--xi5nNt9o7M=se8Qkhf20TxRCj-G=6dA@mail.gmail.com>
In-Reply-To: <CAL_JsqJngFLbNtT3m--xi5nNt9o7M=se8Qkhf20TxRCj-G=6dA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 14 Oct 2024 12:38:53 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJM3sHECd9U1aJ+HGvTarLxmrNFkXq-k4jGU4S6h8nO3A@mail.gmail.com>
Message-ID: <CAL_JsqJM3sHECd9U1aJ+HGvTarLxmrNFkXq-k4jGU4S6h8nO3A@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mt8183: Add port node to dpi node
To: Pin-yen Lin <treapking@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, Fabien Parent <fparent@baylibre.com>, 
	Jitao shi <jitao.shi@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_103908_742158_B4599B5B 
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

On Fri, Sep 13, 2024 at 4:37=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Thu, Sep 12, 2024 at 9:44=E2=80=AFAM Pin-yen Lin <treapking@chromium.o=
rg> wrote:
> >
> > Add the port node to fix the binding schema check.
>
> The dsi node has the same issue.

This is still causing warnings in the tree. Please respin the patch.

>
> > Fixes: 009d855a26fd ("arm64: dts: mt8183: add dpi node to mt8183")
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202409110843.Hm5W9upr-lkp=
@intel.com/
> >
> > ---
> >
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot=
/dts/mediatek/mt8183.dtsi
> > index 266441e999f2..0a6578aacf82 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -1845,6 +1845,10 @@ dpi0: dpi@14015000 {
> >                                  <&mmsys CLK_MM_DPI_MM>,
> >                                  <&apmixedsys CLK_APMIXED_TVDPLL>;
> >                         clock-names =3D "pixel", "engine", "pll";
> > +
> > +                       port {
> > +                               dpi_out: endpoint { };
> > +                       };
> >                 };
> >
> >                 mutex: mutex@14016000 {
> > --
> > 2.46.0.662.g92d0881bb0-goog
> >

