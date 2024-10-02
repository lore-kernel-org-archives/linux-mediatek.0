Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57125CF31A0
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 07:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kj1Pt0LnRNJIuXpI+6OAdCve01tweJ1YiJpRdNVkGBo=; b=haKtoxWgKJtGqFDLxyL9pygFB2
	izyDuW1Jd4GIcGaKxwF5CVWCUocbF1sKj5qaF8wP6cT7w92wIZJ4qPvR34SKJNx5RysT3HqU+xW3l
	RQD3TD6NntgcugtLtyZPsiMMfiUZ6F3Nmtrb44cOgGaUCozJaFy7JkRmvg1cJnDYH0+nbPfIIkeIa
	H0BnTGiB5GS7+v12/et40N588htLiHmHfbVflDKxpT3IPWJkvtDPvxpR0W1oWV5XSEZgOfRqGAp0U
	ghJPx1WXtGKP2Lv4LaX1xWNCD/Pf9KFVOnqOHoVg/PiDHmY7M3K/Y+QswDgqwm92LO7HmO3t3F1/y
	trtcVDHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svu2b-000000053ad-0OR0;
	Wed, 02 Oct 2024 07:44:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svu0K-000000053JY-0I7z;
	Wed, 02 Oct 2024 07:42:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727854953;
	bh=SWvaVAQAL3TshA8nFVUBURr/pyJVpPyYwqiGTjxMyFE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gu+EMiqGlUViiTmFvVYQ99dNOgXt97jNtX1ks1dPcWKEUzCChIjrDDCDQkGDStG7f
	 o2Tr2bvZ1lF62ex+IyCMk920IkQNLWK8m1WuII50I5SMY6bdvYvjpFhKT/aSaUiazD
	 pX2iDko52LiTEcQTUtewFXzBnQjhN1v7Jj3dejJpamnJx9SMtdD1W7dlCuXCs/VjKb
	 SCVakbvMoxjvLFTLeqnwgMvP/040gccUY/Cc0g7i74v/ZBNr88m60eq10tjGcPO7OS
	 NYl9gV9V1ZmYmfNTO93cGFbqlw/mYrMaDggm2JKUzGncYoqbWyhZADOJjT3Tf/k2Ui
	 J+pD+msxf0aLQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 777D717E105F;
	Wed,  2 Oct 2024 09:42:33 +0200 (CEST)
Message-ID: <559fc2a5-631c-440a-812f-2907f84b16b4@collabora.com>
Date: Wed, 2 Oct 2024 09:42:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] dt-bindings: nvmem: mediatek: efuse: Reuse
 mt8186-efuse in mt8188
To: Krzysztof Kozlowski <krzk@kernel.org>, Pablo Sun <pablo.sun@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241002022138.29241-1-pablo.sun@mediatek.com>
 <20241002022138.29241-4-pablo.sun@mediatek.com>
 <mh7upw2y2dclyosved3chw7chpqgdg4a3j5ftwftfhm6v5uqpt@cotoeuopfbqg>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <mh7upw2y2dclyosved3chw7chpqgdg4a3j5ftwftfhm6v5uqpt@cotoeuopfbqg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_004236_318307_58B54411 
X-CRM114-Status: GOOD (  15.74  )
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

Il 02/10/24 08:11, Krzysztof Kozlowski ha scritto:
> On Wed, Oct 02, 2024 at 10:21:35AM +0800, Pablo Sun wrote:
>> mt8188 has the same GPU speed binning efuse field just
>> like mt8186, which requires post-processing to convert to the
>> bit field format specified by OPP table.
>>
>> Add the binding for the compatible list:
>>    "mediatek,mt8188-efuse", "mediatek,mt8186-efuse"
>> so mt8188 uses the same conversion.
>>
>> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
>> ---
>>   Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>> index 32b8c1eb4e80..70815a3329bf 100644
>> --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>> @@ -39,6 +39,10 @@ properties:
>>                 - mediatek,mt8195-efuse
>>                 - mediatek,mt8516-efuse
>>             - const: mediatek,efuse
>> +      - items:
>> +          - enum:
>> +              - mediatek,mt8188-efuse
>> +          - const: mediatek,mt8186-efuse
> 
> And this is not compatible with generic one? This is confusing. Why are
> you adding generic fallbacks if they are not valid?
> 

It was my suggestion to start dropping the usage of the generic "mediatek,efuse"
fallback, as I've seen multiple times feedback saying to not use generic fallbacks.

Was that wrong?

Cheers,
Angelo



