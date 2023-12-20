Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFBFC46CD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 14:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqS92X2BEmHS+RsAE1iiyXvsAWpx5yxNf10SoA9w8ck=; b=lc8lPKlV7x29FtH/smhxIxKcjn
	z+JTEpkKRsLcqejHMvngumjZ/89cRV4ue0UGBwCvhF/Mero/oQ0Bh0F2XTXQ7HzDgEXePEybFY0rC
	VQXMx84wB8uuNC1ILJY6rQlIlV1Tu2q0fYwdWfhsBA+55QRdGMUbnN0xZliGCZO833mH3yMfHWGQd
	tP2j4URLxWQAx1WxaxlJo0CvUcCSYMSZiPlFhBmQ4C+d+7cMlhmOn90X57Pm2Tw6evtXnKneiRc3a
	tEVPxcBZXQJ/gNssQVn7iYFg4Jv/7TozDxYS97hZVvDln4QH/m605PtUR+eBXJZYTgUs9DvEL0F73
	XiZtmvgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFx9k-0001j3-1k;
	Wed, 20 Dec 2023 14:02:40 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFx9g-0001hy-23;
	Wed, 20 Dec 2023 14:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703080955;
	bh=KGE66kX/77SCl68GCuAYkM5Fd1OaPVPaz8BPsJaZaSU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=02iIW6zBQjbAIb+TjCYezbs9kecXN6EY5WKxdS3M7MEqckJfl8938Plvewo1ig5RN
	 QQuWzG5o5g3kRAfyvbIMfrj2RRT38xSZlzXFzX9rW/IcPkG9X7tNJP/Kl1NaBaEc0/
	 Z9tVT7KYHPalovCBu7Fw5Sbbc8rQAEbxMuv29ku8l/y9TS5xCMBF2dk+4Bm31WJnao
	 YmPdgNN/22SrkG98xRgVwbSIYHSUvwvDXm0QTqFPKwtAxW+vc8hBIOy+5Xh8qSV6LT
	 RJOKiKayyAXdt89OMl7Lf9gcLf5cQWffB4VZ5IltlcVbCnkJ7ysVPVnCHj5nEVkB4V
	 vFGSxqyo6IZqQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2B9703781F8C;
	Wed, 20 Dec 2023 14:02:34 +0000 (UTC)
Message-ID: <cbbcb801-916a-445d-8b36-60d470b61d46@collabora.com>
Date: Wed, 20 Dec 2023 15:02:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] MediaTek clocks: Support mux indices list and 8195
 DP
Content-Language: en-US
To: sboyd@kernel.org
Cc: mturquette@baylibre.com, matthias.bgg@gmail.com, wenst@chromium.org,
 msp@baylibre.com, amergnat@baylibre.com, yangyingliang@huawei.com,
 u.kleine-koenig@pengutronix.de, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20231103102533.69280-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231103102533.69280-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_060236_800210_4F3B3433 
X-CRM114-Status: GOOD (  16.30  )
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

Il 03/11/23 11:25, AngeloGioacchino Del Regno ha scritto:
> Changes in v3:
>   - Rebased on next-20231025
>   - Added comment in the code explaining why the dp/edp parents lists
>     are split in one PLL per interface
>   - Added a commit performing the same reparenting on MT8188 as well
> 
> Changes in v2:
>   - Rebased on next-20231018
> 

Hello Stephen,

friendly ping for this fully reviewed/tested series :-)

Cheers,
Angelo

> This series adds support to specify custom parent indices for MediaTek
> MUX clocks, necessary to avoid setting the same parent PLL for MT8195's
> top_dp and top_edp clocks, solving DP+eDP concurrent output issues.
> 
> No fixes tags are provided as the clk-mux commit introduces new logic
> and the actual MT8195 fix depends on that.
> 
> This commit was tested on the Acer Tomato Chromebook (MT8195) with
> dual concurrent display outputs (internal eDP panel and TypeC->DP->HDMI
> adapter connected to Samsung UE40JU6400 4k TV); resolution switch on
> DP was also tested; eDP output is not paused and internal display keeps
> working as expected.
> 
> 
> After feedback on v1 of this series (effectively the same as v2, except
> for the rebase), I looked for an alternative solution with using
> clk_set_rate_exclusive() as proposed. Couldn't find any, as that still
> doesn't give any guarantee about selecting the same PLL that the driver
> was manipulating before setting the right divider MUX, hence that still
> wouldn't work correctly.
> 
> For more context, please look at the conversation at [1].
> 
> Cheers!
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20230713072138.84117-1-angelogioacchino.delregno@collabora.com
> 
> AngeloGioacchino Del Regno (3):
>    clk: mediatek: clk-mux: Support custom parent indices for muxes
>    clk: mediatek: mt8195-topckgen: Refactor parents for top_dp/edp muxes
>    clk: mediatek: mt8188-topckgen: Refactor parents for top_dp/edp muxes
> 
>   drivers/clk/mediatek/clk-mt8188-topckgen.c | 27 +++++++-------
>   drivers/clk/mediatek/clk-mt8195-topckgen.c | 27 ++++++++++----
>   drivers/clk/mediatek/clk-mux.c             | 14 +++++++
>   drivers/clk/mediatek/clk-mux.h             | 43 ++++++++++++++++++++--
>   4 files changed, 86 insertions(+), 25 deletions(-)
> 




