From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [RFC v1] clk: core: support clocks that need to be enabled
 during re-parent
Date: Mon, 10 Jun 2019 07:54:15 +0200
Message-ID: <20190610055415.GC13825@kroah.com>
References: <1560138293-4163-1-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560138293-4163-1-git-send-email-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>, James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On Mon, Jun 10, 2019 at 11:44:53AM +0800, Weiyi Lu wrote:
> When using property assigned-clock-parents to assign parent clocks,
> core clocks might still be disabled during re-parent.
> Add flag 'CLK_OPS_CORE_ENABLE' for those clocks must be enabled
> during re-parent.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  drivers/clk/clk.c            | 9 +++++++++
>  include/linux/clk-provider.h | 1 +
>  2 files changed, 10 insertions(+)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
