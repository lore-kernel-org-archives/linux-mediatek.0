Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40AC5C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 07:27:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC00C22571
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 07:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC00C22571
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8fXDhHHgwM+iVJ64vLl0fSoag7NdSSOJs1soTL3Hxqk=; b=OSZU6n4m4Qv6FpYTiIxNql9XZ
	A1iTXD7fmUqDhAya3s+Mko7g0fvH3e3vlIkIyJSecmPLg1pX17oM+Gq0njbdZXUaIlt2frc24Y5Pa
	toi2AcCdUbCHLPr88e4JjFww1Qb1r96bQpsAZn1mYslGhYTCXbYl2FV0h3WfHJ0hI92S8egbdcPQf
	LwrCemwR22bhMpYGbDMd/N9qgYEQkKH+d6JnM9kIlVnbvyom2IfS4ETjuderUAPqrLUAYUciRe1ZV
	eFSSJHfcmr2T29CL4qVcHFcb2hRlH6A+sQCEM/MGtjn3jUyqFzWpKHNtRTed4NHwDNf44/raZs1Y0
	jKtfw8Fpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksL1R-0006fo-3V; Thu, 24 Dec 2020 07:26:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksL1M-0006el-D4; Thu, 24 Dec 2020 07:26:49 +0000
X-UUID: 7c996a651c1849d8bc26a76597193968-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sTA9GxzeiTWZ8Bb1AzVPoBBRf2w9jvzoOgYWkMxjLWk=; 
 b=V2m93C+mJ/lNd3Kma1Ao953qg0XQpgYHzo7sEzco8QIUdo4XBSjRucU+4Q6UKU1T2CXaedQlkUs7LjMxZun8AMXOhfnHclupAxOKzuEeegkiYz+9YfmCnib3bR2fWKdOlQCHft5o2499PfbTT/WdYuCjZv8C0WiC3NEK8r2gzdI=;
X-UUID: 7c996a651c1849d8bc26a76597193968-20201223
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 739575264; Wed, 23 Dec 2020 23:26:46 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 23:26:43 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 24 Dec 2020 15:26:39 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Dec 2020 15:26:38 +0800
Message-ID: <1608794799.7499.2.camel@mhfsdcap03>
Subject: Re: [PATCH v4 01/11] dt-bindings: usb: convert usb-device.txt to
 YAML schema
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Thu, 24 Dec 2020 15:26:39 +0800
In-Reply-To: <20201221190937.GA369845@robh.at.kernel.org>
References: <20201216093012.24406-1-chunfeng.yun@mediatek.com>
 <20201221190937.GA369845@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 74766EA34054B7FEA51C94AAD0ECCBCC07057C7F26AB70431A5FC6B4C07CE5A72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_022648_666854_D7CEC69E 
X-CRM114-Status: GOOD (  27.65  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 netdev@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-12-21 at 12:09 -0700, Rob Herring wrote:
> On Wed, Dec 16, 2020 at 05:30:02PM +0800, Chunfeng Yun wrote:
> > Convert usb-device.txt to YAML schema usb-device.yaml
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v4: no changes, update dependent series:
> >     https://patchwork.kernel.org/project/linux-usb/list/?series=399561
> >     [v6,00/19] dt-bindings: usb: Add generic USB HCD, xHCI, DWC USB3 DT schema
[...]
> > diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > new file mode 100644
> > index 000000000000..f31d8a85d3e6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > @@ -0,0 +1,125 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/usb-device.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: The device tree bindings for the Generic USB Device
> > +
> > +maintainers:
> > +  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > +
> > +description: |
> > +  Usually, we only use device tree for hard wired USB device.
> > +  The reference binding doc is from:
> > +  http://www.devicetree.org/open-firmware/bindings/usb/usb-1_0.ps
> > +
> > +  Four types of device-tree nodes are defined: "host-controller nodes"
> > +  representing USB host controllers, "device nodes" representing USB devices,
> > +  "interface nodes" representing USB interfaces and "combined nodes"
> > +  representing simple USB devices.
> > +
> > +  A combined node shall be used instead of a device node and an interface node
> > +  for devices of class 0 or 9 (hub) with a single configuration and a single
> > +  interface.
> > +
> > +  A "hub node" is a combined node or an interface node that represents a USB
> > +  hub.
> > +
> > +properties:
> > +  compatible:
> > +    pattern: "^usb[0-9a-f]+,[0-9a-f]+$"
> 
> You can refine the length allowed a bit: [0-9a-f]{1,4}
> 
> Same applies elsewhere.
Ok
> 
> > +    description: Device nodes or combined nodes.
> > +      "usbVID,PID", where VID is the vendor id and PID the product id.
> > +      The textual representation of VID and PID shall be in lower case
> > +      hexadecimal with leading zeroes suppressed. The other compatible
> > +      strings from the above standard binding could also be used,
> > +      but a device adhering to this binding may leave out all except
> > +      for "usbVID,PID".
> > +
[...]
> > diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > index 9881ac10380d..5d0c6b5500d6 100755
> > --- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > +++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > @@ -23,6 +23,32 @@ properties:
> >        targeted hosts (non-PC hosts).
> >      type: boolean
> >  
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  "@[0-9a-f]+$":
> > +    type: object
> > +    description: The hard wired USB devices
> > +
> > +    properties:
> > +      compatible:
> > +        pattern: "^usb[0-9a-f]+,[0-9a-f]+$"
> > +        $ref: /usb/usb-device.yaml
> 
> This is wrong. It should be up a level.
Ok
>  And no need to define 
> 'compatible' or 'reg' here because those are defined within 
> usb-device.yaml.
will drop it
> 
> > +        description: the string is 'usbVID,PID', where VID is the vendor id
> > +          and PID is the product id
> > +
> > +      reg:
> > +        $ref: /usb/usb-device.yaml
> > +        maxItems: 1
> > +
> > +    required:
> > +      - compatible
> > +      - reg
> > +
> >  additionalProperties: true
> >  
> >  examples:
> > @@ -30,4 +56,11 @@ examples:
> >      usb {
> >          phys = <&usb2_phy1>, <&usb3_phy1>;
> >          phy-names = "usb";
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        hub@1 {
> > +            compatible = "usb5e3,610";
> > +            reg = <1>;
> > +        };
> >      };
> > -- 
> > 2.18.0
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
