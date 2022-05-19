Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A401FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 13:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GOZlpzKu+tXuDrc/VivFRK/k3RifGf/SoVw1U8MKPHo=; b=RUJxpwj7rGhTtx
	ShzqM/MBhr1bp2re4Q4FpoxjXHWu+FBxZm0f7WvqcZXOj5TvcEa1Lxnd8J3OE7x77tVfLLXyt/lro
	MePio+jniVA5tCug706c0uFwScZhiuUF/YPgA3yyGr9yKqlcTinV8n3p4+agy/oYmWOfsawrafWCF
	LGO4OT8C6/TsGXNsH+TYua5mncJQMFQlPWLAIw/+Sxf6m4MtMIOITvqTt+FJIkWptd/t+mML0ssLO
	a8HySHdLGqAy/imLIvldmYdx1vGQMT+EEF3KdKRDpGvWV7vBs0nE3paYjz+hOCpe5IhnIbL0pFh8O
	oOprd9PhmwxzHNQVR/fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrfzc-006x0h-5F; Thu, 19 May 2022 13:15:04 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrfqe-006t0n-Lz; Thu, 19 May 2022 13:05:51 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 z5-20020a9d62c5000000b00606041d11f1so3511137otk.2; 
 Thu, 19 May 2022 06:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=2+i74u3ZZM7l9wk2/F/HfAuqugTEXe5t2ly2GSSgeoI=;
 b=WNhYQnJ1q8QmAyZ1RkUSuH/gE531Wz+6olcVVLhVhVZC0LyYhW9zNJANOMX5kPKCY2
 m6c/ESIk9zjLFjQpfzsCMTu7qYfLiz7+EGTSkhb+kSbuHg3dAQqdT2+X0m6tzWoXEdh7
 +IERppHdi9PqB60E952KnF8eFLgI8jzgbK9743ks6q3hfSjKJ93LIf51UCmKt57oCX4y
 IgZDq9kelpwSaqKciLJ+7ytCYik8xIFJUHBtwWP3n0JkBF4+xW8N0Jn1HYYiXuT8JitX
 XpMvXD2oOzQvqPhc6IMj7vo/FmlNgdvv7nLBQVRtZL9QNkw5pHLn9Q+Xi+IvJ4kLZONa
 gwAA==
X-Gm-Message-State: AOAM533Timv0V7ISzR6DFHSvfPU8btNFdXVwPJ8GqjIgqTcj0cZyXvfq
 tmXJAbBIUAOLkLQPmanNJg==
X-Google-Smtp-Source: ABdhPJx13WQbNFLUXx9Sun7/J3THykl4WUX5vRXL+kUcH2nWi53SzXAepLltS56IsVr6PIfDgx+HWw==
X-Received: by 2002:a9d:ed2:0:b0:60a:de4f:bd93 with SMTP id
 76-20020a9d0ed2000000b0060ade4fbd93mr1534030otj.40.1652965545587; 
 Thu, 19 May 2022 06:05:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n6-20020a0568301e8600b0060603221280sm1722383otr.80.2022.05.19.06.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 06:05:44 -0700 (PDT)
Received: (nullmailer pid 1359565 invoked by uid 1000);
 Thu, 19 May 2022 13:05:39 -0000
From: Rob Herring <robh@kernel.org>
To: Axe Yang <axe.yang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Jeffery <andrew@aj.id.au>, Matthias Brugger <matthias.bgg@gmail.com>,
 Satya Tangirala <satyat@google.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Eric Biggers <ebiggers@google.com>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <swboyd@chromium.org>, Lucas Stach <dev@lynxeye.de>,
 Chaotian Jing <chaotian.jing@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-mmc@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Tian Tao <tiantao6@hisilicon.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Adrian Hunter <adrian.hunter@intel.com>, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, angelogioacchino.delregno@collabora.com,
 Yue Hu <huyue2@yulong.com>, Kiwoong Kim <kwmad.kim@samsung.com>
In-Reply-To: <20220519111323.14586-2-axe.yang@mediatek.com>
References: <20220519111323.14586-1-axe.yang@mediatek.com>
 <20220519111323.14586-2-axe.yang@mediatek.com>
Subject: Re: [PATCH v10 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
Date: Thu, 19 May 2022 08:05:39 -0500
Message-Id: <1652965539.952223.1359564.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_060548_778120_EE486EC1 
X-CRM114-Status: GOOD (  13.74  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 19 May 2022 19:13:21 +0800, Axe Yang wrote:
> Extend interrupts and pinctrls for SDIO wakeup interrupt feature.
> This feature allow SDIO devices alarm asynchronous interrupt to host
> even when host stop providing clock to SDIO card. An extra wakeup
> interrupt and pinctrl states for SDIO DAT1 pin state switching are
> required in this scenario.
> 
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> ---
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 53 ++++++++++++++++++-
>  1 file changed, 52 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/mmc/mtk-sd.example.dts:50.36-37 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:364: Documentation/devicetree/bindings/mmc/mtk-sd.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1401: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
