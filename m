Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D707C6FA89
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 16:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kR3h2h4j3xOvSN7DGLJjW4YQar99ZXCEZr2kTlB9pYc=; b=ogo+caUKKc7ztl+0y165r4YHiC
	SU++46uI78QiLfUsUDsJsp+TTW0krxGz+wJLO9a98dNxSvRAXeJuV1+CSOJLyQzUFX1dfSPwHgirl
	6qaIHe9uVQdT0FRSVMBTkjpgYZHHqf3erX7oGD3qssTNQE/lI7m9HJeBMmBbXzC+/zUNN1Qo3XlgT
	IZ9zDlryHPauvLR5Dm6huKro/l+jTPTzkTpRZX8zBQ+xbORZojpDSqC3Gj1saEuTA598LeBxfFg3E
	VNJvRI9THG2ZKLnD1xGvhQIrDsn9qzh/pardIpZrBQ8/8sAQPu5s98LfnIVqVKTH9WAUrQXp+58nx
	IRRDjR+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYrd3-00DRS6-Fd; Thu, 15 Sep 2022 16:22:17 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYrcZ-00DQiu-HB; Thu, 15 Sep 2022 16:21:49 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 80E2C6601BB1;
	Thu, 15 Sep 2022 17:21:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663258905;
	bh=Z5N5FX44YimNiJSczF5hZWEdAZshfEyrSoqz/isyZe4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nUC5r/nansvPFsy1DZP/Nw1dA1VwK9kbcBlqQ3NqLgg2/R7O7P+qYinPhF6rc9yZJ
	 16lHboarvLcD3ASLmvrbPzHXZOxYYnPm86yxMmwjjrK6yntlGWmoWuHlGfbLf4H6Wu
	 ZisTbEy68c2EuCZzScMC10ZLbjUTWITJpUMhaLLLgH3ZYkLzL6Rvx8BFQtPx6OH+2/
	 LIEYID9wpXcIg3T/uIYu0unmscu23G6YdVUFKJM98UEkrcU6HnBPoALbf1jREGMBYU
	 vKmkNV8PyWYb23tsGqPBFm0wd2qIajM1OFWDcD4gkJWMg0I7UdLc1IeArSHGFXJ0bG
	 s+fkZM0WJW/mQ==
Message-ID: <9af70465-6923-d625-fe08-7cd66d3775c8@collabora.com>
Date: Thu, 15 Sep 2022 18:21:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] dt-bindings: mailbox: Convert mtk-gce to DT schema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org
Cc: jassisinghbrar@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, houlong.wei@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220915101716.70225-1-angelogioacchino.delregno@collabora.com>
 <04187280-3c35-c9ac-fc70-b5066108ac0c@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <04187280-3c35-c9ac-fc70-b5066108ac0c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_092147_839193_8BF0F956 
X-CRM114-Status: GOOD (  12.71  )
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

Il 15/09/22 17:30, Krzysztof Kozlowski ha scritto:
> On 15/09/2022 11:17, AngeloGioacchino Del Regno wrote:
>> Convert the mtk-gce mailbox binding to DT schema format.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../mailbox/mediatek,gce-mailbox.yaml         | 104 ++++++++++++++++++
>>   .../devicetree/bindings/mailbox/mtk-gce.txt   |  82 --------------
>>   2 files changed, 104 insertions(+), 82 deletions(-)
> 
> How is this related to:
> https://lore.kernel.org/all/66591c84-ee8d-7152-f0c5-5e4a07f632fb@linaro.org/
> ?
> 
> Changelog? Previous review tag?
> 

I completely forgot that I had already sent something similar in the past,
so that was done from scratch :\
I always keep note of what I send, what's accepted, what's not (etc) but,
for some reason, that older series wasn't present in my notes.

In any case, the older series wasn't just a dt schema conversion, but also
changed how we got clocks from the driver, while this one is only a
conversion and nothing else.

Regards,
Angelo

> 
> Best regards,
> Krzysztof



