From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] ARM: mediatek: soc commits for v4.19
Date: Sun, 22 Jul 2018 22:51:53 +0200
Message-ID: <9fdbdba4-c2e0-510d-62bb-e0a604942e19@gmail.com>
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
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Argus Lin <argus.lin@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Hi Arnd, hi Olof,

Please don't forget the following commits.

Best regards,
Matthias

---

The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:

  Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
v4.18-next/soc

for you to fetch changes up to 00673189b8b971c00417632ffe4c90ba9b4f2568:

  soc: mediatek: pwrap: add mt6351 driver for mt6797 SoCs (2018-07-16 15:50:17
+0200)

----------------------------------------------------------------
Argus Lin (4):
      dt-bindings: pwrap: mediatek: add pwrap support for MT6797
      soc: mediatek: pwrap: fix cipher init setting error
      soc: mediatek: pwrap: add pwrap driver for mt6797 SoCs
      soc: mediatek: pwrap: add mt6351 driver for mt6797 SoCs

 .../devicetree/bindings/soc/mediatek/pwrap.txt     |  1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c               | 81 +++++++++++++++++++++-
 2 files changed, 80 insertions(+), 2 deletions(-)
