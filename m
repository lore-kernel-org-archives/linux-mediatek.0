From: Pi-Hsun Shih <pihsun@chromium.org>
Subject: [RFC v3 0/5] Add support for mt8183 SCP.
Date: Mon, 21 Jan 2019 15:18:28 +0800
Message-ID: <20190121071833.43443-1-pihsun@chromium.org>
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, Pi-Hsun Shih <pihsun@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

Add support for controlling and communicating with mt8183's system
control processor (SCP), using the remoteproc & rpmsg framework.
And also add a cros_ec driver for CrOS EC host command over rpmsg.

The overall structure of the series is:
* remoteproc/mtk_scp.c: Control the start / stop of SCP (Patch 2).
* remoteproc/mtk_scp_ipi.c: Communicates to SCP using inter-processor
  interrupt (IPI) and shared memory (Patch 2).
* rpmsg/mtk_rpmsg.c: Wrapper to wrap the IPI communication into a rpmsg
  device. Supports name service for SCP firmware to
  announce channels (Patch 3).
* platform/chrome/cros_ec_rpmsg.c: Communicates with the SCP over the
  rpmsg framework (like what platform/chrome/cros_ec_{i2c,spi}.c does)
  (Patch 4).

Since I'm not familiar with the remoteproc / rpmsg framework, and there
are not much other custom rpmsg driver for reference, would like some
review / comments on the overall structure of the driver.

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

Erin Lo (2):
  dt-bindings: Add a binding for Mediatek SCP
  remoteproc/mediatek: add SCP support for mt8183

Pi-Hsun Shih (3):
  rpmsg: add rpmsg support for mt8183 SCP.
  mfd: add EC host command support using rpmsg.
  cros_ec: differentiate SCP from EC by feature bit.

 .../bindings/remoteproc/mtk,scp.txt           |  10 +
 drivers/mfd/cros_ec_dev.c                     |   9 +
 drivers/platform/chrome/Kconfig               |   8 +
 drivers/platform/chrome/Makefile              |   1 +
 drivers/platform/chrome/cros_ec_rpmsg.c       | 186 +++++++
 drivers/remoteproc/Kconfig                    |   9 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/mtk_common.h               |  75 +++
 drivers/remoteproc/mtk_scp.c                  | 460 ++++++++++++++++++
 drivers/remoteproc/mtk_scp_ipi.c              | 127 +++++
 drivers/rpmsg/Kconfig                         |   8 +
 drivers/rpmsg/Makefile                        |   1 +
 drivers/rpmsg/mtk_rpmsg.c                     | 395 +++++++++++++++
 include/linux/mfd/cros_ec.h                   |   1 +
 include/linux/mfd/cros_ec_commands.h          |   2 +
 include/linux/platform_data/mtk_scp.h         | 137 ++++++
 include/linux/rpmsg/mtk_rpmsg.h               |  35 ++
 17 files changed, 1465 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
 create mode 100644 drivers/platform/chrome/cros_ec_rpmsg.c
 create mode 100644 drivers/remoteproc/mtk_common.h
 create mode 100644 drivers/remoteproc/mtk_scp.c
 create mode 100644 drivers/remoteproc/mtk_scp_ipi.c
 create mode 100644 drivers/rpmsg/mtk_rpmsg.c
 create mode 100644 include/linux/platform_data/mtk_scp.h
 create mode 100644 include/linux/rpmsg/mtk_rpmsg.h

-- 
2.20.1.321.g9e740568ce-goog
