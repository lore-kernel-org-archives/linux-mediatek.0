Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B45CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 17:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nocq6AAKcBqUuTTZkMI9ouwAcIc/TjTbwXq8mGWKqHE=; b=GKmP0u/KCPNkAw
	tqReNHnKEzdXITZ8lPaNmzI1z9HAc6W23Cr8/eb6Pas1ZWECDK9lVkGo1Ger8sFqkCOBARRd1rAhA
	CbXfEaiPHLZXShdDLM6YtNu6Nhl5WqgWRKKU4ijhc/AIIGwcQosQMARTgNNA/ZmtfpcX++gFeMsQf
	uFLIGJacM7cOZCFbE830bJz9gPCEKEgmGSuS2TJU82CFS9GF9OV2YtnU6hdLQkn3mniIk+NeSiFm8
	8OMVQj0hg3foDp86VK9sW5sW1EteUFlHHf4nNOBhFt+/v9Fr/Y5M5cImR14IuBpBPPyFL+zVOzzpl
	JhuKJH05M8b5/2Gltoig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRHEF-0011i3-Ti; Mon, 07 Mar 2022 17:33:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRHE3-0011fD-F9; Mon, 07 Mar 2022 17:32:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1D946B810DB;
 Mon,  7 Mar 2022 17:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D80EAC340E9;
 Mon,  7 Mar 2022 17:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646674368;
 bh=MTx+FSN4s0xomMOmVQ++nOaBz1hENZXctDzB+UA3WSo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rHHC8PyAe0g6wqoZv/RLj0BHY5FdVHkeOKVC13tFqH7fCIEUuUl2I2mrM4UrHvdvV
 dNhV+82wSgojcoKvfaAGnzYdVHDJaXha9AgLIdGr+EY5nxHkNrNBi0EfM9/2rsxNEL
 +R1PyCWtL8m4Fh1vczEXZ8i0C9UlGqPyeFRquNsJE4buppw9GvsczWeSHjrlI3JUVY
 vSniQTbtOWlnEuzxFVZ9Z4jsknXTEjTbCzBRMLSUZTy6RBP9RQNSUHseDAZeKjrXhE
 rjkjjbXzkIjfMJAhz1wifevRJU6hhfoyC+KwN6tf6ndUoC0y7F08Sdsi7bV3i9Mdkm
 We5i4BU8ReUKA==
Received: by mail-ej1-f50.google.com with SMTP id yy13so24722284ejb.2;
 Mon, 07 Mar 2022 09:32:48 -0800 (PST)
X-Gm-Message-State: AOAM530o+8axPs0RiOQyDsSXGoMuC85MY7vRiv3vSyY4qB3SlnORbEKs
 40d8pDQXapO5URIs6FgQuOijt4C11cS3nO1qxw==
X-Google-Smtp-Source: ABdhPJyGmG3VkKnaYLa4PSf98LUiuSxcHYDSLhP/e/6IDPs0vEMo0pjg2pGSJgqWmgK/4anl0xt7rL3jNlIY+nDhFcY=
X-Received: by 2002:a17:906:9913:b0:6d6:dc48:5d49 with SMTP id
 zl19-20020a170906991300b006d6dc485d49mr9995459ejb.325.1646674367107; Mon, 07
 Mar 2022 09:32:47 -0800 (PST)
MIME-Version: 1.0
References: <20220307154558.2505734-1-robert.foss@linaro.org>
 <20220307154558.2505734-2-robert.foss@linaro.org>
 <YiY1CP6DkfgU4re/@robh.at.kernel.org>
 <CAG3jFyssPxuRXzZsZkVHWrSS8b6pRHRRmpZCTvLmDV-t2CDA1g@mail.gmail.com>
 <YiY8ko5WX3mQfDLY@pendragon.ideasonboard.com>
