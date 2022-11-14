Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEEFC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 11:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQD3SyOrq0tQHoASJSDpLXxeml485/o3lnFNLOQH9/k=; b=bXN+oElSfYKdtyQ7Eb8O2KbDjg
	Lgok5bICVPYNEmMQ7YlFofiaYEesgdnS4jCG/c/Yx95GPZi1uYGwkitqGMoOBPtvk+/usiDHEOBZb
	6aV5S6zH+lXpmcdcbPaJm8pKP5XKRRi/MzZX7lcwbZMHxJ+qHv1AH3cggLHTrqFyYeZkp8UUN0S1r
	mGlJimGCBkXPq91z4VJwhBWiIVoq1e30xyrtLLKR/NC2V3LoUNxvf8AU4e8xt2vM+qnjKCwdr2xMw
	oLiXvycGS3kjav1A0K8wzGe07M8lNBwofVyobMOWk0Km/xqGWWyvTUb3Qp2gSUn8L0+DHFk0zEpcQ
	jqqHqKsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouY1h-000a1M-7t; Mon, 14 Nov 2022 11:53:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouY10-000Zer-6D; Mon, 14 Nov 2022 11:52:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CF4FC66016A3;
	Mon, 14 Nov 2022 11:52:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668426756;
	bh=UqXyw29d9gHmZnTaWA17qjx/3BT/it1DZWozqZjgUvE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CuXf2ZA1/Pk4AOO7DSTFEFFFgfULvaPQy0MLLwqgYUgWYqGetFd62NuDx0rNIJDTA
	 lF4Pe54GLAHRsaUIrgKFVdfrXJO8QefoOFcJYzZrEx/Ou0of7YUyCcUXHTyGmt1fAI
	 EfyEBvzDKFjyMgpZ9ohUJj2NysUq7yqqOXF0WESNaBNCAYBUGon6cqukg/LGeFP3U6
	 lGe3MIDd4cvUJBSMWIw2sQdgxdTmJyDKZPQZmLQtOGv7W/Y1bqrj1ZkcuEbE78qAKc
	 1x8l5sguUYXjAIimfVCztPTnQB1SFYyNqjxAJvA9X8votiJRbDLjaE6b/ztyJ0T6qM
	 KJ7XuFKE63m0A==
Message-ID: <70108911-4934-170f-8e66-ed2ff7d63be5@collabora.com>
Date: Mon, 14 Nov 2022 12:52:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [RESEND PATCH v2] arm64: dts: mediatek: mt8195-demo: fix the
 memory size of node secmon
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Miles Chen <miles.chen@mediatek.com>, Bear Wang <bear.wang@mediatek.com>,
 Pablo Sun <pablo.sun@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, linux-usb@vger.kernel.org,
 stable@vger.kernel.org
References: <20221111095540.28881-1-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221111095540.28881-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_035238_412178_4EBDC4F5 
X-CRM114-Status: GOOD (  16.75  )
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

Il 11/11/22 10:55, Macpaul Lin ha scritto:
> The size of device tree node secmon (bl31_secmon_reserved) was
> incorrect. It should be increased to 2MiB (0x200000).
> 
> The origin setting will cause some abnormal behavior due to
> trusted-firmware-a and related firmware didn't load correctly.
> The incorrect behavior may vary because of different software stacks.
> For example, it will cause build error in some Yocto project because
> it will check if there was enough memory to load trusted-firmware-a
> to the reserved memory.
> 
> When mt8195-demo.dts sent to the upstream, at that time the size of
> BL31 was small. Because supported functions and modules in BL31 are
> basic sets when the board was under early development stage.
> 
> Now BL31 includes more firmwares of coprocessors and maturer functions
> so the size has grown bigger in real applications. According to the value
> reported by customers, we think reserved 2MiB for BL31 might be enough
> for maybe the following 2 or 3 years.
> 
> Cc: stable@vger.kernel.org      # v5.19
> Fixes: 6147314aeedc ("arm64: dts: mediatek: Add device-tree for MT8195 Demo board")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



