Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B711C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 08:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ykkG0mlror/7Lzicq1fuo2Kf2jm6yC1syO9cbZpLjo=; b=ztkmhQ3mg8ltkX
	nmjfmp+6uzO9Y0PLFml57rCQc6Yisf1vhZQfh/+5gOyvgz9lZQYSo5U/+8WSk7QXzY1bdpVRAqjl7
	tc/W04ffZR6LYTPh5gzaoBurfB8uskGt9MwtPmRuFxnzmymAPJu1jvkl+KoNSSROVv07wkOksx5VX
	InnaPleyED/eL1C9zvE0heJRb3KtPWNMfw99Ba3XPR+Wlw/+tO2gLrUxvS1fQmcqfdBH6WxZ40hRw
	F2D+azPfKaYC/H/HeekNKPn/bTTv9jngt9UkKYvo4TKLKnkQyV9Bn7JgbDLkhEf5XzMcGZAf9vZ1G
	XEFTRGJJY0119SaL4kYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt3Cg-002LVY-Rf; Mon, 23 May 2022 08:14:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2s9-002CKb-CE; Mon, 23 May 2022 07:53:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=AdnHLVM+oerhxjlqmH3teKIttInw376KeUGWWv3wZOA=; b=TAFTq4It7jrRwjyjVMdHTTigkt
 meY3Bm9m5k+mRAxPyrfnsmUuPP6y/vZQB9N9rlvfgkFkXPr2pWXsoZ9ogtyL0Y/rEdSqc/qT+zohA
 JkBQMrYLpxLTShudiLuyECyfZPN5JjAlG8cpxyXLN7xg/VD0QPgQBkilwEKCkVABHRJbvEdUHwosc
 tfhoaQQzFQn206HiSuD2Lj62KZ9Ylt3MIoy5QepGCSBNVgYys+qt15PlXVEgvN/f5UIPfxkDFoPvo
 Jbzo1zjPKGqbu5jS7qKL2YyLixnbasabTB2e8U9h0ONZmn9PcwVYITX/L6GqxTpwdws6fESz+oI9i
 zbenIwAQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsyHn-000mb7-7H; Mon, 23 May 2022 02:59:15 +0000
X-UUID: 98e95165112e41d281a987073929444a-20220522
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=AdnHLVM+oerhxjlqmH3teKIttInw376KeUGWWv3wZOA=; 
 b=bL/3EHL0M37VixW0KUD8OZJ0I/rtmvr4ghrOyNyH1RClhZnAOqEPiv0sgiFw4zfJ6ANCeEizf4cEVrKblfsr5EJDNeETTG867BoSBcBrst01S2abmqw+I8XoUPlysdGJiGxGqMLO5t8ftWnhHI1xPmK8RCmFawNqH16f0WoZ4Hg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:f29c0bff-31d8-4404-bb8f-fda7dadee5c2, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:2a19b09, CLOUDID:c411377a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 98e95165112e41d281a987073929444a-20220522
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 953365610; Sun, 22 May 2022 19:58:41 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 May 2022 19:58:40 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 23 May 2022 10:58:38 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 23 May 2022 10:58:25 +0800
Message-ID: <bb24ceafc7b1df1b2a5cd1b3662d9cc7af6fce0d.camel@mediatek.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: phy: mediatek: Add YAML schema for
 PCIe PHY
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Chen-Yu
 Tsai" <wenst@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
CC: Wei-Shun Chang <weishunc@google.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rex-bc.chen@mediatek.com>,
 <randy.wu@mediatek.com>, <jieyy.yang@mediatek.com>,
 <chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
 <jian.yang@mediatek.com>
Date: Mon, 23 May 2022 10:58:23 +0800
In-Reply-To: <79706876349c3670f8831e75f70722f0bca200cb.camel@mediatek.com>
References: <20220520064920.27313-1-jianjun.wang@mediatek.com>
 <20220520064920.27313-2-jianjun.wang@mediatek.com>
 <79706876349c3670f8831e75f70722f0bca200cb.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_035912_472607_4B955DDE 
X-CRM114-Status: GOOD (  15.78  )
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

Hi Chunfeng,

On Mon, 2022-05-23 at 10:23 +0800, Chunfeng Yun wrote:
> On Fri, 2022-05-20 at 14:49 +0800, Jianjun Wang wrote:
> > Add YAML schema documentation for PCIe PHY on MediaTek chipsets.
> > 
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  .../bindings/phy/mediatek,pcie-phy.yaml       | 75
> > +++++++++++++++++++
> >  1 file changed, 75 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
> > 
...snip...
> > +
> > +  "#phy-cells":
> > +    const: 0
> > +
> > +  nvmem-cells:
> > +    maxItems: 7
> 
> Seems no need 'maxItems', we can get it from items of 'nvmem-cell-
> names'

Please see the comment by Krzysztof[1], I guess we need to add this
'maxTems'.

[1]:
https://lore.kernel.org/lkml/d48c0023-231c-4011-5548-4b260b3fe172@kernel.org/

Thanks.
> 
> > +    description:
> > +      Phandles to nvmem cell that contains the efuse data, if
> > unspecified,
> > +      default value is used.
> > +
> > +  nvmem-cell-names:
> > +    items:
> > +      - const: glb_intr
> > +      - const: tx_ln0_pmos
> > +      - const: tx_ln0_nmos
> > +      - const: rx_ln0
> > +      - const: tx_ln1_pmos
> > +      - const: tx_ln1_nmos
> > +      - const: rx_ln1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - "#phy-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    phy@11e80000 {
> > +        compatible = "mediatek,mt8195-pcie-phy";
> > +        #phy-cells = <0>;
> > +        reg = <0x11e80000 0x10000>;
> > +        reg-names = "sif";
> > +        nvmem-cells = <&pciephy_glb_intr>,
> > +                      <&pciephy_tx_ln0_pmos>,
> > +                      <&pciephy_tx_ln0_nmos>,
> > +                      <&pciephy_rx_ln0>,
> > +                      <&pciephy_tx_ln1_pmos>,
> > +                      <&pciephy_tx_ln1_nmos>,
> > +                      <&pciephy_rx_ln1>;
> > +        nvmem-cell-names = "glb_intr", "tx_ln0_pmos",
> > +                           "tx_ln0_nmos", "rx_ln0",
> > +                           "tx_ln1_pmos", "tx_ln1_nmos",
> > +                           "rx_ln1";
> > +        power-domains = <&spm 2>;
> > +    };
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
