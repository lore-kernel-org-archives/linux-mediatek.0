From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v3] gpu/drm: mediatek: call mtk_dsi_stop() after mtk_drm_crtc_atomic_disable()
Date: Thu, 30 May 2019 10:55:12 +0800
Message-ID: <CAJMQK-ir9J-JN9DDZPBA1nVkJUZ_6A+fY4fA6jx6zOh_9q5a-w@mail.gmail.com>
References: <20190528073908.633-1-hsinyi@chromium.org> <1559033586.5141.3.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559033586.5141.3.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>
List-Id: linux-mediatek@lists.infradead.org

On Tue, May 28, 2019 at 4:53 PM CK Hu <ck.hu@mediatek.com> wrote:

> I think we've already discussed in [1]. I need a reason to understand
> this is hardware behavior or software bug. If this is a software bug, we
> need to fix the bug and code could be symmetric.
>
> [1]
> http://lists.infradead.org/pipermail/linux-mediatek/2019-March/018423.html
>
Hi CK,

Jitao has replied in v2[1]
"
mtk_dsi_start must after dsi full setting.
If you put it in mtk_dsi_ddp_start, mtk_dsi_set_mode won't work. DSI
will keep cmd mode. So you see no irq.
...
"

[1] https://lore.kernel.org/patchwork/patch/1052505/#1276270

Thanks
