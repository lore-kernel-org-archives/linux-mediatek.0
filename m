Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C0AD1AD5D
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 14:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAuXQiE11s/G4pHb9ZVtQJs230NuUCabSZDQDnuKM08=; b=0A1nKK3O1il3AzaPyqW7bL6/Im
	DDAG7A8oNik2azV9/8qYzQ/DwHrwlVkn6Ogmpa50HTcJRS7htxcaKELkax4lpI/7ZnTIo2hzWEbpb
	WUjWdKhuApYnwWqpZVws71+GXHUlHp8mQAeYuc3H11ERQoofPKtAUqzSG6ex4wL6d87wfsYnuMyy9
	/2Hzydy8XeEiXuVvIICy9fJ/xtsWu01Zo+atbex4oxbAK1M9el5CnjF0+mE84i9lp5UcnNnPr+SPJ
	h2glisy1GbtteVBCGv7WNRxjqDB4DimsUdZVFyarsKd/FeMDceUTEoaVxdTkfkRWoeOzyHU+rYqB0
	RhfzXk8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t14bU-0000000C1KW-1u7d;
	Wed, 16 Oct 2024 14:02:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t14Zu-0000000C0wR-0eUt;
	Wed, 16 Oct 2024 14:00:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DF8825C3A40;
	Wed, 16 Oct 2024 14:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC3BBC4CECF;
	Wed, 16 Oct 2024 14:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729087240;
	bh=BK+m1uMt60o3i/gpdeSpzqCx2kCyhlvBP3c0lem4WOI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QXIlt5rzW1YryMHuQonu8dv8xaVMC6/kDvF/9+IAc9rsSNeyUU2hpaJQh7AV66eOK
	 8RJ4+Fdf4+oanyvdQSCALRGHMzh/KZUifMS2ezbmLw35PKOTMJNYo42ca5DOTJj4Gl
	 nyz+7jObwtDm3UYtOyaUOmjaeV6X3me01t7FYIWUGG/Z3xMlWfdMXo0lEcz8qpFdDU
	 Zpbqgq7kX5vRNr6R4PcSXT6/AMIx1BiKa8TBtb+4bpukaOmyo5VzJm4g8k74L3aaz7
	 UYJuf2BEj6linzhzcILkGcQ9lL+rynEdxkOLVTF1BZS/G6rDMf+C8EHj7LJZz/ob6y
	 xtvAGSS2fu9ww==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539f8490856so3679064e87.2;
        Wed, 16 Oct 2024 07:00:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVC21IQ+7arR/zV5WxI1k+2fqaLKo1my5WY1F9RpCNZCQIfnbyQoHSqS9201echfe2xEZE+4jDGiCVNXyvv8KY=@lists.infradead.org, AJvYcCVEP18YJ8WiQwFpnYRy+M00qqnS3pyJyBE1VzJAoQ4SRDoJEDSUDiSdFtqrnQ4KCueW2Qfw2exMhHGKczWhVLrY@lists.infradead.org
X-Gm-Message-State: AOJu0YxFW3uFngzO7sPdYnsr1c6fZ9yJHkIDeCjuUZ6lklNN3shv7T34
	YVpFKehSBGKuMwpdSZtBgIDO9LINXtVuwEoCnDL7Na3dS330uHZecNn2p62U8kD/7O76WgVtxC8
	+glBj9xxmtdk/lQDrCeyEGx56zA==
X-Google-Smtp-Source: AGHT+IHPNCs8MLQVCkQZQoxybDWunU9F2SX3BzDcHCSDYdOE+qgMEiK6HJiUfa4Hxo6OfVwl0wtqw2rR+HzDyvgDK+M=
X-Received: by 2002:a05:6512:1317:b0:536:52c4:e45c with SMTP id
 2adb3069b0e04-539da4eb323mr9683702e87.31.1729087238930; Wed, 16 Oct 2024
 07:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <20241014085148.71105-1-angelogioacchino.delregno@collabora.com>
 <20241014085148.71105-2-angelogioacchino.delregno@collabora.com>
 <CAL_Jsq+hpTPCkuXoCF88nyS_D+iFZB5osrt1q04RxffDsY7cXw@mail.gmail.com>
 <ec14b01e-7237-4f52-82a6-b8de42fb120b@collabora.com> <20241015134802.GB447702-robh@kernel.org>
 <e5612a1d-b609-4f4a-aec4-601f7060e4cf@collabora.com>
