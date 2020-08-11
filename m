Return-Path: <SRS0=N3vC=BV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44FFC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2020 07:02:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 909EE20772
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2020 07:02:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AH0hEtFY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AEhR5it6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 909EE20772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2nZnoA3Sf6IqAK1Vh7qMDYfNBFlX/5qCKnG0FiOUVhc=; b=AH0hEtFYArq+SXt80spN59HO0
	GLvTHYU8btEaBFJNltqEPA2plO052PF2/qMlejbLAEs1FBCEI2poaQRy7DPT9schYieV9XROx7PFF
	+ANSZlHsBNRf5zrZ64l5X6elrf2EKsVaiUGtBJIkTOWc+mRgVUFwjW2Zc45SvWrP19gDO+CKmWRlX
	NPsyihQNircjIeWnWTpLtMI3hwt+a2oSIJ2+RNt43byqzpUjYugQyc04oP6evfRHgQ0L+rNmh5sth
	Lq5UdEA71ChHmKgIGOtfN9E8n12E8uAA4bnLY9Vq6ketoVcmJnVBfP8Zx/lIjg4qE7G3X+vNRD2K1
	+XwNYzfEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5OIX-0001F7-0E; Tue, 11 Aug 2020 07:02:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5OIQ-0001Cj-CQ; Tue, 11 Aug 2020 07:02:08 +0000
X-UUID: 61b2d7ff8d69451aa9bd393f5234f204-20200810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=luiMjCONGDSZAfgjuV+GaEcthQ2SBwbITf3lz2PQy1k=; 
 b=AEhR5it6VK6aQOJJAPle8Vtqqae/26zFXbVNaBBJDcYqptRcYugvMj/JQjFhkZeNsiz5nYbQervcZM5WPeoRSQ1mBzt9lgItxN8CzzesenJghPaMc4xKfcgnRhpHeKLuNCsmlX8syHHxnrLAfLclD9MoOlCQFYu+aHXyf8qhp5M=;
X-UUID: 61b2d7ff8d69451aa9bd393f5234f204-20200810
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1314368794; Mon, 10 Aug 2020 23:02:03 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Aug 2020 00:02:01 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Aug 2020 15:01:53 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 11 Aug 2020 15:01:53 +0800
Message-ID: <1597129314.20627.25.camel@mtksdaap41>
Subject: Re: [PATCH v2 1/5] dt-bindings: ARM: Mediatek: Document bindings
 for MT8192
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Tue, 11 Aug 2020 15:01:54 +0800
In-Reply-To: <CAFqH_50+_Bt97roTACRhoq8XkfSc1UcHyQP3OCacQR5oK-viOg@mail.gmail.com>
References: <1596012277-8448-1-git-send-email-weiyi.lu@mediatek.com>
 <1596012277-8448-2-git-send-email-weiyi.lu@mediatek.com>
 <CAFqH_50+_Bt97roTACRhoq8XkfSc1UcHyQP3OCacQR5oK-viOg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 268E491AB7C4BC3B53770B729121ED1B10A33991DE15E3EB8DFFC0639A50E6EB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200811_030206_712119_419931D2 
X-CRM114-Status: GOOD (  27.81  )
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
Cc: Rob Herring <robh@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 James Liao <jamesjj.liao@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wendell Lin <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-07-29 at 11:53 +0200, Enric Balletbo Serra wrote:
> Hi Weiyu,
> 
> Thanks for the patch, some comments below. I am not sure what
> maintainers think but your patches, in general, are really big and I'm
> wondering if wouldn't be better split by functionalities. Will make
> your series much longer but easy to review in my opinion. Anyway, I'm
> going to comment a few files but the comments can be applied to other
> files.
> 

Hi Enric,
You're right, these are big. I was trying to to add these documents
through the clock series at this stage. Do you suggest to send with
other functional series instead through the clock series?

