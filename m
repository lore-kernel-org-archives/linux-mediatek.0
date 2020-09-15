Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 444D8C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 06:02:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8B8120732
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 06:02:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pSyStUzr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nmpAc5EK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8B8120732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OlRdkwYYqvCpNrQ5QX0uXF8nfsrAKnkSlyIGrOcyfa0=; b=pSyStUzrdjtl3PTsCcETcKFQQ
	O/VSfgeKMV1McXCNgLQvX9MMFG83fOOG8DtUasJIOvWHrQ8bS0NgizAu5p23N9LmTkS2AnaHvGdiA
	+MiCm0zIfOrjEI0FDiUTCenCnn0Y1AiGa5SWZ8ju2I1zH95ZUHO09KTocKUX1Zo66lbnLgfRCN/ge
	0i6+YNb7OvSXKc1HDaTl66FxrWdyNc261YYWTmXrK1zpYP9xpBeqd3NYQnUK0unHIU1+4oRcz9PaF
	2E3odqujzU71DM9xeHJ5pSYBZsxBr4le23EZouo/KPOIB/RVp3pweZMQerzgzNPKUl5nCL+do+hKA
	hrxfru+Dw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI42i-0004wU-S0; Tue, 15 Sep 2020 06:02:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI42e-0004v6-2e; Tue, 15 Sep 2020 06:02:13 +0000
X-UUID: 601f62e5c7e34a768bec05f0de239c85-20200914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=7TyzYnNnuHx6SNq8ViyS5YlncO0DkL6/ccYuDYtvhdI=; 
 b=nmpAc5EKv0qaJixZXNRHgewAvtiGQNtPGPPnZeTkAzPQLHx/vDqBJ7bFgftxyALPD+EfepsMpcf+IOIeq6NdNfAgqLjs5rK/PhvO1f8MIM+0XnSWprfn4kgbRZ1y4V2U0aula2k9sCZDjQ+rF2jXP9/Q8wUXGAU8Jb7NHxH4JXs=;
X-UUID: 601f62e5c7e34a768bec05f0de239c85-20200914
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 462311863; Mon, 14 Sep 2020 22:02:07 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 22:57:09 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 15 Sep 2020 13:57:06 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Sep 2020 13:57:06 +0800
Message-ID: <1600149301.25043.17.camel@mhfsdcap03>
Subject: Re: [PATCH v2 02/23] dt-bindings: memory: mediatek: Convert SMI to
 DT schema
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 15 Sep 2020 13:55:01 +0800
In-Reply-To: <20200914232345.GA465583@bogus>
References: <20200905080920.13396-1-yong.wu@mediatek.com>
 <20200905080920.13396-3-yong.wu@mediatek.com>
 <20200914232345.GA465583@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F0B44B45969F81D8D7A3A71A4A0A1C136FDDE0730FA3C551C17876F4581648A22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_020212_333115_ADC3FD86 
X-CRM114-Status: GOOD (  15.69  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Evan
 Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-09-14 at 17:23 -0600, Rob Herring wrote:
> On Sat, Sep 05, 2020 at 04:08:59PM +0800, Yong Wu wrote:
> > Convert MediaTek SMI to DT schema.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  .../mediatek,smi-common.txt                   | 49 ----------
> >  .../mediatek,smi-common.yaml                  | 96 +++++++++++++++++++
> >  .../memory-controllers/mediatek,smi-larb.txt  | 49 ----------
> >  .../memory-controllers/mediatek,smi-larb.yaml | 85 ++++++++++++++++

[...]

> > +  mediatek,smi:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description: a phandle to the smi_common node.
> > +
> > +  mediatek,larb-id:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: the hardware id of this larb.
> > +      Required property for mt2701, mt2712, mt6779 and mt7623.
> 
> Is there a set of valid values?

In the patch[4/23], I change the larb_nr to 32. normally this id is from
0 to 31. I will add this in next version:

    minimum: 0
    maximum: 31

> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8173-clk.h>
> > +    #include <dt-bindings/power/mt8173-power.h>
> > +
> > +    larb1: larb@16010000 {
> > +      compatible = "mediatek,mt8173-smi-larb";
> > +      reg = <0x16010000 0x1000>;
> > +      mediatek,smi = <&smi_common>;
> > +      power-domains = <&scpsys MT8173_POWER_DOMAIN_VDEC>;
> > +      clocks = <&vdecsys CLK_VDEC_CKEN>,
> > +               <&vdecsys CLK_VDEC_LARB_CKEN>;
> > +      clock-names = "apb", "smi";
> > +    };
> > +
> > -- 
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