In-Reply-To: <e5612a1d-b609-4f4a-aec4-601f7060e4cf@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 16 Oct 2024 09:00:23 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLsFbJbLn76QYwzCfu+bmpjfsxCDp_OuKAFnktMXMbTBA@mail.gmail.com>
Message-ID: <CAL_JsqLsFbJbLn76QYwzCfu+bmpjfsxCDp_OuKAFnktMXMbTBA@mail.gmail.com>
Subject: Re: [PATCH v12 1/3] dt-bindings: display: mediatek: Add OF graph
 support for board path
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, matthias.bgg@kernel.org, 
	chunkuang.hu@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com, 
	ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	wenst@chromium.org, kernel@collabora.com, sui.jingfeng@linux.dev, 
	michael@walle.cc, sjoerd@collabora.com, 
	Alexandre Mergnat <amergnat@baylibre.com>, Michael Walle <mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_070042_329769_9C9FEE49 
X-CRM114-Status: GOOD (  37.78  )
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

On Wed, Oct 16, 2024 at 4:23=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 15/10/24 15:48, Rob Herring ha scritto:
> > On Tue, Oct 15, 2024 at 10:32:22AM +0200, AngeloGioacchino Del Regno wr=
ote:
> >> Il 14/10/24 19:36, Rob Herring ha scritto:
> >>> On Mon, Oct 14, 2024 at 3:51=E2=80=AFAM AngeloGioacchino Del Regno
> >>> <angelogioacchino.delregno@collabora.com> wrote:
> >>>>
> >>>> The display IPs in MediaTek SoCs support being interconnected with
> >>>> different instances of DDP IPs (for example, merge0 or merge1) and/o=
r
> >>>> with different DDP IPs (for example, rdma can be connected with eith=
er
> >>>> color, dpi, dsi, merge, etc), forming a full Display Data Path that
> >>>> ends with an actual display.
> >>>>
> >>>> The final display pipeline is effectively board specific, as it does
> >>>> depend on the display that is attached to it, and eventually on the
> >>>> sensors supported by the board (for example, Adaptive Ambient Light
> >>>> would need an Ambient Light Sensor, otherwise it's pointless!), othe=
r
> >>>> than the output type.
> >>>>
> >>>> Add support for OF graphs to most of the MediaTek DDP (display) bind=
ings
> >>>> to add flexibility to build custom hardware paths, hence enabling bo=
ard
> >>>> specific configuration of the display pipeline and allowing to final=
ly
> >>>> migrate away from using hardcoded paths.
> >>>>
> >>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> >>>> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> >>>> Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
> >>>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> >>>> Tested-by: Michael Walle <mwalle@kernel.org> # on kontron-sbc-i1200
> >>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno=
@collabora.com>
> >>>> ---
> >>>>    .../display/mediatek/mediatek,aal.yaml        | 40 ++++++++++++++=
+++++
> >>>>    .../display/mediatek/mediatek,ccorr.yaml      | 21 ++++++++++
> >>>>    .../display/mediatek/mediatek,color.yaml      | 22 ++++++++++
> >>>>    .../display/mediatek/mediatek,dither.yaml     | 22 ++++++++++
> >>>>    .../display/mediatek/mediatek,dpi.yaml        | 25 +++++++++++-
> >>>>    .../display/mediatek/mediatek,dsc.yaml        | 24 +++++++++++
> >>>>    .../display/mediatek/mediatek,dsi.yaml        | 27 ++++++++++++-
> >>>>    .../display/mediatek/mediatek,ethdr.yaml      | 22 ++++++++++
> >>>>    .../display/mediatek/mediatek,gamma.yaml      | 19 +++++++++
> >>>>    .../display/mediatek/mediatek,merge.yaml      | 23 +++++++++++
> >>>>    .../display/mediatek/mediatek,od.yaml         | 22 ++++++++++
> >>>>    .../display/mediatek/mediatek,ovl-2l.yaml     | 22 ++++++++++
> >>>>    .../display/mediatek/mediatek,ovl.yaml        | 22 ++++++++++
> >>>>    .../display/mediatek/mediatek,postmask.yaml   | 21 ++++++++++
> >>>>    .../display/mediatek/mediatek,rdma.yaml       | 22 ++++++++++
> >>>>    .../display/mediatek/mediatek,ufoe.yaml       | 21 ++++++++++
> >>>>    16 files changed, 372 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/medi=
atek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek=
,aal.yaml
> >>>> index cf24434854ff..47ddba5c41af 100644
> >>>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aa=
l.yaml
> >>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aa=
l.yaml
> >>>> @@ -62,6 +62,27 @@ properties:
> >>>>        $ref: /schemas/types.yaml#/definitions/phandle-array
> >>>>        maxItems: 1
> >>>>
> >>>> +  ports:
> >>>> +    $ref: /schemas/graph.yaml#/properties/ports
> >>>> +    description:
> >>>> +      Input and output ports can have multiple endpoints, each of t=
hose
> >>>> +      connects to either the primary, secondary, etc, display pipel=
ine.
> >>>> +
> >>>> +    properties:
> >>>> +      port@0:
> >>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        description: AAL input port
> >>>> +
> >>>> +      port@1:
> >>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        description:
> >>>> +          AAL output to the next component's input, for example cou=
ld be one
> >>>> +          of many gamma, overdrive or other blocks.
> >>>> +
> >>>> +    required:
> >>>> +      - port@0
> >>>> +      - port@1
> >>>> +
> >>>>    required:
> >>>>      - compatible
> >>>>      - reg
> >>>> @@ -89,5 +110,24 @@ examples:
> >>>>               power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
> >>>>               clocks =3D <&mmsys CLK_MM_DISP_AAL>;
> >>>>               mediatek,gce-client-reg =3D <&gce SUBSYS_1401XXXX 0x50=
00 0x1000>;
> >>>> +
> >>>> +           ports {
> >>>> +               #address-cells =3D <1>;
> >>>> +               #size-cells =3D <0>;
> >>>> +
> >>>> +               port@0 {
> >>>> +                   reg =3D <0>;
> >>>> +                   aal0_in: endpoint {
> >>>> +                       remote-endpoint =3D <&ccorr0_out>;
> >>>> +                   };
> >>>> +               };
> >>>> +
> >>>> +               port@1 {
> >>>> +                   reg =3D <1>;
> >>>> +                   aal0_out: endpoint {
> >>>> +                       remote-endpoint =3D <&gamma0_in>;
> >>>> +                   };
> >>>> +               };
> >>>> +           };
> >>>>           };
> >>>>        };
> >>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/medi=
atek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediat=
ek,ccorr.yaml
> >>>> index 9f8366763831..fca8e7bb0cbc 100644
> >>>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,cc=
orr.yaml
> >>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,cc=
orr.yaml
> >>>> @@ -57,6 +57,27 @@ properties:
> >>>>        $ref: /schemas/types.yaml#/definitions/phandle-array
> >>>>        maxItems: 1
> >>>>
> >>>> +  ports:
> >>>> +    $ref: /schemas/graph.yaml#/properties/ports
> >>>> +    description:
> >>>> +      Input and output ports can have multiple endpoints, each of t=
hose
> >>>> +      connects to either the primary, secondary, etc, display pipel=
ine.
> >>>> +
> >>>> +    properties:
> >>>> +      port@0:
> >>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        description: CCORR input port
> >>>> +
> >>>> +      port@1:
> >>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        description:
> >>>> +          CCORR output to the input of the next desired component i=
n the
> >>>> +          display pipeline, usually only one of the available AAL b=
locks.
> >>>> +
> >>>> +    required:
> >>>> +      - port@0
> >>>> +      - port@1
> >>>> +
> >>>>    required:
> >>>>      - compatible
> >>>>      - reg
> >>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/medi=
atek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediat=
ek,color.yaml
> >>>> index 7df786bbad20..6160439ce4d7 100644
> >>>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,co=
lor.yaml
> >>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,co=
lor.yaml
> >>>> @@ -65,6 +65,28 @@ properties:
> >>>>        $ref: /schemas/types.yaml#/definitions/phandle-array
> >>>>        maxItems: 1
> >>>>
> >>>> +  ports:
> >>>> +    $ref: /schemas/graph.yaml#/properties/ports
> >>>> +    description:
> >>>> +      Input and output ports can have multiple endpoints, each of t=
hose
> >>>> +      connects to either the primary, secondary, etc, display pipel=
ine.
> >>>> +
> >>>> +    properties:
> >>>> +      port@0:
> >>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        description: COLOR input port
> >>>> +
> >>>> +      port@1:
> >>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        description:
> >>>> +          COLOR output to the input of the next desired component i=
n the
> >>>> +          display pipeline, for example one of the available CCORR =
or AAL
> >>>> +          blocks.
> >>>> +
> >>>> +    required:
> >>>> +      - port@0
> >>>> +      - port@1
> >>>> +
> >>>>    required:
> >>>>      - compatible
> >>>>      - reg
> >>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/medi=
atek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/media=
tek,dither.yaml
> >>>> index 6fceb1f95d2a..abaf27916d13 100644
> >>>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,di=
ther.yaml
> >>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,di=
ther.yaml
> >>>> @@ -56,6 +56,28 @@ properties:
> >>>>        $ref: /schemas/types.yaml#/definitions/phandle-array
> >>>>        maxItems: 1
> >>>>
> >>>> +  ports:
> >>>> +    $ref: /schemas/graph.yaml#/properties/ports
> >>>> +    description:
> >>>> +      Input and output ports can have multiple endpoints, each of t=
hose
> >>>> +      connects to either the primary, secondary, etc, display pipel=
ine.
> >>>> +
> >>>> +    properties:
> >>>> +      port@0:
> >>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        description: DITHER input, usually from a POSTMASK or GAMMA=
 block.
