Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3C3C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Nov 2021 07:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kS8u68pgZrhWt2M6PmjxIIEsXUgKdeduq1ZY1plhQ5E=; b=dWRHxC/jzK0Rb7
	D/AmzoCf9rPomjFrVfHfx9T9W62j91TWCpihiXj9MRcre97goIGVFD5b+srf630sGJKZRbQhFVI1L
	qLYAr/rkTfnFjWo8XMRykiLvCue/DCSKFlaRHkVbdfbbBoJXFOo6kgHt8RKN6Iw5Ve3hR7TxVhErt
	+HA8uafT4brh1d8H16vE8Dc+RV8nDnRTErnpk0SJTdailbdSc8R8deNHgAx3MMCDruyUzvbYpKiLY
	Eg0T71IBJTP5s+9qZ3DG0GK6Zs7y7HNZPFKxOcYKgskB72CfSW20cv6KslpDvBbB1iiK825GIw4MP
	TQlMSLvK1b9PFvAkkWpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpn8k-004Bqg-1Y; Wed, 24 Nov 2021 07:56:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpn8f-004BoN-Hy; Wed, 24 Nov 2021 07:56:24 +0000
X-UUID: 74b4f729cdbe4532819cc237f6faefb8-20211124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jmFRbgHXyWQM9FuS/EWE6h1VSjBn50PLdJLWIThLNL0=; 
 b=PMn8Os6KAebKXCTvTYoEmtVrlTNe/DkFVvPXjVKCL8kF/CJkiNPnsSR68yWkjx90vBNBO4WDE+TqslV5ji+13daQYZBAOYBnmqKrdjeBrDEkQGX+3O5uy7y9rljL+8gi5pqwke1H7od6LSrcG1h3aewZoU2X6xPCqgcleRDnvUo=;
X-UUID: 74b4f729cdbe4532819cc237f6faefb8-20211124
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 248490592; Wed, 24 Nov 2021 00:56:18 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Nov 2021 23:48:35 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Nov 2021 15:48:34 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 24 Nov 2021 15:48:33 +0800
Message-ID: <ba47b03019a2ee19bee058f6c08dc304c2b7c566.camel@mediatek.com>
Subject: Re: [PATCH 4/6] dt-bindings: phy: mediatek: tphy: support software
 efuse load
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Chen-Yu Tsai
 <wenst@chromium.org>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@ti.com>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>, Eddie Hung
 <eddie.hung@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, "Yz
 Wu" <yz.wu@mediatek.com>
Date: Wed, 24 Nov 2021 15:48:33 +0800
In-Reply-To: <8aa7adbf-7367-1b3a-4d63-f9fe83e72117@linaro.org>
References: <20211107075646.4366-1-chunfeng.yun@mediatek.com>
 <20211107075646.4366-4-chunfeng.yun@mediatek.com>
 <71f83770-b12f-2452-d24b-ae1be9b5b075@linaro.org>
 <CAGXv+5GzP1SXi2ihhifK_Ui8Rt04UgeFyjivzHc532yvPFo3OA@mail.gmail.com>
 <8aa7adbf-7367-1b3a-4d63-f9fe83e72117@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_235621_627117_A14E7FE2 
X-CRM114-Status: GOOD (  28.03  )
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

On Mon, 2021-11-22 at 09:21 +0000, Srinivas Kandagatla wrote:
> 
> On 22/11/2021 04:05, Chen-Yu Tsai wrote:
> > On Sat, Nov 20, 2021 at 1:19 AM Srinivas Kandagatla
> > <srinivas.kandagatla@linaro.org> wrote:
> > > On 07/11/2021 07:56, Chunfeng Yun wrote:
> > > > Add optional property nvmem-cells and nvmem-cell-names to
> > > > support
> > > > software efuse load, this helps to fix the efuse bit shift
> > > > issue
> > > > on mt8195 etc.
> > > > 
> > > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > 
> > > Applied thanks,
> > 
> > This is a PHY DT binding change. Shouldn't it go in with patch 5,
> > the
> > phy driver patch, through the PHY tree instead?
> 
> That's true, this is dropped from nvmem tree now!

Thanks

> 
> --srini
> > 
> > ChenYu
> > 
> > > --srini
> > > 
> > > > ---
> > > >    .../devicetree/bindings/phy/mediatek,tphy.yaml | 18
> > > > ++++++++++++++++++
> > > >    1 file changed, 18 insertions(+)
> > > > 
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > > > b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > > > index 9e6c0f43f1c6..05ee274b4b71 100644
> > > > --- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > > > +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> > > > @@ -160,6 +160,24 @@ patternProperties:
> > > >                    - PHY_TYPE_PCIE
> > > >                    - PHY_TYPE_SATA
> > > > 
> > > > +      nvmem-cells:
> > > > +        items:
> > > > +          - description: internal R efuse for U2 PHY or
> > > > U3/PCIe PHY
> > > > +          - description: rx_imp_sel efuse for U3/PCIe PHY
> > > > +          - description: tx_imp_sel efuse for U3/PCIe PHY
> > > > +        description: |
> > > > +          Phandles to nvmem cell that contains the efuse data;
> > > > +          Available only for U2 PHY or U3/PCIe PHY of version
> > > > 2/3, these
> > > > +          three items should be provided at the same time for
> > > > U3/PCIe PHY,
> > > > +          when use software to load efuse;
> > > > +          If unspecified, will use hardware auto-load efuse.
> > > > +
> > > > +      nvmem-cell-names:
> > > > +        items:
> > > > +          - const: intr
> > > > +          - const: rx_imp
> > > > +          - const: tx_imp
> > > > +
> > > >          # The following optional vendor properties are only
> > > > for debug or HQA test
> > > >          mediatek,eye-src:
> > > >            description:
> > > > 
> > > 
> > > _______________________________________________
> > > Linux-mediatek mailing list
> > > Linux-mediatek@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
