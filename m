Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C522CC25B75
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 06:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rv1sDHR32RWCfZmFBg17q325stbG/XmstQRsoUj80I=; b=lYVtkfjSNNWyc8g1LdT2eL7E6m
	CN0oDHROoOkkemAGWgaqcU67yTGajsL6EB4WGqhDKBqUfwWwHVph16zO5sSPjK5rB4G8YckS5jZIL
	/pj8VWILPjXT3zfzizpEautUjzIiKgL7jzB8UMJynUdRN8Lt5btHo8H33lpYQFZmJ4pqRXjfd6JsC
	17TZDjfpmDgKTA+dknoANENaVbz83SaTutQ6joX1z33zkQjjrXXG0q8GYfpG22p16k8tZAiqOGD/6
	UpAp1JBqZwdfwckY6Yn/z5+L3gycp675+ETwuoIfHC978cAbxV0JPEgFCBkxjqx/Lz6WLUshMbZXf
	i8jMDBRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF6u0-00000008Zpn-2UaV;
	Thu, 06 Jun 2024 06:47:12 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF6tw-00000008Znt-0HaK
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Jun 2024 06:47:09 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-52b919d1fc0so477791e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Jun 2024 23:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717656424; x=1718261224; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rv1sDHR32RWCfZmFBg17q325stbG/XmstQRsoUj80I=;
        b=CS6fnm5wkFyQZDN2B7JrfNqwmDzkHH3LgLG9PS937hr4HiWtGSLe7EUs1cDq/4ZpCB
         udxoDgXwh0ur17CCBmeM1D5kB+S3zGJIOnyaN1D0N/Zq6kOoVgJ2oarDINoHkeaEZllR
         cM156v32jcys/VSasraQEI+virTH41m+oSOyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717656424; x=1718261224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+rv1sDHR32RWCfZmFBg17q325stbG/XmstQRsoUj80I=;
        b=SZGcfPPv2S6meoD69aET1gCtDoPWz9XYQ1jHnVz1CDWrRUCw2YWc7CpJ+YllExfEAn
         9Uig90lbyW+6yHaa9qYg4zaoN1IJSc1g6JqL4axqfSwY1X57IRraI9seHwiopF2aMZP0
         zWTN6401e5kXGKk2E/yDgYkzbiVDvv/Q4P98tDrnp1JjVFnmbv4hKo88mce8RCOKeR4J
         YzuaWIQlyoMogEugfLqbyTKSmBtzTWEpVi4LdJm/o+pmPPk1q2khfZ8zLgI60PLlRQeD
         Dl4omFKxoTgE9jUp+3ZgPQ9NzIENOP0Tm43kZBm2LteAPOO9eTp7ouN3qYblPSWJQKSj
         EyoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN0bf5H5q7JicsVq+ZngRGEzm4kDGNcponGTzyl+a0pRff0NFz629ERPJMcAImNIebOtub5buJGC8Cj3tWwLqED8jiEXeyjz+uAcNtu09AKeww
X-Gm-Message-State: AOJu0YzlBoUgABZR+o5+xQXR2ygLlWnsJwwQF4S0bcrMg4Qx/pxe82/C
	Zmy2BC2g1l4DMsunXC4IkyoDObS+7ylKozxTvCItggUZp0n70zOz6f6RiQOtusCjTgYq4r8Rmtb
	Slr7AalpXAdhfJ6TY9K6VgDM9zm0t5huIuxUK
X-Google-Smtp-Source: AGHT+IGeuCm9PsqMZJSdhMHCIrhen6KLNJPY05qssC+yap37aeWf5ikwB9VlUACAq1ji5UH3ecZrST5zcf6cfOqLI4U=
X-Received: by 2002:a05:6512:2825:b0:52b:a50c:c23e with SMTP id
 2adb3069b0e04-52bb2195a3cmr495256e87.34.1717656423496; Wed, 05 Jun 2024
 23:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240521075717.50330-1-angelogioacchino.delregno@collabora.com>
 <20240521075717.50330-3-angelogioacchino.delregno@collabora.com>
 <e7845300fa822413f6308cb6297222cde89c39e0.camel@mediatek.com> <0e0fe86c-92da-43f5-89d7-8084274a908a@collabora.com>
