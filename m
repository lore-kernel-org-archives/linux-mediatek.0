Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C20C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 16:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pm3yvqRRQ/6FcIX6rTfmVc9rDf9tkZriNtDnJ1ynyow=; b=vEh1kq1TL4RuEL
	OnStzoqPJVfIGC6Bc3jfmcmILglIj5iuZKDTSvd6MJYsfQusjhV9vWHa9gwBt8QX6f4N89soLru3h
	7NWL3AsCu4R6jqO64Bw3+3b1L9aZDE3v7kuk0Nxnbf+U0Oonn49tIwFqdnO8Xxe4oAD+ojBbwW6VU
	BT9MGxHNBeRRhqPHQA5R25n35wdHFDNrXKw64d4pmDJnAGH8K8wbcou76v+PhouAFIfQ+0Yw+xBRg
	qfJUqiPrBNNKIcAhu1Hk8eTDK+ioGi6V+kC3+aJOiUqAIhbapDm2KzJ2vEAshl6rvJrIo/6IpV7v8
	Zb9L0kg7pSxTq6Z/kuUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRGgX-000wCL-Ro; Mon, 07 Mar 2022 16:58:13 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRGgK-000w71-3x
 for linux-mediatek@lists.infradead.org; Mon, 07 Mar 2022 16:58:02 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 p3-20020a17090a680300b001bbfb9d760eso17281235pjj.2
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Mar 2022 08:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tIhXGZLVpZ9gpPB8Y0IEDVl0g8sNd0sXb4aXiUdZXd0=;
 b=YP2FNy86W7N8nKMNMqM2YUGV/GbODjCGqey24vRQhOQVk5clrTz+DAxqejvidakQBI
 9TtFA05SljyJ4KDFxjiN0umUq+/62+jga/bbaQdWUCLFfYvljIcv4m9X07eYaYh0Nadd
 DQuK/PW1H4wFsAybKEPfJVLdPlSP3bAmsH1B3AbYFXJSnSoGSKcjtg9OJUWvYtY3JuFR
 nUOmT0BkXOrKM/WQSvWbp9PZTq2KswXC8vo4U+i925uXsuuaZkdSAV4S3wC2QQBiR+ra
 amwbzwb/jnl2ZttKE0v8nzwzkmsCIX0ezC7DO1vPG97dlUA+tsLIOXhpelHcLD5a3Fzj
 6vpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tIhXGZLVpZ9gpPB8Y0IEDVl0g8sNd0sXb4aXiUdZXd0=;
 b=KMkTznhL8DDbcHAJbAs0GGrllgZIZl/Ci4xhBncvF5j6rjsDxybhigPpehz7H073l1
 IEglW0ymoQ04KeoMJ4Pf2V/zMHMF7HP7lGX8glIj0TL8xtDlVN9MNqzMegBdFRYrSNSQ
 uMLRvi7iws8qxhQfCAUWH9R8VXA6wbJ+iWnM82RzO4yOC+pLsBA4yVErjAg4ViQfe3R7
 5+soXL37KEDBOXDeqCv8O29vaFKd4qGeyZFh45fRfGaOpi3dJ7h+z/CyNsdKi3wOAuBK
 KSV4G4XM1IHmFpkywQWHMhYzGfD2xQgahd/HVVj3n3iDFCstgoHzyMn4SEABBO/vQ8li
 Ufxw==
X-Gm-Message-State: AOAM530VnMwiRV4VnzX4kddr8Uo4SnCDPUHMFsE0JHT4Tl3gjEPGtMap
 8cY5fuUZk1h6fmdWWMsNHgWueIy2htVQDzhOx8bIpg==
X-Google-Smtp-Source: ABdhPJx8XmL3ynHyeduH/5RI2S24f5ccnfYE5r4H7NIQr7UVkGE6yqNch4rjeZxEKJVjLao5GJVTFGn1w108kteXJF8=
X-Received: by 2002:a17:902:7044:b0:14e:e1b1:bb0e with SMTP id
 h4-20020a170902704400b0014ee1b1bb0emr12959564plt.65.1646672279034; Mon, 07
 Mar 2022 08:57:59 -0800 (PST)
MIME-Version: 1.0
References: <20220307154558.2505734-1-robert.foss@linaro.org>
 <20220307154558.2505734-2-robert.foss@linaro.org>
 <YiY1CP6DkfgU4re/@robh.at.kernel.org>
In-Reply-To: <YiY1CP6DkfgU4re/@robh.at.kernel.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 7 Mar 2022 17:57:47 +0100
Message-ID: <CAG3jFyssPxuRXzZsZkVHWrSS8b6pRHRRmpZCTvLmDV-t2CDA1g@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] Revert "dt-bindings:drm/bridge:anx7625:add vendor
 define"
To: Rob Herring <robh@kernel.org>
Cc: airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com, 
 xji@analogixsemi.com, hsinyi@chromium.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_085800_207206_E7857464 
X-CRM114-Status: GOOD (  29.58  )
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

