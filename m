Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC7CC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 15:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msuKplR8LiDHbv1Vto9qDswxW6X70u+GDqXQ2HUeDGA=; b=VwfStt37eKwq6W/SV8eVvMyAPT
	BvhqOfKVkv1q5MzAmlFrL5Klg4HvZw29IaW8ZCSaI6NzpljXwXr7bE7SA/8sxXh3MxqppBnVY5oyO
	krX0WfvUj2A95XDn3Q6dAbkCXuyGPzi17mjzBOKuK/938oXzj/8oX6QryqT033x+97+qNLjUJEOJ2
	FaNCH2553dIvOm3Eo43bAGHfnocRgq6izoL7DDLmUZ3+jZ5ZZnQZkbhzRPdBYSpGNLJ96Qm03Xe/U
	on2DpD1xX8NBoiBCNAnLAy2YBHYkz10/57cgvqH+HXMUyN3TMR+ZsUEFHUgzHf7PUWamQw9IrMyRw
	HMnC1Csg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx7Hc-0000000Gbfx-1942;
	Wed, 17 Apr 2024 15:33:12 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx7HS-0000000GbbY-03t6;
	Wed, 17 Apr 2024 15:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713367979;
	bh=2xn4oP5qSf+gAMTht/g7tss9ReK+HcgndLYujyEm8Ac=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=2Nw0ur492Zb/y4Fr0BxzxP5YKMPjw99hkTQ/6oQaqB3+TKVKQgGYBrzJ5jJjUK5C+
	 rqnfaLCAzZS6Y4lwooVAe3tkIF4Y/j+3RFx0r/OkjAxhnAjoLyHcQKycQoRGZrfvtn
	 gBV2oZMyRtPJa4Z+YL8ANtXiuZOG4m/dsN7DoTDSKiPLVdmd06Kpq5kjkMa2of9vWJ
	 YJxdniLjhP02rYUR5TRcTzi0GUJ36xaHfNGAuhi5HEXi7Pi15z13hmap5zqT4ThXlV
	 8obhAOg9xFFA0U3O+BI6GWy2CQ1Dyn2vvv4E0tkNotlFeikZaXdEvGRL7dcHhPlQpl
	 AdHfXY7lei2/w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 329843782144;
	Wed, 17 Apr 2024 15:32:58 +0000 (UTC)
Message-ID: <59edbcc4-fcd2-4de7-a275-1d10e0c35155@collabora.com>
Date: Wed, 17 Apr 2024 17:32:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: regulator: Add bindings for MediaTek
 DVFSRC Regulators
To: Rob Herring <robh@kernel.org>
Cc: henryc.chen@mediatek.com, wenst@chromium.org, keescook@chromium.org,
 gustavoars@kernel.org, linux-mediatek@lists.infradead.org,
 amergnat@baylibre.com, broonie@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, djakov@kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 kernel@collabora.com
References: <20240417091442.170505-1-angelogioacchino.delregno@collabora.com>
 <20240417091442.170505-2-angelogioacchino.delregno@collabora.com>
 <171336511790.2347768.12360106374334104584.robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <171336511790.2347768.12360106374334104584.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_083302_224876_A5B8142B 
X-CRM114-Status: GOOD (  17.50  )
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

Il 17/04/24 16:46, Rob Herring ha scritto:
> 
> On Wed, 17 Apr 2024 11:14:36 +0200, AngeloGioacchino Del Regno wrote:
>> The Dynamic Voltage and Frequency Scaling Resource Collector Regulators
>> are controlled with votes to the DVFSRC hardware.
>>
>> This adds support for the regulators found in MT6873, MT8183, MT8192
>> and MT8195 SoCs.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../mediatek,mt6873-dvfsrc-regulator.yaml     | 71 +++++++++++++++++++
>>   1 file changed, 71 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.example.dtb: /example-0/soc/system-controller@10012000: failed to match any schema with compatible: ['mediatek,mt8195-dvfsrc']
> 

This is a circular dependency with patch [3/7], so I think that the bot complaining
is expected?


> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240417091442.170505-2-angelogioacchino.delregno@collabora.com
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



