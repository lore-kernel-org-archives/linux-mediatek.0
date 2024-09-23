Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D257CF9C5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 08:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOS8Eiunblku3CIAok0Gx15OecsFtV72KWbsEsRTOd8=; b=p8jDw+oS/beBPcBTz/QbC1ef0L
	AAEPJhUBUpl+j1/uMKQSrAINvK4OkG3UC4OaPqvXOhWyTVeOV0mSvw4IaU9v1cIp+vzZ7vIEoWTPi
	RVlpPaiY9Y7/GcIISTfL2nxnZ6tHtw+sXkJRfmgQgV4AoebahPgXr6JZXF6WmpI7pH0E2rOA+QGi2
	DJLPCjLbSxRxMLJEkTOwq8Uaw/aY9vzK6kFEEIshGDv0GlfO8yNCpyhK+BwRaT/MYOnnm27hv4vyj
	WAl9uXJECMqPrYZNx798TKn5oPolk2kQmavmc1VU3RNk69dd2JAY7FZg0U41Jx2QDAHL27mOaj9B1
	Asa92RDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sseeh-0000000GhlZ-1EXa;
	Mon, 23 Sep 2024 08:42:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssebk-0000000GhK1-3MPw;
	Mon, 23 Sep 2024 08:39:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727080786;
	bh=eXHgjinyCeQRm93WuvKLpdJCSQuczMdbgMoD2VyF1Mw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aNo4VSZjtXkADpQH2SdZisiji+GTyx6iXeB/92p2iuxxvyCQ6F7vY0lbJ+MUtDDem
	 UX2n2dJ8mm7KyRgohB6W3tu1FEqyVmU0NVvsd1HkGwcNTYcdmNs24InXngTCfpvZXC
	 SUHqiQ2wfATucwaNn1r+lDf2Uz4d+ZkUoJhE+Kc+v8t9jXFg0M+kmnrcB8VEv+xK2O
	 wiA0+Q/3Q2pK1LYjEqXo9Dq9lqBdNLegZ7BRkqIArrKSGFQ1UcB03qyqFT7YRDO6n0
	 iePDNzb18cjMpTyQRns3QwjIqebowbhlY4PG9vxfNRFkoR3NlTbTXhRYUqGw/v8V1o
	 LI0Su5Eg4pn/A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8E78C17E1067;
	Mon, 23 Sep 2024 10:39:45 +0200 (CEST)
Message-ID: <57460379-f227-4032-b353-c0400e582dff@collabora.com>
Date: Mon, 23 Sep 2024 10:39:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: mediatek: mt8188: Fix wrong clock
 provider in MFG1 power domain
To: Pablo Sun <pablo.sun@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240920134111.19744-1-pablo.sun@mediatek.com>
 <20240920134111.19744-2-pablo.sun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240920134111.19744-2-pablo.sun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_013949_060758_21DE3C00 
X-CRM114-Status: UNSURE (   7.78  )
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

Il 20/09/24 15:41, Pablo Sun ha scritto:
> The clock index "CLK_APMIXED_MFGPLL" belongs to the "apmixedsys" provider,
> so fix the index.
> 
> In addition, add a "mfg1" label so following commits could set
> domain-supply for MFG1 power domain.
> 
> Fixes: b8369604050b ("UPSTREAM: arm64: dts: mediatek: mt8188: Add support for SoC power domains")
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



