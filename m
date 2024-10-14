Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3803CFC503
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 08:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/968DB6ZvvIMSVz9wPBk0eoDQyxIovxIoyGOExuWrk=; b=EQHnRw46dlHNf/vynOJwwqmJbt
	T8S2QSgkHImIXeDFyRbGGbr0lyUM4kVo9E+Ha5rZfqQhYIXE9ReVG0sDNq2jAyG603tQX/ZxgscTX
	XHY2WUbA8cucbfr3bfdFSXJmm1XaCIe8MHImm4wQ49f/zeFYHx9yCj7/8HxxhbY8s9774a0YxQwCE
	5SyRI5UvyhkQrRkP6GI+3iBNhHCkNOYPb3qZiz5eBzPwys1La5If8s7RgJ4KQvnmNq2kWIk43Cdle
	wZ5HPjbZ4ohX4zKcQCLvBIZboxDwjKM7LGbzRO+/VL/t39gN9syVHACmSnsrKONDPlts1htkBQ5cg
	WIGlPUMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0GeN-00000004K13-0Vgo;
	Mon, 14 Oct 2024 08:41:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0GQa-00000004HWF-3Ytk;
	Mon, 14 Oct 2024 08:28:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728894462;
	bh=+/txDlTZRlfL1E6ViTuAgBK8brlnyiBPLDdgnvnwqDk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oGlpjvaLOFy32Lo1P06OUFkRk6EJg1ZJSCKb/94dsaYCVZp0GaPX26RqAVb1e4NuS
	 hcHdudD971rEQOiAcw1BTU1ZrFeheKg4FnpUs1RG6ZTckrOACEyYjwjfCrehR/jMOo
	 yziINUYCyAbaBSycRSsOJ3Rk3h0IG47uvKS9Cxc3yUTIO5foqiiZMPE9XSQKHEZDMr
	 0IJN8nZovv+gFGaZPAMagSQXqhgYvdulWHsmLRtUsJbBfIXTpDlganLyYe4t2HsoTa
	 1QOsST92XnKF2QdV9BhkpiQJ36dvRhZBMX+p8pI2POY+zJPWEguR7uyLFrK5FKT3M7
	 MmGP0ZzMWIM/Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 35A3D17E10A0;
	Mon, 14 Oct 2024 10:27:42 +0200 (CEST)
Message-ID: <2608306c-da19-4160-b0c7-dbb8935abc42@collabora.com>
Date: Mon, 14 Oct 2024 10:27:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Pull pinctrl node changes from MT6795 document
To: Rob Herring <robh@kernel.org>, Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Yassine Oudjana <y.oudjana@protonmail.com>,
 Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-2-y.oudjana@protonmail.com>
 <20241011165640.GA2475122-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241011165640.GA2475122-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_012745_182731_A23C5CFF 
X-CRM114-Status: GOOD (  15.19  )
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

Il 11/10/24 18:56, Rob Herring ha scritto:
> On Fri, Oct 11, 2024 at 03:03:46PM +0300, Yassine Oudjana wrote:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>
>> mediatek,pinctrl-mt6795.yaml has different node name patterns which match
>> bindings of other MediaTek pin controllers, ref for pinmux-node.yaml which
>> has a description of the pinmux property, as well as some additional
>> descriptions for some pin configuration properties. Pull those changes
>> into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match in
>> preparation to combine the MT6795 document into it.
>>
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> ---
>>   .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 38 ++++++++++++++-----
>>   1 file changed, 28 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>> index 3bbc00df5548d..352a88d7b135e 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>> @@ -111,12 +111,12 @@ allOf:
>>           - "#interrupt-cells"
>>   
>>   patternProperties:
>> -  '-[0-9]*$':
>> +  '-pins$':
> 
> Worst case, this could be an ABI break. Best case, it's churn for
> mt6779. Is it worth unifying?
> 
All those MediaTek pinctrl bindings are mostly the same, where only the pin
definitions in the binding header does actually change.

I think that it's worth unifying them, not only to get rid of the duplication
but mostly for consistency between all of those subnode names which are wildly
differing for no real reason... and consistency is a long time issue with
MediaTek bindings/dts in general (which is way way way better now, but still)...

Besides - just for context and nothing else: the driver doesn't care about
the names of the subnodes, anyway... so while this is technically an ABI break
it's not really creating any functionality issue, and then, actually, Yassine
is also modifying the devicetrees to comply with his consistency changes, so,
in my own perspective, it's still acceptable.

If you think otherwise, though, I'm still fine with your POV.

Cheers,
Angelo

