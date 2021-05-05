Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3D5C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 11:24:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BD3361175
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 11:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BD3361175
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GT4OXomwE/sNR6uYLLMBJwuR8Ylm1i92tV8dYQxqsGQ=; b=ZXKO3jajGnMqwxjh8gbaLP5+4
	5kG7tBzMDiZ1yzu0hl3acFfDtdCosdLgVzqlmM8VOHZgEe9vNoAtQ9+WMyKirw/BY197DCR0iY/Do
	KZIDsrnnKN8JAcNMJJkQMNPGudfy94Glk0Z4ZLBWOgy0x5dr5AUy/wI4zt3XcCCJp16mmhxpeVY7u
	bXTnM3nsqzE/88XP6AFXKkXygZMPOQhfKCfdbi1cFqvWw1dMHWlGQwIw7ThqIQ+v5oK0hrWrDhNsM
	mrLm8pt5ZBB4Xf3TiacluTaxveHWap0NT5Y7CL1LHcUJaN3Sk7uOWARUJK2kJmo9G6R9A2SZ3xK3d
	JDsVN5BPA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leFdR-0014xx-Cg; Wed, 05 May 2021 11:24:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leFd5-0014w3-DU; Wed, 05 May 2021 11:23:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=ZZSRvaP/49Ep7TPtTRRXVzuw75YzKkuiLQ1Eftb+0ek=; b=tZKDXmh3UagcPQGtDNgjpTAgTV
 h+F9yj5WqbKpPI5fpgvAiLZ0jrVTaOBbLZkK2W8Zd6/3dJrYl+v8tCDBLbFWeWRAaCgdo2JcjIycl
 NMBryqtqaLHJq5nJtODsmIMMfkZGwwOEkUA8PoXHJYZfGwSHOxCYlljyT2sW2hzFJhzqKrCOnC0zT
 crBrKjZ2Vo9VLT3OZcDHFOvEYjz4+iZOYbcBoY7xna6jhR16FnQqwmhOmiPiYF4ioVsbbF8IDT9+N
 Sz34N83ZbN4Ascvrg6F7+OI3Pnevsazpu51jIAAzTHeOxSwnFyQe+xCtPHu8eiTqYsOh6i2ieWbGh
 5BxmPicA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leFd1-004hYU-K6; Wed, 05 May 2021 11:23:45 +0000
X-UUID: 09275f8daf6c47bbb5deb7188a608c02-20210505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ZZSRvaP/49Ep7TPtTRRXVzuw75YzKkuiLQ1Eftb+0ek=; 
 b=jbJyDhGWd9m3+7KCmLHHAHfhLwow5FwSKD9sFsJxvKVkZOu5uNv7n2rO/9aUigq/+Z7syai9iPTcscsahYsQBfHzGv4V1FPRGDgw3VzY2ozjP/9eDxXOdeL1ovOxasNOu+UyUWiVBu9W3BdUcwLCsJPCbZRZpc0yzTNv67nxmiw=;
X-UUID: 09275f8daf6c47bbb5deb7188a608c02-20210505
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1047414680; Wed, 05 May 2021 04:23:38 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 04:23:30 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 19:23:29 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 5 May 2021 19:23:29 +0800
Message-ID: <5b25f903ea4d6e81662e6565f309f578d75f212e.camel@mediatek.com>
Subject: Re: [RESEND PATCH v7 01/22] dt-bindings: ARM: Mediatek: Add new
 document bindings of imp i2c wrapper controller
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>, <devicetree@vger.kernel.org>
Date: Wed, 5 May 2021 19:23:29 +0800
In-Reply-To: <161974692707.177949.4882672793905809142@swboyd.mtv.corp.google.com>
References: <20210324104110.13383-1-chun-jie.chen@mediatek.com>
 <20210324104110.13383-2-chun-jie.chen@mediatek.com>
 <161974692707.177949.4882672793905809142@swboyd.mtv.corp.google.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_042343_687466_79AD7A26 
X-CRM114-Status: GOOD (  18.48  )
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

the mail list in patchwork seems to no update even I add more reviewer
by replying mail,
so I will send v8 for adding device tree reviewer, sorry for the
inconvenience.

On Thu, 2021-04-29 at 18:42 -0700, Stephen Boyd wrote:
> Please Cc devicetree@vger.kernel.org and use robh+dt@kernel.org for
> DT
> bindings. This was waiting for DT review but because the right lists
> weren't Cced it fell off the queue.
> 
> Quoting chun-jie.chen (2021-03-24 03:40:49)
> > This patch adds the new binding documentation of imp i2c wrapper
> > controller
> > for Mediatek MT8192.
> > 
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
> > ---
> >  .../arm/mediatek/mediatek,imp_iic_wrap.yaml   | 80
> > +++++++++++++++++++
> >  1 file changed, 80 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wra
> > p.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_w
> > rap.yaml
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_w
> > rap.yaml
> > new file mode 100644
> > index 000000000000..fb6cb9e60ee2
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_w
> > rap.yaml
> > @@ -0,0 +1,80 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/arm/mediatek/mediatek,imp_iic_wrap.yaml*__;Iw!!CTRNKA9wMg0ARbw!zBjsgUmEFn39CiAYbdvjgfS-ucvRLXrZkdtlMOnVKeNDFyjwC3IIoNkKYdm_kZGjQbbv$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!zBjsgUmEFn39CiAYbdvjgfS-ucvRLXrZkdtlMOnVKeNDFyjwC3IIoNkKYdm_kTIaPcIk$
> >  
> > +
> > +title: MediaTek IMP I2C Wrapper Controller
> > +
> > +maintainers:
> > +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > +
> > +description:
> > +  The Mediatek imp i2c wrapper controller provides functional
> > configurations and clocks to the system.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - mediatek,mt8192-imp_iic_wrap_c
> > +          - mediatek,mt8192-imp_iic_wrap_e
> > +          - mediatek,mt8192-imp_iic_wrap_s
> > +          - mediatek,mt8192-imp_iic_wrap_ws
> > +          - mediatek,mt8192-imp_iic_wrap_w
> > +          - mediatek,mt8192-imp_iic_wrap_n
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
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    imp_iic_wrap_c: syscon@11007000 {
> > +        compatible = "mediatek,mt8192-imp_iic_wrap_c", "syscon";
> > +        reg = <0x11007000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    imp_iic_wrap_e: syscon@11cb1000 {
> > +        compatible = "mediatek,mt8192-imp_iic_wrap_e", "syscon";
> > +        reg = <0x11cb1000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    imp_iic_wrap_s: syscon@11d03000 {
> > +        compatible = "mediatek,mt8192-imp_iic_wrap_s", "syscon";
> > +        reg = <0x11d03000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    imp_iic_wrap_ws: syscon@11d23000 {
> > +        compatible = "mediatek,mt8192-imp_iic_wrap_ws", "syscon";
> > +        reg = <0x11d23000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    imp_iic_wrap_w: syscon@11e01000 {
> > +        compatible = "mediatek,mt8192-imp_iic_wrap_w", "syscon";
> > +        reg = <0x11e01000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    imp_iic_wrap_n: syscon@11f02000 {
> > +        compatible = "mediatek,mt8192-imp_iic_wrap_n", "syscon";
> > +        reg = <0x11f02000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > -- 
> > 2.18.0
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
