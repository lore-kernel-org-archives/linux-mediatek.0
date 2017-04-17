From: <jiajie.hao@mediatek.com>
Subject: [PATCH] mmc: sdio: Fix sdio wait busy implement limitation
Date: Mon, 17 Apr 2017 16:09:30 +0800
Message-ID: <1492416571-28843-1-git-send-email-jiajie.hao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: ulf.hansson@linaro.org
Cc: linus.walleij@linaro.org, chaotian.jing@mediatek.com, yong.mao@mediatek.com, eddie.huang@mediatek.com, srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

The host may issue an I/O abort by writing to the CCCR at any time
during I/O read operation via CMD52. And host may need suspend
transcation during write busy stage in SDIO suspend/resume scenario.
>From other side, a card may accept CMD52 during data transfer phase.

Previous implement would block issuing above command in busy stage.
It cause function driver can't implement as proper way and has no
opportunity to do some coverage in error case via I/O abort etc.

We need bypass some necessary operation during busy check stage.

