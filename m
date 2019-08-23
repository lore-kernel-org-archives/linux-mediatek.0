From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm: mediatek: dts32 updates for v5.4
Date: Fri, 23 Aug 2019 18:40:40 +0200
Message-ID: <e236f659-2851-21b8-1873-314cd72ed6be@gmail.com>
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
To: arm-soc <arm@kernel.org>, soc@kernel.org
Cc: Ryder Lee <ryder.lee@mediatek.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Arnd and Olof,

please have a look on the following patch.

Regards,
Matthias

---
The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.3-next-dts32

for you to fetch changes up to cc212241df0b8975bb0e6d7f9028405a9c664e49:

  arm: dts: mediatek: add basic support for MT7629 SoC (2019-08-22 11:22:17 +0200)

----------------------------------------------------------------
add support for the mt7629 reference board

----------------------------------------------------------------
Ryder Lee (1):
      arm: dts: mediatek: add basic support for MT7629 SoC

 arch/arm/boot/dts/Makefile                |   1 +
 arch/arm/boot/dts/mt7629-rfb.dts          | 263 ++++++++++++++++
 arch/arm/boot/dts/mt7629.dtsi             | 481 ++++++++++++++++++++++++++++++
 include/dt-bindings/reset/mt7629-resets.h |  71 +++++
 4 files changed, 816 insertions(+)
 create mode 100644 arch/arm/boot/dts/mt7629-rfb.dts
 create mode 100644 arch/arm/boot/dts/mt7629.dtsi
 create mode 100644 include/dt-bindings/reset/mt7629-resets.h