> >>>> +
> >>>> +      port@1:
> >>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        description:
> >>>> +          DITHER output to the input of the next desired component =
in the
> >>>> +          display pipeline, for example one of the available DSC co=
mpressors,
> >>>> +          DP_INTF, DSI, LVDS or others.
> >>>> +
> >>>> +    required:
> >>>> +      - port@0
> >>>> +      - port@1
> >>>> +
> >>>>    required:
> >>>>      - compatible
> >>>>      - reg
> >>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/medi=
atek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek=
,dpi.yaml
> >>>> index 3a82aec9021c..b567e3d58aa1 100644
> >>>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp=
i.yaml
> >>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp=
i.yaml
> >>>> @@ -71,13 +71,34 @@ properties:
> >>>>          Output port node. This port should be connected to the inpu=
t port of an
> >>>>          attached HDMI, LVDS or DisplayPort encoder chip.
> >>>>
> >>>> +  ports:
> >>>> +    $ref: /schemas/graph.yaml#/properties/ports
> >>>> +
> >>>> +    properties:
> >>>> +      port@0:
> >>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        description: DPI input port
> >>>> +
> >>>> +      port@1:
> >>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        description: DPI output to an HDMI, LVDS or DisplayPort enc=
oder input
> >>>
> >>> This is wrong. The existing 'port' is the output. 'port' and 'port@0'
> >>> are treated as the same thing. Since you are adding an input port, th=
e
> >>> new port has to be 'port@1' (or any number but 0).
> >>>
> >>> I haven't looked at the driver code, but it should request port 0 and
> >>> always get the output port. And requesting port 1 will return an erro=
r
> >>> or the input port.
> >>
> >> Hello Rob,
> >>
> >> I want to remind you that in v2 of this series you said that it'd be w=
rong for
> >> port@0 to be an output, I replied that you misread that as I had model=
ed it indeed
> >> as an input, and then you gave me your Reviewed-by tag.
> >
> > I have not misread it. Then I guess I forgot about it and missed it the
> > next time on v3.
> >
>
> Okay, that was some misunderstanding then - it's fine, no problem.
>
> >> Anyway - I get your concern about the previous behavior of `port`, but=
 I chose to
