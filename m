From: John Crispin <john@phrozen.org>
Subject: [PATCH 0/2] clk: mediatek: add missing ethernet reset definition
Date: Mon, 23 Jan 2017 13:48:25 +0100
Message-ID: <1485175707-58528-1-git-send-email-john@phrozen.org>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>
Cc: Erin Lo <erin.lo@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>
List-Id: linux-mediatek@lists.infradead.org

When the clk code for mt2701 was merged, we forgot to add the reset
controller of the ethernet subsystem. This series adds the missing code
and header files required to reference the bits from within a devicetree
file.

John Crispin (2):
  clk: mediatek: add mt2701 ethernet reset
  reset: mediatek: Add MT2701 ethsys reset controller include file

 drivers/clk/mediatek/clk-mt2701-eth.c     |    2 ++
 include/dt-bindings/reset/mt2701-resets.h |    7 +++++++
 2 files changed, 9 insertions(+)

-- 
1.7.10.4

