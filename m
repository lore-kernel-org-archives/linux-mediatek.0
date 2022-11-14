Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F89C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 22:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3hQEMxlrNK+06eeO3xPT9LuLj4yjY7yvIvmM3pxtPo=; b=2YTHU7LDKbxaHddoThjJY88g49
	Sc+/pOAcbiMR/+Zw/F33Oz1kwMn4fQL/yqj87V7BrtNmwH9pHDSWg89wE/6P5brJPfPriZUHgWiWD
	n4Da46WteNYfMHoOW/6RL7/DCH+0EmJf86Wc+jrcfHoWDVmkNnkAJhnLfjNtk+WOsH1/npBgQ3Pfr
	yL6L/izjaKO1Tqs2zEm2OysnASX3d8f0lZWFanV7Jz91yTcD4TEOifCEZd812gbVTOvxstIeSsgVs
	ABYygxGATYpz/dfuX+CKmVZ361YeoJlO4hVRAxqkYNZtCyo4NAC9wu70pHRCMmsMXiRPBkw07h5sp
	xnPHJC1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouiOP-005kSX-4i; Mon, 14 Nov 2022 22:57:29 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouiOB-005kOS-F1; Mon, 14 Nov 2022 22:57:17 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 06BD5240003;
	Mon, 14 Nov 2022 22:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668466631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M3hQEMxlrNK+06eeO3xPT9LuLj4yjY7yvIvmM3pxtPo=;
	b=bj9eV86lzO2PB1EMaUD1jpebxgmKDCSQHfN4vnk2N7CP9Sp0BntWcEb+LscO0TFl27SYbq
	huthOt1QjAWLQOuK0MIdUHuitTti2lkheZnVDX42rOeEYo5Sm8oZ0DuvabkKthMx+xwbcF
	kCAvB1k8/torNFRFnIY9JZHj8HWVEhjl7HceyIKCpMQrFwIMYKAH7oUxmmcYVPDWsFwvO2
	FBjK1SdraumjMSx5Q5n3Qtrx1IUB6h6/TZ/+qh3zrAlZgZIRDPdDN6e+W4Kn/gm8idNiFP
	ia/ECYj9ZldDZoWIuYzpmRzn0N89TSslCE+21uX6IQiQclrzRGWOLvTwmEjnFg==
Date: Mon, 14 Nov 2022 23:57:08 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Fabien Parent <fabien.parent@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Lee Jones <lee@kernel.org>, Chen Zhong <chen.zhong@mediatek.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Pavel Machek <pavel@ucw.cz>, Liam Girdwood <lgirdwood@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>, linux-rtc@vger.kernel.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: Re: [PATCH v4 2/9] dt-bindings: rtc: mediatek: convert MT6397 rtc
 documentation
Message-ID: <Y3LHxDIzfZWhnQJN@mail.local>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
 <20221005-mt6357-support-v4-2-5d2bb58e6087@baylibre.com>
 <20221109222916.GA2985917-robh@kernel.org>
 <Y2wwUOJ0KZdt1tZ6@mail.local>
 <adf8bc44-4cbc-af2a-4ec8-1859a98146d7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adf8bc44-4cbc-af2a-4ec8-1859a98146d7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_145715_804416_164E40BB 
X-CRM114-Status: GOOD (  23.49  )
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

On 10/11/2022 15:14:01+0100, Krzysztof Kozlowski wrote:
> On 09/11/2022 23:57, Alexandre Belloni wrote:
> > On 09/11/2022 16:29:16-0600, Rob Herring wrote:
> >> On Tue, Nov 08, 2022 at 07:43:37PM +0100, Alexandre Mergnat wrote:
> >>> - Convert rtc/rtc-mt6397.txt to rtc/mt6397-rtc.yaml
> >>> - Add mediatek,mt6357-rtc compatible.
> >>> - Add maintainer
> >>> - Remove the .txt binding file
> >>>
> >>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/mfd/mt6397.txt   |  2 +-
> >>>  .../bindings/rtc/mediatek,mt6397-rtc.yaml          | 40 ++++++++++++++++++++++
> >>>  .../devicetree/bindings/rtc/rtc-mt6397.txt         | 31 -----------------
> >>>  3 files changed, 41 insertions(+), 32 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
> >>> index 0088442efca1..79aaf21af8e9 100644
> >>> --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
> >>> +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
> >>> @@ -33,7 +33,7 @@ Optional subnodes:
> >>>  		- compatible: "mediatek,mt6331-rtc"
> >>>  		- compatible: "mediatek,mt6358-rtc"
> >>>  		- compatible: "mediatek,mt6397-rtc"
> >>> -	For details, see ../rtc/rtc-mt6397.txt
> >>> +	For details, see ../rtc/mediatek,mt6397-rtc.yaml
> >>>  - regulators
> >>>  	Required properties:
> >>>  		- compatible: "mediatek,mt6323-regulator"
> >>> diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml b/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml
> >>> new file mode 100644
> >>> index 000000000000..bb48c0150f95
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml
> >>> @@ -0,0 +1,40 @@
> >>> + # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/rtc/mediatek,mt6397-rtc.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: MediaTek MT6397/MT6366/MT6358/MT6357/MT6323 RTC
> >>> +
> >>> +maintainers:
> >>> +  - Alexandre Mergnat <amergnat@baylibre.com>
> >>> +
> >>> +description: |
> >>> +  MediaTek PMIC based RTC is an independent function of MediaTek PMIC that works
> >>> +  as a type of multi-function device (MFD). The RTC can be configured and set up
> >>> +  with PMIC wrapper bus which is a common resource shared with the other
> >>> +  functions found on the same PMIC.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - mediatek,mt6323-rtc
> >>> +      - mediatek,mt6357-rtc
> >>> +      - mediatek,mt6358-rtc
> >>> +      - mediatek,mt6366-rtc
> >>> +      - mediatek,mt6397-rtc
> >>
> >> As this is only a compatible string, just fold this into the MFD schema 
> >> doc.
> > 
> > Actually, it probably also supports the start-year property
> 

I checked and it doesn't support it but this needs to be fixed.

> What about rest of rtc.yaml schema?
> 

wakeup-source would make sense but the driver doesn't support it yet.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

