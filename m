Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631BFC4725D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 10:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGK7NH8Qc0fcKXWjstiG+UG2RVKnibn9y87x4q3Yn8k=; b=bZ8RV2W8kq7xHuawg1JheMRfN/
	BxaibRRDlUjCV/hPBrST7fk6w9VFJF1i3xviLtKtrovBg0HqTGK3xheIsfDJp7W/HpzoWww4fWqBm
	yS6JfWZz6Ad4mL09Y1SA3Sd1oQjUns46ORbdLHOm80g6TUSZZQ3AdXfrxS/K+DIWM3WqmWNUVh9+2
	jB2lRN7y2YEVxEY29d5Eur6VgSsu60TH2QoeOzMAef+4zGB1mkG2k0C1snzGCbfJdbiXB4fCjjPt8
	mb0fUxzErEcOIB1PhKcwccBmKb1z4yLNlbrlVOemhBMemC90WH57GYF+XbEEJa3yAXBrtQlfzRYm3
	XesTDGEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRrbZ-00BXxd-0w;
	Mon, 22 Jan 2024 10:32:37 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRrbV-00BXve-1v;
	Mon, 22 Jan 2024 10:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705919551;
	bh=3bcuHEEJjol3ORfk+55aI9k34MFRZBBDcr1e/CQUF5Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XM0iSXbg2Nziyyd6ztgNjUnTTcdenVcJcypAmL712TiILIukqJ3aBlQUai6mbImwM
	 01yzQ34o1C01otXnih1MZDJ8xauoAn5del8Yw0VRUD/aEzVr5IsnFLJ7BqIO4opzjG
	 ffsBvmy4fExNxhIyyuptoYDu/kJXljnGhfqHe1NOYOj32CHFX4XSjx6cCzGaSATVYF
	 6/Q6i7E402AIZGUgIa0PosgityNEQkFod+gRi86pRxsYZM7TZVGAuQHBf4qYuTXxWT
	 Eidj2wtfS/ggjRMp15YiZB6s9WL38sQy6f1sXgPUhwbPBvVF0ZI7dLUWgq4+rTBDve
	 eHLCzX4l2Ef8g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B3598378045F;
	Mon, 22 Jan 2024 10:32:30 +0000 (UTC)
Message-ID: <12b7b339-498b-45c1-bc5e-05e07660aefa@collabora.com>
Date: Mon, 22 Jan 2024 11:32:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: mt6360-tcpc: Drop
 interrupt-names
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, linux@roeck-us.net, heikki.krogerus@linux.intel.com,
 cy_huang@richtek.com, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240119094105.98312-1-angelogioacchino.delregno@collabora.com>
 <20240119-eldest-discharge-e2d3812be0a9@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240119-eldest-discharge-e2d3812be0a9@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_023233_813209_6C8B933A 
X-CRM114-Status: GOOD (  16.47  )
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

Il 19/01/24 17:32, Conor Dooley ha scritto:
> On Fri, Jan 19, 2024 at 10:41:04AM +0100, AngeloGioacchino Del Regno wrote:
>> This IP has only one interrupt, hence interrupt-names is not necessary
>> to have.
>> Since there is no user yet, simply remove interrupt-names.
> 
> I'm a bit confused chief. Patch 2 in this series removes a user of this
> property from a driver, so can you explain how this statement is true?
> 
> Maybe I need to drink a few cans of Monster and revisit this patchset?
> 

What I mean with "there is no user" is that there's no device tree with any
mt6360-tcpc node upstream yet, so there is no meaningful ABI breakage.
Different story would be if there was a device tree using this already, in
which case, you can make a required property optional but not remove it.

Anything wrong?! :-)

Cheers,
Angelo


> Thanks,
> Conor.
> 
>> ---
>>   .../devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml        | 5 -----
>>   1 file changed, 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
>> index 053264e60583..339bc9c00ac0 100644
>> --- a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
>> +++ b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
>> @@ -22,10 +22,6 @@ properties:
>>     interrupts:
>>       maxItems: 1
>>   
>> -  interrupt-names:
>> -    items:
>> -      - const: PD_IRQB
>> -
>>     connector:
>>       type: object
>>       $ref: ../connector/usb-connector.yaml#
>> @@ -58,7 +54,6 @@ examples:
>>           tcpc {
>>             compatible = "mediatek,mt6360-tcpc";
>>             interrupts-extended = <&gpio26 3 IRQ_TYPE_LEVEL_LOW>;
>> -          interrupt-names = "PD_IRQB";
>>   
>>             connector {
>>               compatible = "usb-c-connector";
>> -- 
>> 2.43.0
>>


