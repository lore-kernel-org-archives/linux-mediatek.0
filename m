Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76258C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 May 2022 08:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4vcbERf9WSDCBaglOf8lx0PM55gdmgiJoE9FlWiqdrI=; b=pj/VrMc3V5SbvD
	f5rggUrEzZ5RTCGeNy9bXsvDcdAoO4N2AxhP/HsDgDxwLNu8W3Y3h0FWjg/xThUFUnLm5QbIxl8n1
	4p0BY/U9AiTmw6QVX/U1kthywU2YfKl9IcAJSuA55kje28kpxSc/YxUQ3s998KtHJYRrxEVD04uUD
	L/Mw/hWKMEJlm7driphHuNUetN7MAWjNwqk8l0iXVC0wDFRRdZIR0L5PTCiWIJ5rxMT1ugDsX/1Z1
	xHXWqHjvg1w9St3v8pgFwxSIvi/k51A8a5nyH3RHfh+871Zu3m/WoEe5eZ/RYnx2FiA0AfMgdywxe
	1FJW+HvMzbj3fQIQKZRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nl4uj-00Ftqc-4U; Sun, 01 May 2022 08:26:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nl4uY-00Ftoj-E4; Sun, 01 May 2022 08:26:35 +0000
X-UUID: 71ade7dab172453c8ce4bac365472043-20220501
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:1cb3d744-6431-4d3f-87ca-3d6c575d9037, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:29e418c7-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 71ade7dab172453c8ce4bac365472043-20220501
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 4027042; Sun, 01 May 2022 01:26:28 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 1 May 2022 01:26:26 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sun, 1 May 2022 16:26:24 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 1 May 2022 16:26:24 +0800
Message-ID: <cf3062c9ebc69642bdc16ce32ed3260486969b04.camel@mediatek.com>
Subject: Re: [PATCH v2] dt-bindings: arm: mediatek: mmsys: refine power and
 gce properties
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
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Cellopoint
 <cellopoint.kai@gmail.com>
Date: Sun, 1 May 2022 16:26:24 +0800
In-Reply-To: <c9239316-40af-724b-cace-7da5bf7e8e21@linaro.org>
References: <20220429083051.11260-1-jason-jh.lin@mediatek.com>
 <c9239316-40af-724b-cace-7da5bf7e8e21@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_012634_528939_206ADF3C 
X-CRM114-Status: GOOD (  14.71  )
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

On Fri, 2022-04-29 at 22:58 +0200, Krzysztof Kozlowski wrote:
> On 29/04/2022 10:30, Jason-JH.Lin wrote:
> > Power:
> >   Refine description and add item number for power-domains
> > property.
> > 
> > GCE:
> >   Refine description and add item number for mboxes property and
> >   mediatek,gce-client-reg property.
> > 
> > Fixes: 1da90b8a7bae ("dt-bindings: arm: mediatek: mmsys: add power
> > and gce properties")
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

[snip]
 
> >    mboxes:
> > +    minItems: 1
> > +    maxItems: 24
> 
> Wait, no, I wrote it should be 16 for one device and 24 for other,
> not
> 24 for all...
> 

Ok, I thought maxItems: 24 contained 16, but it's not clear enough.


I'm not sure how to describe different maxItems for different
platforms. Does it come like this?

1. Remove the maxItems in mboxes property.
2. Add the allOf condition before the line "additionalProperties:
false". E.g.

allOf:
  - if:
      properties:
        compatible:
          contains:
            const: mediatek,mt8173-mmsys
    then:
      properties:
        mboxes:
          maxItems: 16
    else:
      properties:
        mboxes:
          maxItems: 24

additionalProperties: false
...


Regards,
Jason-JH.Lin

> Best regards,
> Krzysztof
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
