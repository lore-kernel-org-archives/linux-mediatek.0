Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C35DC43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 08:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSxJx/x4LLkGsEQr/q3HIxj0HG5GLJVWI2OR7iN5Y3Q=; b=GUjb4W3SZAoBacXIvQBZupM6P8
	mn2lUo8HcSmAahMnR/BY1VaSwFyY4ux1py7UlfArPRorD1WuM2l5EElNydm/x1FrIiypaBuTdN7+F
	2AsROWVVurv1XmjmEVnJRKU1pM3adj61zm0/e1tIIhI4Ssa01CJ5ROkvXHREhm/SZ/GtaI2rsS8o5
	vRWXQxGM7++LWQIBF7oKtvYQ3vjmVbO7xZuAbwGGUlQ0eMJlFh28rSRG26/eXVZJblDxqQHxNi5eD
	I34OZDEEtGx4HPDQNI7v4JRErRB3a3EFz5acdGKc+1EYnRz+JZ3pG1ySHqcz53tED0GqFxWlo7IW8
	0Saa++YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Hny-006AtQ-CM; Mon, 04 Jul 2022 08:51:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Hnm-006Aoc-C7; Mon, 04 Jul 2022 08:51:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5232E6601638;
	Mon,  4 Jul 2022 09:51:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656924689;
	bh=06W+b6RL3osPIk+iBasdY5Wk4bfRW2/i6Z/FRiPkz6w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZNwSe8DAIq9PDy8NpAkLp1m+dZI4MiloI3sMQiWFzvhu6wpBeSbiQUsNuQ2rHhp1B
	 DpQH311R7NfzbMDBmzJB5I24BebrerlG0NoP1y7bqbc3g6pprFizDvN2vOP2EuRZPl
	 TtaVAoKZc9aHynzqWFROX5El67b+I1Zh8+k0Zxz0ugXTR6hfeeYZv3MKrO1FFAwNcy
	 hsUuKf/yNMNmiWyC5h3V1bK8X9rjI7Gg1E/YBPBp8kuFbR6bmRza+ya6hW1ql10yif
	 jOANStZJGVVXHQ3FFkY5/DjCun0+n08JaI8S3QCM8w/4XMwArH6uziMX9pvM1aS/Jj
	 k/zS5NDy/salg==
Message-ID: <515d5b84-e625-5908-aa00-b2f03e77fe3b@collabora.com>
Date: Mon, 4 Jul 2022 10:51:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 01/11] dt-bindings: arm: mediatek: Add MT8195 Cherry
 Tomato Chromebooks
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, hsinyi@chromium.org, allen-kh.cheng@mediatek.com,
 gtk3@inbox.ru, luca@z3ntu.xyz, sam.shih@mediatek.com,
 sean.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
 <20220630153316.308767-2-angelogioacchino.delregno@collabora.com>
 <20220701153111.glbd6gophzipwtjk@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220701153111.glbd6gophzipwtjk@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_015130_584299_A43C5871 
X-CRM114-Status: GOOD (  17.32  )
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

Il 01/07/22 17:31, Nícolas F. R. A. Prado ha scritto:
> On Thu, Jun 30, 2022 at 05:33:06PM +0200, AngeloGioacchino Del Regno wrote:
>> Document board compatibles for the MT8195 Cherry platform's
>> Tomato Chromebooks, at the time of writing composed of four
>> revisions (r0, r1, r2, r3-r4).
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   Documentation/devicetree/bindings/arm/mediatek.yaml | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
>> index dd6c6e8011f9..3e0afa17ed2e 100644
>> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
>> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
>> @@ -144,6 +144,19 @@ properties:
>>             - const: google,spherion-rev0
>>             - const: google,spherion
>>             - const: mediatek,mt8192
>> +      - description: Google Tomato (Acer Chromebook Spin 513)
> 
> Hi Angelo,
> 
> searching for "Acer Chromebook Spin 513" I found that there are two different
> chromebooks:
> 
> https://www.acer.com/ac/en/US/content/series/acerchromebookspin513
> https://www.acer.com/ac/en/GB/content/series/acerchromebookspin513cp5132h
> 
> The first one is a Qualcomm based one, while the second is mt8195-based, so I
> assume that's Tomato.
> 
> They can be telled apart by the model name though: the Qualcomm one is
> "CP513-1H", while Tomato is "CP513-2H". So I suggest to add the "CP513-2H" here
> in the description, as well as in the cover letter, to avoid confusion between
> the two.
> 

Hey Nicolas,
nice catch!

Even though it would be odd for someone to think that we refer to a Qualcomm
powered Chromebook while checking 'mediatek.yaml'... I agree with you, let's
specify the model clearly as 'CP513-2H': it fits, so why not!

I'll send a v2 soon.

Cheers!

> Thanks,
> Nícolas
> 

