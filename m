Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A363C3600B
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Mar 2025 11:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dmPfC7OU2QLqAk48xvis5CLpXwsdgyGGuDsmRqlx9I=; b=GViR7/i/WpGqblVZeTzvPGhNtM
	HWT+BvdswLXqe16qncmzIkFtyLCQAbtfsQeKMOqY/Ob4bW+g930E0rWtQeLo4XnYLRCyCUceMM7dk
	cgS0viVn76MAA7WfQWFWEyUhecP9iHYQGFIDu03K3xZwQiZWZa5P6eO+56WZq+wilhE3+NQBz0v33
	dk9n7U7WJtnJ8fuBBVk8ARAS0qK+Xkpns2m4BAjnaQnV3VzKK5fVowbrtHyPFE9Hi/Sd2L4/3JLHO
	SloTKFdkIDQXe00AsxY1jQvYnmvoNTHEx4jlBCDWnFy4+YA3OJ8R4BNzck0gz30lkSez4dqjHnOw4
	u14LVS6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzD8g-00000000C9o-36J8;
	Mon, 31 Mar 2025 11:17:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzD6v-00000000Brf-0xFX;
	Mon, 31 Mar 2025 11:15:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30B251F02;
	Mon, 31 Mar 2025 04:15:22 -0700 (PDT)
Received: from [10.57.15.213] (unknown [10.57.15.213])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8830B3F694;
	Mon, 31 Mar 2025 04:15:14 -0700 (PDT)
Message-ID: <2aa3bf07-924b-4359-b566-0db57d53cdf5@arm.com>
Date: Mon, 31 Mar 2025 12:15:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] drm/panfrost: Add support for AARCH64_4K page
 table format
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com, angelogioacchino.delregno@collabora.com,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
References: <20250324185801.168664-1-ariel.dalessandro@collabora.com>
 <20250324185801.168664-5-ariel.dalessandro@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250324185801.168664-5-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_041521_298673_85BA2DE9 
X-CRM114-Status: GOOD (  13.49  )
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

On 24/03/2025 18:57, Ariel D'Alessandro wrote:
> Currently, Panfrost only supports MMU configuration in "LEGACY" (as
> Bifrost calls it) mode, a (modified) version of LPAE "Large Physical
> Address Extension", which in Linux we've called "mali_lpae".
> 
> This commit adds support for conditionally enabling AARCH64_4K page
> table format. To achieve that, a "GPU optional quirks" field was added
> to `struct panfrost_features` with the related flag.
> 
> Note that, in order to enable AARCH64_4K mode, the GPU variant must have
> the HW_FEATURE_AARCH64_MMU feature flag present.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

(one very minor nit below)

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.h |  16 +++
>  drivers/gpu/drm/panfrost/panfrost_mmu.c    | 140 +++++++++++++++++++--
>  drivers/gpu/drm/panfrost/panfrost_regs.h   |  34 +++++
>  3 files changed, 183 insertions(+), 7 deletions(-)
> 

[...]

> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 294f86b3c25e..ccf51fd5f9c0 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
[...]
> +
> +static int panfrost_mmu_cfg_init(struct panfrost_mmu *mmu,
> +				  enum io_pgtable_fmt fmt)

NIT: It's always hard to see in the diff, but the alignment of the
second line is wrong. But I'll fix this up when merging.

Thanks,
Steve


