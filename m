Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3524AC636CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 15:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ThuuZK4oNLUYk4rXoIAwsAeYd7jYxO56zCJ4oA5u5k=; b=j1QSxfuATs7vpQ1whumikRaKS2
	GHlZGv3O5Z/Af4J1JO+ApQuJNX2P8Jir9ZUXdC7in6a3PIvQN6O1THl3mTYWjN6LbXlmjh3fyLll1
	DUG420jWTOzYg5bu4v5RzRc5ROfedNgbBwjHARrc6NIpOS8p7rEmywmA1eXoAzrsVUveAYAidPlpo
	uBWku1Qv/1U3B4sgCUFg0PmmWi4LtS5HMIgvDl39ZddVQrfqJnbgbzR8VpSk+uw8PO53e4RLZGZVy
	WOEyXMpD60dkzRZ4wWRGOMj4IQOVg1w341D6dcx5/GXoGsCHjpR+RQnOxTN/IVJ/70QouVZwInDqZ
	Byg0hNqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPm7G-00G27q-4Z; Wed, 08 Feb 2023 15:12:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPm74-00G24e-JK; Wed, 08 Feb 2023 15:12:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B54511477;
	Wed,  8 Feb 2023 07:12:35 -0800 (PST)
Received: from [10.57.12.246] (unknown [10.57.12.246])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D28A33F8C6;
	Wed,  8 Feb 2023 07:11:49 -0800 (PST)
Message-ID: <7e08656f-4908-43e3-57d6-2928b1eb12d5@arm.com>
Date: Wed, 8 Feb 2023 15:11:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/9] Panfrost: Improve and add MediaTek SoCs support
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 airlied@gmail.com
Cc: daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
 matthias.bgg@gmail.com, robh@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_071158_689770_7BB31331 
X-CRM114-Status: GOOD (  17.81  )
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

On 08/02/2023 10:37, AngeloGioacchino Del Regno wrote:
> This series adds support for new MediaTek SoCs (MT8186/MT8192/MT8195)
> and improves MT8183 support: since the mtk-regulator-coupler driver
> was picked, it is now useless for Panfrost to look for, and manage,
> two regulators (GPU Vcore and GPU SRAM) on MediaTek;

Yay! ;) I never did like Panfrost dealing with two regulators.

> The aforementioned driver will take care of keeping the voltage
> relation (/constraints) of the two regulators on its own when a
> voltage change request is sent to the Vcore, solving the old time
> issue with not working DVFS on Panfrost+MediaTek (due to devfreq
> supporting only single regulator).
> 
> In the specific case of MT8183, in order to not break the ABI, it
> was necessary to add a new compatible for enabling DVFS.

It's a shame to need a new compatible, but it seems sensible to me.

For the panfrost changes:

Reviewed-by: Steven Price <steven.price@arm.com>

I'll let others comment on the DT binding changes.

Thanks,

Steve

> Alyssa Rosenzweig (3):
>   drm/panfrost: Increase MAX_PM_DOMAINS to 5
>   drm/panfrost: Add the MT8192 GPU ID
>   drm/panfrost: Add mediatek,mt8192-mali compatible
> 
> AngeloGioacchino Del Regno (6):
>   dt-bindings: gpu: mali-bifrost: Don't allow sram-supply by default
>   dt-bindings: gpu: mali-bifrost: Allow up to 5 power domains for MT8192
>   dt-bindings: gpu: mali-bifrost: Add compatible for MT8195 SoC
>   dt-bindings: gpu: mali-bifrost: Add new MT8183 compatible
>   dt-bindings: gpu: mali-bifrost: Add a compatible for MediaTek MT8186
>   drm/panfrost: Add new compatible for Mali on the MT8183 SoC
> 
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 68 +++++++++++++++++--
>  drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       | 28 ++++++++
>  drivers/gpu/drm/panfrost/panfrost_gpu.c       |  8 +++
>  4 files changed, 99 insertions(+), 7 deletions(-)
> 