> >> model this that way purely for consistency.
> >>
> >> First of all - the driver(s) will check if we're feeding a full graph,=
 as it will
> >> indeed first check if port@1 is present: if it is, then it follows thi=
s scheme with
> >> port@0 as INPUT and port@1 as OUTPUT.
> >> If the component in port@0 is an OUTPUT, the bridge attach will fail.
> >>
> >> Getting to bindings themselves, then... it would be a mistake to model=
 port@0 as an
> >> output and port@1 as an input, because that would be not only inconsis=
tent with the
> >> DRM Bridge bindings, but would be highly confusing when reading the de=
vicetree.
> >
> > Somewhat confusing, yes. Highly, no. Put a comment in the DT.
> >
>
> "Somewhat or highly" boils down to personal opinion, so I still go for "h=
ighly"
> but won't argue about that as wouldn't be productive and would bring us n=
owhere
> anyway, so, whatever :-)
>
> Putting a comment in DT is an option, yes, but that comment would need to=
 be put
> on all of the MediaTek SoC device trees - current and future - and IMO wo=
uld scream
> "inconsistency warning" (in different words, of course) all over, which h=
onestly
> doesn't really look clean... at least to my eyes...

What I find more confusing is my updated DT doesn't work with my
existing kernel...

> >> Please note that the bridge bindings are always declaring port@0 as an=
 INPUT and
