Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81C8C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 06:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ViiVquVmkWHUzcWw5a3RCL7U72JtpCkxmroB77bVHEQ=; b=1pwG1/vKjbqLD3
	VURreiJVaCC3H8sM6daoNQEiLzGJMhxxD+I+qG6ssK2CjNOy1rlJFVgcP55/wKZfZF0xVVCCOAHfc
	csHk1Sj/lkCEhJ4B+K6zHePnWtvh5xH1JnD+IJ8KMDp1pg84cCKYUadWeTCOJe6eYUCqPSsULfPmQ
	YVb3AjcnJc4tRRv2yoO3XCxJpADpemkwDqfGgnewOEZivc3xWKHIHzcfRX/eSUdJSddkVS24leAtN
	tnonzwFg+BqnaC3aUtbvkv1F3PIyNPnvWHXvj8j47U5112WE8Fm3BM2p/wfJpdRVnIEe9BDn/SwfM
	Kckh/iplpnBxmHce7+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwedE-001r2e-UC; Thu, 02 Jun 2022 06:48:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwecm-001qjM-2M; Thu, 02 Jun 2022 06:48:05 +0000
X-UUID: 496896d2a2e34461bc432cdeb2312b02-20220601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:0a82bb25-5870-4a39-b57b-a4f69cd74eb2,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:2a19b09,CLOUDID:1357dc37-9855-4915-a138-f5705f1f3d02,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 496896d2a2e34461bc432cdeb2312b02-20220601
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 247324207; Wed, 01 Jun 2022 23:47:56 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jun 2022 23:44:32 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 2 Jun 2022 14:44:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 2 Jun 2022 14:44:31 +0800
Message-ID: <eb4deff1a01c09783518bbaff8fe4e4c4ca6fa5b.camel@mediatek.com>
Subject: Re: [PATCH v1] dt-bindings: dsp: mediatek: add mt8186 dsp document
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 2 Jun 2022 14:44:31 +0800
In-Reply-To: <c0a188e5-8a8c-d4a3-5a3d-9b9dd85d8f44@linaro.org>
References: <20220422071534.15653-1-tinghan.shen@mediatek.com>
	 <c0a188e5-8a8c-d4a3-5a3d-9b9dd85d8f44@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_234804_155684_2CDD4F96 
X-CRM114-Status: GOOD (  25.10  )
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

Thanks for your review and sorry for late response.

On Fri, 2022-04-22 at 17:49 +0200, Krzysztof Kozlowski wrote:
> On 22/04/2022 09:15, Tinghan Shen wrote:
> > This patch adds mt8186 dsp document. The dsp is used for Sound Open
> > Firmware driver node. It includes registers, clocks, memory regions,
> > and mailbox for dsp.
> > 
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > ---
> > 
> > This patch depends on MT8186 clock bindings.
> > 
https://urldefense.com/v3/__https://lore.kernel.org/all/20220409132251.31725-2-chun-jie.chen@mediatek.com/__;!!CTRNKA9wMg0ARbw!xNJkwM9Z-raJLjgIoriOnjolphzSHqpnATbd3XC7wU7iaUns8gqGB2omSOkliuoDf3g$
> >  
> > 
> > ---
> >  .../bindings/dsp/mediatek,mt8186-dsp.yaml     | 93 +++++++++++++++++++
> >  1 file changed, 93 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> > b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> > new file mode 100644
> > index 000000000000..00a79e880895
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> > @@ -0,0 +1,93 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/dsp/mediatek,mt8186-dsp.yaml*__;Iw!!CTRNKA9wMg0ARbw!xNJkwM9Z-raJLjgIoriOnjolphzSHqpnATbd3XC7wU7iaUns8gqGB2omSOklA_t3nMM$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!xNJkwM9Z-raJLjgIoriOnjolphzSHqpnATbd3XC7wU7iaUns8gqGB2omSOkl3OXmT2U$
> >  
> > +
> > +title: Mediatek mt8186 DSP core
> > +

(...snip...)

> > +
> > +  clock-names:
> > +    items:
> > +      - const: audiodsp_sel
> > +      - const: adsp_bus_sel
> 
> What does the "sel" stands for? Maybe just skip the "_sel" suffixes?

No problem. I'll remove '_sel' in next version.

> 
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  mboxes:
> > +    items:
> > +      - description: ipc reply between host and audio DSP.
> > +      - description: ipc request between host and audio DSP.
> > +
> > +  mbox-names:
> > +    items:
> > +      - const: mbox0
> > +      - const: mbox1
> 
> These should be rather some meaningful names, e.g. "rx" and "tx".

The mbox name has to align with the adsp ipc driver.
The adsp ipc driver is using 'mbox%d' for mailbox channels.


https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?id=9db69df4bdd37eb1f65b6931ee067fb15b9a4d5c

	chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);

	/* ...snip... */

	adsp_chan->ch = mbox_request_channel_byname(cl, chan_name);

Is it ok to continue using these names?
> 
> > +
> > +  memory-region:
> > +    items:
> > +      - description: dma buffer between host and DSP.
> > +      - description: DSP system memory.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - mbox-names
> > +  - mboxes
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> 
> You do not use these headers.

Ok. I'll remove them at next version.

Thanks,
TingHan

> 
> > +    #include <dt-bindings/clock/mt8186-clk.h>
> > +    dsp@10680000 {
> 
> 
> 
> Best regards,
> Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
