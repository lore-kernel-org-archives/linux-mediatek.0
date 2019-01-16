From: CK Hu <ck.hu@mediatek.com>
Subject: [PATCH 0/3] Remove self-implemented queue of Mediatek cmdq
Date: Wed, 16 Jan 2019 13:04:32 +0800
Message-ID: <20190116050435.11624-1-ck.hu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Houlong Wei <houlong.wei@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

Mediatek mailbox controller implement its own data queue rather than using
mailbox framework's queue. This series let the framework provide abort
function and Mediatek mailbox controller implement the abort-function, so
it could use framework's queue.

The reason that Mediatek mailbox controller has to implement its own queue:
One client of Mediatek mailbox controller is display driver. When a cursor
is moving, display continuously update the register related to the cursor.
Display hardware has a limitation that register should be updated in the
vblank period which is a small interval. In tradition, display hardware
would trigger an interrupt when vblank start, and driver could update
register in this irq handler. But the interrupt handler has the risk that
it could be delayed by some reason so the handler may be postponed out of
this vblank interval. In order to reduce the risk, display driver use GCE
hardware to write register. If a cursor move 3 times before vblank,
display driver would send 3 messages sequentially to mailbox controller.
If the controller use framework's queue, controller just receive the
first message and the others is queued in framework. The first message
could be executed exactly in vblank interval but the other messages are
sent to controller when controller notify framework tx_done in interrupt
handler. The interrupt may be postponed by some reason this is what we
worried. So Mediatek mailbox controller has to implement its own queue to
make sure that all message execute in vblank interval.

The reason that abort-function could let Mediatek mailbox controller use
framework's queue:
The primary concept is to let display driver send at most one message to
mailbox controller. When it need to send the second message before the
first message is done, it should abort the first message and then send the
second message which should merge the first message. For other client
driver, it could still send multiple messages into framework's queue.

CK Hu (3):
  mailbox: Add ability for clients to abort data in channel
  mailbox: mediatek: Implement abort_data function.
  mailbox: mediatek: Remove busylist

 drivers/mailbox/mailbox.c          |  23 +++
 drivers/mailbox/mtk-cmdq-mailbox.c | 281 +++++++----------------------
 include/linux/mailbox_client.h     |   1 +
 include/linux/mailbox_controller.h |   4 +
 4 files changed, 90 insertions(+), 219 deletions(-)

-- 
2.18.0
