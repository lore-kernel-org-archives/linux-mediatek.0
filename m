From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: mediatek: dts changes for v4.21
Date: Sun, 9 Dec 2018 23:08:59 +0100
Message-ID: <e5b4136c-99fe-16ec-8974-9c4d1d83efa8@gmail.com>
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
tags/v4.20-next-dts64

for you to fetch changes up to c2e66b8f7c37567e63859e04b3e69fa7027ebb86:

  arm64: dts: mt8173: Add GCE node (2018-12-05 12:16:39 +0100)

----------------------------------------------------------------
mt8173: add node for the command queue device

----------------------------------------------------------------
Houlong Wei (1):
      arm64: dts: mt8173: Add GCE node

 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)
