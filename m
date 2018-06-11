From: <argus.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH V5 0/4] Pwrap: Mediatek pwrap driver for mt6797
Date: Mon, 11 Jun 2018 18:49:56 +0800
Message-ID: <1528714200-2500-1-git-send-email-argus.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: argus.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Argus Lin <argus.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Here's version 5 of the patch series, include 4 patches:
1. Fix bug at cipher init for
5ae48040aa47 ("soc: mediatek: PMIC wrap: add mt6323 slave support")
2. Add pwrap driver for mt6797 SoCs.
3. Add mt6351 support for mt6797 SoCs.
4. A big change from V4 to V5 is we remove INT1 interrupt declaration since
it is only for debug purpose. The PWRAP_RDDMY, RESET and DCM can use legacy
setting, it is backwards compatible. The new caps flag declaration is not
needed, just remove it.

Changes from v3 to v4:
1)add caps flag for pwrap to explain pwrap's capability.
2)remove has_bridge flag, replace by caps flag.
3)add int1_en_all flag for new interrupt.
4)add pwrap drivers for mt6797 SoCs.
5)fix bug at cipher init for
5ae48040aa47 ("soc: mediatek: PMIC wrap: add mt6323 slave support")
6)add mt6351 support for mt6797 SoCs.

Changes from v2 to v3:
1)adjust upstream patch sequence.
2)fix build error for new filed at pmic_wrapper_type.
3)adjust pmic_type enum sequence.

Changes from v1 to v2:
1) add new capability field and MARCO for different pwrap series, the capability include BRIDGE, RESET, DCM, PRIORITY_SEL and INT1_EN.
2) add starvaction for mt6797 pwrap.
3) add INT1 interrupt to handle starvaction and request exception.



Argus Lin (4):
  dt-bindings: pwrap: mediatek: add pwrap support for MT6797
  soc: mediatek: pwrap: fix cipher init setting error
  soc: mediatek: pwrap: add pwrap driver for mt6797 SoCs
  soc: mediatek: pwrap: add mt6351 driver for mt6797 SoCs

 .../devicetree/bindings/soc/mediatek/pwrap.txt     |  1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c               | 81 +++++++++++++++++++++-
 2 files changed, 80 insertions(+), 2 deletions(-)

-- 
1.9.1
