Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71425C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 08:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xm6NlF3I7IBcYIFROmAEnnlr6XMx9qR//dGw47Crdcc=; b=RsAGyIgV1/Hr6SltbxyVSNPouy
	sDk4FrUIq1HWtS/P0LZR4OAaAL7aYXf6QQNhmlqeCim6SV7kgftn1w+UVU5KVNx403EROLghdBytu
	5QciLLLuCIryABIlctpp67oX2383q8JYsFhE1xTsQMUaQzHFzUkT9jKJNm22pSR8lxCTk1HqGmGSr
	JbyxbbxA17DCgK5G1lLCfF2JFfCStkfcm++ZVCA6DC8PKs1erYKY2Tf1HQp7CYNvRnpCAOB6aDEZN
	9NMqPvkDBfiFgyrqp8BNkwezDShwt7qhBKMMFmsL1lMHd164nX260OkThDzNBRWIw014A++b3rufo
	G5c/WPWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jcX-002eAT-3L; Fri, 08 Jul 2022 08:45:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jcG-002e1c-7x; Fri, 08 Jul 2022 08:45:37 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CE32366015BA;
	Fri,  8 Jul 2022 09:45:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657269928;
	bh=nL4EphTxTGIn93JKt1KWZWPGficfXAV2gqP5apqt848=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S/tslfd35NfROb1/gP9GcNLN4NQ/6dH9fx0Uy3IpVBAO3wpMiTDiLLgKG2TTw5UFO
	 tVTnvB9Zg9WxJ3bhEcmLy4JNQI5Kct3gTnDyDoXo3SD7DNrrOBDHwj9j2KEf9Wp9Ow
	 2URxBRLhdef2HoME8wIOdN9rlYFL3cdrq2QQ92yo9HPjitetMu1kz2G7hXlTh/ejP2
	 J/nFmlvS6y4OMBHnHDdXLA1xU1TE2tmfAMO4iNtjimWyZJ0ZWlmTSIzUocq6+q20ZM
	 ox8KOEf38ZCMM0r7xGUrckoJ7x1SjEMeNqCf2WFQcP/ui5uUc0KR3iDsVhORuYnJ9k
	 1WnwqbQzoeBLA==
Message-ID: <217695f5-55d3-e347-ea04-d30aaee6e712@collabora.com>
Date: Fri, 8 Jul 2022 10:45:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 0/2] MediaTek SoC ARM/ARM64 System Timer
Content-Language: en-US
To: daniel.lezcano@linaro.org
Cc: tglx@linutronix.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org
References: <20220613133819.35318-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220613133819.35318-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_014536_489156_B9807EDD 
X-CRM114-Status: GOOD (  18.74  )
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

Il 13/06/22 15:38, AngeloGioacchino Del Regno ha scritto:
> In an effort to give some love to the apparently forgotten MT6795 SoC,
> I am upstreaming more components that are necessary to support platforms
> powered by this one apart from a simple boot to serial console.
> 
> This series introduces support to start the System Timer for the CPU
> cores found in various MediaTek SoCs including, but not limited to the
> MT6795 Helio X10 - and will most probably unblock many developers for
> the upstreaming of various platforms.
> 
> For a broad overview of why/what/when, please look at the description
> of patch [2/2] in this series.
> 
> Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.
> 
> Changes in v4:
>   - Changed statement in documentation, now saying:
>     "MediaTek SoCs have different timers on different platforms"
> 
> Changes in v3:
>   - Merged mtk_cpux_{enable,disable}_irq() as one mtk_cpux_set_irq() function
>     as suggested by Matthias
> 
> Changes in v2:
>   - Added back a lost line in commit 2/2 (sorry, commit didn't get amended...!)
>   - Tested again for safety
> 
> AngeloGioacchino Del Regno (2):
>    dt-bindings: timer: mediatek: Add CPUX System Timer and MT6795
>      compatible
>    clocksource/drivers/timer-mediatek: Implement CPUXGPT timers
> 
>   .../bindings/timer/mediatek,mtk-timer.txt     |   6 +-
>   drivers/clocksource/timer-mediatek.c          | 114 ++++++++++++++++++
>   2 files changed, 119 insertions(+), 1 deletion(-)
> 


Gentle ping for this one - I need it to start upstreaming devicetrees for
that MT6795 Xperia M5 smartphone, or it won't be able to boot.

Thanks,
Angelo