In-Reply-To: <0e0fe86c-92da-43f5-89d7-8084274a908a@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 6 Jun 2024 14:46:51 +0800
Message-ID: <CAGXv+5FgVk9z3DhAC5oYoGXSJ+wJf+sa6wFSyJ_Nhy3JrKkCng@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	=?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>, 
	"mripard@kernel.org" <mripard@kernel.org>, =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>, 
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, "robh@kernel.org" <robh@kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"kernel@collabora.com" <kernel@collabora.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	=?UTF-8?B?WXUtY2hhbmcgTGVlICjmnY7nprnnkosp?= <Yu-chang.Lee@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"amergnat@baylibre.com" <amergnat@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_234708_214796_361E5BEA 
X-CRM114-Status: GOOD (  36.57  )
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

On Wed, Jun 5, 2024 at 7:15=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 05/06/24 03:38, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) ha scritto:
> > Hi, Angelo:
> >
> > On Tue, 2024-05-21 at 09:57 +0200, AngeloGioacchino Del Regno wrote:
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
> >> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> >> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> >> Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@c=
ollabora.com>
> >> ---
> >>   .../bindings/arm/mediatek/mediatek,mmsys.yaml | 28 +++++++++++++++++=
++
> >>   1 file changed, 28 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,m=
msys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.y=
aml
> >> index b3c6888c1457..0ef67ca4122b 100644
> >> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.ya=
ml
> >> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.ya=
ml
> >> @@ -93,6 +93,34 @@ properties:
> >>     '#reset-cells':
> >>       const: 1
> >>
> >> +  port:
> >> +    $ref: /schemas/graph.yaml#/properties/port
> >> +    description:
> >> +      Output port node. This port connects the MMSYS/VDOSYS output to
> >> +      the first component of one display pipeline, for example one of
> >> +      the available OVL or RDMA blocks.
> >> +      Some MediaTek SoCs support multiple display outputs per MMSYS.
> >
> > This patch looks good to me. Just want to share another information for=
 you.
> > Here is an example that mmsys/vdosys could point to the display interfa=
ce node.
> >
> > vdosys0: syscon@1c01a000 {
> >            mmsys-display-interface =3D <&dsi0>, <&dsi1>, <&dp_intf0>;
> > };
> >
> > vdosys1: syscon@1c100000 {
> >            mmsys-display-interface =3D <&dp_intf1>;
> > };
> >
> > There is no conflict that mmsys/vdosys point to first component of one =
display pipeline or point to display interface.
> > Both could co-exist.
> >
>
> Hey CK,
>
> yes, this could be an alternative to the OF graphs, and I'm sure that it'=
d work,
> even though this kind of solution would still require partial hardcoding =
of the
> display paths up until mmsys-display-interface (so, up until DSI0, or DSI=
1, etc).

I think you might be misunderstanding CK's proposal? He's simply saying tha=
t
instead of pointing to the start of the pipeline, point to the end instead.
You can still use the OF graph and work backwards from the output.

> The problem with a solution like this is that, well, even though it would=
 work,
> even if we ignore the suboptimal partial hardcoding, OF graphs are someth=
ing
> generic, while the mmsys-display-interface would be a MediaTek specific/c=
ustom
> property.
>
> In the end, reusing generic kernel apis/interfaces/etc is always preferre=
d
> compared to custom solutions, especially in this case, in which the gener=
ic
> stuff is on-par (or actually, depending purely on personal opinions, supe=
rior).

Here you are mixing hardware descriptions and kernel implementation details=
.

I think this goes back to whether the mmsys/vdosys is actually part of the
graph or not. It certainly controls the muxes within the graph. But that
doesn't mean it has to be within the graph itself. It can just have pointer=
s
to entry points of the graph (for which you would have a couple lines of
custom code [1]). If the data doesn't flow through the mmsys/vdosys, then
I would argue that it is not part of the graph.

I would also argue that the data path should be fully described in the
device tree, not hardcoding paths based on board usage. The latter is
a policy / design decision, not a hardware capability.


ChenYu

> As for the two to co-exist, I'm not sure that this is actually needed, as=
 the
> OF graphs are already (at the end of the graph) pointing to the display i=
nterface.
>
> In any case, just as a reminder: if there will be any need to add any cus=
tom
> MediaTek specific properties later, it's ok and we can do that at any tim=
e.
>
> Cheers!
> Angelo
>
> > Regards,
> > CK
> >
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
> >> +    anyOf:
> >> +      - required:
> >> +          - endpoint@0
> >> +      - required:
> >> +          - endpoint@1
> >> +      - required:
> >> +          - endpoint@2
> >> +
> >>   required:
> >>     - compatible
> >>     - reg
>
>

