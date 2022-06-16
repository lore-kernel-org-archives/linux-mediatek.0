Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BE1C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 07:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBoVA0ywL89C97W90y4qw72PtWhCwh82+V1EzKMA5uA=; b=VATQvf1zwkzDvhlZDaJUPEboSg
	kGqmE+3jnILybc00R1mXrfgMLeDxacH1JbcPQQpqRk0vyYI9lU6i9f5BnRetvSrAssJAPfhXzyFNE
	rqw9f2QTdZazsBAjTlihkJqrZ5PQdcShOPY3cnIGVLvSUdIr2SmsyArA50Irp8emfffQzV1jQPYm2
	Z20gOXMkW82/Ktu4PmCvjzd5jN6laX2Mi/pdxftSIJOKz3+zUToK0j5N74g79ze+NUyYI8snvK8zx
	pePhOcorvfCmWLjwQotmsl/rJ5+ohgMpKTyUWtBB4KJyZARK8BkMwJBC3HjP1AmdP16ubAo8RhVY/
	/RB6STOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1kC3-0018pz-I9; Thu, 16 Jun 2022 07:45:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1k78-0016kp-W5; Thu, 16 Jun 2022 07:40:29 +0000
X-UUID: 9e593c5a8b1842a4b2ba118fa8777eac-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:1d156ca5-62c1-4ed1-b732-426e56f5422f,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:c1feb748-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 9e593c5a8b1842a4b2ba118fa8777eac-20220616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 554470533; Thu, 16 Jun 2022 00:40:24 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jun 2022 00:34:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 16 Jun 2022 15:34:19 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Jun 2022 15:34:19 +0800
Message-ID: <29fd9902d02654fa5098000732f92d6dc89defc4.camel@mediatek.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: dsp: mediatek: add mt8186 dsp
 document
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, YC Hung
	<yc.hung@mediatek.com>, Curtis Malainey <cujomalainey@chromium.org>, Allen-KH
 Cheng <allen-kh.cheng@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 16 Jun 2022 15:34:19 +0800
In-Reply-To: <acac2ec1-759a-dee0-8f08-df83b63b96f5@linaro.org>
References: <20220609083101.24195-1-tinghan.shen@mediatek.com>
	 <20220609083101.24195-4-tinghan.shen@mediatek.com>
	 <acac2ec1-759a-dee0-8f08-df83b63b96f5@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_004027_113213_CD40AAB4 
X-CRM114-Status: GOOD (  21.52  )
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

Hi Krzysztof,

On Wed, 2022-06-15 at 10:32 -0700, Krzysztof Kozlowski wrote:
> On 09/06/2022 01:31, Tinghan Shen wrote:
> > This patch adds mt8186 dsp document. The dsp is used for Sound Open
> > Firmware driver node. It includes registers, clocks, memory regions,
> > and mailbox for dsp.
> > 
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > ---
> >  .../bindings/dsp/mediatek,mt8186-dsp.yaml     | 91 +++++++++++++++++++
> >  1 file changed, 91 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> > b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> > new file mode 100644
> > index 000000000000..33c78f89d296
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> > @@ -0,0 +1,91 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/dsp/mediatek,mt8186-dsp.yaml*__;Iw!!CTRNKA9wMg0ARbw!0iJc3XTOVoKM_s-soALULRxog7f0GZLppKL0FCcIrYfh91fW2HmlpzSUZjVmoUR5PrasY2BmVGvmvv_IwZtlmOdXYw$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!0iJc3XTOVoKM_s-soALULRxog7f0GZLppKL0FCcIrYfh91fW2HmlpzSUZjVmoUR5PrasY2BmVGvmvv_IwZujnl7wMw$
> >  
> > +
> > +title: MediaTek mt8186 DSP core
> > +
> > +maintainers:
> > +  - Tinghan Shen <tinghan.shen@mediatek.com>
> > +
> > +description: |
> > +  MediaTek mt8186 SoC contains a DSP core used for
> > +  advanced pre- and post- audio processing.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt8186-dsp
> > +
> > +  reg:
> > +    items:
> > +      - description: Address and size of the DSP config registers
> > +      - description: Address and size of the DSP SRAM
> > +      - description: Address and size of the DSP secure registers
> > +      - description: Address and size of the DSP bus registers
> > +
> > +  reg-names:
> > +    items:
> > +      - const: cfg
> > +      - const: sram
> > +      - const: sec
> > +      - const: bus
> > +
> > +  clocks:
> > +    items:
> > +      - description: mux for audio dsp clock
> > +      - description: mux for audio dsp local bus
> > +
> > +  clock-names:
> > +    items:
> > +      - const: audiodsp
> > +      - const: adsp_bus
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  mboxes:
> > +    items:
> > +      - description: ipc reply between host and audio DSP.
> > +      - description: ipc request between host and audio DSP.
> 
> "IPC request between" does not specify who sends the request. Host or DSP?
> 
> See existing bindings for some better examples, e.g.:
> Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml
> which clearly states who receives from who.
> 
> > +
> > +  mbox-names:
> > +    items:
> > +      - const: rep
> > +      - const: req
> 
> tx/rx
> 
> 
> 
> 
> Best regards,
> Krzysztof

OK. I'll update in the next version.

Thanks,
TingHan


