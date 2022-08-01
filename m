Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CF8C19F2B
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 06:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mWyv9vilCggP4s7Y2WSCQauoJ04MYKrZvEUasRwJGa8=; b=PYnFt/6UZ9sLski8RwNXR8TQC5
	F05E/YzDOwrF8rqjjfUADF/DQxeyniiRpKG6w9RWQX20D/EM8OxG2r7jenScD4qkPMin4FFGCRQOP
	2VA79V/6b1GVOVqFLvg5NTKOiXI5RWYNBs3+ZRCCv2imNtnkcKoQd7F+wo5q5xj2g28StKlvnaZJt
	UhpL1BMwUfjgYhv5cJu/5Ot0b1dc7xLZPbjO1MwkhwHOH51viJ23rLtJPhIa+d5PSbx+fNgXACX4D
	Vt2ZPkYCZPE4b9W2qQpAMLiUeY2KOFjgj7jDqncoQKwlrvTVKTkid/9AhCAfbuytK5zwEVNkxYeDE
	4UXDUu3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIPDj-0036cT-NY; Mon, 01 Aug 2022 06:48:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIPDg-0036YN-F2; Mon, 01 Aug 2022 06:48:07 +0000
X-UUID: abde7a34cf954846a170b1902f16c4f6-20220731
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:dd0fe704-3c5b-402c-9d4b-d9b9031f096e,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:613ddfd0-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: abde7a34cf954846a170b1902f16c4f6-20220731
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <hui.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1472314646; Sun, 31 Jul 2022 23:47:51 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 1 Aug 2022 14:16:48 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 1 Aug 2022 14:16:47 +0800
Message-ID: <e8dc87197fd19de2fd16262967ee305c142f4282.camel@mediatek.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: mediatek: add support for
 mt8188
From: hui.liu <hui.liu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: <linus.walleij@linaro.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jianguo.zhang@mediatek.com>, <zhiyong.tao@mediatek.com>,
	<sean.wang@mediatek.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Mon, 1 Aug 2022 14:16:47 +0800
In-Reply-To: <20220729230439.GA99380-robh@kernel.org>
References: <20220729102452.9478-1-hui.liu@mediatek.com>
	 <20220729102452.9478-2-hui.liu@mediatek.com>
	 <20220729230439.GA99380-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220731_234804_550026_EABE29F8 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
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

On Fri, 2022-07-29 at 17:04 -0600, Rob Herring wrote:
> 
> > +
> > +# PIN CONFIGURATION NODES
> > +patternProperties:
> > +  '-pins$':
> > +    type: object
> > +    $ref: "/schemas/pinctrl/pincfg-node.yaml"
> 
> Doesn't this belong in the child '^pins' node? There's no properties
> in 
> this node, right?
> 
> > 

Hi Rob,

Yes. I will move $ref: "/schemas/pinctrl/pincfg-node.yaml" to '^pins'
node in the next version:
# PIN CONFIGURATION NODES
patternProperties:
  '-pins$':
    type: object
    additionalProperties: false

    patternProperties:
      '^pins':
        type: object
        $ref: "/schemas/pinctrl/pincfg-node.yaml"
        additionalProperties: false

Thanks.
Hui



