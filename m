Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2350EC3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 18:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WU0dokbZJR7hGpUs28LPuEyaZMppFxtbY3wOwZuSs+U=; b=r85zuaErryfgY8g7NFGfFtJHQ1
	a6AzNDqvW3oWgOYe7N7pmpnGVlhoLMQKj3VBjVP9KMCRgsYM7zlRrwdB5aNHx5RKiDpYdF4+EogTG
	F0GxV84uGo3bxjSHVmsAhfgdvt00z2nSa+fLR4d1KTFZuZKM/R0PeqQH4XcekjenAOI9IYhEGdqOx
	ZSRlECq4gM3R7aGk2PIs14DIG9NYBV4veBuHy9whCfT+LEnDFkHm4vt0cG66tzNHRZR0P3KEgQ6fs
	s7FMz0AFhEcnbNJAotInhVrIcZqu+T0gpgFLuW0qzEpKcEWmjPqLgVsUVhFxclsX5KQgn2FgZuTea
	psiMDsrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pClrt-003o9d-Qx; Tue, 03 Jan 2023 18:18:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCkKi-0030zV-6s; Tue, 03 Jan 2023 16:40:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 819861516;
	Tue,  3 Jan 2023 08:40:51 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 804AE3F71A;
	Tue,  3 Jan 2023 08:40:07 -0800 (PST)
Message-ID: <832f3200-77ac-1ee0-e1b5-5f56353cba36@arm.com>
Date: Tue, 3 Jan 2023 16:39:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/3] iommu/sound: Use component_match_add_of helper
Content-Language: en-GB
To: Maxime Ripard <maxime@cerno.tech>
Cc: Sean Anderson <sean.anderson@seco.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Joerg Roedel <joro@8bytes.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 alsa-devel@alsa-project.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20221222233759.1934852-1-sean.anderson@seco.com>
 <20221222233759.1934852-3-sean.anderson@seco.com>
 <7897d4a6-bf43-becd-3437-7a254f38f6be@arm.com>
 <20230103161550.4tui3ihl65olvkd7@houat>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230103161550.4tui3ihl65olvkd7@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_084012_402233_1BD8A1E5 
X-CRM114-Status: GOOD (  21.60  )
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

On 03/01/2023 4:15 pm, Maxime Ripard wrote:
> Hi Robin,
> 
> On Tue, Jan 03, 2023 at 01:01:07PM +0000, Robin Murphy wrote:
>> Hi Sean,
>>
>> On 22/12/2022 11:37 pm, Sean Anderson wrote:
>>> Convert users of component_match_add_release with component_release_of
>>> and component_compare_of to component_match_add_of.
>>>
>>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>>> Acked-by: Mark Brown <broonie@kernel.org>
>>> ---
>>>
>>> Changes in v2:
>>> - Split off from helper addition
>>>
>>>    drivers/iommu/mtk_iommu.c    | 3 +--
>>>    drivers/iommu/mtk_iommu_v1.c | 3 +--
>>>    sound/soc/codecs/wcd938x.c   | 6 ++----
>>>    3 files changed, 4 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
>>> index 2ab2ecfe01f8..483b7a9e4410 100644
>>> --- a/drivers/iommu/mtk_iommu.c
>>> +++ b/drivers/iommu/mtk_iommu.c
>>> @@ -1079,8 +1079,7 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
>>>    		}
>>>    		data->larb_imu[id].dev = &plarbdev->dev;
>>> -		component_match_add_release(dev, match, component_release_of,
>>> -					    component_compare_of, larbnode);
>>> +		component_match_add_of(dev, match, larbnode);
>>
>> I've long since given up trying to make sense of how the DRM tree works, but
>> the conflicting change is definitely already in mainline:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=b5765a1b44bea9dfcae69c53ffeb4c689d0922a7
> 
> As far as I can see, that patch doesn't affect DRM at all, and the
> commit you pointed to doesn't either, nor has it been merged through the
> DRM tree.

Right it doesn't affect DRM, and was merged via the IOMMU tree, but it 
does affect *this* patch, which Sean has based on a drm-next branch that 
seemingly still wasn't up to date with 6.2-rc1 at the time.

Since v2 had already been posted, it seemed like a bright idea to 
comment here to clarify that it was still relevant, rather than bumping 
the old thread to reply directly. Apologies for any confusion.

In practical terms I think it's merely a case of dropping this hunk; the 
other one in mtk_iommu_v1.c looks fine to me.

Cheers,
Robin.

> Can you expand a bit on how we're involved in this, what we should
> clarify or help with?
> 
> Maxime

