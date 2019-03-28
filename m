From: Loys Ollivier <lollivier@baylibre.com>
Subject: [PATCH RFC 0/1] gnss: get serial speed from subdrivers
Date: Thu, 28 Mar 2019 11:03:08 +0100
Message-ID: <1553767389-22857-1-git-send-email-lollivier@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Loys Ollivier <lollivier@baylibre.com>, Colin Ian King <colin.king@canonical.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Hello,

Here's a patch that moves the currently hardcoded, default serial speed
to the subdrivers.
If the default speed is not specified by the subdriver then it is read
from the device tree.

Please let me know what you think !

Cheers,
Loys

Loys Ollivier (1):
  gnss: get serial speed from subdrivers

 drivers/gnss/mtk.c    |  6 +++++-
 drivers/gnss/serial.c | 21 +++++++++++++--------
 drivers/gnss/serial.h |  3 ++-
 drivers/gnss/ubx.c    |  3 ++-
 4 files changed, 22 insertions(+), 11 deletions(-)

-- 
2.7.4
