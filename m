From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] ARM: mediatek: 32-bit DT updates for v4.19
Date: Thu, 26 Jul 2018 10:31:09 +0200
Message-ID: <3ee3ccfb-8fd6-34b0-c03d-67532067e707@gmail.com>
References: <2d918d15-d1d3-b4e0-7427-0b3baa56100a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2d918d15-d1d3-b4e0-7427-0b3baa56100a@gmail.com>
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Ryder Lee <ryder.lee@mediatek.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Frank Wunderlich <frank-w@public-files.de>
List-Id: linux-mediatek@lists.infradead.org

Hi Olof,
Hi Arnd,

This is the second attempt to send the pull request, as in the first one I sent
the branch instead of the tag.

Please have a look.
Regards,
Matthias

---

The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:

  Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v4.18-next-dts32

for you to fetch changes up to 11a20c5601c5f0c685fa3a166348b7ffa830e123:

  dt-bindings: arm: mediatek: cleanup MT7623N reference boards (2018-07-16
15:57:40 +0200)

----------------------------------------------------------------
- mt7623
- delete unsupported reference board
- fix pio leds
- add missing cooling device

----------------------------------------------------------------
Frank Wunderlich (1):
      arm: dts: mediatek: Fix pio-leds for Bananapi-R2

Ryder Lee (2):
      arm: dts: mt7623: cleanup MT7623N NAND dts file
      dt-bindings: arm: mediatek: cleanup MT7623N reference boards

Viresh Kumar (1):
      arm: dts: mediatek: Add missing cooling device properties for CPUs

 Documentation/devicetree/bindings/arm/mediatek.txt |  3 -
 arch/arm/boot/dts/Makefile                         |  1 -
 arch/arm/boot/dts/mt7623.dtsi                      |  3 +
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts      |  6 +-
 arch/arm/boot/dts/mt7623n-rfb-nand.dts             | 73 ------------------
 arch/arm/boot/dts/mt7623n-rfb.dtsi                 | 86 ----------------------
 6 files changed, 6 insertions(+), 166 deletions(-)
 delete mode 100644 arch/arm/boot/dts/mt7623n-rfb-nand.dts
 delete mode 100644 arch/arm/boot/dts/mt7623n-rfb.dtsi
