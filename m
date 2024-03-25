Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A333EC54E64
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Mar 2024 13:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4thd2ZTS7+ANXVLcJCbfAt3fDy9gqJOO3GLl8F1igJM=; b=L/6yoAdLDdb5rBzBZqYQ10lQX4
	srfhvxXWtU3nfzHgbuPH+cYGsSULFK6onqAsj691xhbuepEZNIgr+j/5N4tZJ+0vZmNGKXYlpFyji
	X0ysxqtruv8xLs+6JO0Z0/vYPy1e267NjKttVDz/GPlyK1DTXpuqCQQbHiCPvQ3X2cXcj4tinsiEr
	GS3EAaIK8so71lYiXYOJFmDxXJ9xIRIYENcUC4JSAYmOYZcRPafHIrjRlaFTWKW6NvreU2+hmE9Ss
	9RYkkidtQzZWfr6v0uf4cZDlQSydn9MtB1w/obVO49cTQBJoPY6Yzykp4RkS+KZqse83jU0CJ+JQ7
	kiC8mwew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rok2E-0000000HRnN-0WAP;
	Mon, 25 Mar 2024 13:06:42 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rok27-0000000HRk7-0dBY;
	Mon, 25 Mar 2024 13:06:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711371992;
	bh=y41ZUo//R1PFlTZZBp6OISCB8XZyhdqerzYG0tK4h84=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AwX6bukZx35XtczvSYUlGvxfUuq/ynvrxShktE9Ug4+6f6WqsKtlBHio6PNittTaT
	 kJgFP96UNjt/zIufP5ssM0wvAe/8YetuWcgPl38y7W8Ojrr7ACbJM4TRGscxJiyJMH
	 Dj9S+4+zL5ZPSxEuY0Q4w29SNV9IzMz4LM2bTl87dXpGjZRcumk6dT8t7EmRQpBtFG
	 dTfWlwuI/cxuKtaFieVRYUm9H0OUAKdFWUTwdZIpaMvEUhSlBV5xqmaOrTWmN6onVM
	 HkjfDZJDQ8/ZKTdc3SYc+SB0cU8Dm1AlBmKORLdHETtCryt3E8LywypIWElPFbkBMX
	 HC575lGmdMdnw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CF571378209A;
	Mon, 25 Mar 2024 13:06:31 +0000 (UTC)
Message-ID: <2625bf93-1501-4e5d-b492-de9bcffa93ec@collabora.com>
Date: Mon, 25 Mar 2024 14:06:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] soc: mediatek: pm-domains: solve power domain glitch
 issue
To: "yu-chang.lee" <yu-chang.lee@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, mandyjh.liu@mediatek.com,
 fan.chen@mediatek.com, xiufeng.li@mediatek.com
References: <20240325121908.3958-1-yu-chang.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240325121908.3958-1-yu-chang.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_060635_428672_D0E69772 
X-CRM114-Status: GOOD (  14.71  )
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

Il 25/03/24 13:19, yu-chang.lee ha scritto:
> Hi,
> 
> This series aims to solve power-off failures and occasional SMI hang issues that
> occur during camera stress tests. The issue arises because, when MTCMOS powers on
> or off, signal glitches are sometimes produced. This is fairly normal, but the
> software must address it to avoid mistaking the glitch for a transaction signal.
> 
> The solutions in these patches can be summarized as follows:
> 
> 1. Disable the sub-common port after turning off the Larb CG and before turning
>     off the Larb MTCMOS.
> 2. Use CLAMP to disable/enable the SMI common port.
> 3. Implement an AXI reset.
> For previous discussion on the direction of the code modifications, please refer
> to: https://lore.kernel.org/linux-arm-kernel/c476cc48-17ec-4e14-98d8-35bdffb5d296@collabora.com/
> 
> 
> yu-chang.lee (2):
>    soc: mediatek: pm-domains: add smi_larb_reset function when power on
>    soc: mediatek: pm-domains: support smi clamp protection

Can you please change both commit titles to use "pmdomain: mediatek:" instead of
"soc: mediatek:"?

Thanks
Angelo

> 
>   drivers/pmdomain/mediatek/mt8188-pm-domains.h |  69 +++++-
>   drivers/pmdomain/mediatek/mtk-pm-domains.c    | 206 +++++++++++++++---
>   drivers/pmdomain/mediatek/mtk-pm-domains.h    |  13 ++
>   3 files changed, 255 insertions(+), 33 deletions(-)
> 


