From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] soc: mediatek: soc driver updates for v5.2
Date: Tue, 23 Apr 2019 18:14:24 +0200
Message-ID: <269cf168-14c0-6a72-5078-0c8e307655eb@gmail.com>
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
Cc: Fabien Parent <fparent@baylibre.com>, Nathan Chancellor <natechancellor@gmail.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Olof and Arnd,

Below you can find the updates for soc drivers ready to be merged for v5.2.

Please take them into account.

Best regards,
Matthias

---

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.1-next-soc

for you to fetch changes up to 89e28da82836530f1ac7a3a32fecc31f22d79b3e:

  soc: mediatek: pwrap: Zero initialize rdata in pwrap_init_cipher (2019-04-12
21:57:49 +0200)

----------------------------------------------------------------
pmic wrapper:
- add mt8516 bindings
- add mt8516 driver support
- fix clang warning

----------------------------------------------------------------
Fabien Parent (3):
      dt-bindings: pwrap: mediatek: add pwrap support for MT8516
      soc: mediatek: pwrap: add missing check on rstc
      soc: mediatek: pwrap: add support for MT8516 pwrap

Nathan Chancellor (1):
      soc: mediatek: pwrap: Zero initialize rdata in pwrap_init_cipher

 .../devicetree/bindings/soc/mediatek/pwrap.txt     |   1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c               | 111 ++++++++++++++++++++-
 2 files changed, 110 insertions(+), 2 deletions(-)
