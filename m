Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E91EC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 23:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yd53OIp69atYo/xq3UTNLVEYNs18PHuXNa5tnT/NW9k=; b=AxRohzCUbMfhkkh0pYjt7A9NLN
	y3a5ZAvlfgR69RId3cocP9fXkzjfpBIXgmcJU/VbxdeQYubqA33Q1xOfArVmvACAzMOa10w9upsuN
	ow43p+zMpEGJN2GmTe98jc9Ee8tE70BxOlibvLyFO198upNcQXT5jgIcQ1v3aywF2LiLvhyCAqRT+
	pvrksVYyXOPc9wdlF/juz5b51z/xMDZY2PtdK2I9+SSDZz75Kqn7YDmFSV6/kKQ3caEKQW5vqZMw+
	PfW6mMwL0ZpG1oct0yMA48ayCVKDHNzMxNZ79A/EUePSD+hRfq4g3696ul/cqaTse4aV0G+xesdXx
	7FmMEtEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osuWR-000kZt-Sl; Wed, 09 Nov 2022 23:30:19 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osuWO-000kUJ-U9; Wed, 09 Nov 2022 23:30:18 +0000
Received: by mail-wr1-x42a.google.com with SMTP id bk15so28067016wrb.13;
        Wed, 09 Nov 2022 15:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yd53OIp69atYo/xq3UTNLVEYNs18PHuXNa5tnT/NW9k=;
        b=HjI7n8jwrI1i9d0mghiBrQ8cNkDGiVdP5rlGYlbuCL5hzabhIzTU1GaXCbCIDdmzCJ
         taRsFNF8weRKi3lPSbm9yOyzDEYAkCvrP0TJFkvGGsDZ9P85EoKXVlejtNkMfAgrOher
         IK46/G4gNPm55e/0WPialtNWy/+jt+S16UBlNeYPst1vMbB0J9L7XyU/HqZtAxYGCgQC
         Wa/iRrKfzGaMrH22mZ9+AYnX4aZjADE55HttXdH/m7uZ7zLYM9qldTqu+rJ8KKDsHdB2
         RiNZUD+Byzl5eRjjk51ene6p5Q3a38n2zNkauNZmx9cGVKpIzV/y0Dg4PBbEtBend8s1
         wzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yd53OIp69atYo/xq3UTNLVEYNs18PHuXNa5tnT/NW9k=;
        b=3ZxHmw3k3/V5WJywuR1OTPypdcIXYZkg7YzUQORHF1XpeXXV1BLxHCKpfg/O3KL8zt
         i++rHXIurfBY0hbrqMT4/wDSoNXAq7Hp/1IQgmoDtM7jh3WYwexzJmrO8fiHQvsU6E12
         KHM0okkK1MMAZ8C6Orrm5OntdOclalKOFin6i3uh9tmBp5yZ+33ET+6N+iRCy520tuZz
         GvSaASoR/MpfJ3bCFFhgEFesCeSfeBQPDnApgWI03hIkqr2PZkwOIY7K3bHftuSjo731
         v9X1pobF0lWcCDQJY62oi3SxVdhe0o9WSHPGto6Y4W3TWR5Ti6aDhfp46HZqN5G3GMtl
         LVew==
X-Gm-Message-State: ACrzQf2i5RGG4MbOt651/9SRZoU7pUkD1vkRJemDQNQA7hP5UoTt1UbT
	0io3DIh9xI4seTWoUdsx41Q=
X-Google-Smtp-Source: AMsMyM7IHFxlRJdSaiea1qynaJTdSS1ofJAQcfFdlfMvly3FeETbIZYli4VVuBjOfWQXY3W6Av+NqA==
X-Received: by 2002:a05:6000:118d:b0:236:f075:dccd with SMTP id g13-20020a056000118d00b00236f075dccdmr27367367wrx.37.1668036611828;
        Wed, 09 Nov 2022 15:30:11 -0800 (PST)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id m23-20020a05600c3b1700b003cf47556f21sm3351289wms.2.2022.11.09.15.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 15:30:11 -0800 (PST)
Date: Thu, 10 Nov 2022 01:30:08 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	=?utf-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 net-next 4/6] dt-bindings: net: add generic
 ethernet-switch
Message-ID: <20221109233008.bsu2zl4bixsz44mi@skbuf>
References: <20221104045204.746124-1-colin.foster@in-advantage.com>
 <20221104045204.746124-1-colin.foster@in-advantage.com>
 <20221104045204.746124-5-colin.foster@in-advantage.com>
 <20221104045204.746124-5-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104045204.746124-5-colin.foster@in-advantage.com>
 <20221104045204.746124-5-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_153017_028632_318F7783 
X-CRM114-Status: GOOD (  16.59  )
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

On Thu, Nov 03, 2022 at 09:52:02PM -0700, Colin Foster wrote:
> diff --git a/Documentation/devicetree/bindings/net/ethernet-switch.yaml b/Documentation/devicetree/bindings/net/ethernet-switch.yaml
> new file mode 100644
> index 000000000000..fbaac536673d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ethernet-switch.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/ethernet-switch.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ethernet Switch Device Tree Bindings

I vaguely remember Krzysztof saying during other reviews that "Device
Tree Bindings" in the title is superfluous. Suggest: "Generic Ethernet
Switch".

> +
> +maintainers:
> +  - Andrew Lunn <andrew@lunn.ch>
> +  - Florian Fainelli <f.fainelli@gmail.com>
> +  - Vivien Didelot <vivien.didelot@gmail.com>
> +
> +description:
> +  This binding represents Ethernet Switches which have a dedicated CPU
> +  port. That port is usually connected to an Ethernet Controller of the
> +  SoC. Such setups are typical for embedded devices.

This description was taken from the DSA switch schema and not adapted
for the generic Ethernet switch schema.

Suggest instead:

  Ethernet switches are multi-port Ethernet controllers. Each port has
  its own number and is represented as its own Ethernet controller.
  The minimum required functionality is to pass packets to software.
  They may or may not be able to forward packets autonomously between
  ports.

(this should also clarify if it's okay to reference ethernet-switch.yaml
from drivers which don't speak switchdev, which I believe it is).

(my suggestion is open to further comments for improvement)

> +
> +select: false
> +
> +properties:
> +  $nodename:
> +    pattern: "^(ethernet-)?switch(@.*)?$"
> +
> +patternProperties:
> +  "^(ethernet-)?ports$":
> +    type: object
> +    properties:
> +      '#address-cells':
> +        const: 1
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      "^(ethernet-)?port@[0-9]+$":
> +        type: object
> +        description: Ethernet switch ports
> +
> +        $ref: /schemas/net/dsa/dsa-port.yaml#

I wonder if you actually meant dsa-port.yaml and not ethernet-controller.yaml?

> +
> +oneOf:
> +  - required:
> +      - ports
> +  - required:
> +      - ethernet-ports
> +
> +additionalProperties: true
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3106a9f0567a..3b6c3989c419 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14326,6 +14326,7 @@ M:	Florian Fainelli <f.fainelli@gmail.com>
>  M:	Vladimir Oltean <olteanv@gmail.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/net/dsa/
> +F:	Documentation/devicetree/bindings/net/ethernet-switch.yaml
>  F:	drivers/net/dsa/
>  F:	include/linux/dsa/
>  F:	include/linux/platform_data/dsa.h
> -- 
> 2.25.1
> 


