Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8A8C2D0EC
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 17:37:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA5F42078E
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 17:37:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nlypWVh5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA5F42078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SeW/KatPuR04aHDmJ141Z5QoyZ55jyuMAqSn8OpV4c=; b=nlypWVh5SYpfXz
	ePiP/OWxkxIgTjrJdOan0xwZih+1PLo6A5hgrdxJiw7iewImnXOeDw1VActFaabknQBGo6D4J9HOn
	2Kay7CARCxYIH1246vKOfXOHZ/1qxzJd+ss3UUWQZDCxkCvGkp53hskTXVPiYvMNAtGa12ablhg9R
	mCZI7PTT/HbVYHCwUEUmgNIiKVL0UQpPVpA92DZm+4U9hj4ZSXQnCfieGQNtniiCbZ9e6kJ8/0HiQ
	LsTA2B0VSbJ2983rpDPIQMPrECuMNKUw0T7/rppsLm5lE4yMVlbQq97A+Oq6TZ5IbHqVS+baRMbDx
	0cqKMwN3UeYKyu2owT2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMxaJ-00062b-V4; Fri, 10 Apr 2020 17:36:55 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMxaG-00061C-Oi; Fri, 10 Apr 2020 17:36:54 +0000
Received: by mail-oi1-f193.google.com with SMTP id k133so1241817oih.12;
 Fri, 10 Apr 2020 10:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QBEtm9wj9+GCsvuO7AqmsQRpKjkshfnjy93bDn3pJjg=;
 b=mrKwzGO4zR4LmE3PcVo4aUvamCnjP1rJHqjjVMyBBZ+WQ9vluI9a2adBdf8IbcM33J
 awQCGIJ2ayP1ubiiYw+syfp0UtyFNfdnrdbCzR6gEY7VyAeuXMwV8NcDTImVFNh6ruGD
 23DM1g1k5KXTO9DWOqT4HgtstyjoCxOrc9DhKXMd5+ibFyRlufQuV827EczC+ak9wIlh
 qXpudfGdixJbT4Ko9khJQe5QGiI3rMsBlVqM14YU8evFzOjKssG5T7dImW5DBzQguexU
 CcWf9oxD6jv2cowaAf+pN+okBWIyDYEtFtddZgI1O3IIQOTz8hXhCZSBdtezkykP0FM3
 O49g==
X-Gm-Message-State: AGi0Pub56CdbrTbL/jprHipwm5uSk9R6NIwgnsBvN4fHL16gfGZLvifB
 t19XgRe9psqpwBXQ9mvoyQ==
X-Google-Smtp-Source: APiQypJvIzXiGQUkFI9BjUhby/lCJa4wLGEtjD/gV8K12mkSAWYPQSvkgPt6INjIArj9sD7aK4V+Kg==
X-Received: by 2002:aca:34c6:: with SMTP id b189mr4027120oia.63.1586540208773; 
 Fri, 10 Apr 2020 10:36:48 -0700 (PDT)
Received: from rob-hp-laptop (ip-99-203-29-27.pools.cgn.spcsdns.net.
 [99.203.29.27])
 by smtp.gmail.com with ESMTPSA id q187sm1541807oih.48.2020.04.10.10.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 10:36:47 -0700 (PDT)
Received: (nullmailer pid 27880 invoked by uid 1000);
 Fri, 10 Apr 2020 17:25:27 -0000
Date: Fri, 10 Apr 2020 12:25:27 -0500
From: Rob Herring <robh@kernel.org>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [V4, 1/2] media: i2c: dw9768: Add DT support and MAINTAINERS entry
Message-ID: <20200410172527.GA24529@bogus>
References: <20200330123634.363-1-dongchun.zhu@mediatek.com>
 <20200330123634.363-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330123634.363-2-dongchun.zhu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_103652_801476_1AB72802 
X-CRM114-Status: GOOD (  16.46  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, drinkcat@chromium.org,
 srv_heupstream@mediatek.com, shengnan.wang@mediatek.com,
 andriy.shevchenko@linux.intel.com, tfiga@chromium.org, louis.kuo@mediatek.com,
 sj.huang@mediatek.com, linux-mediatek@lists.infradead.org,
 sakari.ailus@linux.intel.com, matthias.bgg@gmail.com, bingbu.cao@intel.com,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Mar 30, 2020 at 08:36:33PM +0800, Dongchun Zhu wrote:
> This patch is to add the Devicetreee binding documentation and
> MAINTAINERS entry for dw9768 actuator.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../bindings/media/i2c/dongwoon,dw9768.yaml        | 62 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 +++
>  2 files changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> new file mode 100644
> index 0000000..8a353dc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9768.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dongwoon Anatech DW9768 Voice Coil Motor (VCM) Device Tree Bindings
> +
> +maintainers:
> +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> +
> +description: |-
> +  The Dongwoon DW9768 is a single 10-bit digital-to-analog (DAC) converter
> +  with 100 mA output current sink capability. VCM current is controlled with
> +  a linear mode driver. The DAC is controlled via a 2-wire (I2C-compatible)
> +  serial interface that operates at clock rates up to 1MHz. This chip
> +  integrates Advanced Actuator Control (AAC) technology and is intended for
> +  driving voice coil lenses in camera modules.
> +
> +properties:
> +  compatible:
> +    const: dongwoon,dw9768
> +
> +  reg:
> +    maxItems: 1
> +
> +  vin-supply:
> +    description:
> +      Definition of the regulator used as I2C I/O interface power supply.
> +    maxItems: 1

You can drop this. *-supply is always a single entry.

> +
> +  vdd-supply:
> +    description:
> +      Definition of the regulator used as VCM chip power supply.
> +    maxItems: 1

Same here.

> +
> +required:
> +  - compatible
> +  - reg
> +  - vin-supply
> +  - vdd-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c2: i2c@11009000 {

i2c {

> +        clock-frequency = <400000>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        dw9768: camera-lens@c {
> +            compatible = "dongwoon,dw9768";
> +            reg = <0x0c>;
> +
> +            vin-supply = <&mt6358_vcamio_reg>;
> +            vdd-supply = <&mt6358_vcama2_reg>;
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 38fe2f3..5e124d2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5134,6 +5134,13 @@ S:	Maintained
>  F:	drivers/media/i2c/dw9714.c
>  F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.txt
>  
> +DONGWOON DW9768 LENS VOICE COIL DRIVER
> +M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> +
>  DONGWOON DW9807 LENS VOICE COIL DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:	linux-media@vger.kernel.org
> -- 
> 2.9.2

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
