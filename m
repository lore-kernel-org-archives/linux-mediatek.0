From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH 0/7] drm/mediatek: cleaning up and refine
Date: Mon, 1 Aug 2016 11:17:19 -0400
Message-ID: <CAOw6vbKvnLiBfHLRvCp3GAzZ8N8cT0iEEDiGi_54vyTDLF8ZWQ@mail.gmail.com>
References: <1469783054-54567-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1469783054-54567-1-git-send-email-bibby.hsieh@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Cawa Cheng <cawa.cheng@mediatek.com>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Mao Huang <littlecvr@chromium.org>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Fri, Jul 29, 2016 at 5:04 AM, Bibby Hsieh <bibby.hsieh@mediatek.com> wrote:
> These patches based on 4.7-rc1 to clean up unused function & variable
> and use drm core function instead.
>
> The following patches are needed to cleanly apply on top of v4.7-rc1:
>  - https://patchwork.kernel.org/patch/8044001/
>    (drm: Deal with rotation in drm_plane_helper_check_update())
>  - https://patchwork.kernel.org/patch/9248373/
>    (drm: Warn about negative sizes when calculating scale factor)
>  - https://patchwork.kernel.org/patch/9248371/
>    (drm: Store clipped src/dst coordinatee in drm_plane_state)
>  - https://patchwork.kernel.org/patch/9248363/
>    (drm/plane-helper: Add drm_plane_helper_check_state())
>  - https://patchwork.kernel.org/patch/9248361/
>    (drm/mediatek: Use drm_plane_helper_check_state())
>
> Bibby Hsieh (2):
>   drm/mediatek: Use drm_atomic destroy_state helpers
>   drm/mediatek: Fix mtk_atomic_complete for runtime_pm
>
> Daniel Kurtz (5):
>   drm/mediatek: Remove mtk_drm_crtc_check_flush
>   drm/mediatek: plane: Remove plane zpos/index
>   drm/mediatek: Remove mtk_drm_plane
>   drm/mediatek: plane: Merge mtk_plane_enable into
>     mtk_plane_atomic_update
>   drm/mediatek: plane: Use FB's format's cpp to compute x offset
>


The whole set looks good to me.


Reviewed-by: Sean Paul <seanpaul@chromium.org>


>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |   21 ++++----
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h  |    1 -
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c   |   17 ++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c |   80 +++++++++++-------------------
>  drivers/gpu/drm/mediatek/mtk_drm_plane.h |   15 +-----
>  5 files changed, 56 insertions(+), 78 deletions(-)
>
> --
> 1.7.9.5
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
