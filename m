Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4D5C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 12:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ilirZXqmOJLU4jSS41YU1AYw565EEHepngHLadyybkQ=; b=FGkU9hVwCRZwtS
	mb3SY4NjLETy0uxxffH2hbae5OypySedahv/x3SKrCYF7JEIO4vUfnUl9JsIs+xOZonvn7fnzjR3V
	GZp/8NzXWwls7hdyguIHt2NNYpl9RTeRqg2iqvtgv2NJSm96Aw9oVYbp9B9I1XwXzY4rBs7q9Ev7N
	aEkfpgwDnJrV7qmTw8hw15o4lLEF/5IvbPqzPNgghCovEi0PL60F9ZDH1VMSoBLl5D+cM2VdeTky8
	Onj2KjVwbc4mAiTIx2m712qRwZOAhBq2WyVLCQ5vRksUwrRQjmGxu/wrHLKqm+H2vRGtsoUNGddT8
	bqsr0Rum3ldsmrv030pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlri7-005nn7-Nc; Tue, 03 May 2022 12:32:59 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlrhw-005niU-JN; Tue, 03 May 2022 12:32:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 451221F42C92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651581166;
 bh=qxbwIud/z0dkgi/rqpCFxK4Db8RLK0j+LCYn27SBNtA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DE56hFw4/S2R6lSczDYKbM/I2R4smmMDXxQaukD7P9b0dzmlXOfvp1JgQMUu8IYJB
 D4nUan73wyKjV6sD6Wz15zOrCrfJ5Uk8yxJRPQJLXqXYgFR8g9mR8zW7jazlvQoXI/
 tiNSxB96wtyzwh0smXgCyuU67mJ8iTsIun1yEc+9UECcZO106YtWzZoUoICl3ZTQm6
 xSdobzynER0B41xDE4UuPPEsCWvSr1LKx7WCwu75muaNWliR5P5AcZWS9AnKZ/qqbV
 +1YyyR3BFyLvIkIPSDSEWUvkDYhWIqwT4+byLxnFD6noQ3E/qedtKEJg1qpEdz/oSV
 +RoNpDORyJ3fw==
Message-ID: <07889dc4-4198-086b-4df6-e02b65daff10@collabora.com>
Date: Tue, 3 May 2022 14:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: Add MediaTek MT6795 pinctrl
 bindings
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, sean.wang@kernel.org, matthias.bgg@gmail.com,
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, nfraprado@collabora.com,
 kernel@collabora.com
References: <20220503105317.54696-1-angelogioacchino.delregno@collabora.com>
 <20220503105317.54696-3-angelogioacchino.delregno@collabora.com>
 <1651579140.664800.3296827.nullmailer@robh.at.kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1651579140.664800.3296827.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_053248_832072_A75B1692 
X-CRM114-Status: GOOD (  10.96  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 03/05/22 13:59, Rob Herring ha scritto:
> On Tue, 03 May 2022 12:53:17 +0200, AngeloGioacchino Del Regno wrote:
>> Add devicetree and pinfunc bindings for MediaTek Helio X10 MT6795.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../pinctrl/mediatek,pinctrl-mt6795.yaml      | 224 +++++
>>   include/dt-bindings/pinctrl/mt6795-pinfunc.h  | 908 ++++++++++++++++++
>>   2 files changed, 1132 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
>>   create mode 100644 include/dt-bindings/pinctrl/mt6795-pinfunc.h
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml:100:14: [error] syntax error: expected <block end>, but found '<block mapping start>' (syntax)
> 

Oops. I'm sorry for that, apparently I've sent the wrong version of this series.
Luckily, only the yaml file had issues in that version.

I'll send a v2 soon. Sorry for the noise.

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
