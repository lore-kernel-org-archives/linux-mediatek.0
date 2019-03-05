From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v5 0/9] Mediatek MT8183 clock support
Date: Tue, 5 Mar 2019 13:05:36 +0800
Message-ID: <20190305050546.23431-1-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Resend clock patches from v4 based on v5.0-rc1.

The whole series now is composed of
a fix for PLL tuner (PATCH 1),
clock common changes for both MT8183 & MT6765 (PATCH 2-3),
clock support of MT8183 (PATCH 4-8) and
resend a clock patch long time ago(PTACH 9).

changes since v4:
- refine for the fix of PLL tuner(PATCH 1).
- add configurable pcw_chg_reg for MT8183 and the following IC(PATCH 7).

changes sinve v3:
- add fix tag.
- small change of mtk_clk_mux data structure.
- use of_property_for_each_string to iterate dependent subsys clock of power domain.
- document critical clocks.
- reduce some clock register error log.
- few coding style fix.

changes sinve v2:
- refine for implementation consistency of mtk clk mux.
- separate the onoff API into enable/disable API for mtk scpsys.
- resend a patch about PLL rate changing.

changes since v1:
- refine for better code quality.
- some minor bug fix of clock part, like incorrect control address
  and missing clocks.
