Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF486C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 17:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwNf0JnT69FuiXYhTYViH8ZPSjflFdpq7uiGw18GQis=; b=GLT+F8hvkvPr4GC9l8ocFb5U76
	tGONjA3AAggWv0iw39IMhiHIB0lla57K0JX3oOpsN4WrHA6gJKOwtAFNtzq45636L2LWDdbmwv1wx
	WG1VjyGW5if57QmohUmzrTxbGBfpmSPTp8k5t6AaPUvhF2dz3dkfSTR0E0KCR/6M/FI4wi9sp1bNU
	U7hKKnap1eD3Q6l0MmE1HDkxhIpiyqfAzhKV5SaHwbHagsl6XTIoUIOxgiJcY3r8j1BNKnMW0TVha
	xumkbmYztWrGy7UId3Olgk7kN7xRp0/NZPn2H7ckpTjhSKhhauGMLYBRpRWYG1gScEu96XjyC+vCQ
	w7NDUMvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6Eif-00Gt9i-C9; Fri, 16 Dec 2022 17:42:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6Eic-00Gt6x-9M; Fri, 16 Dec 2022 17:41:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7FD41042;
	Fri, 16 Dec 2022 09:42:33 -0800 (PST)
Received: from [10.57.88.234] (unknown [10.57.88.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA5E33F5A1;
	Fri, 16 Dec 2022 09:41:45 -0800 (PST)
Message-ID: <2db73405-464f-6980-a7c1-7fe232611331@arm.com>
Date: Fri, 16 Dec 2022 17:41:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/2] drm: Add component_match_add_of and convert users of
 drm_of_component_match_add
Content-Language: en-GB
To: Sean Anderson <sean.anderson@seco.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Brian Starkey <brian.starkey@arm.com>, Chen Feng <puck.chen@hisilicon.com>,
 Chen-Yu Tsai <wens@csie.org>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Joerg Roedel <joro@8bytes.org>, John Stultz <jstultz@google.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, Liam Girdwood <lgirdwood@gmail.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Lucas Stach <l.stach@pengutronix.de>,
 Mali DP Maintainers <malidp@foss.arm.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Paul Cercueil <paul@crapouillou.net>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Clark <robdclark@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Samuel Holland <samuel@sholland.org>,
 Sean Paul <sean@poorly.run>, Takashi Iwai <tiwai@suse.com>,
 Tian Tao <tiantao6@hisilicon.com>, Tomi Valkeinen <tomba@kernel.org>,
 Will Deacon <will@kernel.org>, Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Yong Wu <yong.wu@mediatek.com>,
 alsa-devel@alsa-project.org, etnaviv@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20221103182222.2247724-1-sean.anderson@seco.com>
 <68562aca-5256-9e4b-bcd5-983e43408a7d@seco.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <68562aca-5256-9e4b-bcd5-983e43408a7d@seco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_094158_458306_79C6F0AB 
X-CRM114-Status: GOOD (  14.06  )
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

On 2022-12-16 17:08, Sean Anderson wrote:
> On 11/3/22 14:22, Sean Anderson wrote:
>> This series adds a new function component_match_add_of to simplify the
>> common case of calling component_match_add_release with
>> component_release_of and component_compare_of. There is already
>> drm_of_component_match_add, which allows for a custom compare function.
>> However, all existing users just use component_compare_of (or an
>> equivalent).
>>
>> I can split the second commit up if that is easier to review.
>>
>>
>> Sean Anderson (2):
>>    component: Add helper for device nodes
>>    drm: Convert users of drm_of_component_match_add to
>>      component_match_add_of
>>
>>   .../gpu/drm/arm/display/komeda/komeda_drv.c   |  6 ++--
>>   drivers/gpu/drm/arm/hdlcd_drv.c               |  9 +-----
>>   drivers/gpu/drm/arm/malidp_drv.c              | 11 +------
>>   drivers/gpu/drm/armada/armada_drv.c           | 10 ++++---
>>   drivers/gpu/drm/drm_of.c                      | 29 +++----------------
>>   drivers/gpu/drm/etnaviv/etnaviv_drv.c         |  4 +--
>>   .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  3 +-
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  3 +-
>>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  4 +--
>>   drivers/gpu/drm/msm/msm_drv.c                 | 14 ++++-----
>>   drivers/gpu/drm/sti/sti_drv.c                 |  3 +-
>>   drivers/gpu/drm/sun4i/sun4i_drv.c             |  3 +-
>>   drivers/gpu/drm/tilcdc/tilcdc_external.c      | 10 ++-----
>>   drivers/iommu/mtk_iommu.c                     |  3 +-
>>   drivers/iommu/mtk_iommu_v1.c                  |  3 +-
>>   include/drm/drm_of.h                          | 12 --------
>>   include/linux/component.h                     |  9 ++++++
>>   sound/soc/codecs/wcd938x.c                    |  6 ++--
>>   18 files changed, 46 insertions(+), 96 deletions(-)
>>
> 
> ping?
> 
> Should I send a v2 broken up like Mark suggested?

FWIW you'll need to rebase the IOMMU changes on 6.2-rc1 anyway - 
mtk_iommu stops using component_match_add_release() at all.

Thanks,
Robin.