On Mon, 7 Mar 2022 at 17:38, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Mar 07, 2022 at 04:45:57PM +0100, Robert Foss wrote:
> > This reverts commit a43661e7e819b100e1f833a35018560a1d9abb39.
>
> S-o-b and reason for the revert?
>
> > ---
> >  .../display/bridge/analogix,anx7625.yaml      | 65 +------------------
> >  1 file changed, 2 insertions(+), 63 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > index 1d3e88daca041..ab48ab2f4240d 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > @@ -43,70 +43,14 @@ properties:
> >    vdd33-supply:
> >      description: Regulator that provides the supply 3.3V power.
> >
> > -  analogix,lane0-swing:
> > -    $ref: /schemas/types.yaml#/definitions/uint8-array
> > -    minItems: 1
> > -    maxItems: 20
> > -    description:
> > -      an array of swing register setting for DP tx lane0 PHY.
> > -      Registers 0~9 are Swing0_Pre0, Swing1_Pre0, Swing2_Pre0,
> > -      Swing3_Pre0, Swing0_Pre1, Swing1_Pre1, Swing2_Pre1, Swing0_Pre2,
> > -      Swing1_Pre2, Swing0_Pre3, they are for [Boost control] and
> > -      [Swing control] setting.
> > -      Registers 0~9, bit 3:0 is [Boost control], these bits control
> > -      post cursor manual, increase the [Boost control] to increase
> > -      Pre-emphasis value.
> > -      Registers 0~9, bit 6:4 is [Swing control], these bits control
> > -      swing manual, increase [Swing control] setting to add Vp-p value
> > -      for each Swing, Pre.
> > -      Registers 10~19 are Swing0_Pre0, Swing1_Pre0, Swing2_Pre0,
> > -      Swing3_Pre0, Swing0_Pre1, Swing1_Pre1, Swing2_Pre1, Swing0_Pre2,
> > -      Swing1_Pre2, Swing0_Pre3, they are for [R select control] and
> > -      [R Termination control] setting.
> > -      Registers 10~19, bit 4:0 is [R select control], these bits are
> > -      compensation manual, increase it can enhance IO driven strength
> > -      and Vp-p.
> > -      Registers 10~19, bit 5:6 is [R termination control], these bits
> > -      adjust 50ohm impedance of DP tx termination. 00:55 ohm,
> > -      01:50 ohm(default), 10:45 ohm, 11:40 ohm.
> > -
> > -  analogix,lane1-swing:
> > -    $ref: /schemas/types.yaml#/definitions/uint8-array
> > -    minItems: 1
> > -    maxItems: 20
> > -    description:
> > -      an array of swing register setting for DP tx lane1 PHY.
> > -      DP TX lane1 swing register setting same with lane0
> > -      swing, please refer lane0-swing property description.
>
> These apply to the DP side, so no need to revert this part.

Ack.

>
> > -
> > -  analogix,audio-enable:
> > -    type: boolean
> > -    description: let the driver enable audio HDMI codec function or not.
> > -
>
> Not sure on this one...

These additions are independent from my reading of this, would you
like a v2 with only the bus-type related changes reverted?

>
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >
> >      properties:
> >        port@0:
> > -        $ref: /schemas/graph.yaml#/$defs/port-base
> > -        unevaluatedProperties: false
> > +        $ref: /schemas/graph.yaml#/properties/port
> >          description:
> > -          MIPI DSI/DPI input.
> > -
> > -        properties:
> > -          endpoint:
> > -            $ref: /schemas/media/video-interfaces.yaml#
> > -            type: object
> > -            additionalProperties: false
> > -
> > -            properties:
> > -              remote-endpoint: true
> > -
> > -              bus-type:
> > -                enum: [1, 5]
>
> I think the error here is really 1 should be 4 which corresponds to
> D-PHY which is used by both CSI and DSI. Otherwise, I don't really see
> the issue with bus-type being shared between CSI and DSI.

I think that would be a correct solution. And ignoring everything
else, the range of this property is something that should be fixed.

But that would mean that CPI (camera parallel interface) and DPI
(display parallel interface) would share the
V4L2_FWNODE_BUS_TYPE_PARALLEL enum. I think that would be perfectly
functional, but it is not what V4L2_FWNODE_BUS_TYPE_PARALLEL is
documented to represent. As far as I can see it's only intended to
represent CPI.

Instead of having V4L2_FWNODE_BUS_TYPE_PARALLEL represent two
standards, I think they should be split. And possibly
V4L2_FWNODE_BUS_TYPE_PARALLEL should be renamed for CPI, but that is a
separate story. This would provide for the neatest and most legible
solution. If this solution is implemented, this range would be
incorrect. Additionally the snippet reverted in 2/2 of this series
would no longer be valid.

As it stands V4L2_FWNODE_BUS_TYPE_PARALLEL was used to represent DPI
due to not being caught in the review process.

>
> > -                default: 1
> > -
> > -              data-lanes: true
> > +          Video port for MIPI DSI input.
> >
> >        port@1:
> >          $ref: /schemas/graph.yaml#/properties/port
> > @@ -143,9 +87,6 @@ examples:
> >              vdd10-supply = <&pp1000_mipibrdg>;
> >              vdd18-supply = <&pp1800_mipibrdg>;
> >              vdd33-supply = <&pp3300_mipibrdg>;
> > -            analogix,audio-enable;
> > -            analogix,lane0-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
> > -            analogix,lane1-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
> >
> >              ports {
> >                  #address-cells = <1>;
> > @@ -155,8 +96,6 @@ examples:
> >                      reg = <0>;
> >                      anx7625_in: endpoint {
> >                          remote-endpoint = <&mipi_dsi>;
> > -                        bus-type = <5>;
> > -                        data-lanes = <0 1 2 3>;
> >                      };
> >                  };
> >
> > --
> > 2.32.0

Signed-off-by: Robert Foss <robert.foss@linaro.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