> Missatge de Weiyi Lu <weiyi.lu@mediatek.com> del dia dc., 29 de jul.
> 2020 a les 10:46:
> >
> > This patch adds the binding documentation for apmixedsys, audsys,
> > camsys-raw, camsys, imgsys, imp_iic_wrap, infracfg, ipesys, mdpsys,
> > mfgcfg, mmsys, msdc, pericfg, scp-adsp, topckgen, vdecsys-soc,
> > vdecsys and vencsys for Mediatek MT8192.
> >
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > ---
> >  .../bindings/arm/mediatek/mediatek,apmixedsys.txt  |  1 +
> >  .../bindings/arm/mediatek/mediatek,audsys.txt      |  1 +
> >  .../bindings/arm/mediatek/mediatek,camsys-raw.yaml | 40 ++++++++++++++++++++
> >  .../bindings/arm/mediatek/mediatek,camsys.txt      |  1 +
> >  .../bindings/arm/mediatek/mediatek,imgsys.txt      |  2 +
> >  .../arm/mediatek/mediatek,imp_iic_wrap.yaml        | 43 ++++++++++++++++++++++
> >  .../bindings/arm/mediatek/mediatek,infracfg.txt    |  1 +
> >  .../bindings/arm/mediatek/mediatek,ipesys.txt      |  1 +
> >  .../bindings/arm/mediatek/mediatek,mdpsys.yaml     | 38 +++++++++++++++++++
> >  .../bindings/arm/mediatek/mediatek,mfgcfg.txt      |  1 +
> >  .../bindings/arm/mediatek/mediatek,mmsys.txt       |  1 +
> >  .../bindings/arm/mediatek/mediatek,msdc.yaml       | 39 ++++++++++++++++++++
> >  .../bindings/arm/mediatek/mediatek,pericfg.yaml    |  1 +
> >  .../bindings/arm/mediatek/mediatek,scp-adsp.yaml   | 38 +++++++++++++++++++
> >  .../bindings/arm/mediatek/mediatek,topckgen.txt    |  1 +
> >  .../arm/mediatek/mediatek,vdecsys-soc.yaml         | 38 +++++++++++++++++++
> >  .../bindings/arm/mediatek/mediatek,vdecsys.txt     |  1 +
> >  .../bindings/arm/mediatek/mediatek,vencsys.txt     |  1 +
> >  18 files changed, 249 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys-raw.yaml
> >  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
> >  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mdpsys.yaml
> >  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml
> >  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml
> >  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys-soc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
> > index bd7a0fa..6942ad4 100644
> > --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
> > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
> > @@ -17,6 +17,7 @@ Required Properties:
> >         - "mediatek,mt8135-apmixedsys"
> >         - "mediatek,mt8173-apmixedsys"
> >         - "mediatek,mt8183-apmixedsys", "syscon"
> > +       - "mediatek,mt8192-apmixedsys", "syscon"
> >         - "mediatek,mt8516-apmixedsys"
> >  - #clock-cells: Must be 1
> >
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
> > index 38309db..fdcb267 100644
> > --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
> > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
> > @@ -12,6 +12,7 @@ Required Properties:
> >         - "mediatek,mt7622-audsys", "syscon"
> >         - "mediatek,mt7623-audsys", "mediatek,mt2701-audsys", "syscon"
> >         - "mediatek,mt8183-audiosys", "syscon"
> > +       - "mediatek,mt8192-audsys", "syscon"
> >         - "mediatek,mt8516-audsys", "syscon"
> >  - #clock-cells: Must be 1
> >
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys-raw.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys-raw.yaml
> > new file mode 100644
> > index 0000000..db6f425
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys-raw.yaml
> > @@ -0,0 +1,40 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: https://urldefense.com/v3/__http://devicetree.org/schemas/arm/mediatek/mediatek,camsys-raw.yaml*__;Iw!!CTRNKA9wMg0ARbw!3w84XoXGRAkVX5zxTBA4o5h7EkKiKBuCO5VZDMmx94qoJK357wbTnjT9XN6SRPQc$ 
> > +$schema: https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!3w84XoXGRAkVX5zxTBA4o5h7EkKiKBuCO5VZDMmx94qoJK357wbTnjT9XGLX7Fq7$ 
> > +
> > +title: MediaTek CAMSYS RAW Controller
> > +
> > +maintainers:
> > +  - Weiyi Lu <weiyi.lu@mediatek.com>
> > +
> > +description:
> > +  The Mediatek camsys raw controller provides various clocks to the system.
> > +
> 
> It only provides clocks or also provides configuration registers
> non-clock related?
> 

Thanks for reminding, it also provides other configuration registers.
I'll update the description in next version.

> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - mediatek,mt8192-camsys_rawa
> > +          - mediatek,mt8192-camsys_rawb
> > +          - mediatek,mt8192-camsys_rawc
> > +      - const: syscon
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +examples:
> > +  - |
> > +    camsys_rawa: camsys_rawa@1a04f000 {
> 
> I think that this should be  "syscon@1a04f000", since node names are
> supposed to match the class of the device instead of the name of the
> device.
> 

Got it, I'll fix in next version.

> Just because I am curious, can you show me an example of
> "mediatek,mt8192-camsys_rawb" or "mediatek,mt8192-camsys_rawc"? It's a
> different address space?
> 
> > +        compatible = "mediatek,mt8192-camsys_rawa", "syscon";
> > +        reg = <0 0x1a04f000 0 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> 

OK, I'll add those in next version.

> [snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
