Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7263C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 15:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6olgbthaOhN3f4AFE/3iBlFPFGb625oZX9E4dP1sDhg=; b=edYrYsMe4UTKZx
	qg5uVmJGbGFxz0oZ11E1eDMGuZjbE0AAZ3fAmHht7mLUasuoUR8CBli5Cer53dT9k+S7Dk/VypoZv
	zIHun1gH5UledlRAOGU/grOBxQ3gW+g5NQ3jgAw2oawZqw+u9VKnJCT/O7x9TEXwAW5oIRrQIFwwp
	pDdB3fhDE+MGIsIZs+mRXRUhlrcxMPJMsI+3GcUN+iU2637tTAEUvAUlIjEm9lVriDF6rkoz+qiYs
	9xMHQEVvR8Pn7WmSlYhg8a9AL6pBsyO8qC18cbPkOy0rDlP4IvzfhGlU34ZPSZGavnF9zz8ywpnOr
	2q5tfdpEyVF7NVnIH9EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc6jq-00AeEB-0T;
	Tue, 14 Mar 2023 15:38:58 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc6jl-00AeAc-10;
	Tue, 14 Mar 2023 15:38:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1678808324; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RAOnXKx8Fb4MqB1wVrAAxOBX7beM5WUE8KoKAAw/vni8gi6JlsigmpoPkfqyAJE1U4+kCyKhTOdwqOGhhmgbYdUbHTx1az0uXXIBEtKHLaeCxh6MXkxrz8kMNwBXKwT5MHdQxMDpUHRRLX/3BNeqP6WcK83WuwcaUX6wsZoI7nA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1678808324; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=6olgbthaOhN3f4AFE/3iBlFPFGb625oZX9E4dP1sDhg=; 
	b=GL95TvrtiRIE/4EbRySqwytvKn4VW5GOSZjZB8tymYHsOzZlxj3JEqkKGJdjRK7idqIUmOnhF8LH1h+hb3CK+EUBIjbWTsT+BXIQC5gxtKLK+WkhfEuiAhZeQXmBRMvk/KZzDM/up3yg7Bm0Ig2JGG1ps/N+MT88TaRzEN1LrEU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1678808324;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=6olgbthaOhN3f4AFE/3iBlFPFGb625oZX9E4dP1sDhg=;
	b=iPKP6Gz/R1TpNa0LjJzAreb6ProiuSXPsWVPDsG+WoHUGHzCtu30dgnnboxtfPpE
	YHRCLUQBcRTvMNOHanG03z3sV6ubEkSeBA0sK9B+gpmviiOUKDKzRdAQp/RwApF0n+h
	h+kLW1V3vRWssWZQBNdY7+uEAUd1A0Aw2hc+So2c=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1678808321651755.4458697967328; Tue, 14 Mar 2023 08:38:41 -0700 (PDT)
Message-ID: <c64d9f88-75ca-3a6c-b5c2-6e4b1a161d5f@arinc9.com>
Date: Tue, 14 Mar 2023 18:38:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 15/21] dt-bindings: pinctrl: {mediatek,ralink}: fix
 formatting
To: Rob Herring <robh@kernel.org>
References: <20230313205921.35342-1-arinc.unal@arinc9.com>
 <20230313205921.35342-16-arinc.unal@arinc9.com>
 <167880254685.25972.15349420182231511267.robh@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <167880254685.25972.15349420182231511267.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_083853_394265_B9DA158D 
X-CRM114-Status: GOOD (  18.69  )
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
Cc: Linus Walleij <linus.walleij@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Daniel Santos <daniel.santos@pobox.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Del Regno <angelogioacchino.delregno@collabora.com>, DENG Qingfang <dqfext@gmail.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 14.03.2023 17:10, Rob Herring wrote:
> 
> On Mon, 13 Mar 2023 23:59:15 +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Change the style of description properties to plain style where there's no
>> need to preserve the line endings, and vice versa.
>>
>> Fit the schemas to 80 columns for each line.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>   .../pinctrl/mediatek,mt65xx-pinctrl.yaml      | 22 +++---
>>   .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 33 +++++----
>>   .../pinctrl/mediatek,mt6795-pinctrl.yaml      | 33 +++++----
>>   .../pinctrl/mediatek,mt7620-pinctrl.yaml      |  2 +-
>>   .../pinctrl/mediatek,mt7621-pinctrl.yaml      |  2 +-
>>   .../pinctrl/mediatek,mt7622-pinctrl.yaml      | 26 +++----
>>   .../pinctrl/mediatek,mt7981-pinctrl.yaml      | 33 +++++----
>>   .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 68 ++++++++---------
>>   .../pinctrl/mediatek,mt8183-pinctrl.yaml      | 26 ++++---
>>   .../pinctrl/mediatek,mt8186-pinctrl.yaml      | 47 ++++++------
>>   .../pinctrl/mediatek,mt8188-pinctrl.yaml      | 74 ++++++++++---------
>>   .../pinctrl/mediatek,mt8192-pinctrl.yaml      | 47 ++++++------
>>   .../pinctrl/mediatek,mt8195-pinctrl.yaml      | 41 +++++-----
>>   .../pinctrl/mediatek,mt8365-pinctrl.yaml      | 28 +++----
>>   .../pinctrl/ralink,rt2880-pinctrl.yaml        |  2 +-
>>   .../pinctrl/ralink,rt305x-pinctrl.yaml        |  2 +-
>>   .../pinctrl/ralink,rt3883-pinctrl.yaml        |  2 +-
>>   17 files changed, 254 insertions(+), 234 deletions(-)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml:103:16: [warning] wrong indentation: expected 14 but found 15 (indentation)
> ./Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml:113:16: [warning] wrong indentation: expected 14 but found 15 (indentation)
> 
> dtschema/dtc warnings/errors:
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230313205921.35342-16-arinc.unal@arinc9.com
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

I do see the warning. Looks like the wrong indentation was there before 
my patch series. I'll address that as well on this patch on v3.

Will you review the rest of v2?

Arınç

