From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH] arm64/mm: remove unnecessary boundary check
Date: Fri, 26 Feb 2016 09:47:21 +0000
Message-ID: <20160226094718.GA29125@arm.com>
References: <1456371874-19826-1-git-send-email-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456371874-19826-1-git-send-email-miles.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: miles.chen@mediatek.com
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srv_wsdupstream@mediatek.com, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, Feb 25, 2016 at 11:44:34AM +0800, miles.chen@mediatek.com wrote:
> From: Miles Chen <miles.chen@mediatek.com>
> 
> Remove the unnecessary boundary check since there is a huge
> gap between user and kernel address that they would never overlap.
> (arm64 does not have enough levels of page tables to cover 64-bit
> virtual address)
> 
> See Documentation/arm64/memory.txt
> 
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---
>  arch/arm64/mm/init.c | 2 --
>  1 file changed, 2 deletions(-)

Acked-by: Will Deacon <will.deacon@arm.com>

Will
