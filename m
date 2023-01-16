Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CABC46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 11:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkTQIvOTy2Q+K4dJuv6vPdsOqGOw58PTiozdPxfZn3I=; b=t3N5ZUOJjIhphmAHBcXQx6/CR+
	F4ADh3MOYDxK7lHsaepgGEk2b/ufl1MEPbJj69Q0QKgddr9BsWkSKwEd/fmy0+3Do+aromJUMVXVm
	9MhTJE1TdFVU9uJ4IxQgLt49/U7VdlnDt8kvwHVEj/YUGvuJr7URc9MN8MxUYc3qpMrwzeS2Tl2f3
	22qeTuschZAkl9dXib3NvtYukMNOvf9eySM+kI2LsMuBjJGdoICOOqaSQLAYh4rjLrnT0xr9gnYyr
	O2zhdgGA0RdotimvC56er9wUMkCIEU2UzYrb9MLz9m3dKoRpnhlaPZ6ac5KzkzzlHlwkJdAaLgBje
	pOpTIk9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHNJM-009qfN-W7; Mon, 16 Jan 2023 11:05:57 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHNJC-009qcK-Kn
	for linux-mediatek@lists.infradead.org; Mon, 16 Jan 2023 11:05:48 +0000
Received: by mail-ed1-x533.google.com with SMTP id z11so40249353ede.1
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Jan 2023 03:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DkTQIvOTy2Q+K4dJuv6vPdsOqGOw58PTiozdPxfZn3I=;
        b=ED6QSrMSUPNHwFiTOrKroYXFmam4lacEgtZHDTlJNUpWMEL4jpdoM2kBWOqUELlHw7
         2bj5P3opYT0PPSSfaBzk0RpDdc6EdHW1T4R6kSoYMYNRAEtssW4RBLnmttw/IKapOJPb
         PH2E2tvWImw0CwO1A72ACqZlVvDAQMEXcnJxXA2kG6pxV/xxo4xx8MBKiVYrdj4N3v44
         EL826unFaCLt1nrKeMeZOKGrxJgM+Ado/7w0WF1WTUV/X7PGpRnfdZlZIHoFucFLE+FG
         NyoBr7BrCkbIOhbY8fLkIk60R/SBtZoTeW3ktTExq1t6OAwVN3ifO2Psev+/84LyyDvg
         xjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DkTQIvOTy2Q+K4dJuv6vPdsOqGOw58PTiozdPxfZn3I=;
        b=hZG43Urr6v0HqNE+L55n5Ov7j+hfOjEpTH2PuTFWM9wZpN7dsX0nUSGPhJy2VlhST1
         RkaZJW+ArL6r75yEOpp8/xtAXw20xB8TLlDxwA1zoHhwu89mnxF5t/FJrA4ka6pGyT91
         UsyP9rqxban+yOdlahFEcTSxJGQTiD58b3xsCpfhNWby9YRARSi+B4nabc9GrfnX/6ob
         CXv+dkB1+TGMK5tii5KM+Zj1GVDjSFcPBij3htDYChX/MofIlfi37ptLvlckKSO9ZGJr
         SVAt5tBJZyjITaQhtnv3xzKdO3mICyQ2PZw0exgHA78jmm1cY1pX/wOTDX6QZ45uxvdT
         5Bjw==
X-Gm-Message-State: AFqh2koCAmN6AM7BaXtxQAk91CzwyiUXDyDaa8cTfq5Phb4NOs1f0b/5
	qY45Ht4S3j754cgKMY3H4GZ3wnZdp2DKeqNKBDHPWQ==
X-Google-Smtp-Source: AMrXdXusX6CCt6i+1zaot2H1Rxeu6HDMPxop2j94acllkt+bi9QBmrv2MyabXzFTmvM+wRwke6z0eFz0cOXpsGJoQa4=
X-Received: by 2002:a50:ab4b:0:b0:46a:b1a9:c34e with SMTP id
 t11-20020a50ab4b000000b0046ab1a9c34emr12264339edc.212.1673867142735; Mon, 16
 Jan 2023 03:05:42 -0800 (PST)
MIME-Version: 1.0
References: <20230112152855.216072-1-bchihi@baylibre.com> <20230112152855.216072-3-bchihi@baylibre.com>
 <256c2328-a426-a1bf-4f47-1d6c9e706f63@collabora.com>
In-Reply-To: <256c2328-a426-a1bf-4f47-1d6c9e706f63@collabora.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Mon, 16 Jan 2023 12:05:07 +0100
Message-ID: <CAGuA+orQ333LxJYw9Gws=uLXxewM2z_nX5QH1CfhOk06ViJrMg@mail.gmail.com>
Subject: Re: [PATCH v10 2/6] dt-bindings/thermal/mediatek: Add dt-binding
 document for LVTS thermal controllers
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: daniel.lezcano@linaro.org, rafael@kernel.org, amitk@kernel.org, 
	rui.zhang@intel.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	khilman@baylibre.com, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, james.lo@mediatek.com, 
	rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_030546_685128_87EBFF3A 
X-CRM114-Status: GOOD (  20.10  )
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

On Mon, Jan 16, 2023 at 11:38 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 12/01/23 16:28, bchihi@baylibre.com ha scritto:
> > From: Balsam CHIHI <bchihi@baylibre.com>
> >
> > Add dt-binding document for mt8192 and mt8195 LVTS thermal controllers.
> >
> > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> > ---
> >   .../thermal/mediatek,lvts-thermal.yaml        | 140 ++++++++++++++++++
> >   1 file changed, 140 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> > new file mode 100644
> > index 000000000000..43b8777fc1b2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> > @@ -0,0 +1,140 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/thermal/mediatek,lvts-thermal.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek SoC Low Voltage Thermal Sensor (LVTS)
> > +
> > +maintainers:
> > +  - Balsam CHIHI <bchihi@baylibre.com>
> > +
> > +description: |
> > +  LVTS is a thermal management architecture composed of three subsystems,
> > +  a Sensing device - Thermal Sensing Micro Circuit Unit (TSMCU),
> > +  a Converter - Low Voltage Thermal Sensor converter (LVTS), and
> > +  a Digital controller (LVTS_CTRL).
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt8192-lvts-mcu
> > +      - mediatek,mt8192-lvts-ap
>
> I agree, MT8192 has LVTS... but you don't have it in the driver?
> I don't think that it would be much effort to just add it to the commit that
> adds the driver itself... otherwise, even though bindings are describing the
> hardware and not the drivers, I, personally, don't really like to see the
> binding advertising mt8192 mcu/ap while it's not really supported in the driver.

Hi Angelo,

mt8192 will be supported later,
so I totally agree with you about removing its binding description for now.

Best regards,
Balsam

>
> Regards,
> Angelo

