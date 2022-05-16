Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CF2C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 08:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BaAvY8aXxXyYp+nSBfYbBJFN9prLWUddxSPaAEb7JpI=; b=COYYBZJzHt8S1+
	yYanNJpuqcgQxNdONdLvC0JAxLk7fEOA9SbzPjJljSs+7rAQJsTwxACxT6AMq3xmeRMa/H4AecTjx
	oso2Ov15BjjfBPqbJjkVYkdyqDC8k2H6niGtcAEMB3I5M//+u+2TN1ioQ0mdN4JYEqHXSqIWuUX3F
	6m3tqptYK3kBd93oh4O2q7ZvCS9/0G5RPniRFSW/qfiQrf9iw3283ceKXj3MDFQBhRgSMwF1ODeaU
	Bc+y+eVZDDryqLn/iKwyD+5LatdxfM5QSDInR4SqBk7x2H4G9VPTgMa7YTAOALljOYwoOjtfO2YVo
	fX6TLTTBLzzIPBzd1lmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqWSO-006kkR-2G; Mon, 16 May 2022 08:52:00 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqWSD-006kiB-2a; Mon, 16 May 2022 08:51:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8F8C11F407CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652691107;
 bh=gV9kB7ivZNyAdhSFNP1wk4K4CwcgA76yv2I+a7JWfyg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YoFKzksDbBZNLg5EvKENN0GqsHSebAGPsYmisWzx/3PKbAn+FxzB1wSvHECYq75z0
 2CrtSBGa4usFd2gFvY35Ld/+ec2frrs6NJtvafPe8B4Z9/HQpDr1sLWIUFFRGNUazb
 c8z2LV3fPBryI42a//xFvhkD/8sIJIZldQGpGqzrX1uPidLBW6pKIzVBTliXJ3MQSY
 V0K470gXhu3Ydl9xoSWZKHUxGk1PrXWv0TwGBPu6hWb/GYj+6dRLSyvUtcgn1JHHqS
 Vh+QtQqE+jSuQgV8I2QLruXX35ODzyrRWauKwQSk3syvwBVq9FVD5bbi9dOp+JTzX6
 uXM5G0La9lXMA==
Message-ID: <0f303425-3b12-7573-b201-030d4d044db8@collabora.com>
Date: Mon, 16 May 2022 10:51:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 5/7] arm64: dts: mediatek: mt6795: Add fixed clocks for
 32kHz and 26MHz XOs
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com
References: <20220513171617.504430-1-angelogioacchino.delregno@collabora.com>
 <20220513171617.504430-6-angelogioacchino.delregno@collabora.com>
 <03e99a02-1233-3882-e1e5-24ab1bbaf257@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <03e99a02-1233-3882-e1e5-24ab1bbaf257@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_015149_295895_C98E58F8 
X-CRM114-Status: GOOD (  13.34  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 16/05/22 09:10, Krzysztof Kozlowski ha scritto:
> On 13/05/2022 19:16, AngeloGioacchino Del Regno wrote:
>> Add the 32kHz and 26MHz oscillators as fixed clocks in devicetree to
>> provide a good initial clock spec, since this SoC features two always
> 
> I don't understand that part with actual patch. You claim here you add
> clocks, but in DTS they were already before.
> 
> Additionally, these clocks do not belong to DTSI because, AFAIU, these
> are properties of boards. At least their frequencies should be moved to
> the board DTS.
> 
> 

I should reword the commit description to be clearer, sorry about that: I
went with "exactly what I've done", but looking at the actual diff, it is
just a rename. What my brain was ticking on here was about removing clocks
that didn't really exist (uart_clk is not a fixed clock, etc), and adding
the ones that do exist.... but then again, the result, casually, is a rename.

In any case... no, these clocks are not board-specific for two reasons:
1. AFAIK, these fixed clock outputs are from the SoC itself, not from
    external components placed on the board, and
2. Even if these were from external components, the SoC *needs* these
    ones to work and any board that doesn't have these fixed XOs simply
    wouldn't be able to work.

Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
