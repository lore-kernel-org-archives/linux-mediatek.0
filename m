From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] Mediatek DT 32 bit updates for v5.1
Date: Fri, 8 Feb 2019 20:59:39 +0100
Message-ID: <40e8af4e-e86d-af97-d9bf-0932c97a2829@gmail.com>
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Ryder Lee <ryder.lee@mediatek.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Arnd,
Hi Olof,

Please find below changes for 32 bit device tree for v5.1.

Please merge :)
Matthias

---
The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.0-next-dts32

for you to fetch changes up to 60b71a239bbd286232a547349815d6330f10db7c:

  dt-bindings: interrupt-controller: update bindings for MT7623 (2019-02-08
13:18:04 +0100)

----------------------------------------------------------------
mt7623:
add cooling mask to all CPUs
add compatible to sysirq binding

----------------------------------------------------------------
Ryder Lee (1):
      dt-bindings: interrupt-controller: update bindings for MT7623

Viresh Kumar (1):
      ARM: dts: mt7623: Add all CPUs in cooling maps

 .../bindings/interrupt-controller/mediatek,sysirq.txt     |  1 +
 arch/arm/boot/dts/mt7623.dtsi                             | 15 ++++++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)
