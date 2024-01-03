Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB7BC47073
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jan 2024 13:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=10ywBqMwsG/ZpjjGiJJJq+HyVWwg4cHTziY0djq4/zI=; b=1n6FsNZAlLWaQN
	eOCB88MG+njsPrzoTbdbFcB70nv5XnZlFAa5DTGeVzWl2ClIaEG9A3MuyxY0mL/f1eA8Rhj5+oySi
	BZr/o+tQU79YPsn3MgnXV+421JVxY8KMBeGT34z2JoTisODeRu4g8PR9GhZc84KucQ6L2fW6+BTfq
	ggGWxboQ1Lt8hWr4YaZB/3O8BzgQIfTK0Cqhes83tifkKdkypqKrmykuui2Ydq2Lu6I5Cv7svSt/8
	X+zBDAUR952QqtmNaiBF2AoukjLxQ474VStCdEcPIet6TA8j4MlypJX4KAOI/59FFBDpzRrKy2CaH
	kcHmnxiE56BJzAEBfkZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1iM-00B1x5-1H;
	Wed, 03 Jan 2024 13:55:22 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1iH-00B1ur-33;
	Wed, 03 Jan 2024 13:55:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704290116;
	bh=Y6SN+zcURs1UQAKNCimkS1H11ol49Zpgfxhql3MJ7i4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OEbrY+he1zb30qR2uQrvQ7dcOwSYSQT8qymnjLa+upsc7Ez7ryen9zJPWA7Vi7Du2
	 /f3Hv1g7ttdlDMUx5KjYcfDWy4PoqXPh6KFTfjiuyNiyJmA3K5ynqX0fn/jujtmPnd
	 2qvDB7kqHEG27Mh72zuXfdZHwPrrEarrjEHQCm4uS9U2LG1G7H9b61HFiGucA2JqXR
	 R3C8ZUEOrF51z8WD763tPE7Fp8Hd84FgregzilTRwqZ8ib05L8/4YMjiIJEFnwFYS7
	 w5vEBCoGzRk2e9cHaUxfvLn+S/NNYj5HQaykQMIkeSNB5Ej9FHN7kWInPbQL03iSXO
	 FgKZVkWi7x3Ww==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0687C37813CB;
	Wed,  3 Jan 2024 13:55:15 +0000 (UTC)
Message-ID: <796f2535-9b19-48f9-933a-00d181564c1f@collabora.com>
Date: Wed, 3 Jan 2024 14:55:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt7986: fix reference to PWM in fan
 node
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20231116130816.4932-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231116130816.4932-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_055518_221917_00E65D2B 
X-CRM114-Status: UNSURE (   7.62  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 16/11/23 14:08, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This fixes typo and resolves following validation error:
> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: pwm-fan: pwms: [[54, 0, 10000], [0]] is too long
>          from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#
> 
> Fixes: c26f779a2295 ("arm64: dts: mt7986: add pwm-fan and cooling-maps to BPI-R3 dts")
> Cc: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



