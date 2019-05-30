From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v3] gpu/drm: mediatek: call mtk_dsi_stop() after
 mtk_drm_crtc_atomic_disable()
Date: Thu, 30 May 2019 15:10:26 +0800
Message-ID: <1559200226.23119.4.camel@mtksdaap41>
References: <20190528073908.633-1-hsinyi@chromium.org>
         <1559033586.5141.3.camel@mtksdaap41>
         <CAJMQK-ir9J-JN9DDZPBA1nVkJUZ_6A+fY4fA6jx6zOh_9q5a-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJMQK-ir9J-JN9DDZPBA1nVkJUZ_6A+fY4fA6jx6zOh_9q5a-w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>
List-Id: linux-mediatek@lists.infradead.org

Hi, Hsin-Yi:

On Thu, 2019-05-30 at 10:55 +0800, Hsin-Yi Wang wrote:
> On Tue, May 28, 2019 at 4:53 PM CK Hu <ck.hu@mediatek.com> wrote:
> 
> > I think we've already discussed in [1]. I need a reason to understand
> > this is hardware behavior or software bug. If this is a software bug, we
> > need to fix the bug and code could be symmetric.
> >
> > [1]
> > http://lists.infradead.org/pipermail/linux-mediatek/2019-March/018423.html
> >
> Hi CK,
> 
> Jitao has replied in v2[1]
> "
> mtk_dsi_start must after dsi full setting.
> If you put it in mtk_dsi_ddp_start, mtk_dsi_set_mode won't work. DSI
> will keep cmd mode. So you see no irq.
> ...
> "
> 
> [1] https://lore.kernel.org/patchwork/patch/1052505/#1276270
> 
> Thanks

OK, this looks the hardware behavior, so I would like you to add comment
in the code to describe why we need this asymmetric behavior. The
description should be clear so that we could know how to modify the code
flow in future.

Regards,
CK
