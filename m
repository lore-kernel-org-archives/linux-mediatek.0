From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH 0/2] fix issue: vblank interrupts are never disabled
Date: Fri, 7 Oct 2016 18:37:48 +0800
Message-ID: <CAGS+omDG9ge+U4kXQcmV_YDO8frWh8V5RAZ=107jHo4Uq_QBeA@mail.gmail.com>
References: <1475119789-64619-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1475119789-64619-1-git-send-email-bibby.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, YT Shen <yt.shen@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, CK Hu <ck.hu@mediatek.com>, Mao Huang <littlecvr@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-Id: linux-mediatek@lists.infradead.org

On Thu, Sep 29, 2016 at 11:29 AM, Bibby Hsieh <bibby.hsieh@mediatek.com> wrote:
>
> Clean the interrupt status before enable interrupt
> and set the vblank_disable_allowed to fix the issue.

For the series:

Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>

>
> Bibby Hsieh (2):
>   drm/mediatek: set vblank_disable_allowed to true
>   drm/mediatek: clear IRQ status before enable OVL interrupt
>
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c |    1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  |    1 +
>  2 files changed, 2 insertions(+)
>
> --
> 1.7.9.5
>
