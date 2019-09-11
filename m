From: Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH v1] scsi: allow auto suspend override by low-level driver
Date: Wed, 11 Sep 2019 17:41:27 +0800
Message-ID: <1568194890-24439-1-git-send-email-stanley.chu@mediatek.com>
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
To: linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, pedrom.sousa@synopsys.com, sthumma@codeaurora.org, jejb@linux.ibm.com, bvanassche@acm.org
Cc: marc.w.gonzalez@free.fr, andy.teng@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com, evgreen@chromium.org, subhashj@codeaurora.org, linux-mediatek@lists.infradead.org, peter.wang@mediatek.com, vivek.gautam@codeaurora.org, matthias.bgg@gmail.com, Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
List-Id: linux-mediatek@lists.infradead.org

Until now the scsi mid-layer forbids runtime suspend till userspace
enables it. This is mainly to quarantine some disks with broken
runtime power management or have high latencies executing suspend
resume callbacks. If the userspace doesn't enable the runtime suspend
the underlying hardware will be always on even when it is not doing
any useful work and thus wasting power.

Some low-level drivers for the controllers can efficiently use runtime
power management to reduce power consumption and improve battery life.

This patchset allows runtime suspend parameters override within the LLD itself
instead of waiting for userspace to control the power management, and
make UFS as the first user of this capability.

Stanley Chu (3):
  scsi: core: allow auto suspend override by low-level driver
  scsi: ufs: override auto suspend tunables for ufs
  scsi: ufs-mediatek: enable auto suspend capability

 drivers/scsi/scsi_sysfs.c       |  3 ++-
 drivers/scsi/sd.c               |  3 +++
 drivers/scsi/ufs/ufs-mediatek.c |  7 +++++++
 drivers/scsi/ufs/ufshcd.c       |  8 ++++++++
 drivers/scsi/ufs/ufshcd.h       | 10 ++++++++++
 include/scsi/scsi_device.h      |  2 +-
 6 files changed, 31 insertions(+), 2 deletions(-)

-- 
2.18.0
