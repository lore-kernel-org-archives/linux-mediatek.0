Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0ACAC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 12:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJUFdR/T3fk+7q1z81V/QYA3AidCEQ3jro3FXKsX6OY=; b=HTHwWPEw0OWopsKy7JgyBfDtaj
	63spCZOeu9tsm58t4Suz1LgGSYo8Q5OxN6mUeYyJtnEwJQyqJcCfKsbIN5uAMyWc6PqVhULng99zj
	vTtojgQfOCkI5r2Ns4N+8NP9+mBMWG+znmm7OBM1sqXIJNOVqTp6e4sG4WrRvfrmJ1eN/B6mD0Vbu
	mdIrQQjb9TZYO+fHOQyhTq+3CzfdrFiNTgVjXZsoHFVZ5PYl3BG4OhfojT8BlMAiBXgYz0JlKsf6h
	Ys27R7+8iJUOobva/FtE67YbMmy/MOcMIbUd8usGTfVazfvx+xad+a4M2j24+DRoDF4xsR+kUox/h
	8iZUAUBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBDdq-00CoP9-22;
	Thu, 07 Dec 2023 12:38:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBDdk-00CoJH-0G;
	Thu, 07 Dec 2023 12:38:07 +0000
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4B8BC660738E;
	Thu,  7 Dec 2023 12:37:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701952680;
	bh=4FannGmPzD8CTNLgg1c0SxMxDgNTQfia5dxSGdeJOck=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BWy5jkpBBuyQgLvhL5xgoDA6sGW8Hh0NrDwPp+9690sCYRgTkbe5jzuTtvVauJv9C
	 E6zkCC1unRdDhsh1YjP7p8wIVi+MoxzXbDeHBbw+ZXr4wKpzUafWyqZh7wqlOOoPcN
	 wN5Oer8NUorVHwS6sW9Y6l5LNMaddcevFU9eeMEZfUz8TUECdMcmOQYINpQ2EwHc9b
	 2hwAbOQ6UYUT3nPYB2vDne/g0l17Kf8Nd0vknwqR5R1YQqP02jE21d+wEzp50D90Uv
	 8a9LZBfe93dhdYQyW+vcV5fJ07yNtMvAvcBBFTRpzSFaN5V5Yno2ijptpi2/rLOLKo
	 kwsqlGAEKKI/A==
Message-ID: <6c7c65a1-1398-43fc-8036-d901e8bc0934@collabora.com>
Date: Thu, 7 Dec 2023 13:37:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] mmc: mediatek: extend number of tuning steps
Content-Language: en-US
To: Axe Yang <axe.yang@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Wenbin Mei <wenbin.mei@mediatek.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20231207063535.29546-1-axe.yang@mediatek.com>
 <20231207063535.29546-3-axe.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231207063535.29546-3-axe.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_043804_291048_47F492D3 
X-CRM114-Status: GOOD (  19.55  )
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

Il 07/12/23 07:35, Axe Yang ha scritto:
> Previously, during the MSDC calibration process, a full clock cycle
> actually not be covered, which in some cases didn't yield the best
> results and could cause CRC errors. This problem is particularly
> evident when MSDC is used as an SDIO host. In fact, MSDC support
> tuning up to a maximum of 64 steps, but by default, the step number
> is 32. By increase the tuning step, we are more likely to cover more
> parts of a clock cycle, and get better calibration result.
> 
> To illustrate, when tuning 32 steps, if the obtained window has a hole
> near the middle, like this: 0xffc07ff (hex), then the selected delay
> will be the 6 (counting from right to left).
> 
> (32 <- 1)
> 1111 1111 1100 0000 0000 0111 11(1)1 1111
> 
> However, if we tune 64 steps, the window obtained may look like this:
> 0xfffffffffffc07ff. The final selected delay will be 44, which is
> safer as it is further away from the hole:
> 
> (64 <- 1)
> 1111 ... (1)111 1111 1111 1111 1111 1100 0000 0000 0111 1111 1111
> 
> In this case, delay 6 selected through 32 steps tuning is obviously
> not optimal, and this delay is closer to the hole, using it would
> easily cause CRC problems.
> 
> As per mesaurements taken on mediatek SoC platform, the tuning phase
> will take:
> 	eMMC	- 32 steps: ~3ms
> 		- 64 steps: ~6ms
> 	SDIO	- 32 steps: ~4ms
> 		- 64 steos: ~7ms
> Tuning more steps won't prolong boot times by any meaningful amount
> of time, so for SD/SDIO the default tuning steps will be adjust to
> 64. But for eMMC, it is still preferred to use 32 steps tuning as
> otherwise there would be performance lose when accessing the RPMB
> partition(requiring retuning each time).
> 
> You can configure property "mediatek,tuning-step" in MSDC dts node
> to adjust the step number.
> 
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



