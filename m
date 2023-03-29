Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB4CC6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 13:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZArf/KEBhCl4uF4GSqJ6He5uaQeHSjZWQF+06G3ZX4=; b=kTfPjC5l3GWiQjvDhl9MuFL/IH
	fnVDJ4UVGm3li35XnP2UuvSTDHAeU7mbCopXNWJRzp/DcGA/SHSlggaWQbwUD6yHvPawxVylaVgn/
	oTUeX05jG7cdpKW6XzMIhjmRKuBhlCQ2u12uGYjGDaRI3XTykuyar7RePEnw/+AAVcGPfJHjXVeEa
	DKgZRWy4YzXuCf6u9rcQOlBNcsDUghqbPoheqW2Y8ClMR1OGvOLdqUGOC5fbMUUoX4V4vuencrKuD
	9yAd6gZ06NgQParPAB/2uAlsaqP2Umvc/4d6C5+ylZT/hzmm7P839KrZ83XSwiF6BGd1R6a1bXN1u
	KpVERFkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phVsC-000PPf-17;
	Wed, 29 Mar 2023 13:29:56 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phVs5-000PMm-1M;
	Wed, 29 Mar 2023 13:29:54 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 27F036602173;
	Wed, 29 Mar 2023 14:29:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680096588;
	bh=EOpnX/dcQ/BbXzds0SG3hg5cL//fXhc2G0DAUpgv+q4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ICmRH+yKTLVAQGmS7JSUDaSjWqxemU8uS0ZXU5qKpq2ec7nQTj9iX7uLN/4JDmeP1
	 RKBQWhLfz3J+0iKmi+7G/Vu7WtCIzsNVKRE1sEuYWUQ3MZpsVqw24vH4LlPtPsI3+i
	 4lWRtkIJjxMFmlxKkHYIl/X7XXHlXK34krkET1Jwp+TK1ugflp7ieaLf4GOzB+fW4d
	 gxHQ6BkVXpRRuhWK14Z9IrPGeScbPuaON9zHD1KM8c+Nm2dku5sXbWvBL6jKfiYRTx
	 xo7uLOQPQI/cYSjm909+Zh5z//qBUXJMNK8LQ3PrNa5iJyJmZWV2Q8gHHkMGjNVY1u
	 Pf5omuY/LfRLw==
Message-ID: <8e894763-6589-79ef-1e75-67f546013a2f@collabora.com>
Date: Wed, 29 Mar 2023 15:29:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 16/17] arm64: dts: mediatek: fix systimer properties
Content-Language: en-US
To: amergnat@baylibre.com, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
 <20230203-evk-board-support-v3-16-0003e80e0095@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230203-evk-board-support-v3-16-0003e80e0095@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_062949_589239_5656990A 
X-CRM114-Status: GOOD (  11.05  )
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

Il 29/03/23 10:54, amergnat@baylibre.com ha scritto:
> From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> 
> MT8365 has a SYST timer (System Timer), therefore the compatible node
> should be "mediatek,mt6765-timer" instead of "mediatek,mt6795-systimer"
> (which corresponds to ARM/ARM64 System Timer).
> 
> Plus, register range should be 0x100 instead of 0x10.
> 
> Finally, interrupt polarity of systimer is LEVEL_HIGH.
> 
> Fix the above properties accordingly.
> 
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



