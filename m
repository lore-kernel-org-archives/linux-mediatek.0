Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECECC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 14:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KfD/NzeVLNLpWyXjwWNCkf8QfEMgLxurXkY0Pfz+aqE=; b=zwW7zgwT2FJJ28
	lD6wTWTSHZCkpzTl0Ed4UYNA59Aooxbqfw0ocT3Otodex3anJRr7DxKqoAapTdi+dHRrSnZ9KG2hv
	7ghGa65dpN/4LPmi7CExTZHUpe3narT0F0nU0+TyepZYMb2bzCA8v+QAV0RIMqgAIshxStUTDHQ44
	gONZ7zvraAfPv/4A3pIAWlRFisrpef5o0C1PYEQmyexedrH/gnz/YV5oZ44HZLfNXY6X+Hk4MT9mi
	rszmvzM778RLnAlO1fGCdh1GhlVHjBkP6PQxOdGleOsH4oIqvBS2mohGzBg41ScaUXjLVuII2og3Y
	KRSWfuQ7kUW+i2SRlxAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njiDc-001iAB-3u; Wed, 27 Apr 2022 14:00:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njiDO-001i84-5C; Wed, 27 Apr 2022 14:00:25 +0000
X-UUID: 84a6d8b72c2d43039895948644d39e33-20220427
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:d6367481-e0ab-462c-92a4-7cefd524433f, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:d0e6b1c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 84a6d8b72c2d43039895948644d39e33-20220427
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1954769408; Wed, 27 Apr 2022 07:00:16 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Apr 2022 07:00:14 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Apr 2022 22:00:12 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Apr 2022 22:00:12 +0800
Message-ID: <7b8cd25b87df6edc058fc5bc7574ab40544d8cc9.camel@mediatek.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: nvmem: mediatek: Convert mtk-efuse
 binding to YAML
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "Srinivas
 Kandagatla" <srinivas.kandagatla@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@canonical.com>
CC: Lala Lin <lala.lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Date: Wed, 27 Apr 2022 22:00:12 +0800
In-Reply-To: <51be638b-e12d-b9ae-c14b-f51e33d2503e@linaro.org>
References: <20220425084800.2021-1-allen-kh.cheng@mediatek.com>
 <20220425084800.2021-2-allen-kh.cheng@mediatek.com>
 <e64bdca8-7b18-b450-830c-ca07946a73fb@linaro.org>
 <9d65b713e3ffdd34dcca532c4c97fa98b124bde4.camel@mediatek.com>
 <0169c4ac-fdce-29b7-553a-14dc7df532d1@linaro.org>
 <a8e212a0e0449e015a33e76b320266376d4b9be6.camel@mediatek.com>
 <89609af9-5feb-0553-5e39-c97c4750b5a1@linaro.org>
 <33c754a7b6e4cd631bb2aeef002d34a6c25d6689.camel@mediatek.com>
 <0c63c24a-8014-2491-095c-77893d2141d9@linaro.org>
 <daca88d63fa844179a3d44affee124584353bec9.camel@mediatek.com>
 <51be638b-e12d-b9ae-c14b-f51e33d2503e@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_070022_255163_6371F473 
X-CRM114-Status: GOOD (  15.05  )
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

On Wed, 2022-04-27 at 15:53 +0200, Krzysztof Kozlowski wrote:
> On 27/04/2022 12:00, allen-kh.cheng wrote:
> > I think there are two cases in mediatek efuse dirver now.
> > 
> > Case 1, 
> > const: mediatek,efuse is deprecated.
> > const: mediatek,mt8173-efuse is remained. All mediatek chipsets
> > will
> > use mediatek,mt8173-efuse as fallback.
> > 
> > Case 2,
> > const: mediatek,efuse is deprecated.
> > const: mediatek,mt8173-efuse is deprecated.
> > 
> > All mediatek chipsets(include ediatek,mt8173-efuse) will use
> > mediatek,efuse as fallback.
> > 
> > Which one do you think is better?
> 
> Indeed, I forgot that mt8173 would also fallback to generic efuse.
> Indeed let's go with case 2, so your proposal before was correct.
> 
> 
> Best regards,
> Krzysztof

Ok, thank you for your reply.

I will repare v3 for those.

Best regards,
Allen


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
