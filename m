From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm: mediatek: soc driver updates for v5.4
Date: Fri, 23 Aug 2019 18:43:53 +0200
Message-ID: <8c860e37-3816-d75f-fc37-ce496905ba73@gmail.com>
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
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Bibby Hsieh <bibby.hsieh@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Hi Olof and Arnd,

Please find below two patches for soc drivers.

See you,
Matthias

---
The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.3-next-soc

for you to fetch changes up to 556030f0604f3cf5f1ea91307c0695541e5c74ca:

  soc: mediatek: cmdq: change the type of input parameter (2019-08-23 14:06:48
+0200)

----------------------------------------------------------------
cmdq helper:
reoder function parameter and change size of the parameters

----------------------------------------------------------------
Bibby Hsieh (2):
      soc: mediatek: cmdq: reorder the parameter
      soc: mediatek: cmdq: change the type of input parameter

 drivers/soc/mediatek/mtk-cmdq-helper.c | 10 +++++-----
 include/linux/soc/mediatek/mtk-cmdq.h  | 14 +++++++-------
 2 files changed, 12 insertions(+), 12 deletions(-)
