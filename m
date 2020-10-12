Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FB3C433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 06:05:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 077252074D
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 06:05:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EbRt4XaK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Wfgp0TiS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 077252074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=edtJvf1bIX3SLBd2ABkKAvDJdlx1OWsL4KEzIpOPc08=; b=EbRt4XaK2nhXxW9yn8/P8pJeR
	LA9YGtpc1R5PA0vx+edn0nWqGHdxdMml5rIzwGNgOkHcRGnVFgCIYoWdw7AKPFpnGtH+IyWTAgtdu
	LsXzYbKNqPlMKE4tusMB5RtWOBRjn1DFd/vDXtK7llPG6xudMZvyQ/4enY3GKne0TsAbwzxsH//6s
	zeqvBgRHgrFn+p5kO4b5zpZXTO/Fj40uSLV4mzrFBF29g9wHQDTD6lnusD6ydfMtDtbS+zKsP8SZo
	Ohf3/OjRQSpXG157QbCYqDoAMNLjarAwcoOFkHhlGYm2/CBfZxkLRcmdEQ1teg6SDNEA+/OGjzDwY
	m7eLOOjyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRqxV-000276-Lx; Mon, 12 Oct 2020 06:05:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRqxS-00026c-Ie; Mon, 12 Oct 2020 06:05:20 +0000
X-UUID: 2f1236d3b99d4f71b5f59e3f1689d58a-20201011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=wdmPxsTTUwP5rK6jCbvQqM0OVb37cVHtRHgz73szDVA=; 
 b=Wfgp0TiSTAIsNhU63ZAmX2S4Wj25PTWa1x8VDNuf5hE901eh3G5zR2zhKWUDGmrhM4zbh9PPzwD4tfQeYO2UcNOR261/DNX6oxfyI6QX4z0zuGzazku3xR0XoXYirnKBKnwLpETY60LbAkV4Syucark+Norn6WbkLl0AeDRZy10=;
X-UUID: 2f1236d3b99d4f71b5f59e3f1689d58a-20201011
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1171675752; Sun, 11 Oct 2020 22:05:10 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Oct 2020 22:56:44 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs07n2.mediatek.inc
 (172.21.101.141) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 12 Oct 2020 13:56:41 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Oct 2020 13:56:40 +0800
Message-ID: <1602482201.8921.11.camel@mhfsdcap03>
Subject: Re: [PATCH 3/5] dt-bindings: mediatek: mt8192: add audio afe document
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Mon, 12 Oct 2020 13:56:41 +0800
In-Reply-To: <20201005135739.GA87274@bogus>
References: <1601624142-18991-1-git-send-email-jiaxin.yu@mediatek.com>
 <1601624142-18991-4-git-send-email-jiaxin.yu@mediatek.com>
 <20201005135739.GA87274@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_020518_827911_0D21D94D 
X-CRM114-Status: GOOD (  21.47  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, shane.chien@mediatek.com, tiwai@suse.com,
 maowenan@huawei.com, tzungbi@google.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-10-05 at 08:57 -0500, Rob Herring wrote:
> On Fri, Oct 02, 2020 at 03:35:40PM +0800, Jiaxin Yu wrote:
> > This patch adds mt8192 audio afe document.
> > 
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > ---
> >  .../bindings/sound/mt8192-afe-pcm.yaml        | 98 +++++++++++++++++++
> >  1 file changed, 98 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> > new file mode 100644
> > index 0000000000000..43852315f1867
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> > @@ -0,0 +1,98 @@
> > +# SPDX-License-Identifier: GPL-2.0
> 
> Dual license new bindings:
> 
> (GPL-2.0-only OR BSD-2-Clause)
> 
Ok, got it.

> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek AFE PCM controller for mt8192
> > +
> > +maintainers:
> > +   - Jiaxin Yu <jiaxin.yu@mediatek.com>
> > +   - Shane Chien <shane.chien@mediatek.com>
> > +
> > +properties:
> > +  compatible:
> > +    contains:
> 
> So any other string in addition is okay?
> 
No, there will be no other string. So do I need to remove "contains"?

> > +      const: mediatek,mt8192-audio
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description: AFE interrupt line
> 
> Drop description.
> 
Ok.

> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  reset-names:
> > +    const: audiosys
> > +
> > +  apmixedsys:
> > +    maxItems: 1
> 
> This is an array?
> 
No, it is just a phandle to the mediatek apmixedsys controller.

> > +    description: The mediatek apmixedsys controller
> > +
> > +  infracfg:
> > +    maxItems: 1
> > +    description: The mediatek infracfg controller
> > +
> > +  topckgen:
> > +    maxItems: 1
> > +    description: The mediatek topckgen controller
> 
> These all need a type reference and and vendor prefix.
> 
Should I change it to the following?

mediatek,topckgen:
  $ref: "/schemas/types.yaml#/definitions/phandle"
  maxItems: 1
  description: The phandle of the mediatek topckgen controller

> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: AFE clock
> > +      - description: ADDA DAC clock
> > +      - description: ADDA DAC pre-distortion clock
> > +      - description: audio infra sys clock
> > +      - description: audio infra 26M clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aud_afe_clk
> > +      - const: aud_dac_clk
> > +      - const: aud_dac_predis_clk
> > +      - const: aud_infra_clk
> > +      - const: aud_infra_26m_clk
> > +
> > +required:
> > +  - compatible
> > +  - interrupts
> > +  - resets
> > +  - reset-names
> > +  - power-domains
> > +  - clocks
> > +  - clock-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8192-clk.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/power/mt8192-power.h>
> > +
> > +    afe: mt8192-afe-pcm {
> > +        compatible = "mediatek,mt8192-audio";
> > +        interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
> > +        resets = <&watchdog MT8192_TOPRGU_AUDIO_SW_RST>;
> > +        reset-names = "audiosys";
> > +        apmixedsys = <&apmixedsys>;
> > +        infracfg = <&infracfg>;
> > +        topckgen = <&topckgen>;
> > +        power-domains = <&scpsys MT8192_POWER_DOMAIN_AUDIO>;
> > +        clocks = <&audsys CLK_AUD_AFE>,
> > +                 <&audsys CLK_AUD_DAC>,
> > +                 <&audsys CLK_AUD_DAC_PREDIS>,
> > +                 <&infracfg CLK_INFRA_AUDIO>,
> > +                 <&infracfg CLK_INFRA_AUDIO_26M_B>;
> > +        clock-names = "aud_afe_clk",
> > +                      "aud_dac_clk",
> > +                      "aud_dac_predis_clk",
> > +                      "aud_infra_clk",
> > +                      "aud_infra_26m_clk";
> > +    };
> > +
> > +...
> > -- 
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
