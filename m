Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0395C43461
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 20:00:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CA9C208E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 20:00:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vleYOJEE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CA9C208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FL83EJtRKrh8f90STTK52BhN3e6J4ZB3xYeiHPw9TWs=; b=vleYOJEEGnW455mLyHZbVI5fT
	8b+vfgwG4FN8fFy8BzeeMVKdAFBa7DFF1HnAzk+TiLSmAtsXBVrq1RMdmDRPcWacueL91THBVhamJ
	GQouLPwrwCu+MAAq4tiT3HmlhROIHgfWuML3qs4HwMD3LxnE2eTd45tUtLyfC/HILTcl932mv3Fue
	YHaKvQgXlLBMXy5CDvsr94WIAQgFZPKIeCiGvCieTRqzb/OGVHah08sj4VsRwvHOGqRKzvUKYIJH8
	GmTmADe5Td2KX8S2LDV/0LFPMae0PtE6JDugsZo9Qtw+Nlth/I5ptLe+gpJ/yx/vvJysDrtQR1mI+
	9EL68kpuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIH7N-0006ys-1Q; Tue, 15 Sep 2020 19:59:57 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIH7F-0006wV-RZ; Tue, 15 Sep 2020 19:59:50 +0000
Received: by mail-il1-f196.google.com with SMTP id t18so4224430ilp.5;
 Tue, 15 Sep 2020 12:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w5YpoxfTyrzce47e7+bq2Lzj+yxd8SjgCIV6N4Js4ic=;
 b=J0sNnn8tQ8iH8crkwigCwqNtJHrSlu81WXP18jS0TAaToVMUKSWmk0uxvLVP9By+e2
 HMnZf5RNdJ/D7CZziEPheJKJa8iIqtZjxvB5J+LHgV7X5Mm2P8dGwca13SkMoKu/iy+L
 y/VoHUq3lN4wGtibd73YhtET6FDoO76Xijg3doaUO8mD+oK+eKAWpUZL9UCqZZt8vDnL
 ex+Ta3ZGikw6rC7wUBJtUIxZ0zuNddpI5edFTWzq0ilV01t7/BxG3BGpUxfOWBjHlvRh
 sYbKQfnvt+aQI6mZ6slpPxwVfb/2Meyo5GsoFrL2VTb/2cWJ/kw89uD1vB51Z7vVvICV
 o2Ig==
X-Gm-Message-State: AOAM530tFW9APGzsStnMQTtP4CScgJ8OcVJ5GyMFAew4Pk7KGB2PESCL
 K+JyM6VdjySGn1S+gy7bsA==
X-Google-Smtp-Source: ABdhPJyysbHV/o3l7AFAopcgw0STvpK5TyfVIMhU4B3slSiPLWgiIgY4LBEjD+PF3te9Q+sWVDfzSA==
X-Received: by 2002:a05:6e02:d07:: with SMTP id
 g7mr12751974ilj.63.1600199989032; 
 Tue, 15 Sep 2020 12:59:49 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id q23sm8155081iob.19.2020.09.15.12.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 12:59:48 -0700 (PDT)
Received: (nullmailer pid 2407937 invoked by uid 1000);
 Tue, 15 Sep 2020 19:59:45 -0000
Date: Tue, 15 Sep 2020 13:59:45 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
Message-ID: <20200915195945.GA2407885@bogus>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910175733.11046-2-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_155949_931659_C83FA203 
X-CRM114-Status: GOOD (  14.27  )
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
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>, Russell King <linux@armlinux.org.uk>,
 Tero Kristo <t-kristo@ti.com>, linux-aspeed@lists.ozlabs.org,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, Guenter Roeck <linux@roeck-us.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-omap@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Andrew Jeffery <andrew@aj.id.au>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 10 Sep 2020 19:57:19 +0200, Krzysztof Kozlowski wrote:
> Convert the NXP PCA953x family of GPIO expanders bindings to device tree
> schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Use additionalProperties.
> 2. Add wakeup-source.
> 3. Add hogs.
> 4. Extend example with hogs.
> ---
>  .../devicetree/bindings/gpio/gpio-pca953x.txt |  90 ----------
>  .../bindings/gpio/gpio-pca95xx.yaml           | 166 ++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.yaml  |   4 -
>  3 files changed, 166 insertions(+), 94 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
