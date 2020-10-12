Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94EDFC433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 06:31:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1A5820757
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 06:31:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bPo6Uay4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AT1cduE9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1A5820757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZqAX5xS4HM/wN1S5vuQ31feLCH5X5dicDQtmmS0tL4g=; b=bPo6Uay4vBknZV6bw7zaFTsrA
	i8x/QAiZEeIA5nQITwW7HQkc6nV9L1zqk3NhsNT4A/mnHqN+aqeKmM7wf6rYnsh1rDuIkW3KjA5fp
	W0rUr3uYAc05lTAyyzaEbelKc4T8rxtldoIOedQA38FZcKZP1xjr+lD08zpLzEil9TYagLzkax+Ai
	ifsPYPmWeL/nXBzuxkM7K5NeTg8VU6OA/hEXFabv59XTiDFDTK/XVeqxhgYthIPIzKpjdIbB6bvrP
	W1AIU6lgi+Xz+dsI7AqZi/g7x6vgUg5Q+iEvKH6vSwiijleXSeblT7GMdOvtM7FENyu6Phdj5SHwz
	gKwWyiF4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRrMO-0006x6-QU; Mon, 12 Oct 2020 06:31:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRrMM-0006wh-IH; Mon, 12 Oct 2020 06:31:03 +0000
X-UUID: b2b0b3d49a9d43358309dd35286612b8-20201011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=tye3EoEyjrtmqh7ssQVONlLnuV9c6l4iS/PzBi5TB1c=; 
 b=AT1cduE9lTQGrYcfJVwgNmRloFcK+HPOVfILbeakhYB2oh+uAcTbUrCHisgogz542/WXOnz0zu7rw1fNiImNOfnFaNWBT8KUZ6RikewboIp7nkZ10h6cm4C3uX6vG/XHmZLGbDeVkoLVp+I0Na72ix5exw2vNnQbebJApxJ4/3Y=;
X-UUID: b2b0b3d49a9d43358309dd35286612b8-20201011
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 296436385; Sun, 11 Oct 2020 22:30:58 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Oct 2020 23:20:55 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs07n2.mediatek.inc
 (172.21.101.141) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 12 Oct 2020 14:20:53 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Oct 2020 14:20:52 +0800
Message-ID: <1602483653.8921.20.camel@mhfsdcap03>
Subject: Re: [PATCH 5/5] dt-bindings: mediatek: mt8192: add
 mt8192-mt6358-rt1015-rt5682 document
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Mon, 12 Oct 2020 14:20:53 +0800
In-Reply-To: <20201006204344.GA2791644@bogus>
References: <1601624142-18991-1-git-send-email-jiaxin.yu@mediatek.com>
 <1601624142-18991-6-git-send-email-jiaxin.yu@mediatek.com>
 <20201006204344.GA2791644@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_023102_823541_D907EB1C 
X-CRM114-Status: GOOD (  23.24  )
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

On Tue, 2020-10-06 at 15:43 -0500, Rob Herring wrote:
> On Fri, Oct 02, 2020 at 03:35:42PM +0800, Jiaxin Yu wrote:
> > This patch adds document for the machine board with mt6358, rt1015 and rt5682.
> > 
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > ---
> >  .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 44 +++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> > new file mode 100644
> > index 0000000000000..dff5004cd0368
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> > @@ -0,0 +1,44 @@
> > +# SPDX-License-Identifier: GPL-2.0
> 
> Dual license new bindings:
> 
> (GPL-2.0-only OR BSD-2-Clause)
> 
Ok, got it.

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
> > +    contains:
> 
> Drop this. Other strings shouldn't be allowed.
> 

Should I need to remove "contains"?

> > +      const: mediatek,mt8192_mt6359_rt1015_rt5682
> 
> Just a list of part numbers? A different codec would be a different 
> compatible and driver? You should have a link to the codec and you can 
> read it's compatible to get what codec you have.
> 
THis bindings is dedicated to the mt8192 with mt6359, rt1015 and rt5682.
We are not ready to configure dai-link in DTS. Is this mandatory now?

> > +
> > +  mediatek,platform:
> > +    $ref: "/schemas/types.yaml#/definitions/phandle"
> > +    description: |
> > +     The DT/OF node which is used to specify the link's platform driver.
> 
> What's "link's platform driver"? A DT doesn't have drivers.
> 
There's something wrong with my description. "mediatek,platform" is the
phandle of MT8192 ASoC platform.

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
