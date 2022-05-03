Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6A2C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 12:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=li/lhvwZY3//A6p0aOOzB7MX5fBalaPmzE0aKJ+oFZQ=; b=OQ2hbswSOvjbP2
	M/Bqe42DsGkjKX+sb5uAz3AvNYGBOtZ7zd/TT2M47hK3ZcmvT4UMK4nx2hqzXjNroORFHCJt9pAr+
	jGNtLY3XWcXkQFHWM0T7z7GQaTyjUwfhd1xjwXzo/tZXAuTPzmZoTHJY5K7l+5Kp+IAFy2QH+2CUM
	jQzAlUNZN3nrcNJJhjOW5kseTjMEyqw1R+9tXAh7gW+QsSHOo7xvGGRMnjdhA9InFuXVLELX8DyYI
	eOs/1Mo0e1/YmRxnw/VZqhKDvxXlueb0CNZTl/lQ7iDU6nTQKZJSDEa+yrmEWvpM/JLtdQo/zUAAa
	rrJP4sIs5rAXwajxTcYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlrsq-005sFo-H5; Tue, 03 May 2022 12:44:04 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlrsF-005rw4-UG; Tue, 03 May 2022 12:43:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 92C501F4354B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651581805;
 bh=n9/BmWbN3g+/wyuxwqu1fAbXZTK/mlyH9NhVx5Z5DvM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BTKgQTkN2YsUXw1djbp3qfuwQbLGIZpI+tVUm0u4oeOlUbPviD9bCK4g9yo3fCd6e
 prWG0Famn7AwU6UHSLvRl7n/j6PzO57l2AFvD1wjxXDNgv2GJ61yOpDtLRScyc5hU6
 aA2O9o+24k09YaYa6wWbowIngNtIi1IXYhDPwEVc7sCagym9Ylh9zktGadH3zC08HY
 2sQDR+/SQQrNuvsRFsNckV8jqDIY3J2atQNUPXkERoyOzZ3AoHB756vNOPSWcDCndQ
 oNt8r6cG2nSP8Wv4gbGvedE/cpLOzTQMR/Fc7ksjUAho4DDebVJ71LitCPil+05ElK
 rS44evNa7Vyhw==
Message-ID: <94dbb7ee-764a-5568-a044-80dbfe77c29a@collabora.com>
Date: Tue, 3 May 2022 14:43:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: power: Add MediaTek Helio X10 MT6795
 power domains
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, mbrugger@suse.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, nfraprado@collabora.com
References: <20220503105436.54901-1-angelogioacchino.delregno@collabora.com>
 <20220503105436.54901-2-angelogioacchino.delregno@collabora.com>
 <ac774c74-4577-3dfc-7bf4-3c180d45b420@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ac774c74-4577-3dfc-7bf4-3c180d45b420@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_054328_174221_72E99A8C 
X-CRM114-Status: GOOD (  14.36  )
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

Il 03/05/22 14:38, Krzysztof Kozlowski ha scritto:
> On 03/05/2022 12:54, AngeloGioacchino Del Regno wrote:
>> Add power domains dt-bindings for MediaTek Helio X10 (MT6795).
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../power/mediatek,power-controller.yaml         |  2 ++
>>   include/dt-bindings/power/mt6795-power.h         | 16 ++++++++++++++++
>>   2 files changed, 18 insertions(+)
>>   create mode 100644 include/dt-bindings/power/mt6795-power.h
>>
>> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>> index 135c6f722091..b448101fac43 100644
>> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>> @@ -23,6 +23,7 @@ properties:
>>   
>>     compatible:
>>       enum:
>> +      - mediatek,mt6795-power-controller
>>         - mediatek,mt8167-power-controller
>>         - mediatek,mt8173-power-controller
>>         - mediatek,mt8183-power-controller
>> @@ -62,6 +63,7 @@ patternProperties:
>>         reg:
>>           description: |
>>             Power domain index. Valid values are defined in:
>> +              "include/dt-bindings/power/mt6795-power.h" - for MT8167 type power domain.
>>                 "include/dt-bindings/power/mt8167-power.h" - for MT8167 type power domain.
>>                 "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
>>                 "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
>> diff --git a/include/dt-bindings/power/mt6795-power.h b/include/dt-bindings/power/mt6795-power.h
>> new file mode 100644
>> index 000000000000..0e27bc7fa748
>> --- /dev/null
>> +++ b/include/dt-bindings/power/mt6795-power.h
>> @@ -0,0 +1,16 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
> 
> If it is not a derivative work, should be GPL-2.0 OR BSD
> 

On that, I agree with you, fully.

Though, all of the mt(xxxx)-power.h headers provide this license tag and I
wanted to follow that to give the same.

Should I change it to (GPL-2.0-only OR BSD-2-Clause)?

Regards,
Angelo

> 
> Best regards,
> Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
