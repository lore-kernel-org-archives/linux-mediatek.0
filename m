Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAB7C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 13:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hgr4JtlrSaSbm3ZvB9FYszigGrQ4DQ/Sm84VptBeyJo=; b=1WX2XLZ0oxveC6
	iJ4YNvV9zGZtso2Vh6ZB021YL71cdf0cCXqS4QCDbWYBSsGvdaaBGN/DQBTf5H3j72Nq+3+evJncq
	pQEB4I2j8Qlj95O+T4oiQOPLnMmOxQZFbN9ekHMPwT+UGdMI0vhfP5R3ZZiK9PepvFqVAeO3lxpXQ
	xsyEbskdjZNXbKsUgI/3ty/Y0vUUMRUDcmKNaL93kGise5x2jndTmH+VdOrb0b0dFAQWs5auc8X+w
	0KJ6tmaVAwikdOOoZ4+wKKO6dJxSJJAZ0urM1kbOTqU4m4ajQ46eoNePV3UK9NxyrwGs+G02VDgwH
	AbcOAPU40Hn7QZGlHamg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVD5u-001n74-FA; Fri, 18 Mar 2022 13:56:42 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVD5g-001n1y-TO; Fri, 18 Mar 2022 13:56:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1F1091F46053
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647611787;
 bh=WW2IaA9n9cAPDlRSBj0mOwH/eH4P6GAUHKgCpdJwtmk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cpq6UFB+YPJAAY2YBpwTmpzQvUCgl7GvqK1HuV1xf3r6N3v0ler0buDb+ai0A/jHg
 9Pv0tuip/gPib6cd74DG0i+AEYQlH0+7fZdItTRDaq/R53taqgnCWWf7X79s+PY+61
 Q6v6agGDq8DxEmY2bgHkLk3NOdmsSEqfMlmDCBHCbpoFVdKa3/e/FwBe1SFPWMdemY
 RAod8cX7rzlUeBXa8cAXMFY/11pDV3hND3U+x23NGF2g2mteaPDhoa/BGn+qf7JEWL
 ZTNtaqYeeOgaveAUNgAT3gdOWiADOgW50bNzrFPVJHuudZPlKsz8FADZ13rGlle6Xr
 mCl1Of2Malo7Q==
Message-ID: <e0adbb4d-aa87-49ea-d79f-11c5f4fc4bdd@collabora.com>
Date: Fri, 18 Mar 2022 14:56:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: mediatek: Add YAML schema for
 PCIe PHY
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, rex-bc.chen@mediatek.com,
 randy.wu@mediatek.com, jieyy.yang@mediatek.com, chuanjia.liu@mediatek.com,
 qizhong.cheng@mediatek.com, jian.yang@mediatek.com
References: <20220318095417.2016-1-jianjun.wang@mediatek.com>
 <20220318095417.2016-2-jianjun.wang@mediatek.com>
 <2e0989c3-7132-6091-5c9e-5dc8d9af22e8@collabora.com>
 <319cf016-55fb-dcd4-9157-ad795c8e68ff@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <319cf016-55fb-dcd4-9157-ad795c8e68ff@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_065629_158810_ECED1309 
X-CRM114-Status: GOOD (  16.88  )
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

Il 18/03/22 14:51, Krzysztof Kozlowski ha scritto:
> On 18/03/2022 12:12, AngeloGioacchino Del Regno wrote:
>> Il 18/03/22 10:54, Jianjun Wang ha scritto:
>>> Add YAML schema documentation for PCIe PHY on MediaTek chipsets.
>>>
>>> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
>>> ---
>>>    .../bindings/phy/mediatek,pcie-phy.yaml       | 75 +++++++++++++++++++
>>>    1 file changed, 75 insertions(+)
>>>    create mode 100644 Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
>>> new file mode 100644
>>> index 000000000000..868bf976568b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
>>> @@ -0,0 +1,75 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/phy/mediatek,pcie-phy.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek PCIe PHY
>>> +
>>> +maintainers:
>>> +  - Jianjun Wang <jianjun.wang@mediatek.com>
>>> +
>>> +description: |
>>> +  The PCIe PHY supports physical layer functionality for PCIe Gen3 port.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: mediatek,mt8195-pcie-phy
>>
>> Since I don't expect this driver to be only for MT8195, but to be extended to
>> support some more future MediaTek SoCs and, depending on the number of differences
>> in the possible future Gen4 PHYs, even different gen's, I propose to add a generic
>> compatible as const.
>>
>> So you'll have something like:
>>
>> - enum:
>>       - mediatek,mt8195-pcie-phy
>> - const: mediatek,pcie-gen3-phy
> 
> I am not sure if this is a good idea. How sure are you that there will
> be no different PCIe Gen3 PHY not compatible with this one?
> 
> 

Thanks for pointing that out, I have underestimated this option.

Perhaps Jianjun may be more informed about whether my proposal is valid or not.

Cheers,
Angelo

> Best regards,
> Krzysztof



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
