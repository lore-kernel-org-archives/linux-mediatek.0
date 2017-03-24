From: Chaotian Jing <chaotian.jing@mediatek.com>
Subject: mmc: core: Do not hold re-tuning during CMD6 commands
Date: Fri, 24 Mar 2017 14:18:59 +0800
Message-ID: <1490336341-22292-1-git-send-email-chaotian.jing@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, Jaehoon Chung <jh80.chung@samsung.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Shawn Lin <shawn.lin@rock-chips.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org


Chaotian Jing (1):
  mmc: core: Do not hold re-tuning during CMD6 commands

 drivers/mmc/core/mmc_ops.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
1.7.9.5

