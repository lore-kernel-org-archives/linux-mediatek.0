Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E562DC6379F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 09:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TD1HByFG+9ivuthhxtqxMWNZz4S5bBCQEHhEDbx05/0=; b=4hrjSVhOmSTU3pU2EyprFPVOol
	W7jTrc+c9lSjTAk6IXOK/P4unxQez2Fc3BYp3y5U4Yv0GP3LykUhoC8zFHwFxMaoVBCV4+B251gx1
	3fWQqU1fyXIc7o4K4sACeAu2y18W/rTYHQs39suW7a6YkGtAOM+iz5lpmbdoC/5AUSH81UjB35j6I
	YOvdmt2L3phY81NSbG9g6fgjdPnywW/ikbEaQBANZ0T1PUuNBtTWPVJitln4UGlt7UyjG55rAfoN1
	EsVQmLQXnN352w0wPoltkALhhjEKKYBf6kT7d30hJ6iZXBpcNjlGZqFDOssMf96ZuUx3XjFoKItl5
	uqbh6ZKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlCO-00BMWh-2v; Wed, 22 Feb 2023 09:14:04 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlCB-00BMQw-TN; Wed, 22 Feb 2023 09:13:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9623A66021CF;
	Wed, 22 Feb 2023 09:13:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677057228;
	bh=EQcPbGfJMfRIei4Am5Ga2lgUV4SqL9FM6hrNSYWP81M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ci/5xPZofV2WGWkOXFeQ2oVFhVnJmStDnJ+1lB2glB7h3NKKb0bfohtHXtJKXc2yX
	 JWVnuiF69Z+OHcCJRhnNa2ACiMYCzBSOy8zvnn6pooaRWfMSZnpSOazVeZdqClc+0G
	 y25SprcuQ75Uh659VUCmWtbl16GzOd1vQwSZ126q0a97ymt/Bno/rmABd5HTPjHFej
	 tiNgim+asQkJ4eXmwVfXy9ow8OgyZX/OAWJw2eQd1I8sHZf5MJcjSXa4wxJT8r7mqb
	 PXbcpQlG+VbDWbC6B4pSwrVwbVGuk1hsDT0ukfvwzMBfUkrryQJxDBqZx/qx7uR7HC
	 Bzqd0ggFXVjHg==
Message-ID: <88a3fa09-60cb-bb3c-c392-286efd983627@collabora.com>
Date: Wed, 22 Feb 2023 10:13:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 06/10] dt-bindings: gpu: mali-bifrost: Add a compatible
 for MediaTek MT8186
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
 <20230221153740.1620529-7-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Ed-5Nq0zNzCGzez3fnW2yxW7zFx9B6k58Y4yb8P+hvpw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5Ed-5Nq0zNzCGzez3fnW2yxW7zFx9B6k58Y4yb8P+hvpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_011352_108681_12158F60 
X-CRM114-Status: GOOD (  18.22  )
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

Il 22/02/23 09:37, Chen-Yu Tsai ha scritto:
> On Tue, Feb 21, 2023 at 11:37 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Get GPU support on MT8186 by adding its compatible.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>> index be18b161959b..43a841d4e94d 100644
>> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>> @@ -15,6 +15,11 @@ properties:
>>
>>     compatible:
>>       oneOf:
>> +      - items:
>> +          - enum:
>> +              - mediatek,mt8186-mali
>> +          - const: mediatek,mt8183b-mali
>> +          - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> 
> The MT8186 has Mali-G52 MC2 2EE, while the MT8183 has Mali-G72 MP3.

Keeping in mind the obvious - which is that G52 and G72 are both Bifrost....

> So we actually need a new entry with two power domains.
> 

...This is my node for MT8186:

		gpu: gpu@13040000 {
			compatible = "mediatek,mt8186-mali",
				     "mediatek,mt8183b-mali",
				     "arm,mali-bifrost";
			reg = <0 0x13040000 0 0x4000>;

			clocks = <&mfgsys CLK_MFG_BG3D>;
			interrupts = <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH 0>,
				     <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH 0>,
				     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH 0>;
			interrupt-names = "job", "mmu", "gpu";
			power-domains = <&spm MT8186_POWER_DOMAIN_MFG1>,
					<&spm MT8186_POWER_DOMAIN_MFG2>,
					<&spm MT8186_POWER_DOMAIN_MFG3>;
			power-domain-names = "core0", "core1", "core2";

			/* Please ignore speedbin, that's for another time :-) */
			nvmem-cells = <&gpu_volt_bin>;
			nvmem-cell-names = "speed-bin";
			#cooling-cells = <2>;
		};

There are three MFG power domains... MFG2 and MFG3 are parents of MFG1, on that
I agree, but we can avoid adding a new entry just for MT8186 and use the MT8183-b
one while still being technically correct.

Besides, Mali G52 and Mali G72 are both Bifrost... so I don't think that this
commit is incorrect. For the sake of simplicity, I would push on getting this
one picked.

Unless there are any real-strong opinions against...

Regards,
Angelo

> Our downstream Mali driver & DT use just that.
> 
> ChenYu



