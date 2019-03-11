From: Pi-Hsun Shih <pihsun@chromium.org>
Subject: [PATCH v6 0/7] Add support for mt8183 SCP.
Date: Mon, 11 Mar 2019 14:34:51 +0800
Message-ID: <20190311063458.137473-1-pihsun@chromium.org>
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, Pi-Hsun Shih <pihsun@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

Add support for controlling and communicating with mt8183's system
control processor (SCP), using the remoteproc & rpmsg framework.
And also add a cros_ec driver for CrOS EC host command over rpmsg.

The overall structure of the series is:
* remoteproc/mtk_scp.c: Control the start / stop of SCP (Patch 2, 3).
* remoteproc/mtk_scp_ipi.c: Communicates to SCP using inter-processor
  interrupt (IPI) and shared memory (Patch 2, 3).
* rpmsg/mtk_rpmsg.c: Wrapper to wrap the IPI communication into a rpmsg
  device. Supports name service for SCP firmware to
  announce channels (Patch 4).
* platform/chrome/cros_ec_rpmsg.c: Communicates with the SCP over the
  rpmsg framework (like what platform/chrome/cros_ec_{i2c,spi}.c does)
  (Patch 5, 6, 7).

Since I'm not familiar with the remoteproc / rpmsg framework, and there
are not much other custom rpmsg driver for reference, would like some
review / comments on the overall structure of the driver.

Changes from v5:

Changes from v4:
 - Merge patch 6 (Load ELF firmware) into patch 2, so the driver loads
   ELF firmware by default, and no longer accept plain binary.
 - rpmsg_device listed in device tree (as a child of the SCP node) would
   have it's device tree node mapped to the rpmsg_device, so the rpmsg
   driver can use the properties on device tree.

Changes from v3:
 - Make writing to SCP SRAM aligned.
 - Add a new patch (Patch 6) to load ELF instead of bin firmware.
 - Add host event support for EC driver.
 - Fix some bugs found in testing (missing spin_lock_init,
   rproc_subdev_unprepare to rproc_subdev_stop).
 - Fix some coding style issue found by checkpatch.pl.

Changes from v2:
 - Fold patch 3 into patch 2 in v2.
 - Move IPI id around to support cross-testing for old and new firmware.
 - Finish more TODO items.

Changes from v1:
 - Extract functions and rename variables in mtk_scp.c.
 - Do cleanup properly in mtk_rpmsg.c, which also removes the problem of
   short-lived work items.
 - Code format fix based on feedback for cros_ec_rpmsg.c.
 - Extract feature detection for SCP into separate patch (Patch 6).

Erin Lo (3):
  dt-bindings: Add a binding for Mediatek SCP
  remoteproc/mediatek: add SCP support for mt8183
  remoteproc: mt8183: add reserved memory manager API

Pi-Hsun Shih (4):
  rpmsg: add rpmsg support for mt8183 SCP.
  dt-bindings: Add binding for cros-ec-rpmsg.
  platform/chrome: cros_ec: add EC host command support using rpmsg.
  cros_ec: differentiate SCP from EC by feature bit.

 .../devicetree/bindings/mfd/cros-ec.txt       |   5 +-
 .../bindings/remoteproc/mtk,scp.txt           |  36 +
 drivers/mfd/cros_ec_dev.c                     |   9 +
 drivers/platform/chrome/Kconfig               |   9 +
 drivers/platform/chrome/Makefile              |   1 +
 drivers/platform/chrome/cros_ec_rpmsg.c       | 265 ++++++++
 drivers/remoteproc/Kconfig                    |  10 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/mtk_common.h               |  77 +++
 drivers/remoteproc/mtk_scp.c                  | 628 ++++++++++++++++++
 drivers/remoteproc/mtk_scp_ipi.c              | 163 +++++
 drivers/rpmsg/Kconfig                         |   9 +
 drivers/rpmsg/Makefile                        |   1 +
 drivers/rpmsg/mtk_rpmsg.c                     | 385 +++++++++++
 include/linux/mfd/cros_ec.h                   |   1 +
 include/linux/mfd/cros_ec_commands.h          |   2 +
 include/linux/platform_data/mtk_scp.h         | 157 +++++
 include/linux/rpmsg/mtk_rpmsg.h               |  18 +
 18 files changed, 1776 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
 create mode 100644 drivers/platform/chrome/cros_ec_rpmsg.c
 create mode 100644 drivers/remoteproc/mtk_common.h
 create mode 100644 drivers/remoteproc/mtk_scp.c
 create mode 100644 drivers/remoteproc/mtk_scp_ipi.c
 create mode 100644 drivers/rpmsg/mtk_rpmsg.c
 create mode 100644 include/linux/platform_data/mtk_scp.h
 create mode 100644 include/linux/rpmsg/mtk_rpmsg.h

-- 
2.21.0.360.g471c308f928-goog
