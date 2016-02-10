From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH] MIPS: pci-mt7620: Fix return value check in
 mt7620_pci_probe()
Date: Wed, 10 Feb 2016 10:01:06 +0100
Message-ID: <20160210090106.GA10352@linux-mips.org>
References: <1454768659-32720-1-git-send-email-weiyj_lk@163.com>
 <56B613D3.2070709@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <56B613D3.2070709@openwrt.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: John Crispin <blogic@openwrt.org>
Cc: weiyj_lk@163.com, Matthias Brugger <matthias.bgg@gmail.com>, linux-mips@linux-mips.org, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Sat, Feb 06, 2016 at 04:40:03PM +0100, John Crispin wrote:

> On 06/02/2016 15:24, weiyj_lk@163.com wrote:
> > From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> > 
> > In case of error, the function devm_ioremap_resource() returns
> > ERR_PTR() and never returns NULL. The NULL test in the return
> > value check should be replaced with IS_ERR().
> > 
> > Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Hi,
> 
> thanks for the fix.
> 
> Acked-by: John Crispin <blogic@openwrt.org>
> 
> @Ralf: can you merge this via LMO with the next PR please ?
> 
> @mbgg: ignore the patch please it is for the legacy MIPS SoCs

Applied.  Thanks folks,

  Ralf
