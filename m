From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH V10 0/5] make mt7623 clock of hdmi stable
Date: Tue, 9 Apr 2019 17:55:00 +0800
Message-ID: <1554803700.4573.2.camel@mtksdaap41>
References: <20190409065307.82280-1-wangyan.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190409065307.82280-1-wangyan.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: wangyan wang <wangyan.wang@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, chunhui dai <chunhui.dai@mediatek.com>, Colin Ian King <colin.king@canonical.com>, Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

Hi, Wangyan:

This version still has alignment problem, but I've fixed it and for this
series,

Applied to mediatek-drm-fixes-5.1 [1], thanks.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-fixes-5.1

Regards,
CK

On Tue, 2019-04-09 at 14:53 +0800, wangyan wang wrote:
> From: Wangyan Wang <wangyan.wang@mediatek.com>
> 
> V10 adopt maintainer's suggestion.
> Here is the change list between V9 & V10
> 
> 1. Align the first character to the right of '(' in
> mtk_hdmi_phy_clk_get_data() of "drm/mediatek: remove flag ..."
> 2. Align the first character to the right of '(' in
> mtk_hdmi_pll_recalc_rate() of "drm/mediatek: make implementation ..." 
> 3. Align the first character to the right of '(' in
> mtk_hdmi_pll_round_rate() of "drm/mediatek: no change ..."
> 4. move patch " drm/mediatek: make implementation ..." before
> patch "drm/mediatek: no change parent ..." 
> 5. To make MT2701 HDMI stable, TVDPLL should not be adjusted and
> it's the parent clock of HDMI phy, so HDMI phy could not adjust parent
> rate. there are 3 steps to make MT2701 HDMI stable.
>     1). remove flag CLK_SET_RATE_PARENT for mt2701 hdmi phy to not propagate
> rate change to parent in "drm/mediatek: remove flag ...".
>     2). Using new factor for tvdpll in mt2701 to match divider of DPI in
> mt2701 in "drm/mediatek: using new...".
>     3). No change parent rate in round_rate() for mt2701 hdmi phy in
> "drm/mediatek: no change parent...".
> 
> 6. Recalculate the rate of this clock, by querying hardware to
> make implementation of recalc_rate() to match the definition.
> 
> Wangyan Wang (5):
>   drm/mediatek: remove flag CLK_SET_RATE_PARENT for mt2701 hdmi phy
>   drm/mediatek: fix the rate and divder of hdmi phy for MT2701
>   drm/mediatek: using new factor for tvdpll in MT2701
>   drm/mediatek: make implementation of recalc_rate() to match the definition
>   drm/mediatek: no change parent rate in round_rate() for mt2701 hdmi phy
> 
>  03_27_ck.diff                                  | 91 ++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_dpi.c             |  8 +--
>  drivers/gpu/drm/mediatek/mtk_hdmi_phy.c        | 35 ++--------
>  drivers/gpu/drm/mediatek/mtk_hdmi_phy.h        |  5 +-
>  drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c | 50 ++++++++++++--
>  drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c | 23 +++++++
>  patch1.diff                                    | 75 ++++++++++++++++++++
>  patch_5_4.diff                                 | 95 ++++++++++++++++++++++++++
>  remove_parent_flag.diff                        | 75 ++++++++++++++++++++
>  9 files changed, 412 insertions(+), 45 deletions(-)
>  create mode 100644 03_27_ck.diff
>  create mode 100644 patch1.diff
>  create mode 100644 patch_5_4.diff
>  create mode 100644 remove_parent_flag.diff
> 
