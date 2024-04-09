Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33C2CD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 03:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKPZzs2J4lIrxwzL7Z1BludJY/XdSD/M6/ANxlIo6/0=; b=R2BegE/Vy9C0HUTPGfKRwGyp64
	FNtnpXnidk85pFH87w2GrO5iuyHoWxVuAfKPgkEPObDnEvkgXBbaOSmtFTs4A5KfK6kzXcMSA+IJm
	jpvGyOqejR0tiPNp9qlrtCROq0euQMqmkrPmet2HWSOy9pg718HY5gU1Gm1W+DI/Sckfv7FEJ0hWC
	5ig2oPRihR6NaisUYwMsfnju0EHrggesyVeroFtI9K7g7w9L4q8h8RtlJBKhcImW5waYoT8ffWymw
	25Y5ZOctCDij2UobpwdWJ69MG5hgELeCTVIDzIuHJmDk9l5hFXvIbtC2p4QMzdh9/ar48LMcC7JhQ
	GsahF+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru2Kw-00000000BVu-3TQL;
	Tue, 09 Apr 2024 03:39:54 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru2Kt-00000000BU5-1fC3
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 03:39:53 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-516b6e75dc3so6492630e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Apr 2024 20:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712633984; x=1713238784; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKPZzs2J4lIrxwzL7Z1BludJY/XdSD/M6/ANxlIo6/0=;
        b=aCeg1sM0hqv7pGMiRZsDNc+DUFXUfjg+oMoScxn1gNl6zP8nBa/aPd9IApysjK+eIw
         ZUjtR/IQTXubNdAAmDvREuBVLDBU+Cw1UuLOpZhsUgwM2Nx8EOR2SdJ0pPz6ttRw3Cwg
         2buphnkc1H9Z8PiQZc8baTb7puxKPqJv08t2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712633984; x=1713238784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKPZzs2J4lIrxwzL7Z1BludJY/XdSD/M6/ANxlIo6/0=;
        b=piYEuPqL3/42/LAIJ7LQr05kr1sXtxkG5mca5ESEot3DuYjEhN0B9Sr4KvJ8PciUl7
         z2gq+gdPCspUZU3G8VhhTRHu3YeSmmmXbEmOXY8JCCaIgnI7eLtPPto4ceCa8nKLe4gb
         EF8ohUkN+jDH8kjSpSBjuBvl0aMdP1CwEa3owBPLJM/NcjPRV2q4gW5izDcJ3+/XxDe2
         xCtJLVS0bSlDGacIrMn2iZ7tFogExsMf+d+h2pczDOXhWW3Hh/rAqzjBOF7oSMIBlJje
         zphtodI2tMKxZ2zJFgL6xViu1qUpcFS3zP3faEMz6hemnePZfDJ+6fdWvOK06OQO8Y3i
         oujQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEfLJu9DjKcc+274ExT8ZquJQIfLGq656MvRMb5cWWJyFA8olMghJV/WDeoCOVz5EVsJgakC+OC1KuLepKb44t11DAHbM9SLGPs47oPHPqtF5a
X-Gm-Message-State: AOJu0Yw2nSEurd8f/sizyVo2Ma1XMAviDxPom84PszDqyq8Qdx3ig2RZ
	L/vyKeJyP2L+8Q+/MUqdkrYJLweVG2toRRfk/k/ugxjN22kvGjP9mddlH9C3XcHQAZODP94X6dF
	3hS5AA5yAgX6/ovuqlpFo6Cy7vmipYGibzv5C
X-Google-Smtp-Source: AGHT+IFba+BrwCMiOouL0a7dqzF+zOfyVTmCHkiqgDT24USb8iVyp548tZZRYidWDUI6/w60evjxT4xx96AaXSCW7qY=
X-Received: by 2002:ac2:43b6:0:b0:516:c099:e785 with SMTP id
 t22-20020ac243b6000000b00516c099e785mr6549819lfl.20.1712633983546; Mon, 08
 Apr 2024 20:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240404081635.91412-1-angelogioacchino.delregno@collabora.com>
 <20240404081635.91412-3-angelogioacchino.delregno@collabora.com>
 <CAGXv+5F9rfTVDExKSCF7fBKwR+HijNzFYE6+4aHKw3ZP81DG9w@mail.gmail.com> <5e385c2e-6509-4347-96a5-4606b32d20ff@collabora.com>
