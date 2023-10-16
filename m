Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D927CDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 08:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMLcIlWkwBOzhMr3yKBj8yFWy4J88QraLHIfLaOnEdM=; b=bmS7K6wBDpMotpGK27uascMnKg
	ne5ha3tT/SgnRfJ9MsZtwdSmieUPbqpF3g2jggDAG9yzbjZihy9YJog4zwY+VHHaG/17FiX6LLFjE
	akpYyEsYRHl4a4o4RisPoptGzM+t8zSUwctsmJ+Y+1LsHrRlHd7zKI2hDiEd1PleFk2jcCh9TMT1I
	vKjPskME292wlUXi2zQ+U3s0jZdjL4Q+8i+QkdKiz2kIiKVXUOIDhkayEhpNbvjX6Am3Sgqpmi8lr
	7jNYzkzes/z+4Y5AM1wp5d6BvLPiAYfEBDXNUZmiQoaKyGh1cZYinpqR2Y4uoiZ9at5fgfZ4QzBWu
	4AXf/NJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsIXX-008jsK-0Y;
	Mon, 16 Oct 2023 08:01:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsIXT-008jrQ-1d;
	Mon, 16 Oct 2023 08:01:25 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CB32D66072AF;
	Mon, 16 Oct 2023 09:01:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697443280;
	bh=1qoI2NcTPM67udTkaBwYJkrXK+5Ym0B+bxwOJZO701U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vv+mGcDMzBLHWwbe4xCV03VQR6rzeihSWz5RrABE6IOYAxc1bk/uQQrxK4hZT4nUz
	 Hn9T2oOmbNoOGhR3vdx34V0K3HDznRoWYK5cridCg61u69n8jnnOCS77xKwdj0RsTy
	 jtzWSD7Wu8MSbJvxCWWPeaKmFTDJfubF07EUgNViZJOpmffzupOGgT3bNyZSO8vQHd
	 z4BqEYr7Nkjb3/SMwkB2PIu3HnR+UCdYgzdS8IwtYv3pfhKtesFBKfZGbCt3UyUA/W
	 LsaMVWUAiDn7v0C5xPCaOKNfVroN3mzuJd8bdnMO5E+ZBEsU8LEblGeHaBIFF5rbUc
	 SRWXKKqWGBqDg==
Message-ID: <b1f42bab-7670-c099-8c7a-882f7268b358@collabora.com>
Date: Mon, 16 Oct 2023 10:01:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v7 15/16] dt-bindings: display: mediatek: split: add
 compatible for MT8195
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20231012084037.19376-1-moudy.ho@mediatek.com>
 <20231012084037.19376-16-moudy.ho@mediatek.com>
 <e58ecc95-5133-4542-8178-338583bca2ab@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <e58ecc95-5133-4542-8178-338583bca2ab@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_010123_704073_E30D88DE 
X-CRM114-Status: GOOD (  15.09  )
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

Il 13/10/23 08:52, Krzysztof Kozlowski ha scritto:
> On 12/10/2023 10:40, Moudy Ho wrote:
>> Add compatible string and GCE property for MT8195 SPLIT, of
>> which is operated by MDP3.
>>
>> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> 
> 
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: mediatek,mt8195-mdp3-split
>> +
>> +    then:
>> +      required:
>> +        - mediatek,gce-client-reg
> 
> else:
>    mediatek,gce-client-reg: false
> 
> 

Technically, all of the display components do support GCE, using it is
a matter of preference, so disallowing gce-client-reg on anything that
is not mt8195-mdp3-split is *technically* wrong, as much as not having
that from the beginning was also technically wrong... :-)

P.S.: The driver for the display split component doesn't use GCE yet,
only mdp3 for now, but again, it's the driver - while the HW is actually
capable of using that

Cheers,
Angelo

>> +
>>   additionalProperties: false
>>   
>>   examples:
> 
> Best regards,
> Krzysztof
> 


