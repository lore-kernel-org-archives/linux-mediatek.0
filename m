Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9626C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 08:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XASMIPNqt9lT3p0vj5jWv9mby7nLSD2KFBn3jBOkQ6k=; b=XgrovrKPPRonNf
	dtjsLmw7LotkoBF7VOeMvtkC+tccwKX0pm+GvF+vvpiyBGPHKk/SPKrKeXK8rdGlmkJuvBpXWL0E7
	7SYD9zn55b9DCEcgp+hZzHoQqLvFCzV3VMrvVawN1WDPl6zUNs/oS4E7wreZ9AqtN2G1qmtfJjLMJ
	tpr7Ap+D/GY3oyiVJI8ZHI/cGr5E39KL7mvQVr9H/hcZbYh/fLCxiJmoqleMsiz6dAb0XpG9NYMDj
	FhSOXvDGqr5sUePKSJe9j2+OpZnfEeGkQf319PdFinXxGb3EPfHlFx/5pZMHjtQDqrYxnkM1vbYvf
	JXNdyOETPxEqGltAu5Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkLcS-00A3pL-S6; Fri, 29 Apr 2022 08:04:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkLcQ-00A3od-8Z; Fri, 29 Apr 2022 08:04:51 +0000
X-UUID: 72e1d4a0a6224e3d84a8db6476f34e5b-20220429
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:9e1f9acc-c3b1-4477-9ec7-2baf8e7575ef, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:3be0282f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 72e1d4a0a6224e3d84a8db6476f34e5b-20220429
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1525755377; Fri, 29 Apr 2022 01:04:45 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Apr 2022 00:54:42 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Apr 2022 15:54:41 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Apr 2022 15:54:41 +0800
Message-ID: <0a43e9787c8e4886b361268a58e755afbf81be1d.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: arm: mediatek: mmsys: refine power and gce
 properties
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Fabien Parent <fparent@baylibre.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, CK Hu <ck.hu@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 29 Apr 2022 15:54:41 +0800
In-Reply-To: <9779588a-5bda-ea82-64a0-c13d48d89eff@linaro.org>
References: <20220428012715.2619-1-jason-jh.lin@mediatek.com>
 <b7bb228f-751c-e7ad-a695-3dc40d889a72@linaro.org>
 <60338c26047f47c77fdc7d4eff6a7dee43853e1b.camel@mediatek.com>
 <9779588a-5bda-ea82-64a0-c13d48d89eff@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_010450_335449_08ABAC6A 
X-CRM114-Status: GOOD (  32.26  )
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

Thanks for the reviews.

On Fri, 2022-04-29 at 07:55 +0200, Krzysztof Kozlowski wrote:
> On 29/04/2022 06:10, Jason-JH Lin wrote:
> > Yes, we cannot have infinite number for this, but we can use not
> > only
> > one mbox channel for one mmsys.
> > 
> > Its maximum number is equal to GCE HW thread number.
> > The maximum number in mt8195 is 24 and mt8173 is 16.
> > 
> > But we currently using 1.
> > So I'm not sure if I need to set the maxItems for this?
> 
> Yes. 24 for mt8195 and 16 for mt8173.
> 
OK, I'll add maxItems: 24.
> > 
> > > 
> > > >      description:
> > > > -      Using mailbox to communicate with GCE, it should have
> > > > this
> > > > -      property and list of phandle, mailbox specifiers. See
> > > > -      Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> > > > for
> > > > details.
> > > > -    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > > +      If using mailbox to communicate with GCE, it should have
> > > > this
> > > > +      property. GCE will help configure the hardware settings
> > > > for
> > > > the
> > > > +      current mmsys data pipeline.
> > > >  
> > > >    mediatek,gce-client-reg:
> > > > -    description:
> > > > -      The register of client driver can be configured by gce
> > > > with
> > > > 4 arguments
> > > > -      defined in this property, such as phandle of gce, subsys
> > > > id,
> > > > -      register offset and size.
> > > > -      Each subsys id is mapping to a base address of display
> > > > function blocks
> > > > -      register which is defined in the gce header
> > > > -      include/dt-bindings/gce/<chip>-gce.h.
> > > > -    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > 
> > > Why removing ref? Does your binding work after such change?
> > 
> > I removed it unexpectedly, I'll add it back.
> 
> Just be sure you test it before submitting...
> 
I'm sorry about this.
I think something wrong in my local scanning environment.
I'll fix this and test it before submitting the next version.

Regards,
Jason-JH.Lin
> 
> Best regards,
> Krzysztof
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!3EBAk7zcr3iMc-Todq-efcLmYCZNkxH9gYnUmY1tHbPiVm9yNYhrI-Yj0I16f8jGnA6B$
>  
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
