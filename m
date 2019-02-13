From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH 1/1] arm64: Use _rcuidle for smp_cross_call() tracepoints
Date: Wed, 13 Feb 2019 13:19:25 +0000
Message-ID: <20190213131924.GD5875@brain-police>
References: <1549969765-3707-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1549969765-3707-1-git-send-email-mars.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mars Cheng <mars.cheng@mediatek.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Tue, Feb 12, 2019 at 07:09:25PM +0800, Mars Cheng wrote:
> fix similar issue for aarch64 as the commit 7c64cc0531fa
> ("arm: Use _rcuidle for smp_cross_call() tracepoints") fixed
> in aarch32

I'm not convinced about this justification. As far as I can tell, the commit
mentioned above fixed a cross-call from the idle path as a result of
ARCH_NEEDS_CPU_IDLE_COUPLED, but this never appears to be selected on arm64
afaict.

Are you actually seeing a problem on arm64 in practice?

Will
