From: Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH v2] fixup null q->dev checking in both block and scsi layer
Date: Thu, 12 Sep 2019 16:35:26 +0800
Message-ID: <1568277328-4597-1-git-send-email-stanley.chu@mediatek.com>
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
To: linux-scsi@vger.kernel.org, linux-block@vger.kernel.org, martin.petersen@oracle.com, axboe@kernel.dk, jejb@linux.ibm.com, matthias.bgg@gmail.com
Cc: andy.teng@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com, linux-mediatek@lists.infradead.org, peter.wang@mediatek.com, Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Some devices may skip blk_pm_runtime_init() and have null pointer in its request_queue->dev. For example, SCSI devices of UFS Well-Known LUNs.

Currently the null pointer is checked by the user of blk_set_runtime_active(), i.e., scsi_dev_type_resume(). It is better to check it by blk_set_runtime_active() itself instead of by its users.

v1 => v2:
- Change if style in blk_set_runtime_active() (Jens)

Stanley Chu (2):
  block: bypass blk_set_runtime_active for uninitialized q->dev
  scsi: core: remove dummy q->dev check

 block/blk-pm.c         | 12 +++++++-----
 drivers/scsi/scsi_pm.c |  3 +--
 2 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.18.0
