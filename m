From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v2] arm64: mm: make CONFIG_ZONE_DMA32 configurable
Date: Tue, 4 Jun 2019 14:21:59 +0100
Message-ID: <20190604132159.GD6610@arrakis.emea.arm.com>
References: <1559059700-19078-1-git-send-email-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1559059700-19078-1-git-send-email-miles.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Miles Chen <miles.chen@mediatek.com>
Cc: Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, Robin Murphy <robin.murphy@arm.com>
List-Id: linux-mediatek@lists.infradead.org

On Wed, May 29, 2019 at 12:08:20AM +0800, Miles Chen wrote:
> This change makes CONFIG_ZONE_DMA32 defuly y and allows users
> to overwrite it only when CONFIG_EXPERT=y.
> 
> For the SoCs that do not need CONFIG_ZONE_DMA32, this is the
> first step to manage all available memory by a single
> zone(normal zone) to reduce the overhead of multiple zones.
> 
> The change also fixes a build error when CONFIG_NUMA=y and
> CONFIG_ZONE_DMA32=n.
> 
> arch/arm64/mm/init.c:195:17: error: use of undeclared identifier 'ZONE_DMA32'
>                 max_zone_pfns[ZONE_DMA32] = PFN_DOWN(max_zone_dma_phys());
> 
> Change since v1:
> 1. only expose CONFIG_ZONE_DMA32 when CONFIG_EXPERT=y
> 2. remove redundant IS_ENABLED(CONFIG_ZONE_DMA32)
> 
> Cc: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

Queued for 5.3. Thanks.

-- 
Catalin
