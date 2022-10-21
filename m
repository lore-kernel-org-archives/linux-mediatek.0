Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEA0C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 08:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4XUbYqU28Jj+A2qMtWuHkcEkIeQBZJdTT5EIxDxXpE=; b=PschjrN7qWwRUy9UpSDAvBzqzV
	agKKvETYTex+dbhCv9RNVgmNaCWbwMie5CL22BEgmDFbVmSp4p3xq7CfDHB1+FPpZ0/J5RX9g19I9
	NVO9VNExSD+YU8bics5r40Dab6MklhYUzggg0FWZ7xfrZy/w46T2HDiriqDVUGJB6d8EJAnE2jvIA
	m8k6/0EfE5iUVLunXNrtot7G1KEp5cs7tzuezuYUtbNtwHJmssSXHHXABJUaCnl/jn7s5x9HsGLEr
	PxlX6biulZcXupS07k+Fq3BakBiI4r17Zz0E8il3secdQBbgHgJ9XuM0+6Ac1X5GJkCf+IueqTzAY
	NkTTfLlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oln7L-006EQz-Kw; Fri, 21 Oct 2022 08:10:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oln77-006EEW-R2; Fri, 21 Oct 2022 08:10:47 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 571A5660252D;
	Fri, 21 Oct 2022 09:10:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666339842;
	bh=DiUVKkAeTzt0hWy3SdEYnMX5hoYMr8kBkjbSbi5NeMk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HW24aQ/wmWqGWEVweMxpZMkA1vOidAYC+UJVnKvuf5wfABHR4d7Zl5y4nxRkRYN6n
	 wDQk20Bs3A7lAF1Z1atsJXKr8WK1mgBxKKRTWjZxyh+Ul69TOgmfmbKjv8Tz1/hQEq
	 TRsVxNXuOKJXawwhYx62y9a+VV4k2U70y0UA0g/IfSLOMbHF7A3fz1Ia2JSm6wW/ZN
	 3B3tbAGfWhLPRyQ0EWqUYHMpXJ9BqLR2kyL1+hYz+NiQ2u6TPWq8GK7vZbGdsH0nGe
	 iZAOkk2BRusDsZUrgSx/xZQbNdF/47M6TUMLlUkfwrBdBlZdBSdUQl9bPDAbQ8LHWV
	 VWvA/XEZ8NATg==
Message-ID: <50be72b3-cf72-132d-269a-efe89ae0cb17@collabora.com>
Date: Fri, 21 Oct 2022 10:10:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 2/2] dt-bindings: iio: adc: mediatek,mt2701-auxadc: new
 32k clock
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <f98ed7f3fc15a0614443a57427d46ce17ec2e0cc.1666190235.git.daniel@makrotopia.org>
 <dbe88fd2f7ea5b2f419dce6ecb48c20e96e2e634.1666190235.git.daniel@makrotopia.org>
 <b33b9d2a-f6d5-b2a7-bcb8-1ed2303c04b4@collabora.com>
 <Y1Gh3TQOznz3dmSJ@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <Y1Gh3TQOznz3dmSJ@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_011046_098390_A8C29529 
X-CRM114-Status: GOOD (  23.67  )
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

Il 20/10/22 21:30, Daniel Golle ha scritto:
> On Thu, Oct 20, 2022 at 10:28:02AM +0200, AngeloGioacchino Del Regno wrote:
>> Il 19/10/22 16:38, Daniel Golle ha scritto:
>>> Newer MediaTek SoCs need an additional clock to be brought up for
>>> AUXADC to work. Add this new optional clock to
>>> mediatek,mt2701-auxadc.yaml.
>>>
>>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>>> ---
>>>    .../bindings/iio/adc/mediatek,mt2701-auxadc.yaml          | 8 ++++++--
>>>    1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
>>> index 7f79a06e76f596..c2a1813dd54152 100644
>>> --- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
>>> +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
>>> @@ -44,10 +44,14 @@ properties:
>>>        maxItems: 1
>>>      clocks:
>>> -    maxItems: 1
>>> +    maxItems: 2
>>> +    minItems: 1
>>>      clock-names:
>>> -    const: main
>>> +    items:
>>> +      - const: main
>>> +      - const: 32k
>>
>> You're adding this for MT7986, and I don't see any 32KHz ADC clock on that SoC.
>> I suppose that your '32k' clock is CLK_INFRA_ADC_FRC_CK, currently parented to
>> 'csw_f26m_sel', so that's 26MHz, not 32KHz.
>>
>> Since you'll need the same changes for thermal as well, I would consider setting
>> "infra_adc_frc" as a parent of "infra_adc_26m", like so:
>>
>> 	GATE_INFRA1(CLK_INFRA_ADC_26M_CK, "infra_adc_26m", "infra_adc_frc", 20),
>> 	GATE_INFRA1(CLK_INFRA_ADC_FRC_CK, "infra_adc_frc", "csw_f26m_sel", 21),
>>
>> ...just because there's apparently no reason to have one of them enabled but not
>> the other or, at least, it looks like we *always* need ADC_26M_CK enabled when
>> ADC_FRC_CK is enabled.
>>
> 
> Yes, this change is for MT7986 and MT7981, immitating the behavior
> found in MediaTek's SDK sources. Embedding the dependency into the
> clock driver as you have suggested should also be possible as it is
> true that you always need them both and a similar change for the
> thermal driver would be needed as well.
> 
> Unless you were planning to do so already I will send a patch with your
> suggested change to drivers/clk/mediatek/clk-mt7986-infracfg.c.
> In any case, this series can be dropped then.
> 
> Thank you for the review!
> 
> 

You're welcome. Nice job sending the clock commit.

For the maintainers:
This series can be abandoned, as that clock dependency was fixed elsewhere.

Regards,
Angelo



