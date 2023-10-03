Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A803E75433
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 08:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0bk8SC8ltokUtazyS0oTOeONL9B/Sn464p1/DftEHMw=; b=wJniD+y6C2Vcdw
	oCVfjKIu/kgyZAyExCK7oARRcvD7VwipG9d7BXSJ14yFCxPP1soiqMcYcQZlap8uWh0UWOfrxxReb
	wzjvplsL0n2CWFjDQEDahv93TsFZTe2/xHeCVEEW1GKKluOxlmFTov6dHs8/9O+qOgxNuTDxrND4r
	HBFKR644Q8KuLOaDSHGm16yKO5vz8DzACo/LF3E5QwDwLzNaUY5tJPdjm55n6VILxr7XD1wATDhNM
	mSqyzIXJhbw09Aw+Lmyq9x7U5hpwXPuSL++GHVzv1nB4VZonWxgLWyF3xlrMMq1v8MmZmhECRhWCQ
	TZ+ebfDEF4suT4TqfAIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnatD-00E9rp-2s;
	Tue, 03 Oct 2023 08:36:23 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnat9-00E9qK-32;
	Tue, 03 Oct 2023 08:36:22 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 013D16606EE0;
	Tue,  3 Oct 2023 09:36:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696322175;
	bh=SViJ5J9CMGr2sf0Etj/ajk/FEUe0ldzSz/SBtVJR1CY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nyX4WA7uzIcmi5pybEkyZnUwPiTBFzZYejRx/MLOlcfkl6XywcQildvHrg8AQmmkq
	 zcxfPSuah6Z6eGD7q6RGIhvHPHxmKtnhZ9R6Z3ypU1EumEY7487FfWFIK7zwmdgW5Q
	 FdXEs749Ch24rAKkHbiNOhHSMUP/m7yC+SdOc1orYw3Z12UmXz4aMFdDbYBCRemW98
	 Fn9zzW9oNPWyrerZNoW1ZNMtxrmHUKn7MjknT6DgOaSi5vjCZN9/CGymiPIYxkbqft
	 T3BdgzWirXH7mwybgThh4Sa13MWRaCRDoPHOaU53eSi1HTCUf/VY5uLAgl3hUu2QWM
	 3NcqMHT9t5EiQ==
Message-ID: <23f32b2a-a1fc-da13-e36d-c385abaa9d78@collabora.com>
Date: Tue, 3 Oct 2023 10:36:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 2/2] arm64: dts: mt7986: fix emmc hs400 mode without
 uboot initialization
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230629184318.551317-1-linux@fw-web.de>
 <20230629184318.551317-3-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230629184318.551317-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_013620_129509_AECD408D 
X-CRM114-Status: GOOD (  11.62  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Eric Woudstra <ericwouds@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 29/06/23 20:43, Frank Wunderlich ha scritto:
> From: Eric Woudstra <ericwouds@gmail.com>
> 
> Eric reports errors on emmc with hs400 mode when booting linux on bpi-r3
> without uboot [1]. Booting with uboot does not show this because clocks
> seem to be initialized by uboot.
> 
> Fix this by adding assigned-clocks and assigned-clock-parents like it's
> done in uboot [2].
> 
> [1] https://forum.banana-pi.org/t/bpi-r3-kernel-fails-setting-emmc-clock-to-416m-depends-on-u-boot/15170
> [2] https://github.com/u-boot/u-boot/blob/master/arch/arm/dts/mt7986.dtsi#L287
> 
> Cc: stable@vger.kernel.org
> Fixes: 513b49d19b34 ("arm64: dts: mt7986: add mmc related device nodes")
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



