Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3147C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 13:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eb4XuwH4JdtGx4s9vo9eK4fik69b7fQierZjyFZ7G+g=; b=i5DLwFIMcr/5rnrUzkOjVvMI+D
	knRFnM8TRdUTBz52LOfM6lLZ1CX/HldOdIxSfI+c0ZLqd99C3ChYE1i44NRO0B7neI1guKnkZYjeB
	MI43G/lHZkVkWwaqQcXqkfkPK8ur45Dllp2w0j8VQuO0Vn61Um9e20pHo1b2pnHRLPG0Aqq0wLCSe
	5k0YsH9fZQ4o1LUqrzNdRoxQf+9tC7x8uEsSXYamIw8S9EaJEQg5ZZAPJtogV61RB2m7sZbEG0hvs
	lK0Z9ji68ChOkSF7DfBF3ZqiieaIk2BznQ7o9dRsu6rujOC67+9JGFfIIdsEaAMegOr7xbhpBjnVl
	OtgVz66Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmaSA-003KmQ-05;
	Wed, 12 Apr 2023 13:24:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmaS6-003Kkz-0w;
	Wed, 12 Apr 2023 13:23:59 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 681776603102;
	Wed, 12 Apr 2023 14:23:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681305836;
	bh=C+NuJI3gJQOvg2W2Jt6ytwX+Z1SaqR9sW/KQiI2QbiI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Mbo9WZ5dvorklyrGK5QC93j7iWln5Nb1/0dZiovAp8HYc7dmf9gr1K3T6vJUTMDWF
	 KBjARKXpwJsIkz1QJ6vDHsZNtV8kVU8Jj0BV/XrzMCX1c1zsD2DUMe4viOORDcm+52
	 D80e6axsE5IlRNwR26L7uf7pl+V6gFyzIck6f29rFY9zvzhCBp1KiKmTBlTC9kQ/9M
	 nyf4m+rOp2OB3OrxR2uLA6qWo7Ku1L2tyeEtuX5E/XpQrCrk7x6GAIxCwcOCbvoPUc
	 8UrR0BepUKP3t0nKCa3Is6oXrI8kWwrNKpeDT69WR3iL8uathgheIz0FQheBvmzc8w
	 wAERQg2FZvT8g==
Message-ID: <c66642f5-470f-9d39-19d8-e76f8b6288b3@collabora.com>
Date: Wed, 12 Apr 2023 15:23:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 22/27] arm64: dts: mediatek: mt6795: Copyright header
 additions
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-23-angelogioacchino.delregno@collabora.com>
 <7466cf12-9411-cb35-8e8b-fa50f5efe492@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <7466cf12-9411-cb35-8e8b-fa50f5efe492@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_062358_458206_CE90709D 
X-CRM114-Status: GOOD (  14.24  )
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

Il 12/04/23 14:41, Matthias Brugger ha scritto:
> 
> 
> On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
>> I have added more than 800 lines to this devicetree: adding myself to
>> the copyright header.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi 
>> b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
>> index 29ca9a7bf0b3..a4c950b65006 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
>> @@ -2,6 +2,9 @@
>>   /*
>>    * Copyright (c) 2015 MediaTek Inc.
>>    * Author: Mars.C <mars.cheng@mediatek.com>
>> + *
>> + * Copyright (C) 2023 Collabora Ltd.
>> + *                    AngeloGioacchino Del Regno 
>> <angelogioacchino.delregno@collabora.com>
> 
> Indentation?
> 
> BTW from what I understand the copyright will be by your employer, Collabora not 
> you, but I'm not an legal expert :)
> 

The copyright *is* by my employer ... but at the same time I'm adding my name,
because it's me performing the work.

I didn't write (c) myname, but (c) employer, myname - that's ok :-)

Or was the comment about the commit description? Should that be reworded?

Cheers,
Angelo


