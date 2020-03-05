Return-Path: <SRS0=EkB4=4W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A2EC3F2D1
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2020 21:20:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC73B208CD
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2020 21:20:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JNhz4OKf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FvsPrdXR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC73B208CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HjUCp9XQ/H4NtA582q3rmDTbFiSkjUcsZyKebkfPq/4=; b=JNhz4OKfp4Uk8n
	x60rWhakX65ehcpBIuxlLFo8ZgUVitPacHMXjNhppvRDgBrgkAecSOpVSJ58hheP0gu636wueESzQ
	8QHUDMQBTPFwWOdr1hJ1QVHYfOVXlx1EMgUpaGAkMwbjksgTYD9lRR/viK3lpZxLhhYxdFkR3vJD2
	JSFUrWFfccdC676t7O0yREq5UOD4Bmb4Bi9HUUd/AOrpaeoIb3lfrep3p5uFwcv13zz7fYRlSbYUQ
	5k6bH01lRWvJbj4rYRW7s+2byfl89uLQgG8ul1OFocdHKycQroRKV7S1CEtqCjI54x0Ng2W/Adspe
	xOw28NUk8xQxXaF5456w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9xud-0002sJ-Iv; Thu, 05 Mar 2020 21:20:11 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9xuZ-0002Kb-Av
 for linux-mediatek@lists.infradead.org; Thu, 05 Mar 2020 21:20:09 +0000
Received: by mail-pf1-x444.google.com with SMTP id y26so3359569pfn.11
 for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2020 13:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=loNKzfZ2WYLORcMWCHnowkSlwOV4uJb56BC4cjXOiZU=;
 b=FvsPrdXRRh3QO/+s411g5ODMr7nz7JNzHdZUNqmf3I0YSid7pOy9SG8unIaxB7I8qK
 0b1WIMrjkovcf2oUrO1UOt4ur/E6lhmkDoUhoGLeuB76SYdb8URghyBAbaZcvdZvGCfd
 9mr95A9Hcj0CUdd2H9PuSaS7ktdpityBgJ8rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=loNKzfZ2WYLORcMWCHnowkSlwOV4uJb56BC4cjXOiZU=;
 b=W/eWt8YT/Crc54jyqxsSm9H7Eqm1WxAW2s73W9PRSzsrGNq/pYnimRvfMCv/LFGAtW
 zYveRjJn3en12TXRAgwSEM3hkmNHG+X79LLZgPRcRgjmRmvtIn3ixTVKCNXGsYUmQQJH
 buqGFPXcoSi+OW8cO8INiiDOVpXG41dU4X5U4XfQ3W4aLPnDNTCgoLvGZgUEdWOoFZIk
 /zkrCJ3aP0thIgGghMXcVpttBter+NjOytpPL/p3J0fM4dcG3mxc1gw1UqMg+/R2nWDR
 tkQD97vaVaC2lzwMZtGFFyg7Rtfh7O4lgyVDXXORflz2A90B9kMGesT6nYnx3mt3O6jK
 eFsA==
X-Gm-Message-State: ANhLgQ20CNCtIAUIk+HQBpyffrXvnU7UVtOISAd6SB1J54+Vm2MeQHrs
 iKlxXAgFVo/07TwRucZdw0/lDQ==
X-Google-Smtp-Source: ADFU+vvOwKIZrmY5TmSyaDSc10dmgGfZMXiDaur2s6Rjr8CpcpphDf6IrHTFxblTEIC0/8jRjSIHOA==
X-Received: by 2002:aa7:8ad9:: with SMTP id b25mr342124pfd.70.1583443206190;
 Thu, 05 Mar 2020 13:20:06 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id q187sm32819052pfq.185.2020.03.05.13.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 13:20:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20200305030135.210675-1-pmalani@chromium.org>
