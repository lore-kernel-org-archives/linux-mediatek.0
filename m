Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604A9C52D7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 13:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SzS/ehIWuRMlUc8ksey7YRGqwt45uD56MBnzHufPYo=; b=tYAR7UcjPPKEIqPhV6U6boCpJL
	gGlcGiJ+/0fTL6RY0YWV/11NzdOwqr0sejfe9aaJpfszcTAQoGVaRFQOrQUAalVrNccuzXq7MAuj9
	auCzIAXBCRhhzcazE+GTlH5piUFgq/bX8C1w4VZOm4XPIDQUa5LeffkYTjZjlpPDV90XBWqNSnyJA
	dnfmlYFkTggoAlEllT3/muHgPoYNUUBbURHnTWxkKJCWY1i5AXQeZOhcvUGSiVndIMezZv5ng44Dv
	fjFdyJLTDebPMXiNYDhh15U0SVZMQjhGFgHKMvYf3IWMNEfgr7VSKB9wrVUvrDEIxJf2YjOwA0BSG
	uUH5r0AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh7o2-0000000Cv21-3fi2;
	Thu, 22 Aug 2024 13:24:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh7n7-0000000Cuiy-1k7M;
	Thu, 22 Aug 2024 13:23:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 947CB6122A;
	Thu, 22 Aug 2024 13:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8568EC32782;
	Thu, 22 Aug 2024 13:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724333032;
	bh=P8fGI17fBYSUR6JP+2SBG3qvob6J8CR4tBanfBqwSGc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CGBhDaiMw2PCzbV69OVFQ0ASgOFCZlBCVU//h7NPdqWhY2mrxJnSxoIwGfLoT9Tx3
	 vPNsvUZPxmFVRp1GootR00vw7jSBqjx2BHZ/+HBY0MLM1wzC/zocgeAI8J+frkmbhL
	 QkBm962Y83FwnEqbMk5KRUTYG2ItWkAqgJjfMD3X+AnkWlLKzzf7IWTTwHlqBjiCka
	 SYdfHF5DfvTZXWiBNj1D7vDVKMwRE2Whb7scaT0G3YiVhntKEL6to6I2FrMLDKoMX9
	 Y5eeHKQ+QZue8gk/gFL8rDQAmp88wwQ0bulTzjnBXHrTKDMJsEmtalHP9M120qHE/y
	 M4Vnhj3kUUSsQ==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Riku Voipio <riku.voipio@iki.fi>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
References: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
Subject: Re: [PATCH 00/17] leds: Use scoped device node handling to
 simplify error paths
Message-Id: <172433302926.1317537.8444655210561506833.b4-ty@kernel.org>
Date: Thu, 22 Aug 2024 14:23:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_062353_567131_D0DBD8E8 
X-CRM114-Status: UNSURE (   8.14  )
X-CRM114-Notice: Please train this message.
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

On Fri, 16 Aug 2024 17:31:32 +0200, Krzysztof Kozlowski wrote:
> Make code a bit smaller/simpler, with less of_node_put() thanks to
> cleanup.h.
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

[01/17] leds: aat1290: Use scoped device node handling to simplify error paths
        commit: 1e63395e58b2b1d0105bb5ffdb1e5d7400a4be82
[02/17] leds: ktd2692: Use scoped device node handling to simplify error paths
        commit: 700b6c984b418c04c63a54f67b6758b81016f0e3
[03/17] leds: max77693: add missing of_node_get for probe duration
        commit: d225d436f7baccde74ad80d9dc7f08e1271b8473
[04/17] leds: max77693: Simplify with scoped for each OF child loop
        commit: 05c2f554d1edd6399720e8f8097e9165dcf17044
[05/17] leds: 88pm860x: Simplify with scoped for each OF child loop
        commit: 6c17a9a8991cf1f4e0767c2a8b3c110ea34e1019
[06/17] leds: aw2013: Simplify with scoped for each OF child loop
        commit: 073f016511913e2ea6c52e5d77d33a8cb03c4424
[07/17] leds: bcm6328: Simplify with scoped for each OF child loop
        commit: 6a1d796e70c703a7557c7ef21304879de85f40ec
[08/17] leds: bcm6358: Simplify with scoped for each OF child loop
        commit: c57ba40ea1e78bbf544ec667a9e0f885a8957f5c
[09/17] leds: is31fl32xx: Simplify with scoped for each OF child loop
        commit: 2c37529ee95d06ab44613572bfa474413f9a5b58
[10/17] leds: lp55xx: Simplify with scoped for each OF child loop
        commit: 9d4cfee092ecdaf98f255ee61d094334ddf9f110
[11/17] leds: mc13783: Use scoped device node handling to simplify error paths
        commit: e98a7f1fb9296733855347a98b1cac16e70b7ed8
[12/17] leds: mt6323: Simplify with scoped for each OF child loop
        commit: 84e2b97f87b8bc7dde90555ef29ac5eae27b3c8e
[13/17] leds: netxbig: Simplify with scoped for each OF child loop
        commit: d3f5f674058f5f1d93d9402c79f56684d81e5993
[14/17] leds: pca9532: Simplify with scoped for each OF child loop
        commit: af728722d7a1d81dd38bdf9a646fee84aefde901
[15/17] leds: sc27xx: Simplify with scoped for each OF child loop
        commit: 42476bce8d78eeea5057f34738daa8236b9912a6
[16/17] leds: turris-omnia: Simplify with scoped for each OF child loop
        commit: 122d57e2960c81b6916a5ebe44bfb8c14ebe81de
[17/17] leds: qcom-lpg: Simplify with scoped for each OF child loop
        commit: 9557b4376d02088a33e5f4116bcc324d35a3b64c

--
Lee Jones [李琼斯]


