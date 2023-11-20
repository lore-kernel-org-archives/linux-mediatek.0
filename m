Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661D3C54E76
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 11:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0xfBT5j8HP/OI074xCCvl+fToLQgOUuqvoaE3QOFfw=; b=sLwgKbmEDC+DGjiJghTIsnOK+O
	WlFFZAPMrncEUN2mQ4WsC06TzfLMkImfUIcpY8JK3q2wX7e7SegzdY09dL55jlIW0iA8S7Ke4lbJJ
	RpPNh9BC42zDnM7YPakftpfeN79OxQgAX113b425BgeKUkSnC0FFGT9GKZF7j6LafsVKXemQ1Qql/
	BCZvW+rIz5aOTa/HXNFJEhxSOxUEnxidtYChXfelN2R+zGObKCcftKmAXbooD+T4d41jWY/TVEQvc
	ZHW0tChBHTypDdQ3y8FgE03MkPOjkmKQ0n9M2DoJJEXHEh3GIVRjRunU0vZozIvj415XIwkhduJoW
	llysCIug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r52mN-00Bvly-2O;
	Mon, 20 Nov 2023 11:49:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r52mH-00Bvkt-2i;
	Mon, 20 Nov 2023 11:49:24 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5FAD46602173;
	Mon, 20 Nov 2023 11:49:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700480960;
	bh=GgeKqX0D81jFxCF2ScljQWJwFqYbf3BhS4xRK7EFl7k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pj4PUboTUn0PFKYoW2bVe5T5gpM1R9jE2wFD+r7NmlbnNROPHvdDpg39zZz7uh3/Z
	 m7hae9NFbRLfEFlHEo455s1RIq0QVmmbdT+0Q+CxekLQi9SxGEBngqqWSnUrmfRdvE
	 Dz8MGIo/EhrTXXTZUt0YnvIqWUhovHK7jvOaYWrCj/r0I36uQBn7J2EjIFxqd4QZiH
	 yJ350qVxghZnVt05/JaZq+G8C9pdSlpnaupzZhVWfNIETf5Y+tz10AcHinO96Nrb3M
	 2Ouy3hKXb6wBdX5tFsouBw/PHZh1IzmhlfmxSwANt6rtvORGEs7C1PU8qUm0pm3sdK
	 2jlKnZIv7lCgQ==
Message-ID: <26145766-d6c9-468b-a4ef-78b776fcaed8@collabora.com>
Date: Mon, 20 Nov 2023 12:49:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dt-bindings: arm: mediatek: mmsys: Add VPPSYS
 compatible for MT8188
Content-Language: en-US
To: =?UTF-8?B?WXUtY2hhbmcgTGVlICjmnY7nprnnkosp?= <Yu-chang.Lee@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?R2FybWluIENoYW5nICjlvLXlrrbpipgp?= <Garmin.Chang@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
References: <20231120100258.3428-1-yu-chang.lee@mediatek.com>
 <6bc4fa28-a98f-46c7-b315-7366307b5206@linaro.org>
 <77302f50b5c977011ec26be7a04fa3c6c63653c6.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <77302f50b5c977011ec26be7a04fa3c6c63653c6.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_034922_036673_2D5555AB 
X-CRM114-Status: GOOD (  13.29  )
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

Il 20/11/23 11:26, Yu-chang Lee (李禹璋) ha scritto:
> On Mon, 2023-11-20 at 11:09 +0100, Krzysztof Kozlowski wrote:
>>   	
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>   On 20/11/2023 11:02, yu-chang.lee wrote:
>>> For MT8188, VPPSYS0 and VPPSYS1 are 2 display pipes with
>>> hardware differences in power domains, clocks and subsystem counts,
>>> which should be probed from mtk-mmsys driver to populate device by
>>> platform_device_register_data then start its own clock driver.
>>>
>>> Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>
>>> ---
>>> Change in v4:
>>> - Squashed binding patches
>>> - This patch is based on [1]
>>> [1] soc: mediatek: mmsys: Add support for MT8188 VPPSYS
>>>    -
>> https://patchwork.kernel.org/project/linux-mediatek/patch/20231117054345.15859-1-yu-chang.lee@mediatek.com/
>>>
>>
>> This probably should stay part of previous patchset. Why splitting
>> it?
>>
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Best regards,
>> Krzysztof
>>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> Thank you for your time and effort. I misunderstood that you want me to
> send the binding patches as a independent serie in previous discussion.
> Only until now I squashed them, but the driver patch has already been
> submitted... Should I resend all of these pathes as a serie again?
> 

For this time it's okay, I can pick those separately... but for the next time,
please, yes, the two are related so they should go in one series.

Thanks,
Angelo

> Thanks,
> 
> Best Regards,
> yuchang


