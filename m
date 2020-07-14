Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB28C433E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 03:17:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08EB121D95
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 03:17:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AAqnkP4q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gc17d/8P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08EB121D95
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SKBeLESmI/lijPYku+sqCVk/37smN4shzyzwJLa/RPU=; b=AAqnkP4qiefjcVuusCzhFGUKx
	cKlw4G1wVRn/3LEw8XtTxXZEnyBflqW+mCCxa94bnnDBP4c3Ws0Kgj1CWZZiuqF9mx+eivixm2Gk1
	cftp6mjgVExo0bmXC5QCtoGThRlp/0YJy54psxxsRWvg+WoPcOQejct46DQ1dDIITTjg8yHSNmP0E
	33XEH3GvbuYOuOOW3y6enCMiCE+fms9FXP2yIUYdOWzeYPwZwJc1AsRWm1LhjMbOQBDZEVkIpxJrO
	JfxD9b42NFIpLGOBrV+NEKbv3HOz7gTMjGYoD/gGZgX8YG8FF2OLuPhigoyFL7U88VjtMzdyKk3Pg
	Efj8UtHdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvBRZ-0005s5-Qd; Tue, 14 Jul 2020 03:17:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvBRW-0005rZ-CR; Tue, 14 Jul 2020 03:17:19 +0000
X-UUID: 252d01f706d0437ab13586a33d3cae0d-20200713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=vkbJ6uCn0JxjPLqJVD77fWqRVEpiv14ICWliAnIqR0w=; 
 b=gc17d/8Pwm+3lzafiI0De7JYtk+jqqYgf+90LqgclnCeSOllB8gzVsgbb7ElcNxcIAAZ5PNZDbKq3OMrDNsSgnnLMo9QZM/P5TuP6Iku8dMoQ7ZEvS8Fscna6PuPMQU1haz6wQuWC67ZQgexcVuj1xR7F2jp3NlkIcIsGfGb6ZM=;
X-UUID: 252d01f706d0437ab13586a33d3cae0d-20200713
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1829779296; Mon, 13 Jul 2020 19:17:16 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Jul 2020 20:17:14 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 11:17:12 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Jul 2020 11:17:12 +0800
Message-ID: <1594696632.26207.12.camel@mtkswgap22>
Subject: Re: [PATCH v2 1/2] dt-bindings: devapc: add bindings for mtk-devapc
From: Neal Liu <neal.liu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Tue, 14 Jul 2020 11:17:12 +0800
In-Reply-To: <a0a58181-525c-f7a3-4385-d778a113d60c@gmail.com>
References: <1594285927-1840-1-git-send-email-neal.liu@mediatek.com>
 <1594285927-1840-2-git-send-email-neal.liu@mediatek.com>
 <a0a58181-525c-f7a3-4385-d778a113d60c@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D48AE92DC10F63DF7DB13051FB714DFD25AD5A2EB628FAF8B4EBE6654AEED5A52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_231718_637018_4BE7E8CD 
X-CRM114-Status: GOOD (  23.08  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Neal Liu <neal.liu@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-07-10 at 18:41 +0800, Matthias Brugger wrote:
> 
> On 09/07/2020 11:12, Neal Liu wrote:
> > Add bindings for mtk-devapc.
> > 
> > Signed-off-by: Neal Liu <neal.liu@mediatek.com>
> > ---
> >   .../devicetree/bindings/soc/mediatek/devapc.yaml   |   82 ++++++++++++++++++++
> >   1 file changed, 82 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> > new file mode 100644
> > index 0000000..f08243e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> > @@ -0,0 +1,82 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# # Copyright 2020 MediaTek Inc.
> > +%YAML 1.2
> > +---
> > +$id: "https://urldefense.com/v3/__http://devicetree.org/schemas/soc/mediatek/devapc.yaml*__;Iw!!CTRNKA9wMg0ARbw!1TwSriUtXU2ZjXdZkLODgduBZYDtG23ix3jRxqvN3bdfV29MaK0FUZ5OrDu7VDBq$ "
> > +$schema: "https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!1TwSriUtXU2ZjXdZkLODgduBZYDtG23ix3jRxqvN3bdfV29MaK0FUZ5OrNG2oecr$ "
> > +
> > +title: MediaTek Device Access Permission Control driver
> > +
> > +description: |
> > +  MediaTek bus fabric provides TrustZone security support and data
> > +  protection to prevent slaves from being accessed by unexpected masters.
> > +  The security violation is logged and sent to the processor for further
> > +  analysis and countermeasures.
> > +
> > +maintainers:
> > +  - Neal Liu <neal.liu@mediatek.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt6779-devapc
> > +
> > +  reg:
> > +    description: The base address of devapc register bank
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    description: A single interrupt specifier
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description: Contains module clock source and clock names
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    description: Names of the clocks list in clocks property
> > +    maxItems: 1
> > +
> > +  mediatek-slv_type_num:
> > +    description: Numbers of slave type in mediatek platform
> > +    maxItems: 1
> 
> This should go in the DT data, have a look for example at:
> https://urldefense.com/v3/__https://elixir.bootlin.com/linux/latest/source/drivers/soc/mediatek/mtk-pmic-wrap.c*L1842__;Iw!!CTRNKA9wMg0ARbw!1TwSriUtXU2ZjXdZkLODgduBZYDtG23ix3jRxqvN3bdfV29MaK0FUZ5OrGIX64pv$ 
> and
> https://urldefense.com/v3/__https://elixir.bootlin.com/linux/latest/source/drivers/soc/mediatek/mtk-pmic-wrap.c*L1777__;Iw!!CTRNKA9wMg0ARbw!1TwSriUtXU2ZjXdZkLODgduBZYDtG23ix3jRxqvN3bdfV29MaK0FUZ5OrFN70av_$ 
> 

Okay, I'll try to follow this example.

> > +
> > +  mediatek-vio_dbgs:
> > +    description: The mask bit and start bit of devapc violation debug registers
> > +    maxItems: 5
> > +
> 
> same here
> 
> > +  mediatek-pds_offset:
> > +    description: The offset of devapc pds registers
> > +    maxItems: 1
> 
> same here
> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - mediatek-slv_type_num
> > +  - mediatek-vio_dbgs
> > +  - mediatek-pds_offset
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/mt6779-clk.h>
> > +
> > +    devapc: devapc@10207000 {
> > +      compatible = "mediatek,mt6779-devapc";
> > +      reg = <0x10207000 0x1000>;
> > +      interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
> > +      clocks = <&infracfg_ao CLK_INFRA_DEVICE_APC>;
> > +      clock-names = "devapc-infra-clock";
> > +
> > +      mediatek-slv_type_num = /bits/ 8 <1>;
> > +      mediatek-vio_dbgs = <0x0000FFFF 0x0>,
> > +                          <0x003F0000 0x10>,
> > +                          <0x00400000 0x16>,
> > +                          <0x00800000 0x17>,
> > +                          <0x0F000000 0x18>;
> > +      mediatek-pds_offset = <0x0 0x400 0x900 0x904
> > +                             0xF00 0xF10 0xF14 0xF20>;
> > +    };
> > 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!1TwSriUtXU2ZjXdZkLODgduBZYDtG23ix3jRxqvN3bdfV29MaK0FUZ5OrOXSJ2_W$ 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
