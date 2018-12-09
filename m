From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] soc: mediatek: SoC driver changes for v4.21
Date: Sun, 9 Dec 2018 23:08:56 +0100
Message-ID: <123d92d6-2cee-cae7-42e6-77aabda91038@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm-soc <arm@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Houlong Wei <houlong.wei@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Hi Arnd and Olof,

Below the very only patch, please have a look :)

Regards,
Matthias

---

The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v4.20-next-soc

for you to fetch changes up to 576f1b4bc80220e1f88f1de5ecb25d99a6e9fa04:

  soc: mediatek: Add Mediatek CMDQ helper (2018-12-02 20:46:10 +0100)

----------------------------------------------------------------
add helper functions to create and send commands to
the global command engine (GCE) device using the
command queue driver (cmdq).

----------------------------------------------------------------
Houlong Wei (1):
      soc: mediatek: Add Mediatek CMDQ helper

 drivers/soc/mediatek/Kconfig           |  12 ++
 drivers/soc/mediatek/Makefile          |   1 +
 drivers/soc/mediatek/mtk-cmdq-helper.c | 300 +++++++++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  | 133 +++++++++++++++
 4 files changed, 446 insertions(+)
 create mode 100644 drivers/soc/mediatek/mtk-cmdq-helper.c
 create mode 100644 include/linux/soc/mediatek/mtk-cmdq.h
