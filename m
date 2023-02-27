Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE76C64ED6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 13:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYV3nh0GOJ5cZ96AUmioIJzwz0msM6/oCNyrD26nAT8=; b=KZSYM9eg5NLi+QsIgbrOTWIreK
	WtNn1NVqXBzJWZ2Vq3IBvTFwrt46+LlRXSkXLfU2WKh3MLvAsOtSaW0+9NN7nUsemwLNOKDyFYqkg
	5adv1n/O26jjvOqB2/hpqFCLnB37gjA6jwlIotpuqcPgETNdx8GruHXDa/Wrmc1icGuJxp9ed1vf3
	hWtpDXF8Um7ljp9S9CIe66JeePko/pPhZDnGPpgrBN/77xXwWSt2AYvG+tZV7AP1z5tOszlKIrkO8
	yHYmpF6ffMkBUKcUhYGQJsLOxwBaWiCFpFtnD0SobORuO1tFi/o924EWEfL2FoZH2MKDNh/U2YIzy
	APjKzaTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdPY-009izT-Bu; Mon, 27 Feb 2023 13:19:24 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdPN-009ivn-PT; Mon, 27 Feb 2023 13:19:15 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 21FCA6602EBB;
	Mon, 27 Feb 2023 13:19:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677503951;
	bh=M84hUc6FSjtfLLuQzMVefdgxCampFeISHt8LSmhyiIM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CDiCRdUU0NNxCM540FhfqUKkpo4mktrjuOYSHLlsZ13oHX2JlAsIydqSIIOir4PeH
	 BmEw7i4EV1M0yfhKyziVFK634gam8zXe1GE3igvbIFD5f1ctEoQpDFbCkiF60YiRHn
	 7hCyMAz6X7ahzt+xO6wqPYlnACJpPAGOZd41vWDaO9FM1FUyZf5XUAsSHnYwejfvHu
	 Z9Yg89+hrrZBPLBwYW+TeM7N0ytvedykIhUPOrP8sRDqdMQDqIU3NzS/Gqj3s8GeBn
	 tYkpcIH9Y/Ctre4OM0HYnqh0ed6KDfsy23E99j41mOaZIRfOcI6/y6eZX5dvTtWoE+
	 hFB4Ml2GDtKwg==
Message-ID: <caddf39b-fb0d-c6ff-b98e-bbd5aac5f974@collabora.com>
Date: Mon, 27 Feb 2023 14:19:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 04/11] dt-bindings: gpu: mali-bifrost: Add compatible
 for MT8195 SoC
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-5-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GJgAz4yvb-zvFwxRD2PGtkpV7gD-Lst9KDAaZDzLyDEg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5GJgAz4yvb-zvFwxRD2PGtkpV7gD-Lst9KDAaZDzLyDEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_051913_982893_592C2260 
X-CRM114-Status: GOOD (  16.21  )
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

Il 24/02/23 11:08, Chen-Yu Tsai ha scritto:
> On Thu, Feb 23, 2023 at 9:34 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> The MediaTek MT8195 SoC has a Mali G57 MC5 (Valhall-JM) and has the
>> same number of power domains and requirements as MT8192 in terms of
>> bindings.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>   Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>> index 65fe139ceb83..4d9ab4702582 100644
>> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>> @@ -25,6 +25,11 @@ properties:
>>                 - rockchip,px30-mali
>>                 - rockchip,rk3568-mali
>>             - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
>> +      - items:
>> +          - enum:
>> +              - mediatek,mt8195-mali
> 
> This could be squashed into "- const: mediatek,mt8195-mali" like the
> following lines?
> 

Could be, but I expect more compatibles on this list, that's why I've modeled
that as enum. I prefer keeping this an enum.

> Otherwise,
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> 
>> +          - const: mediatek,mt8192-mali
>> +          - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
>>         - items:
>>             - enum:
>>                 - mediatek,mt8192-mali
>> --
>> 2.39.2
>>