In-Reply-To: <5e385c2e-6509-4347-96a5-4606b32d20ff@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 9 Apr 2024 11:39:32 +0800
Message-ID: <CAGXv+5HkKZr0tDPhS9qVs=Uw7YYpfFYaC2Qf4Suv7RznUNWVsQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com, 
	ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_203951_757994_6AD2F664 
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

On Mon, Apr 8, 2024 at 6:16=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 08/04/24 05:20, Chen-Yu Tsai ha scritto:
> > On Thu, Apr 4, 2024 at 4:16=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Document OF graph on MMSYS/VDOSYS: this supports up to three DDP paths
> >> per HW instance (so potentially up to six displays for multi-vdo SoCs)=
.
> >>
> >> The MMSYS or VDOSYS is always the first component in the DDP pipeline,
> >> so it only supports an output port with multiple endpoints - where eac=
h
> >> endpoint defines the starting point for one of the (currently three)
> >> possible hardware paths.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@c=
ollabora.com>
> >> ---
> >>   .../bindings/arm/mediatek/mediatek,mmsys.yaml | 23 +++++++++++++++++=
++
> >>   1 file changed, 23 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,m=
msys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.y=
aml
> >> index b3c6888c1457..90758bb5bcb1 100644
> >> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.ya=
ml
> >> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.ya=
ml
> >> @@ -93,6 +93,29 @@ properties:
> >>     '#reset-cells':
> >>       const: 1
> >>
> >> +  port:
> >> +    $ref: /schemas/graph.yaml#/properties/port
> >> +    description:
> >> +      Output port node. This port connects the MMSYS/VDOSYS output to
> >> +      the first component of one display pipeline, for example one of
> >> +      the available OVL or RDMA blocks.
> >> +      Some MediaTek SoCs support up to three display outputs per MMSY=
S.
> >> +    properties:
> >> +      endpoint@0:
> >> +        $ref: /schemas/graph.yaml#/properties/endpoint
> >> +        description: Output to the primary display pipeline
> >> +
> >> +      endpoint@1:
> >> +        $ref: /schemas/graph.yaml#/properties/endpoint
> >> +        description: Output to the secondary display pipeline
> >> +
> >> +      endpoint@2:
> >> +        $ref: /schemas/graph.yaml#/properties/endpoint
> >> +        description: Output to the tertiary display pipeline
> >> +
> >> +      required:
> >> +        - endpoint@0
> >> +
> >
> > Technically the mmsys device serves as an glue layer for the display
> > pipeline, providing things like clock control and signal routing; the
> > device itself is not part of the pipeline, and probably shouldn't be
> > part of the graph?
> >
>
> That is (only) partially true: in the case of older SoCs, the MMSYS can o=
nly
> connect to a single first IP of the pipeline, but in the case of newer on=
es,
> and especially (but not limited to) MT8195 onwards having multiple instan=
ces
> of VDOSYS, that really becomes part of the pipeline.
>
> This is not because of the possible different first IP in the pipeline, b=
ut
> because of support for dual-interface (DSI and DP) that, in even newer So=
Cs,
> can be done with cross-mmsys (cross-vdosys, actually...) as some of those=
 do
> have the two in different VDOs.
>
> So yes, this can be done without the graph in MMSYS *in this precise mome=
nt in
> time*, but we'll anyway end up adding it sooner than later - and I'm doin=
g this
> right now, instead of later, because it's also simplifying the implementa=
tion
> so like that I'm "catching two birds with one stone" :-)

I see. Thanks for sorting it out. We had something similar on Allwinner
platforms but it was never as complex or flexible as this.

ChenYu

> Cheers,
> Angelo
>
> > ChenYu
> >
> >>   required:
> >>     - compatible
> >>     - reg
> >> --
> >> 2.44.0
> >>
>
>

