Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8932CC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 09:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2oaUtQPn78qmWXg+3xWGGenuvSbmMueaJG1DpN/6k60=; b=SmI7G0WqyWr+b10qONs2m4vCds
	dXRcuqox1hBJZR8BsWnahs7p2ts3fdqx/4vzxwvhZ3AXG66wp7gT1EsBUYa/lPpiehF8ZiHRwTa7/
	SdlZBNz5shcuXBI7hP0eE6agJsm+fGZCDTDOHWb4LE1Es2mr2nPLF1YLmdCJ+TPymVn+wOx2fa28I
	kgYxVAsmubbL47DF8tExw6L/3WtUFtpQf+MzVYLMQZCSowec44DUeuzb8xI2XaCpmdCrOmcHgmsru
	IXLfo90t3G6f0urOqJhMUke5CtMQJOYXV2e+xv1hyIS0kTefiPwkrP9FUggkvtOKLJdHEEThRKxl3
	7DU2qSqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxODT-00000001eLn-0uA6;
	Thu, 18 Apr 2024 09:38:03 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxODP-00000001eHx-2m72;
	Thu, 18 Apr 2024 09:38:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713433071;
	bh=xTTRylhxTMNxuBPyF0ZhqgtTHDOevThfPc3RUW/tG/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qzhdWhRSZDUQAR3tcksUDkxqnZpVvM6wSVUDbGme+YCwaZ6VCN6zVZCwj4V82tqTF
	 SGtlShSYstZUYS6Hm7D+qpZT8L0IOFgbR7EYbqi75tbyHpg/VwjmUO8LdkT5WI1lEy
	 Cguc92jAtUWBprkFt7MpVm3RLHbc5elQ3cn5TV6G9FADJw4mV/E9CeeAxuIYikY17V
	 eT7ya0NbDgfsm2JDBvqqfQbUFf/c+KnVitUuAAGJyVIohYZli06fFcALDWyT4Iv9Xd
	 7Zve4oKydMyuemER0dwuub0KPc873KsZjt+SfIh8h5kp95S2G8in9vhLbZO6cY5Pbm
	 hJN6qqUkgC5jA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8A90737813E3;
	Thu, 18 Apr 2024 09:37:49 +0000 (UTC)
Message-ID: <8e572021-f872-48c7-bebb-e33e7ed7acf1@collabora.com>
Date: Thu, 18 Apr 2024 11:37:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] dt-bindings: soc: mediatek: Add DVFSRC bindings
 for MT8183 and MT8195
To: Rob Herring <robh@kernel.org>
Cc: henryc.chen@mediatek.com, krzysztof.kozlowski+dt@linaro.org,
 wenst@chromium.org, gustavoars@kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 conor+dt@kernel.org, kernel@collabora.com, amergnat@baylibre.com,
 linux-pm@vger.kernel.org, keescook@chromium.org,
 linux-arm-kernel@lists.infradead.org, lgirdwood@gmail.com,
 djakov@kernel.org, broonie@kernel.org, linux-kernel@vger.kernel.org
References: <20240418082812.152270-1-angelogioacchino.delregno@collabora.com>
 <20240418082812.152270-4-angelogioacchino.delregno@collabora.com>
 <171343301130.424721.10758711321868587171.robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <171343301130.424721.10758711321868587171.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_023759_889453_7552D899 
X-CRM114-Status: GOOD (  17.37  )
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

Il 18/04/24 11:36, Rob Herring ha scritto:
> 
> On Thu, 18 Apr 2024 10:28:08 +0200, AngeloGioacchino Del Regno wrote:
>> Add bindings for the MediaTek Dynamic Voltage and Frequency Scaling
>> Resource Collector (DVFSRC), a hardware module used to collect all the
>> requests from both software and the various remote processors embedded
>> into the SoC and decide about a minimum operating voltage and a minimum
>> DRAM frequency to fulfill those requests in an effort to provide the
>> best achievable performance per watt.
>>
>> This hardware IP is capable of transparently performing direct register
>> R/W on all of the DVFSRC-controlled regulators and SoC bandwidth knobs.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../soc/mediatek/mediatek,mt8183-dvfsrc.yaml  | 94 +++++++++++++++++++
>>   1 file changed, 94 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.example.dtb: system-controller@10012000: regulators@0: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt8183-dvfsrc.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.example.dtb: system-controller@10012000: interconnect@1: Unevaluated properties are not allowed ('reg' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt8183-dvfsrc.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.example.dtb: regulators@0: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6873-dvfsrc-regulator.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.example.dtb: interconnect@1: Unevaluated properties are not allowed ('reg' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/interconnect/mediatek,mt8183-emi.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240418082812.152270-4-angelogioacchino.delregno@collabora.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Whoops. Forgot to update this one. Sending v4.


