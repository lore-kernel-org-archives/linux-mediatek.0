From: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: [PATCH v2 0/4] ASoC: mt8183: fix audio playback slowly after playback
Date: Fri, 27 Sep 2019 18:31:53 +0800
Message-ID: <1569580317-21181-1-git-send-email-jiaxin.yu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: broonie@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, linux@roeck-us.net, wim@linux-watchdog.org
Cc: alsa-devel@alsa-project.org, yong.liang@mediatek.com, lgirdwood@gmail.com, jiaxin.yu@mediatek.com, perex@perex.cz, tzungbi@google.com, linux-mediatek@lists.infradead.org, eason.yen@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

This series patches add reset controller for MT8183, and audio will use it in 
machine driver during bootup, they depend on the following patch:

1. this series add support reset-controller in infra
	[v5,2/2] clk: reset: Modify reset-controller driver
	https://patchwork.kernel.org/patch/11060419/

v2 changes:
	1. remove "WIP" that in the title of patches
	2. add hyper link for the patch that depends on

Jiaxin Yu (2):
  dt-bindings: medaitek: mt8183: add property "resets" && "reset-names"
  ASoC: mt8183: fix audio playback slowly after playback during bootup

yong.liang (2):
  dt-bindings: mediatek: mt8183: Add #reset-cells
  watchdog: mtk_wdt: mt8183: Add reset controller

 .../bindings/sound/mt8183-afe-pcm.txt         |   6 +
 .../devicetree/bindings/watchdog/mtk-wdt.txt  |   9 +-
 drivers/watchdog/Kconfig                      |   1 +
 drivers/watchdog/mtk_wdt.c                    | 110 +++++++++++++++++-
 .../reset-controller/mt8183-resets.h          |  13 +++
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c    |  15 +++
 6 files changed, 150 insertions(+), 4 deletions(-)

-- 
2.18.0
