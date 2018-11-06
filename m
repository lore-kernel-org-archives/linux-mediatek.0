From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v1 00/11] Mediatek MT8183 clock and scpsys support
Date: Tue, 6 Nov 2018 14:41:54 +0800
Message-ID: <20181106064206.17535-1-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

This series is based on v4.20-rc1 and most of changes are
extracted from series below
(clock/scpsys common changes for both MT8183 & MT6765)
https://patchwork.kernel.org/patch/10528495/
(clock support of MT8183)
https://patchwork.kernel.org/patch/10549891/

The whole series is composed of
clock common changes for both MT8183 & MT6765 (PATCH 1-3),
scpsys common changes for both MT8183 & MT6765 (PATCH 4),
clock support of MT8183 (PATCH 5-8), and
scpsys support of MT8183 (PATCH 9-11).
