From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v5 0/3] MT8173 HDMI 4K support
Date: Tue, 18 Oct 2016 09:38:28 +0800
Message-ID: <1476754708.25750.1.camel@mtksdaap41>
References: <1475118135-56780-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1475118135-56780-1-git-send-email-bibby.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Yingjoe Chen <yingjoe.chen@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, YT Shen <yt.shen@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, Mao Huang <littlecvr@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>
List-Id: linux-mediatek@lists.infradead.org

On Thu, 2016-09-29 at 11:02 +0800, Bibby Hsieh wrote:
> This is MT8173 HDMI 4K support PATCH v5, based on 4.8-rc1.
> 
> In order to support HDMI 4K on MT8173,
> we have to make some modifications.
> 1) Make sure that mtk_hdmi_send_infoframe is sent successfully.
> 2) Enhance the HDMI driving current to improve performance.
> 3) Make sure that pixel clock is 297MHz when resolution is 4K.
> 

For this series,
Acked-by: CK Hu <ck.hu@mediatek.com>

> Changes since v4:
>  - Update commit message and patch title.
> 
> Changes since v3:
>  - Rebase to 4.8-rc1.
>  - The valid range of tvdpll is 1G to 2G Hz, so, we Change the
>    if statement of mode->clock to fit that and add a comment.
> 
> Changes since v2:
>  - Remove the change about preparation for MT2701 support.
> 
> Changes since v1:
>  - According to the suggestion from philipp, We use the new
>    dpi0_sel rate set method.
>  - calls clk_set_rate to set the dpi0_sel according to the
>    pixel clock.
>  - Remove the direct access to all the intermediate clock part.
>  - Remove the intermediate tvdpll_d* clocks in dts.
>  - According to suggestion from CK, we rename the clock parse
>    function and remove it from mtk_dpi_conf struct.
>  - Merges the hdmi Pll set rate for pixel clock greater than
>    165MHz and smaller parts.
> 
> The PATCH depends on the following patch:
> https://patchwork.kernel.org/patch/9262575/
> (arm64: dts: mt8173: add mmsel clocks for 4K support)
> 
> Junzhi Zhao (3):
>   drm/mediatek: do mtk_hdmi_send_infoframe after HDMI clock enable
>   drm/mediatek: enhance the HDMI driving current
>   drm/mediatek: modify the factor to make the pll_rate set in the 1G-2G
>     range
> 
>  drivers/gpu/drm/mediatek/mtk_dpi.c             |    9 +++--
>  drivers/gpu/drm/mediatek/mtk_hdmi.c            |   17 ++++++----
>  drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c |   42 +++++++++++++++++-------
>  3 files changed, 48 insertions(+), 20 deletions(-)
> 
