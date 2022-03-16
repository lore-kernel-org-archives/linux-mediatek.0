Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F11C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 10:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0H1xG903hH4C0CVzqlCDRCiwaqOH+0VWFn1NO89omTI=; b=CPp8Ft1ESFX7vt
	+WMktNvgymh80ERpvL9jgdNCHkxR0U8kMjfbjGZOWN0sE96mPbwY75tj5c95zNbOA12lu2s3lhyrF
	7/ZVdSSvPRiWeIhzxaKva4eVfPmAAHSy+0m6PqJXZlV/s63umi70M2wvZmh1FL3w8jUWpp95x6HUW
	4Ye9+KpAZg0B1tjFq3rheM1TdAnOabjJTtS9OGOjwUZr54wB7ShDO/DFELhhRqIzIOQWdj+Q2+yiY
	4NMf0MqbOYx+rRUll7q3v17KA+7AHXG8HftFHDyoQe7cDm+QXFRL7mKU336SS8bieBRpRRqCOXeEV
	XHKcXsXflfL/MSszMVqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nURLl-00CYLt-4B; Wed, 16 Mar 2022 10:57:53 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nURLY-00CY7m-KN; Wed, 16 Mar 2022 10:57:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B85311F4454D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647428259;
 bh=+B786kmjh9bVhF2dKutVQcJCHSHyfhNNrMNo6Cs2QQo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Htic6mUCNGozdobaaT2ZH9DnFUpA3VUjw9aytlaQcKQMsh4mDtjvQ4L8arnYmHveS
 k/QlQjTJS2giW6WpcAi7/mYPOlnQl+BuSG+HnUJVisxaGeicYRfoUmgiMX4yOZ1M1Z
 f1Rag2nzFgD4tLZAjkIY3y0g8VlBZoXLMiX7t2LGQakwVVhZCO4ZHUpqVpKJlnwriN
 rX+trRcxFmD/Q3n3ZQEzHKl/R0xNCbfEKKuYQr5MGGBKH20ULZ4nT5TD353J503tS9
 Iguqwt8793ig+QEiV9BPHBt42E7Q3gscBku2eokd3b9o/61M/IpQbVDT0mYmW+uM9k
 3TfRWAKlbtb4A==
Message-ID: <a06003ae-2dcc-f5a4-3b5c-62db99d18950@collabora.com>
Date: Wed, 16 Mar 2022 11:57:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 0/5] MediaTek pinctrl drivers cleanups
Content-Language: en-US
To: sean.wang@kernel.org
Cc: linus.walleij@linaro.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org
References: <20220222111144.20796-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220222111144.20796-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_035740_837208_57B073E8 
X-CRM114-Status: GOOD (  11.02  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 22/02/22 12:11, AngeloGioacchino Del Regno ha scritto:
> Hello!
> This series performs some cleanups to the MediaTek pinctrl drivers
> by commonizing some functions (reducing code duplication) hence also
> simplifying the probe mechanism by removing unnecessary per-driver
> probe functions.
> 
> This code was tested against multiple platforms.
> 
> Changes in v2:
> - Patch 2/5: Changed -ENOENT to -ENODEV as per Chen-Yu's suggestion
> - Patch 4/5: Removed unnoticed wrong comment change (Chen-Yu)
> 
> AngeloGioacchino Del Regno (5):
>    pinctrl: mediatek: paris: Unify probe function by using OF match data
>    pinctrl: mediatek: common-v1: Add common probe function
>    pinctrl: mediatek: common-v1: Use common probe function
>    pinctrl: mediatek: common-v1: Commonize spec_pupd callback
>    pinctrl: mediatek: common-v1: Commonize spec_ies_smt_set callback
> 
>   drivers/pinctrl/mediatek/pinctrl-mt2701.c     | 40 ++++--------
>   drivers/pinctrl/mediatek/pinctrl-mt2712.c     | 44 +++----------
>   drivers/pinctrl/mediatek/pinctrl-mt6765.c     |  9 +--
>   drivers/pinctrl/mediatek/pinctrl-mt6779.c     |  9 +--
>   drivers/pinctrl/mediatek/pinctrl-mt6797.c     |  9 +--
>   drivers/pinctrl/mediatek/pinctrl-mt8127.c     | 39 +++---------
>   drivers/pinctrl/mediatek/pinctrl-mt8135.c     | 17 ++----
>   drivers/pinctrl/mediatek/pinctrl-mt8167.c     | 40 +++---------
>   drivers/pinctrl/mediatek/pinctrl-mt8173.c     | 29 +++------
>   drivers/pinctrl/mediatek/pinctrl-mt8183.c     |  9 +--
>   drivers/pinctrl/mediatek/pinctrl-mt8192.c     |  9 +--
>   drivers/pinctrl/mediatek/pinctrl-mt8195.c     |  9 +--
>   drivers/pinctrl/mediatek/pinctrl-mt8365.c     | 40 +++---------
>   drivers/pinctrl/mediatek/pinctrl-mt8516.c     | 40 +++---------
>   drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 61 ++++++++++++++-----
>   drivers/pinctrl/mediatek/pinctrl-mtk-common.h | 33 +++++++---
>   drivers/pinctrl/mediatek/pinctrl-paris.c      |  9 ++-
>   drivers/pinctrl/mediatek/pinctrl-paris.h      |  3 +-
>   18 files changed, 164 insertions(+), 285 deletions(-)
> 


Hello maintainers,

friendly ping for this series that already got a Reviewed-by tag on all patches :)

Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
