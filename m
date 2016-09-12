From: YT Shen <yt.shen@mediatek.com>
Subject: Re: [PATCH v7 8/9] drm/mediatek: update DSI sub driver flow
Date: Mon, 12 Sep 2016 18:15:47 +0800
Message-ID: <1473675347.12398.24.camel@mtksdaap41>
References: <1472815484-43821-1-git-send-email-yt.shen@mediatek.com>
         <1472815484-43821-9-git-send-email-yt.shen@mediatek.com>
         <1473224283.11736.27.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473224283.11736.27.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Mao Huang <littlecvr@chromium.org>, Bibby Hsieh <bibby.hsieh@mediatek.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, Jie Qiu <jie.qiu@mediatek.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chris Wilson <chris@chris-wilson.co.uk>, shaoming chen <shaoming.chen@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Dan Carpenter <dan.carpenter@oracle.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.
List-Id: linux-mediatek@lists.infradead.org

Hi CK,

On Wed, 2016-09-07 at 12:58 +0800, CK Hu wrote:
> Hi, YT:
> 
> On Fri, 2016-09-02 at 19:24 +0800, YT Shen wrote:
> > This patch update enable/disable flow of DSI module and MIPI TX module
> > 
> > Signed-off-by: shaoming chen <shaoming.chen@mediatek.com>
> > Signed-off-by: YT Shen <yt.shen@mediatek.com>
> > ---
> 
> I think the description is too simple. Please briefly describe WHY of
> this patch. The original enable/disable flow is workable, so why do you
> need this patch? Without this patch, what problem would happen?
Got it, we will update more descriptions in the next version.
There is no transfer/interrupt function in the upstream DSI driver.
We also implement the following function [1][2] in this patch series.

Original flow works on there is a bridge chip: DSI -> bridge -> panel.
In this case: DSI -> panel, the DSI sub driver flow should be updated.
We need to initialize DSI first so that we can send commands to panel.

[1] https://patchwork.kernel.org/patch/9310819/
drm/mediatek: add dsi interrupt control
[2] https://patchwork.kernel.org/patch/9310823/
drm/mediatek: add dsi transfer function

> 
> Regards,
> CK
> 
> 
