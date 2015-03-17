From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v3] Mediatek PMIC wrapper support
Date: Tue, 17 Mar 2015 11:14:32 +0100
Message-ID: <1426587274-7810-1-git-send-email-s.hauer@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Eddie Huang <eddie.huang@mediatek.com>, Yingjoe Chen <Yingjoe.Chen@mediatek.com>, Henry Chen <henryc.chen@mediatek.com>, YH Chen <yh.chen@mediatek.com>, kernel@pengutronix.de, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

This series adds support for the PMIC wrapper found on MT8135 and
MT8173 SoCs. This has been sent several times already as part of
different series, this time broken out as a series only containing
the wrapper code. No further compile time dependencies.

Changes since v2:

- remove stray debug printk
- change MODULE_LICENSE to GPL v2 as stated in the header

Changes since v1:

- Remove #define DEBUG
- Remove PMIC specific register writes
- Mention other SoCs which contain a PMIC wrapper aswell

Sascha
