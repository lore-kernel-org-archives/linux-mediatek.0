Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19282C369D3
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Apr 2025 15:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6EqK3ZSle4yeQAvY1/0kxSnNoReMOE730iUzyG4pAY8=; b=E4XZdHciLNpySSsceWXqd6cRym
	pfe47udUH2RCZBxZAQWElAWKbbViI6MwqSFbHAzDJUCslGzXK/Ma963OcGxPJIg7KeujBNM4hLUN4
	svPx+gwMMLQWstgSxBBoctaaE0yrPUvoc1w/PLgDK8XVf16nLhqJdt8ASGkvOx96Hw2henUZdGnxX
	641gwtF8nXpc1MwHcB1wVwAY1zoxE2fbfs0AtLx2i/s+LbPMgTSRBF3vTI2tlMJ8hKCkeweFAYaiz
	+fEjA7Ouf47q9qB8p4ESk72+w4lRV+wiBcPh4THGURmVHRGSIdw9+eS0rxAQwvit1lCKERBrlu661
	stmGSxpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FJY-00000007f9F-0pXR;
	Tue, 22 Apr 2025 15:13:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EC1-00000007PXT-1xBj;
	Tue, 22 Apr 2025 14:01:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745330504;
	bh=9kg8U/I7iTtYhBC4HBcL5LySSlN4zeLs7ZD1KhdJjP0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QkAj8pltAJtmonNL2wrSc4wWbqx5IXJPad3NDaCXIor5EVWvxTiLmbEbgGifGPXo+
	 hcpYGPlKcTh3n8NXtYOyNm7QqoVSZEuFQvPq1qfmk/xHgiU19jmNwWOBe0WvQcLaBR
	 CF1Ayi+0VZfAyYN5k8jyJijMBACDx0uDhabH0ghyryOm1bvFWP7RY0KCMUseoV5t9X
	 nxlgDNxVHOjGvSQQAahFg2eYYDpHtJcyy7wSU2mA4vjM9bkpnOdhseqIUCnfjxff7o
	 r1TdWhVdZQsv8eM4Uu/0K4vzKJWZaiE6lz4Mzc7YZNtY1inmvhlldU0jyUTL77Uh57
	 bQeoWdp0gLB8w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 87D0E17E078A;
	Tue, 22 Apr 2025 16:01:43 +0200 (CEST)
Message-ID: <3a2c9ae8-06a9-4ac4-bd41-6d0e2dd3636e@collabora.com>
Date: Tue, 22 Apr 2025 16:01:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: mediatek: Add error messages for missing
 regmaps
To: Chen-Yu Tsai <wenst@chromium.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250421090951.395467-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250421090951.395467-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_070145_650817_0AD41EE5 
X-CRM114-Status: UNSURE (   9.15  )
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

Il 21/04/25 11:09, Chen-Yu Tsai ha scritto:
> A recent change to the syscon regmap API caused the MediaTek power
> controller drivers to fail, as the required regmap could no longer be
> retrieved. The error did not have an accompanying message, making the
> failure less obvious. The aforementioned change has since been reverted.
> 
> Add error messages to all the regmap retrievals, thereby making all
> error paths in scpsys_add_one_domain() have visible error messages.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

FYI - I'm restructuring this driver to handle retrieving the regmaps differently,
as the mt8196 mtcmos are a bit different and need even more, with different names
and this is a trend that goes on and on with new SoCs.... so I'm most probably
about to deprecate those "mediatek,infracfg" "mediatek,smi" "mediatek,something"
for external regmaps, and changing everything to an array of handles in a
"mediatek,bus-protection" (or different name anyway) property.

For now, though:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



