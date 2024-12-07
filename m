Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC51CE7716E
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2024 03:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Cc:To:Subject:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJ53yZUv5qWn3FKAR6sSyKcUASeqiB2DCBVhCzW2Yw4=; b=pKvfEMMpyEXmu7PxkxsJ3iLcQ8
	lyllFaMWe/L4oLT6Mq+2KBKHXakwEV5BdpFA0H9TFbLRya757shpZfpjNYw3Rhz143HfwW7iUU1Mq
	pX4eNSdGNLC4rbO8ifvlzHXb2hK4rnbIGZY2RRlAFmuPKBsEmhvsU9PuqQifH3cMOgBKTnKa3bKBJ
	FpiKCL0fOidCLmkeLYIDRWkHdgUfhx6G7dw6D2BeRgQjafX/rli3ZoAu3vsF5e5J9kQF9ZAvbwfAZ
	RL4ZpsLyTA2K8thH7c6T+3iLVRbPE5MbSsniUo3ghBPlpZ0iNrkF3HpeMd6xBnFzMbTFn2jokjvAC
	051TRPQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJlG4-00000003FWl-0suh;
	Sat, 07 Dec 2024 03:13:28 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJlF5-00000003FQj-16yU
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Dec 2024 03:12:28 +0000
Date: Sat, 07 Dec 2024 00:11:55 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1733541138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CJ53yZUv5qWn3FKAR6sSyKcUASeqiB2DCBVhCzW2Yw4=;
	b=VEtfrcrmScEb9ksaohHhM8XVmH+Le2ZPpCe9L7OD7V3L3oy/wrpOxfUAKBhKBGGyykeR+G
	+aJh+kLm0NAc2sj7XMwYqEm+wfUhLGJf+tzJrWRLwwqfsB8pvPUaWBB18X6rdugCAtz/io
	6Yflt6LSmSoTiarAs2tdOxbq7UQCx89nBCAZlLsMBdTl92T95hd967srl5XJfruyCDVRK2
	vlaEurX+6t/qIjO6lAVl2Ypzv9/lbai4c+2ILF+YtQuieYMrgRpAX3HR/SGkzLq4z9f+dV
	OURLJ4EuNZt8GJSOwK23HUdWI8X5Do3Ck8OJmx+QXOoyT+iovZ9L4555WStvgg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
Subject: Re: [PATCH 0/5] MT8516/MT8167 dtsi fixes
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Fabien Parent <fparent@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Message-Id: <VVS3OS.MZCWW6ICFFUB3@packett.cool>
In-Reply-To: <7bf536a5-30c1-43d8-9ea3-3aaea65c6b0a@collabora.com>
References: <20241204190524.21862-1-val@packett.cool>
	<7bf536a5-30c1-43d8-9ea3-3aaea65c6b0a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_191227_434266_25A2A16F 
X-CRM114-Status: GOOD (  22.59  )
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


On Thu, Dec 5 2024 at 01:27:01 PM +01:00:00, AngeloGioacchino Del Regno 
<angelogioacchino.delregno@collabora.com> wrote:
>> I strongly suggest you to also send one that achieves basic boot 
>> with UART console
> as a first step for upstreaming your board, and then go for 
> incremental changes
> everytime you get a new feature working.

Wanted to get the PMIC in first but sure, could try splitting out the 
initial version without the PMIC.

Oh! One dts/dtsi question: pretty much all MTK devices so far have all 
pinctrl configurations defined per-device. But on this SoC, pin 
assignments have their "canonical" function in the pin name e.g.: 
MT8167_PIN_58_SDA0__FUNC_SDA0_0 and on this device they are used as-is. 
Would it be fine to place these default pinctrl configs for SD/MMC, I2C 
etc. in the SoC dtsi?

>> Generally, if the patches are only simple additions, you could send 
>> the original
> patches without any author variation (and fixing that 
> MT6392_IRQ_numbers enum
> in the original ones because lower case please!) and then your 
> patches on top
> with your additions.

Right, I was mostly unsure if the email workflow supported just sending 
someone else's patches, but I guess that was silly - of course 
git-send-email should do the right thing!

> The upstream driver just gained support for configuring the display 
> paths
> entirely in the devicetree as those are obviously device specific.
> 
> You can make use of that for upstreaming your tablet after adding the 
> display
> nodes (and bindings, if required) as if you go for the default 
> configuration
> that's probably not going to work because it's for the pumpkin boards 
> which
> will most probably have a different display pipeline compared to your 
> board.

The pipeline seems to be the same.. The pumpkin board was brought up 
with DSI as well, the main pipeline I can find in the Android source is 
the same (+ PWM).

I am still struggling to get it to work though: DSI command mode 
configuration gets acknowledged fine, but in burst mode, the vblank 
never arrives. Tried fiddling with various things (CMDQ or not, mutex 
as vblank source since there was an Android commit doing that, etc.), 
nothing helped.

>> By the way, is anyone familiar with PSCI cpuidle/hot-unplug issues on
>> Mediatek Android devices from around this time? [..]
> 
> I did have some issues with an older bootloader on the Xperia M5 
> smartphone
> and would even lock up at boot, because on the old firmwares the power
> domains for the CPUs are not managed automatically by FW.

Interesting, thanks for the pointer!

In the Android kernel sources I could find though, there are no CPU 
domains in the mtk-scpsys-mt8167 driver, and the only references I 
could even find to the related register bits are from code that *reads* 
the status of the CPU power domains to make decisions about sleep 
states (only_one_cpu_online in mtk_idle). Trying to add those to the 
driver anyway, did not succeed so far.

~val




