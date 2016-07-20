From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH 0/4] MT8173 HDMI 4K support
Date: Wed, 20 Jul 2016 12:03:01 +0800
Message-ID: <1468987385-37353-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, Bibby Hsieh <bibby.hsieh@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, YT Shen <yt.shen@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, CK Hu <ck.hu@mediatek.com>, Mao Huang <littlecvr@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>
List-Id: linux-mediatek@lists.infradead.org

This is MT8173 HDMI 4K support PATCH, based on 4.7-rc1.

In order to support HDMI 4K on MT8173,
we have to make some modifications.
1) Make sure that mtk_hdmi_send_infoframe is sent successfully.
2) Enhance the HDMI driving current to improve performance.
3) Make sure that pixel clock is 297MHz when resolution is 4K.  
4) Adjust VENCPLL clock.

Bibby Hsieh (1):
  drm/mediatek: adjust VENCPLL clock for 4K HDMI output

Junzhi Zhao (3):
  drm/mediatek: do mtk_hdmi_send_infoframe after HDMI clock enable
  drm/mediatek: enhance the HDMI driving current
  drm/mediatek: fix the wrong pixel clock when resolution is 4K

 drivers/gpu/drm/mediatek/mtk_dpi.c             |  184 +++++++++++++++++-------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c         |    9 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h         |    1 +
 drivers/gpu/drm/mediatek/mtk_hdmi.c            |   19 ++-
 drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c |   89 ++++++++----
 5 files changed, 216 insertions(+), 86 deletions(-)

-- 
1.7.9.5
