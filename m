From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v1 0/3] update Mediatek MT2712 clock
Date: Thu, 20 Sep 2018 17:57:24 +0800
Message-ID: <20180920095727.11868-2-weiyi.lu@mediatek.com>
References: <20180920095727.11868-1-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180920095727.11868-1-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

This series is based on v4.19-rc1.
Basically, it's for the 3rd ECO design change of MT2712.
And also add support for switching pll reference source
for some MT2712 projects.

*** BLURB HERE ***

Weiyi Lu (3):
  dt-bindings: clock: add clock for MT2712
  clk: mediatek: update clock driver of MT2712
  clk: mediatek: mt2712: add pll reference support

 drivers/clk/mediatek/clk-mt2712.c      | 95 ++++++++++++++++++++++++++--------
 include/dt-bindings/clock/mt2712-clk.h |  3 +-
 2 files changed, 76 insertions(+), 22 deletions(-)

-- 
2.12.5.2.gbdf23ab
