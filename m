Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAF0C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 12:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZzlL4+GUeAi5VK82OoQwobZs+dOmPCkge97s4u9RYQ=; b=4BANViiD/l074alBdD9Hhz6jkq
	2hhyj5AmzhEBlwibw+D7tcSvgETYahKzIGkVIgUUwg/PePBj8nEvRmt07zRIrJjnROI5xbWBv+jAk
	2shCpS7UbJ/SrKnIS4Ad872VCPtb4Uplui2Zt2rT/WZBFVepjAKiNzQCkv5TLqLrfaX6HGJdxRzFF
	cfW6HhqLRrhPcZ/HSON/DzlWmrQFTC6jUG5P9mBz1Mb9oQLQdkfrp/ONdGc2rxqeperf94q8VLuhv
	GeY+ZbXDuSdsuChWL5ldR3Ahfd0S69z4BoX4/CsJIT/fPo4tRqI9V+pMSqjE9Xup8Pemmd9uksucX
	2khNpSrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o94Ts-00A2Zb-S2; Wed, 06 Jul 2022 12:50:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o94Th-00A2Rl-KR; Wed, 06 Jul 2022 12:50:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 519CC66019A9;
	Wed,  6 Jul 2022 13:49:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657111799;
	bh=Lx6CLz1kr9O2ozQR9usOEE/FDQenTT+4HsaadEWYqIM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OMgTIWt3U+1cB9BYr+gOcyOsPqK7v8e8P/WBhNWMbDxkYH5kYMpttkvgY5+5W5nSu
	 v105C1/AilNKoz3pMZRnKRHPj/fuZ6YHE9pxaV2DLodX3d9ifVJbRT0QhB/1oE1lAt
	 RmmXxuAk23goJrllyrOfqZFccEOCIrrdfTyUu+9DLpCTFKne2PVrzkCs7xDyBFs5zE
	 BsOevQASYsIP6JGyauvP1uTQ01Miu9hiSni2n6Oyo0OvyTgnOaIKFLvGulj8YMyYq/
	 XLFC3pwezEXn9trqoX5eeEUwmLlYjVVO9k73mYvUDUoxDQQvRvxPBwkINmbrLRh5o6
	 BSbqQr8aNjDxA==
Message-ID: <57367b11-f2d4-476b-b92d-16c1726316c0@collabora.com>
Date: Wed, 6 Jul 2022 14:49:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 RESEND 0/4] MediaTek Helio X10 MT6795 - MT6331/6332
 Regulators
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220706100912.200698-1-angelogioacchino.delregno@collabora.com>
 <YsV9IerWCoa/xtwM@sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YsV9IerWCoa/xtwM@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_055001_871302_D4333CF2 
X-CRM114-Status: GOOD (  10.13  )
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

Il 06/07/22 14:16, Mark Brown ha scritto:
> On Wed, Jul 06, 2022 at 12:09:08PM +0200, AngeloGioacchino Del Regno wrote:
>> In an effort to give some love to the apparently forgotten MT6795 SoC,
>> I am upstreaming more components that are necessary to support platforms
>> powered by this one apart from a simple boot to serial console.
> 
> This previously got 0day failures due to missing dependencies which
> need would need a merge with IIRC MFD, I see no reference in the cover
> letter to dependencies?

The only blocker for this series was the MFD patch, which got picked and
it's present in next-20220706 (as you suggested me to resend when things
were picked... I decided to wait until they actually landed on -next...)

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20220706&id=ad7f984a6aa9722443c1db9e8f72609bf06a8910

Regards,
Angelo

