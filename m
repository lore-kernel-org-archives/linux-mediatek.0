Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CEBEE645D
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 07:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NUUyDWpxgmpTm1cADTkH3GZOYVYJadd3RN7C7lyuSRw=; b=S92+tqgIaHJNuK
	fra7CU53/1ztxDde1GeJ05jvvh3KVZ+nTkSwmC8xdTaSW5x7yHmcgBPfuMszxCSDLuHOX5/OQ3IUa
	zcXb00K+QHLIz0G+eyaKV1V4zV9pQI2eIJNlBc8/XsSCGeBM6uXtTlXMXzS7LIa4RV2QQUX285Psq
	MgsSBTt4wMNe76reHyzEIMDzVCFZETK3I6aGBxy9h5EHScHUt2QbrgDT77VzZZA4JqxhQ1sGJ8vP6
	79b+k3J2GREcmF3UkoFp7jfg485nlRV38jDv8mGUPHwC4weG65yzMrOwq7jNFUr5eU48bvQl9U/e5
	MSeKx2mO53A4/5YSab5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soejm-0000000CHVw-3aq8;
	Thu, 12 Sep 2024 07:59:34 +0000
Received: from a7-46.smtp-out.eu-west-1.amazonses.com ([54.240.7.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soejd-0000000CHTU-32wX;
	Thu, 12 Sep 2024 07:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726127961;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=cldL7U+54qSN12pAQeSnPmmhceVDu+NalVaDHIDluX0=;
	b=NtQWR1QJPkxoJQdRf/qJU1KmHdFte6fnqP/Br8NrTPqmIobSI96U3KORXePFfeBW
	8Qjg0OpjTYHEOczbvUeA3AWAlja00Mmxcdy9v/Gf+sp2cmNIjgxPv2D4NCLV7/ca4Dw
	NeFgee4lZazq4OQW53Ug3Eg6LZwmhELVAI563IpHalXGZJgJVew0Rex0x5Q6swN6Oe0
	LnGUhrb0r3ZWsr3IGxBE+NwSNY0p24n4Qu0E0rgbJfOCHYy4mpyRzJV4r0EgfSlGGO8
	EaZIk5wOKQk4kajYE/kKKan3wAl4rMiBkHllhm44y0RumUElatUnY71WOy8cW8TxWGg
	WtuURPawQA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726127961;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=cldL7U+54qSN12pAQeSnPmmhceVDu+NalVaDHIDluX0=;
	b=c3lH6ZI8LwowGvCxpLVTIMn1EB+gq+KJXUJ4peySHipaj8FHkKBlLr+5a+AYDhzW
	dzLL8sxo21e9kb1bJsZyRwn7mYtQTuN/Se55g0fh0emWEG6BAIs+Mch8yP7qPmML1lq
	z7qafrMtxlOBBSVlS/gx83XFBYMukITGF7Vm/tGE=
Message-ID: <01020191e53e7670-d04af181-0137-4f35-962e-2f1119d026df-000000@eu-west-1.amazonses.com>
Date: Thu, 12 Sep 2024 07:59:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mailbox: mediatek,gce-mailbox: Stop
 requiring clock-names
To: Conor Dooley <conor@kernel.org>
References: <20240911104327.123602-1-angelogioacchino.delregno@collabora.com>
 <20240911-unhappy-wifi-b0a851e261bb@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240911-unhappy-wifi-b0a851e261bb@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.12-54.240.7.46
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_005925_963549_3D091B9C 
X-CRM114-Status: GOOD (  12.29  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, linux-kernel@vger.kernel.org, houlong.wei@mediatek.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, krzk+dt@kernel.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 11/09/24 19:51, Conor Dooley ha scritto:
> On Wed, Sep 11, 2024 at 12:43:27PM +0200, AngeloGioacchino Del Regno wrote:
>> There is no reason to make specifying the clock-names property
>> mandatory, as the Global Command Engine HW needs only one clock.
> 
> Have you checked to make sure that there are no users that do the lookup
> by name?
> 

It's just that I didn't want to mention any "driver" word in the commit description
for a binding ;-)

(Of course I did, and the driver is not doing any by_name lookup)

Cheers,
Angelo

>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../bindings/mailbox/mediatek,gce-mailbox.yaml        | 11 -----------
>>   1 file changed, 11 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
>> index cef9d7601398..ff5d010fbcf0 100644
>> --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
>> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
>> @@ -56,17 +56,6 @@ required:
>>     - interrupts
>>     - clocks
>>   
>> -allOf:
>> -  - if:
>> -      not:
>> -        properties:
>> -          compatible:
>> -            contains:
>> -              const: mediatek,mt8195-gce
>> -    then:
>> -      required:
>> -        - clock-names
>> -
>>   additionalProperties: false
>>   
>>   examples:
>> -- 
>> 2.46.0
>>



