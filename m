Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF689CF856E
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 08:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QP/5WcG+t0U4c4NONdALg9sHKMiEqQQ97rMhsPS+YA8=; b=ve2I7wziMp/OlEZOzTJspA295b
	9xcp+qp4F9k//axrx8YbjvM08uQEUqQPDOpMArMfXn7EMzBEAOUOMfO83M/JrmDc32JTErPxLOyYB
	OfEnnAn4hXyxtIYlrAIQuWU6xMFuj+C7E7PqGitLk1nj6G8n15tXtf170BZvrNX6bWK13tTpxuP+g
	v9prmlNmPEvN4pMpgJkJPeIlmp+R4VjSG55BCrKIKZEpvMJKotLoFljbkNCAYs9Gerxn1NNYEJp+W
	MbFs5UINGY8NtoX8kwofscoiOn/w0ywTKK4QWx5XRNLYfeJbE9gLoPMqHlm1KI46NxIhZzeze7MsJ
	JTLKrqtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swHam-00000008cYE-1foV;
	Thu, 03 Oct 2024 08:53:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swHZV-00000008cQ0-0Er1;
	Thu, 03 Oct 2024 08:52:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727945546;
	bh=lmmFtIdoLmsASBRqswrRcByVQnqur9EUZC2nGG3BVdU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PI03sLFL56Rdxl2zndxNCdCM9u1i7qJjuUD/uDc2/UJNEoFrQeTrBVEKPtBNLAUsd
	 KT7/lwGLCaCFoxJQLB6l2PFGFNL0cHznfwfeOfDX/Gc6crdvCC1bU4DoYUInXEEHrw
	 lVcYQNtVnFMzz6IzWBwxbim4hgtX9UURJEeApKnyta483Uc61PmvZ2u6++hK2hsnuy
	 ySt1oa/gRCCBvDmamy4gjSr+7/yc4u3IQOih1o5Wd1CfWxSI01klE2WIxzXF/uVtjl
	 Q69R1kffayupwxFNXEzDdenA76RoafuuYTQ0EYAAcRPOPgWV+VvVSUq5J8Ar13zBrQ
	 Wp+GUD9eHDAtw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9758117E10D2;
	Thu,  3 Oct 2024 10:52:25 +0200 (CEST)
Message-ID: <faa93bb8-ebc2-4f95-84ca-a61b80188e20@collabora.com>
Date: Thu, 3 Oct 2024 10:52:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] dt-bindings: nvmem: mediatek: efuse: Reuse
 mt8186-efuse in mt8188
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pablo Sun <pablo.sun@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241002022138.29241-1-pablo.sun@mediatek.com>
 <20241002022138.29241-4-pablo.sun@mediatek.com>
 <mh7upw2y2dclyosved3chw7chpqgdg4a3j5ftwftfhm6v5uqpt@cotoeuopfbqg>
 <559fc2a5-631c-440a-812f-2907f84b16b4@collabora.com>
 <74uvqyd2n6cxzi4z3miqh5ay7xun2qapjuse7bav5thr44rlml@pr44cvxsngfe>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <74uvqyd2n6cxzi4z3miqh5ay7xun2qapjuse7bav5thr44rlml@pr44cvxsngfe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_015229_306392_C33AC92D 
X-CRM114-Status: GOOD (  18.19  )
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

Il 03/10/24 10:13, Krzysztof Kozlowski ha scritto:
> On Wed, Oct 02, 2024 at 09:42:32AM +0200, AngeloGioacchino Del Regno wrote:
>> Il 02/10/24 08:11, Krzysztof Kozlowski ha scritto:
>>> On Wed, Oct 02, 2024 at 10:21:35AM +0800, Pablo Sun wrote:
>>>> mt8188 has the same GPU speed binning efuse field just
>>>> like mt8186, which requires post-processing to convert to the
>>>> bit field format specified by OPP table.
>>>>
>>>> Add the binding for the compatible list:
>>>>     "mediatek,mt8188-efuse", "mediatek,mt8186-efuse"
>>>> so mt8188 uses the same conversion.
>>>>
>>>> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>>>> index 32b8c1eb4e80..70815a3329bf 100644
>>>> --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>>>> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>>>> @@ -39,6 +39,10 @@ properties:
>>>>                  - mediatek,mt8195-efuse
>>>>                  - mediatek,mt8516-efuse
>>>>              - const: mediatek,efuse
>>>> +      - items:
>>>> +          - enum:
>>>> +              - mediatek,mt8188-efuse
>>>> +          - const: mediatek,mt8186-efuse
>>>
>>> And this is not compatible with generic one? This is confusing. Why are
>>> you adding generic fallbacks if they are not valid?
>>>
>>
>> It was my suggestion to start dropping the usage of the generic "mediatek,efuse"
>> fallback, as I've seen multiple times feedback saying to not use generic fallbacks.
>>
>> Was that wrong?
> 
> No, just nothing provided the background that such change is
> intentional. Please mention in commit msg that the preferred way from
> now on is not using the generic fallback.  Maybe even add it to the
> binding itself as comment, so people won't grow the enum with fallback.
> 

Cool. Thanks for the explanation, krzk.

Pablo, can you please add a comment in the binding saying that no more entries
shall be added to the generic fallback set?

Having a comment there, instead of just into the commit message, would be (imo)
better... as then, anyone trying to add new compatibles will be more likely to
read that.

Cheers,
Angelo


