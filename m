Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08FD2C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 09:54:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 769CB2075A
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 09:54:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zQ2Zm7fF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yvbVhQNO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 769CB2075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6EcNlCSLnlRQ0ufJl6lsCNZInQ+lGpyA1MdnK8FnDD4=; b=zQ2Zm7fFYTepL6zlJSqkFS93M
	MHUGDGjQM1D3cQgpaHdkqHfdeX6Djl7HRqlId/jgS1VG/LhlDnyJacfWMzcr0mFfVCxZgg6t7MiFB
	fUzTSpRpLBJcBliZNPSsTeOS91f28hT+IQwSYv4CbsdtndR2NbFAb3ib9DAQnqWAwDoW8tflV7MUR
	Mf8Uh16JsQBHQcm/A/j07e8Df2UODxNSaIbyE1PJuW+vewy1D9+Q71/fsV319KUYinQDnakH/+Iyq
	8RCmBJWECu/qb8CPrnauSOw2ZcykhiOlL+x9tjIZtIuGHn/WX2ZzmgzldJXTBU8V/kpJflIYbV1At
	UOMed4B8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGfl3-0007ns-1K; Fri, 11 Sep 2020 09:54:17 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGfkx-0007lD-1e; Fri, 11 Sep 2020 09:54:12 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08B9rq9H118702;
 Fri, 11 Sep 2020 04:53:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1599818032;
 bh=dxP/WY/4dZH72YPcSv12tcPV/XFUasdrBjjt461p+Vw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=yvbVhQNO427I3UMxxoaBckIDnOBYAZtnuKrvKA7Ps8tHAgg9811RsZRoZzEjIuxOa
 Yyxaml8IUgo1SjEXiZlaAi+FmWvQ1rslc9UkPlebDIdcaPyIfRXFTL+Uq+RnmCWgRU
 Ombas83IuTru1XXR6Zyhs879UIo5EJaKahah5VME=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08B9rqGn086091
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Sep 2020 04:53:52 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 11
 Sep 2020 04:53:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 11 Sep 2020 04:53:52 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08B9riYZ038437;
 Fri, 11 Sep 2020 04:53:44 -0500
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
To: Krzysztof Kozlowski <krzk@kernel.org>, Joel Stanley <joel@jms.id.au>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
 <CACPK8XdocAX5mOXf3VP29cNXH+6unYunB9NiT3qFVKyzR6WXPg@mail.gmail.com>
 <CAJKOXPe6Tf0B5W27XaD5zLk77OBzGCHpirhTdZjFH0oh8GvWgg@mail.gmail.com>
From: Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <c162b6ad-57f1-a75a-11e3-9c80c60bd845@ti.com>
Date: Fri, 11 Sep 2020 12:53:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJKOXPe6Tf0B5W27XaD5zLk77OBzGCHpirhTdZjFH0oh8GvWgg@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_055411_214116_B40BCA94 
X-CRM114-Status: GOOD (  26.97  )
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
 Michal Simek <michal.simek@xilinx.com>, linux-renesas-soc@vger.kernel.org,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, Guenter Roeck <linux@roeck-us.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 11/09/2020 09:52, Krzysztof Kozlowski wrote:
> On Fri, 11 Sep 2020 at 08:24, Joel Stanley <joel@jms.id.au> wrote:
>>
>> On Thu, 10 Sep 2020 at 17:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>
>>> Convert the NXP PCA953x family of GPIO expanders bindings to device tree
>>> schema.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>>
>>> +patternProperties:
>>> +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
>>> +    type: object
>>> +    properties:
>>> +      gpio-hog: true
>>> +      gpios: true
>>> +      input: true
>>> +      output-high: true
>>> +      output-low: true
>>> +      line-name: true
>>> +
>>> +    required:
>>> +      - gpio-hog
>>> +      - gpios
>>> +
>>
>>> +            usb3-sata-sel-hog {
>>> +                gpio-hog;
>>> +                gpios = <4 GPIO_ACTIVE_HIGH>;
>>> +                output-low;
>>> +                line-name = "usb3_sata_sel";
>>
>> I would prefer we didn't require the addition of hte -hog prefix. It's
>> mostly just a matter of taste, but I can think of a few more concrete
>> reasons:
>>
>> We don't require -high or -low prefixes, so the node name doesn't need
>> to describe the properties that will be found below.
> 
> Thanks for the comments.
> 
> It is not about properties (high or low) but the role of a device
> node. The node names should represent a generic class of device (ePAPR
> and device tree spec) and "hog" is such class.
> 
> The Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml already
> uses such naming so the best would be to unify.

In my opinion, It's not right to define this on per gpio-controller and introduce such
per gpio-controller restrictions.

More over, there is already generic schema for gpio hogs: gpio-hog.yaml
Originally, gpio bindings were defined without restricting gpio hog node names and,
generic schema follows this.

I think, the generic "gpio-hogs" sub-node may be introduced to place gpio hogs child nodes,
if gpio hogs node names restriction need to be introduces (*which i'm not sure is reasonable*).

gpio@20 {
	gpio-hogs {
		yyy-hog {
                         gpio-hog;
                         gpios
		}
	}

But this require as gpio code as generic gpio schema update (with backward compatibility in mind).


> 
>>
>> Changing around node names for existing boards carries with it the
>> chance of userspace breakage (as sysfs paths change). I would prefer
>> we avoid that if possible.
> 
> The impact on userspace is indeed important, but are you sure that
> hogs are visible to user-space via sysfs and configurable? I guess you
> think of deprecated CONFIG_GPIO_SYSFS?
> 
> Rob,
> Any hints from you about hog-naming?
> 
> Best regards,
> Krzysztof
> 

-- 
Best regards,
grygorii

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