In-Reply-To: <YiY8ko5WX3mQfDLY@pendragon.ideasonboard.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 7 Mar 2022 11:32:35 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+AqKJ7hU3j4sEf_61ibiyJqOWocc43B0q2G4fHDxPi1g@mail.gmail.com>
Message-ID: <CAL_Jsq+AqKJ7hU3j4sEf_61ibiyJqOWocc43B0q2G4fHDxPi1g@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] Revert "dt-bindings:drm/bridge:anx7625:add vendor
 define"
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Xin Ji <xji@analogixsemi.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chen-Yu Tsai <wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_093251_843178_7225CDFF 
X-CRM114-Status: GOOD (  44.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Mar 7, 2022 at 11:11 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Mar 07, 2022 at 05:57:47PM +0100, Robert Foss wrote:
> > On Mon, 7 Mar 2022 at 17:38, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Mon, Mar 07, 2022 at 04:45:57PM +0100, Robert Foss wrote:
> > > > This reverts commit a43661e7e819b100e1f833a35018560a1d9abb39.
> > >
> > > S-o-b and reason for the revert?
> > >
> > > > ---
> > > >  .../display/bridge/analogix,anx7625.yaml      | 65 +------------------
> > > >  1 file changed, 2 insertions(+), 63 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > > index 1d3e88daca041..ab48ab2f4240d 100644
> > > > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > > @@ -43,70 +43,14 @@ properties:
> > > >    vdd33-supply:
> > > >      description: Regulator that provides the supply 3.3V power.
> > > >
> > > > -  analogix,lane0-swing:
> > > > -    $ref: /schemas/types.yaml#/definitions/uint8-array
> > > > -    minItems: 1
> > > > -    maxItems: 20
> > > > -    description:
> > > > -      an array of swing register setting for DP tx lane0 PHY.
> > > > -      Registers 0~9 are Swing0_Pre0, Swing1_Pre0, Swing2_Pre0,
> > > > -      Swing3_Pre0, Swing0_Pre1, Swing1_Pre1, Swing2_Pre1, Swing0_Pre2,
> > > > -      Swing1_Pre2, Swing0_Pre3, they are for [Boost control] and
> > > > -      [Swing control] setting.
> > > > -      Registers 0~9, bit 3:0 is [Boost control], these bits control
> > > > -      post cursor manual, increase the [Boost control] to increase
> > > > -      Pre-emphasis value.
> > > > -      Registers 0~9, bit 6:4 is [Swing control], these bits control
> > > > -      swing manual, increase [Swing control] setting to add Vp-p value
> > > > -      for each Swing, Pre.
> > > > -      Registers 10~19 are Swing0_Pre0, Swing1_Pre0, Swing2_Pre0,
> > > > -      Swing3_Pre0, Swing0_Pre1, Swing1_Pre1, Swing2_Pre1, Swing0_Pre2,
> > > > -      Swing1_Pre2, Swing0_Pre3, they are for [R select control] and
> > > > -      [R Termination control] setting.
> > > > -      Registers 10~19, bit 4:0 is [R select control], these bits are
> > > > -      compensation manual, increase it can enhance IO driven strength
> > > > -      and Vp-p.
> > > > -      Registers 10~19, bit 5:6 is [R termination control], these bits
> > > > -      adjust 50ohm impedance of DP tx termination. 00:55 ohm,
> > > > -      01:50 ohm(default), 10:45 ohm, 11:40 ohm.
> > > > -
> > > > -  analogix,lane1-swing:
> > > > -    $ref: /schemas/types.yaml#/definitions/uint8-array
> > > > -    minItems: 1
> > > > -    maxItems: 20
> > > > -    description:
> > > > -      an array of swing register setting for DP tx lane1 PHY.
> > > > -      DP TX lane1 swing register setting same with lane0
> > > > -      swing, please refer lane0-swing property description.
> > >
> > > These apply to the DP side, so no need to revert this part.
> >
> > Ack.
> >
> > >
> > > > -
> > > > -  analogix,audio-enable:
> > > > -    type: boolean
> > > > -    description: let the driver enable audio HDMI codec function or not.
> > > > -
> > >
> > > Not sure on this one...
> >
> > These additions are independent from my reading of this, would you
> > like a v2 with only the bus-type related changes reverted?

Yes.

> >
> > >
> > > >    ports:
> > > >      $ref: /schemas/graph.yaml#/properties/ports
> > > >
> > > >      properties:
> > > >        port@0:
> > > > -        $ref: /schemas/graph.yaml#/$defs/port-base
> > > > -        unevaluatedProperties: false
> > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > >          description:
> > > > -          MIPI DSI/DPI input.
> > > > -
> > > > -        properties:
> > > > -          endpoint:
> > > > -            $ref: /schemas/media/video-interfaces.yaml#
> > > > -            type: object
> > > > -            additionalProperties: false
> > > > -
> > > > -            properties:
> > > > -              remote-endpoint: true
> > > > -
> > > > -              bus-type:
> > > > -                enum: [1, 5]
> > >
> > > I think the error here is really 1 should be 4 which corresponds to
> > > D-PHY which is used by both CSI and DSI. Otherwise, I don't really see
> > > the issue with bus-type being shared between CSI and DSI.
> >
> > I think that would be a correct solution. And ignoring everything
> > else, the range of this property is something that should be fixed.
> >
> > But that would mean that CPI (camera parallel interface) and DPI
> > (display parallel interface) would share the
> > V4L2_FWNODE_BUS_TYPE_PARALLEL enum. I think that would be perfectly
> > functional, but it is not what V4L2_FWNODE_BUS_TYPE_PARALLEL is
> > documented to represent. As far as I can see it's only intended to
> > represent CPI.
>
> Are you aware of any standard documenting camera parallel interfaces
> with separate sync signals ? I was looking for that the other day, and
> couldn't find much. CPI seems to be an old MIPI standard, but I couldn't
> find any public document, I'not not sure if it actually matches.

I don't recall. Generally, I think the camera side is not quite the
mess the display side is with all the formats.

> Another common parallel interface in SoCs is AXI4 Stream, which we will
> likely need a bus type for. We'll then have to decide on how to handle
> on-SoC custom parallel buses.

Except for those maybe.

> > Instead of having V4L2_FWNODE_BUS_TYPE_PARALLEL represent two
> > standards, I think they should be split. And possibly
> > V4L2_FWNODE_BUS_TYPE_PARALLEL should be renamed for CPI, but that is a
> > separate story. This would provide for the neatest and most legible
> > solution. If this solution is implemented, this range would be
> > incorrect. Additionally the snippet reverted in 2/2 of this series
> > would no longer be valid.
> >
> > As it stands V4L2_FWNODE_BUS_TYPE_PARALLEL was used to represent DPI
> > due to not being caught in the review process.
>
> We may end up using those values, but I think it should be discussed and
> not rushed in v5.17 if possible.

Given it's not actually used (correctly), agreed.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