References: <20200305030135.210675-1-pmalani@chromium.org>
Subject: Re: [PATCH v2] dt-bindings: Convert usb-connector to YAML format.
From: Stephen Boyd <swboyd@chromium.org>
To: Prashant Malani <pmalani@chromium.org>, devicetree@vger.kernel.org
Date: Thu, 05 Mar 2020 13:20:04 -0800
Message-ID: <158344320452.25912.4758137777863945655@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_132007_414538_B7495016 
X-CRM114-Status: GOOD (  21.37  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, heikki.krogerus@linux.intel.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Prashant Malani <pmalani@chromium.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, enric.balletbo@collabora.com,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, bleung@chromium.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Prashant Malani (2020-03-04 19:01:30)
> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> new file mode 100644
> index 0000000000000..b386e2880405c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> @@ -0,0 +1,203 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/connector/usb-connector.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: USB Connector
> +
> +maintainers:
> +  - linux-usb@vger.kernel.org
> +
> +description:
> +  A USB connector node represents a physical USB connector. It should be a child
> +  of a USB interface controller.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - usb-a-connector
> +      - usb-b-connector
> +      - usb-c-connector
> +
> +  label:
> +    description: Symbolic name for the connector.
> +
> +  type:
> +    description: Size of the connector, should be specified in case of USB-A,
> +      USB-B non-fullsize connectors.

Maybe "should be specified in case of non-fullsize 'usb-a-connector' or
'usb-b-connector' compatible connectors"?

> +    $ref: /schemas/types.yaml#definitions/string
> +    enum:
> +      - mini
> +      - micro
> +
> +  self-powered:
> +    description: Set this property if the USB device has its own power source.
> +    type: boolean
> +
> +  # The following are optional properties for "usb-b-connector".
> +  id-gpios:
> +    description: An input gpio for USB ID pin.
> +    maxItems: 1
> +
> +  vbus-gpios:
> +    description: An input gpio for USB VBus pin, used to detect presence of
> +      VBUS 5V. See gpio/gpio.txt.

Can this be written as bindings/gpio/gpio.txt?

> +    maxItems: 1
> +
> +  vbus-supply:
> +    description: A phandle to the regulator for USB VBUS if needed when host
> +      mode or dual role mode is supported.
> +      Particularly, if use an output GPIO to control a VBUS regulator, should
> +      model it as a regulator. See regulator/fixed-regulator.yaml

And bindings/regulator/fixed-regulator.yaml? The idea is to
disambiguate from kernel Documentation/ directory.

> +
> +  # The following are optional properties for "usb-c-connector".

Is there a way to constrain the binding so that this can't be put in a
connector that doesn't have the usb-c-connector compatible string?

> +  power-role:
> +    description: Determines the power role that the Type C connector will
> +      support. "dual" refers to Dual Role Port (DRP).
> +    allOf:
> +      - $ref: /schemas/types.yaml#definitions/string
> +    enum:
> +      - source
> +      - sink
> +      - dual
> +
> +  try-power-role:
> +    description: Preferred power role.
> +    allOf:
> +      - $ref: /schemas/types.yaml#definitions/string
> +    enum:
> +     - source
> +     - sink
> +     - dual
> +
> +  data-role:
> +    description: Data role if Type C connector supports USB data. "dual" refers
> +      Dual Role Device (DRD).
> +    allOf:
> +      - $ref: /schemas/types.yaml#definitions/string
> +    enum:
> +      - host
> +      - device
> +      - dual

Is there a way to maintain a description for each possible string
property? Then we could move the last sentence in the description above
to be attached to '- dual' here.

> +
> +  # The following are optional properties for "usb-c-connector" with power
> +  # delivery support.
> +  source-pdos:
> +    description: An array of u32 with each entry providing supported power
> +      source data object(PDO), the detailed bit definitions of PDO can be found
> +      in "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.2
> +      Source_Capabilities Message, the order of each entry(PDO) should follow
> +      the PD spec chapter 6.4.1. Required for power source and power dual role.
> +      User can specify the source PDO array via PDO_FIXED/BATT/VAR/PPS_APDO()
> +      defined in dt-bindings/usb/pd.h.
> +    minItems: 1
> +    maxItems: 7
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +  sink-pdos:
> +    description: An array of u32 with each entry providing supported power sink
> +      data object(PDO), the detailed bit definitions of PDO can be found in
> +      "Universal Serial Bus Power Delivery Specification" chapter 6.4.1.3
> +      Sink Capabilities Message, the order of each entry(PDO) should follow the
> +      PD spec chapter 6.4.1. Required for power sink and power dual role. User
> +      can specify the sink PDO array via PDO_FIXED/BATT/VAR/PPS_APDO() defined
> +      in dt-bindings/usb/pd.h.
> +    minItems: 1
> +    maxItems: 7
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +  op-sink-microwatt:
> +    description: Sink required operating power in microwatt, if source can't
> +      offer the power, Capability Mismatch is set. Required for power sink and
> +      power dual role.
> +
> +  ports:
> +    description: OF graph bindings (specified in bindings/graph.txt) that model
> +      any data bus to the connector unless the bus is between parent node and
> +      the connector. Since a single connector can have multiple data buses every
> +      bus has assigned OF graph port number as described below.

has an assigned?

> +    type: object
> +    properties:
> +      port@0:
> +        type: object
> +        description: High Speed (HS), present in all connectors.
> +
> +      port@1:
> +        type: object
> +        description: Super Speed (SS), present in SS capable connectors.
> +
> +      port@2:
> +        type: object
> +        description: Sideband Use (SBU), present in USB-C.

Likewise, is it possible to constrain this to only usb-c-connector
compatible string based bindings? And if so, does it become required for
that compatible string?

> +
> +    required:
> +      - port@0
> +
> +required:
> +  - compatible
> +
> +examples:
> +  # Micro-USB connector with HS lines routed via controller (MUIC).
> +  - |+
> +    muic-max77843@66 {

Add a reg = <0x66>; here? Or drop the unit address above.

> +      usb_con1: connector {
> +        compatible = "usb-b-connector";
> +        label = "micro-USB";
> +        type = "micro";
> +      };
> +    };
> +
> +  # USB-C connector attached to CC controller (s2mm005), HS lines routed
> +  # to companion PMIC (max77865), SS lines to USB3 PHY and SBU to DisplayPort.
> +  # DisplayPort video lines are routed to the connector via SS mux in USB3 PHY.
> +  - |+
> +    ccic: s2mm005@33 {

Same unit address comment.

> +      usb_con2: connector {
> +        compatible = "usb-c-connector";
> +        label = "USB-C";
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +            usb_con_hs: endpoint {
> +              remote-endpoint = <&max77865_usbc_hs>;
> +            };
> +          };
> +          port@1 {
> +            reg = <1>;
> +            usb_con_ss: endpoint {
> +            remote-endpoint = <&usbdrd_phy_ss>;
> +            };
> +          };
> +          port@2 {
> +            reg = <2>;
> +            usb_con_sbu: endpoint {
> +            remote-endpoint = <&dp_aux>;
> +            };

Tabs should be replaced with spaces.

> +          };
> +        };
> +      };
> +    };
> +
> +  # USB-C connector attached to a typec port controller(ptn5110), which has
> +  # power delivery support and enables drp.
> +  - |+
> +    #include <dt-bindings/usb/pd.h>
> +    typec: ptn5110@50 {

Same unit address comment.

> +      usb_con3: connector {
> +        compatible = "usb-c-connector";
> +        label = "USB-C";
> +        power-role = "dual";
> +        try-power-role = "sink";
> +        source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
> +        sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)
> +                     PDO_VAR(5000, 12000, 2000)>;
> +        op-sink-microwatt = <10000000>;
> +      };
> +    };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