> >> other ports as OUTPUT(s).
> >
> > There is no guarantee on that. Port numbering is local to the bridge an=
d
> > opaque to anything outside that bridge. That is why you have to documen=
t
> > what each port represents.
> >
>
> I know and I agree that there's no guarantee on the numbering. I can see =
that in
> other non-drm-bridge bindings, and that's fine.
>
> > Would we have followed that convention if all the ports were defined
> > from the start? Certainly. But that didn't happen and you are stuck wit=
h
> > the existing binding and ABI.
> >
>
> I thought about adding a new compatible for the new port scheme, but that=
 looked
> even worse to me as, after doing that (yeah, I actually went for it in th=
e first
> version that I have never sent upstream) during my own proof-read I start=
ed
> screaming "HACK! HACK! NOOO!" all over, and rewritten the entire thing.
>
> >> As an example, you can check display/bridge/analogix,anx7625.yaml or
> >> display/bridge/samsung,mipi-dsim.yaml (and others) for bridges, otherw=
ise
> >> display/st,stm32mp25-lvds.yaml or display/allwinner,sun4i-a10-display-=
frontend.yaml
> >> (and others) for display controllers, which do all conform to this log=
ic, where
> >> the input is always @0, and the output is @1.
> >>
> >> Of course, doing this required me to do extra changes to the MTK DRM d=
rivers to
> >> actually be retro-compatible with the old devicetrees as I explained b=
efore.
> >
> > You can't fix existing software...
> >
>
> That's true, but I don't see that as an "excuse" (grant me this term plea=
se) to
> "carelessly" keep it in a suboptimal state.
>
> This driver has been growing almost uncontrollably with (wrong, anyway!)
> board-specific component vectors - and writing a new one would just add u=
p
> more code duplication to the mix and/or worsen the maintainability of old=
er
> MediaTek SoCs (as the "old" driver will get forgotten and never updated a=
nymore).
>
> > If you want to break the ABI, then that's ultimately up to you and
> > Mediatek maintainers to decide0. This case is easy to avoid, why would
> > you knowingly break the ABI here.
>
> Because if we don't do this, we condemn (forever) this driver, or part of=
 it
> to have an inverted port scheme compared to either:
>   A. The other drm/mediatek components; or
>   B. The other bridge drivers (of which, some are used with MTK as well)
>
> ...and we also condemn (forever, again) all MediaTek device trees to scre=
am
> "port inconsistency warning: A for drm/mediatek components, B for every o=
ther
> thing", which would scream "drm/mediatek is somewhat broken", which can b=
e
> avoided.

Sure. The cost is just an ABI break to do that.

> > OTOH, this seems like a big enough
> > change I would imagine it is a matter of time before supporting a
> > missing OF graph for the components will be a problem.
> >
>
> Sorry I didn't understand this part, can you please-please-please reword?

I think keeping the kernel working with the old and new binding will
be a challenge. Partly because testing with the old binding won't
happen, but also if the binding and drivers continue to evolve. So
while maintaining old ABI might be possible with this change, it will
continue to be an issue with each change. BTW, did you actually test
backwards compatibility with this? I can see you fallback to the old
binding, but there's a lot of other changes in there I can't really
tell by looking at it.

What I haven't heard from you is "yes, we need to maintain the ABI" or
"no, we can break it". Decide that, then the path here is simple.

Rob

