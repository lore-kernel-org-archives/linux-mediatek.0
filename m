Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01890C4363A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 10:32:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51C8822267
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 10:32:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xUi/HaD3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ha60ki7w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51C8822267
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BrplY/8I2mlCL6cnQmZXcor2MRXLCrlckaNu7b40328=; b=xUi/HaD3zznAJemX8oDqOf5uf
	SClBZaZi7Geyjz1635u294cB2lUF7a5U/LbpxxAn+BE+eX3rDjxT7dG4lnObi1oGU2duGm+qL0xxS
	CmHIzb5Rr3AfLxqprXTsVUueF2TbSWrzyBCzEC5vza7hB9gv0PXmfxUT3yHUh5nt4wXM4lysHeUtX
	nyf++OIfE5/YZ/XUilB9CqCFd3VUf8aY1TMSSupUWBzkjRnxNF0xiZPfT8cQC4sbFfXW/OxXMSpVg
	k9BYLOq9w0NPcfW6Jvi22Ym9mUFYd6M/0qkbtFGynON8nZS5jctXr0XPcpGlZPdinNWfqaN1SH4sa
	nB1ANRV8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVXtJ-0005av-2L; Thu, 22 Oct 2020 10:32:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVXtE-0005Zi-GK; Thu, 22 Oct 2020 10:32:13 +0000
X-UUID: 458c8258d0d849098218c4437e04395a-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=mKI//o1Lk40Yi815nVYXanqjQKt/9UrGV5fgSoCAeH4=; 
 b=ha60ki7wcIGTs1bJnKkZE/nT8iqEUCUQvZPSayyFFNSw+Sit8wZIHvGXQ6MKVUHaO81aVxrQAHNWcFk5S0uCd9z29rRxt6k9nrAqeej6t12hv0+gge05ANLiQPvB4Y1X5OcE+4YHd/UEmcbFf+6YwWEF7BAwmDvypg6GEGBkDzA=;
X-UUID: 458c8258d0d849098218c4437e04395a-20201022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 118090480; Thu, 22 Oct 2020 02:32:07 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 03:32:05 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs07n1.mediatek.inc
 (172.21.101.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 22 Oct 2020 18:32:04 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Oct 2020 18:32:03 +0800
Message-ID: <1603362723.8921.37.camel@mhfsdcap03>
Subject: Re: [PATCH v2 5/5] dt-bindings: mediatek: mt8192: add
 mt8192-mt6358-rt1015-rt5682 document
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Thu, 22 Oct 2020 18:32:03 +0800
In-Reply-To: <20201021145605.GA2775711@bogus>
References: <1603270435-3548-1-git-send-email-jiaxin.yu@mediatek.com>
 <1603270435-3548-6-git-send-email-jiaxin.yu@mediatek.com>
 <20201021145605.GA2775711@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_063212_760512_08687FB1 
X-CRM114-Status: GOOD (  22.21  )
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
 tzungbi@google.com, broonie@kernel.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-10-21 at 09:56 -0500, Rob Herring wrote:
> On Wed, Oct 21, 2020 at 04:53:55PM +0800, Jiaxin Yu wrote:
> > This patch adds document for the machine board with mt6358, rt1015
> > and rt5682.
> > 
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > ---
> >  .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 42 +++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> > new file mode 100644
> > index 0000000000000..4c39e88906fc1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> > @@ -0,0 +1,42 @@
> > +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
> 
> GPL-2.0-only
> 
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/mt8192-mt6359-rt1015-rt5682.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek MT8192 with MT6359, RT1015 and RT5682 ASoC sound card driver
> > +
> > +maintainers:
> > +   - Jiaxin Yu <jiaxin.yu@mediatek.com>
> > +   - Shane Chien <shane.chien@mediatek.com>
> > +
> > +description:
> > +  This binding describes the MT8192 sound card.
> > +
> > +properties:
> > +  compatible:
> > +      const: mediatek,mt8192_mt6359_rt1015_rt5682
> 
> I still don't think this is the right way to do this.
> 
Dear Rob,
This nomencalture is extended to the MTK mt8183/mt8173.
And we think it's better to maintain multiple boards, but
the disadvantage is need to write one more machine drivers.

> > +
> > +  mediatek,platform:
> > +    $ref: "/schemas/types.yaml#/definitions/phandle"
> > +    description: The phandle of MT8192 ASoC platform.
> 
> I still don't understand what this is.
> 

This property will assign to 'snd_soc_dai_link->platforms->of_node'.
The value of 'mediatek,platform' here is &afe that is mt8192 platform
driver.
It will be resolved from a phandle property to a device_node pointer.

> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - mediatek,platform
> > +
> > +examples:
> > +  - |
> > +
> > +    sound: mt8192-sound {
> > +        compatible = "mediatek,mt8192-mt6359-rt1015-rt5682";
> > +        mediatek,platform = <&afe>;
> > +        pinctrl-names = "aud_clk_mosi_off",
> > +                        "aud_clk_mosi_on";
> > +        pinctrl-0 = <&aud_clk_mosi_off>;
> > +        pinctrl-1 = <&aud_clk_mosi_on>;
> > +    };
> > +
> > +...
> > -- 
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
