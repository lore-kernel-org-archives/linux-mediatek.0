From: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH V7 0/6] make mt7623 clock of hdmi stable
Date: Thu, 28 Mar 2019 11:15:09 +0800
Message-ID: <1553742909.10649.1.camel@mtkswgap22>
References: <20190327091929.73162-1-wangyan.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190327091929.73162-1-wangyan.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: wangyan wang <wangyan.wang@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, CK Hu <ck.hu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, chunhui dai <chunhui.dai@mediatek.com>, Colin Ian King <colin.king@canonical.com>, Sean Wang <sean.wang@mediatek.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2019-03-27 at 17:19 +0800, wangyan wang wrote:
> From: Wangyan Wang <wangyan.wang@mediatek.com>
> 
> V7 adopt maintainer's suggestion.
> Here is the change list between V6 & V7
> 
> 1. use readl directly & delete hdmi_phy->pll_rate in
> mtk_hdmi_pll_recalc_rate(). 
> in "drm/mediatek: recalculate hdmi ..."
> 
> 2. detele mtk_hdmi_phy_read() in mtk_hdmi_phy.c.
> in "fix the rate of parent for hdmi phy in MT2701"
> 
> 3. optimize mtk_hdmi_pll_round_rate().
> in "fix the rate of parent for hdmi phy in MT2701"
> 
> chunhui dai (6):
>   drm/mediatek: recalculate hdmi phy clock of MT2701 by querying
>     hardware
>   drm/mediatek: move the setting of fixed divider
>   drm/mediatek: using different flags of clk for HDMI phy
>   drm/mediatek: fix the rate and divder of hdmi phy for MT2701
>   drm/mediatek: using new factor for tvdpll in MT2701
>   drm/mediatek: fix the rate of parent for hdmi phy in MT2701
> 
>  drivers/gpu/drm/mediatek/mtk_dpi.c             |  8 ++---
>  drivers/gpu/drm/mediatek/mtk_hdmi_phy.c        | 35 +++---------------
>  drivers/gpu/drm/mediatek/mtk_hdmi_phy.h        |  6 +---
>  drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c | 50 ++++++++++++++++++++++----
>  drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c | 23 ++++++++++++
>  5 files changed, 76 insertions(+), 46 deletions(-)
> 

The series could not work on v5.1. Please check it out.
