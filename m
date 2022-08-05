Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EDFC00140
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 08:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lr+oT6PZ0Ca2mp6AkFJtWg/xZs5YXRayzMGb/OpD+9o=; b=hG9rHNt6IBHfQhfnzLSQZAr090
	K+ikDVG7EiJIr7CU68Ivv2mDeKG1+ruDiVw7YiR0958qIwLCXViHSm5ev+7JenrMw4WBMwHIcnECj
	dw5RY8K1eqmAHoV24EbeScagHF0I4o6g6sH5ddD0bxP36cuxRPRtkfASNTK1TcMJNVsqEGkdxRYrL
	AXFVWdmrSRbhNWGNjbqE1ql3FiaR4oSuvcLQBDinlpdv7NXAkrroQF3kop50rTJkwxoDX5aWKlnxs
	tPCNuXuigGxcmW79rZZOOJeZWK46sjXcpUKMzqLsHFQUocuJalxHiZ/TjmDUBwsLZJM6u4p9Db4eA
	DmQcM0Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJt1C-00DIHz-PR; Fri, 05 Aug 2022 08:49:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJt11-00DID7-DD; Fri, 05 Aug 2022 08:49:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 80EBAB8249A;
	Fri,  5 Aug 2022 08:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319E1C433D6;
	Fri,  5 Aug 2022 08:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659689341;
	bh=QV2T3OgNhSLSxJ+SL9EEf8c34jK/JO3wBghCapg8t5o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sSvMNYmA33n1k21Ws5eZ1oDJSeOQbqX3HY+kdNH54GuCS1+owWIUZtcQg77HhzjcE
	 aSSM8ABQZv/Mu5ho3x0aIbreKRc6BdHdNM4I20clcG+4FIXzu9hEdBKJsUeOvAeeY6
	 kXI8YgHw8QOV/parqBed4LxkJHrJOxsUDnmOtFIv14JUTzTVX3rPxgHks2NEY2+spq
	 ItmTemqm0LePFMIumon8bOBUOfSfwSF+4rUAIj5aSoBpMV9VT9YMB3N9bMcgmRKv45
	 5tgoyzB5yqIK1UjtSknhhVlFHbHRLzK4yjv6Q4PTYU2FZXymMoUSX190gR/NA/CBj9
	 DP7sqeQwkffAg==
Message-ID: <d681bcab-da6e-4cd9-f3f1-438e9a7481cd@kernel.org>
Date: Fri, 5 Aug 2022 10:48:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v8.1, 2/7] dt-bindings: thermal: Add binding document for
 LVTS thermal controllers
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 bchihi@baylibre.com
Cc: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org,
 amitk@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com,
 abailon@baylibre.com
References: <20220804130912.676043-1-bchihi@baylibre.com>
 <20220804130912.676043-3-bchihi@baylibre.com>
 <20220804231119.x6l2nl362rqvlk6u@notapiano>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220804231119.x6l2nl362rqvlk6u@notapiano>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_014907_636372_82C9DA3E 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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

On 05/08/2022 01:11, Nícolas F. R. A. Prado wrote:
>> diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
>> new file mode 100644
>> index 000000000000..53c44a73f3a4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> [..]
>> +  nvmem-cells:
> 
>        minItems: 1
> 
> since mt8192 only has one of them.

Then add allOf:if:then: which will constrain it per variant/compatible.

Best regards,
Krzysztof

