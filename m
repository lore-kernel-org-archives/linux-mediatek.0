Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00897C77B7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 08:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2yZFoBE/HS6NQQq2MPlszCLUEcrNrFqRIIRwpsyW90=; b=js6jHkdWWG3uw2i4GmmPTAlBIU
	0ImvBGOiZF7zPU0oE0+rrgCpgrTwSD5Wb7ZWkUnvXhdNcBz22uemxyrQXundu1k/awcn80j2vH5L6
	B0hms6KAUiNgTMz45tPiOAK3ICi0bGieC28Bcz9MQG1WZfaZfZwMQOziqK4IowwANUxQlGVPjZEjY
	zrBgD8ZpXVV/K8m1LTwPq1ayoMnvVncApjpaj0JungHhR/63WESjP0HyWyrSwzG7gtaO6zLxZttZZ
	4pzzrDibMRpbaVMNEPY1uUDAKVxgitP1NrmP1CSrmOf5NDbIvejo9DzpVSo/g9UNveBA81m4VW9om
	7D6EzzGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2StG-001cSo-1g;
	Fri, 26 May 2023 08:33:38 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2StC-001cRn-2u;
	Fri, 26 May 2023 08:33:36 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C96D46606E83;
	Fri, 26 May 2023 09:33:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685090013;
	bh=WrowHc+4yGRPLiyYPvvG4JYOR+mPGcHxjVgb39lx+FA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g06/xOFhstlgqDPNyk+/b7fjllrKt0tkTDvq7y0ngnvPTprNQuq5i0YgwajJs9OQw
	 X/4USKtVZL/Wu9KOcc2cIbxveNH4uoOaK7qTOq9yC7K/0CxV03XFrNO+q0puTfxDsR
	 ApkxwhKWE6ufg5ra4TtGQ7Ma5JrML7zrZYgETMaGqhTkQuL/IInaT/LNDBxgaeg/78
	 fLmcppUB9dd5UJE7gxFk5yedjn0F1t78UdQn2kGcG2HWsUgk0Cq0Xhexee6Idd0a/L
	 6ME28Ex9/Umy0DJM0260BvM5gGO5X07i4iKe7cNj1Y3q2xbyuWHGZ4Je97B4oZUkr7
	 cH7UXwUmFpq0A==
Message-ID: <2a60740f-782d-08d5-f62f-dcc67aaf4d32@collabora.com>
Date: Fri, 26 May 2023 10:33:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 2/2] clk: mediatek: mt8365: Fix index issue
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230517-fix-clk-index-v2-0-1b686cefcb7e@baylibre.com>
 <20230517-fix-clk-index-v2-2-1b686cefcb7e@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230517-fix-clk-index-v2-2-1b686cefcb7e@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_013335_092626_B018ED6B 
X-CRM114-Status: GOOD (  20.48  )
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

Il 25/05/23 16:50, Alexandre Mergnat ha scritto:
> Before the patch [1], the clock probe was done directly in the
> clk-mt8365 driver. In this probe function, the array which stores the
> data clocks is sized using the higher defined numbers (*_NR_CLOCK) in
> the clock lists [2]. Currently, with the patch [1], the specific
> clk-mt8365 probe function is replaced by the mtk generic one [3], which
> size the clock data array by adding all the clock descriptor array size
> provided by the clk-mt8365 driver.
> 
> Actually, all clock indexes come from the header file [2], that mean, if
> there are more clock (then more index) in the header file [2] than the
> number of clock declared in the clock descriptor arrays (which is the
> case currently), the clock data array will be undersized and then the
> generic probe function will overflow when it will try to write in
> "clk_data[CLK_INDEX]". Actually, instead of crashing at boot, the probe
> function returns an error in the log which looks like:
> "of_clk_hw_onecell_get: invalid index 135", then this clock isn't
> enabled.
> 
> Solve this issue by adding in the driver the missing clocks declared in
> the header clock file [2].
> 
> [1]: Commit ffe91cb28f6a ("clk: mediatek: mt8365: Convert to
>       mtk_clk_simple_{probe,remove}()")
> [2]: include/dt-bindings/clock/mediatek,mt8365-clk.h
> [3]: drivers/clk/mediatek/clk-mtk.c
> 
> Fixes: ffe91cb28f6a ("clk: mediatek: mt8365: Convert to mtk_clk_simple_{probe,remove}()")

This is not fixing the conversion, but the clock driver, as it originally missed
clock entries and hence was not compliant with its binding (header).
It worked before, probably, but this doesn't mean that this driver didn't contain
a logic mistake from the beginning :-)

So, add (or replace the current one with) the relevant Fixes tag...

Cheers,
Angelo


