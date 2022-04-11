Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343F4C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 12:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vhp10msprhNr2HpuRCp9luTbpcSEtuDRvt7hJgX/3pU=; b=UwzoyzrmInVlvr
	TgGE4brYYREvfkhbjMfAJxTvIaGbndMg2UKIC7ynwuXUZ7ZVaAVLWj6Q/uxz3DSyCbl4tUWEIEZ+y
	r3AaBv5m28iq8h8QmZUbVkySTWirT4BIE/hl48Vsmg7BYSACMBr/sHhdn4AoRrhWagsjOCSmgaigp
	gZguW/pBzQKeH4c8a2DonavbANeCm6iJFe3TelEfgjSSoDcu0YygRjEC7jIa44+jk5gpjYmmxl94m
	hS5n7N5NmEzF19rs39BU/HlavHIyW4jezHRnR3ECjkyO6cOHh5V0GwpmGfA5Y0IdLkF01UonE+xWF
	pUCcUP4H7C3q9Fe4+mSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndsyU-008vj5-0y; Mon, 11 Apr 2022 12:16:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndsxv-008vY8-Ae; Mon, 11 Apr 2022 12:16:21 +0000
X-UUID: ad9c97302d6f4c2c8043e65b369bfacb-20220411
X-UUID: ad9c97302d6f4c2c8043e65b369bfacb-20220411
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 845639133; Mon, 11 Apr 2022 05:16:13 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 05:10:43 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 11 Apr 2022 20:10:42 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Apr 2022 20:10:42 +0800
Message-ID: <fe7d2b878c18a42ff36ebd9911ecb562fe29c953.camel@mediatek.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: devfreq: mediatek: Add mtk cci
 devfreq dt-bindings
From: Johnson Wang <johnson.wang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 <cw00.choi@samsung.com>, <krzk+dt@kernel.org>, <robh+dt@kernel.org>,
 <kyungmin.park@samsung.com>
CC: <khilman@kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <jia-wei.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 11 Apr 2022 20:10:42 +0800
In-Reply-To: <855d7daa-45d1-d6d8-32bd-51778cf58392@linaro.org>
References: <20220408052150.22536-1-johnson.wang@mediatek.com>
 <20220408052150.22536-2-johnson.wang@mediatek.com>
 <855d7daa-45d1-d6d8-32bd-51778cf58392@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_051619_413245_6F7C28A4 
X-CRM114-Status: GOOD (  29.85  )
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

Hi Krzysztof,
On Fri, 2022-04-08 at 10:17 +0200, Krzysztof Kozlowski wrote:
> On 08/04/2022 07:21, Johnson Wang wrote:
> > Add devicetree binding of mtk cci devfreq on MediaTek SoC.
> > 
> 
> Thank you for your patch. There is something to discuss/improve.
> 
> > Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > ---
> >  .../devicetree/bindings/devfreq/mtk-cci.yaml  | 72
> > +++++++++++++++++++
> >  1 file changed, 72 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/devfreq/mtk-
> > cci.yaml
> 
> Filename with vendor prefix, so something like:
> 
> mediatek,cci.yaml

Thank you for your review.
I will take your advice in the next version.
> 
> Also please put it in the "interconnect" directory.
> 

I don't really know about "interconnect".
However, it looks like a Linux framework about data transfer and "NoC".

While this cci driver is more like a power managment which is
responsible for adjusting voltages and frequencies.
In my opinion, "devfreq" should be more suitable.

Please correct me if my understanding is wrong.

> > diff --git a/Documentation/devicetree/bindings/devfreq/mtk-cci.yaml 
> > b/Documentation/devicetree/bindings/devfreq/mtk-cci.yaml
> > new file mode 100644
> > index 000000000000..ef4ea951025c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/devfreq/mtk-cci.yaml
> > @@ -0,0 +1,72 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/devfreq/mtk-cci.yaml*__;Iw!!CTRNKA9wMg0ARbw!yd_wfLu2nSv0GsJZOGP1S8McsGD9A2SC4Qe0Xg1wEb_yEMVcqHRqdvs-M8YKOGckaagO$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!yd_wfLu2nSv0GsJZOGP1S8McsGD9A2SC4Qe0Xg1wEb_yEMVcqHRqdvs-M8YKOERouJvA$
> >  
> > +
> > +title: MediaTek Cache Coherent Interconnect (CCI) frequency and
> > voltage scaling
> > +
> > +maintainers:
> > +  - Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > +
> > +description: |
> > +  MediaTek Cache Coherent Interconnect (CCI) uses the software
> > devfreq module
> 
> Do not reference software implementation (devfreq).

I will modify it in the next version.

> 
> > +  to scale the clock frequency and adjust the voltage. MediaTek
> > CCI shares
> > +  the same power supplies with CPU, so the scheduling involves
> > with CPUfreq.
> 
> The same - cpufreq.
> 
> Instead, focus on the hardware, what do you describe here?

I will focus on hardware description in the next version.

> 
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt8183-cci
> > +      - mediatek,mt8186-cci
> > +
> > +  clocks:
> > +    items:
> > +      - description:
> > +          The multiplexer for clock input of CPU cluster.
> > +      - description:
> > +          A parent of "cpu" clock which is used as an intermediate
> > clock source
> > +          when the original CPU is under transition and not stable
> > yet.
> > +
> > +  clock-names:
> > +    items:
> > +      - const: cci
> > +      - const: intermediate
> > +
> > +  operating-points-v2:
> > +    description:
> > +      For details, please refer to
> > +      Documentation/devicetree/bindings/opp/opp-v2.yaml
> 
> No need for description. Just "operating-points-v2: true".
> 
> "opp-table:true" could stay. My previous comment about its removal
> was a
> wrong advice, because opp-table is used for a table being a children
> of
> this device node.
> 
> Best regards,
> Krzysztof


I will remove it and add "opp-table:true"(also example) in the next
version.

Thanks.

BRs,
Johnson Wang


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
