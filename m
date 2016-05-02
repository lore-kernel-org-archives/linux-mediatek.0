From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] ARM: mediatek: dts updates for v4.7
Date: Mon, 2 May 2016 16:37:23 +0200
Message-ID: <CABuKBe+jtD4nLXFrxTxKJ_Fq9t9D9a_ibXsSkvvZw5e5p_fZeA@mail.gmail.com>
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
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Biao Huang <biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi all,

Please take the following updates.

Thanks,
Matthias

---

The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  https://github.com/mbgg/linux-mediatek.git tags/v4.6-next-dts

for you to fetch changes up to 610175b7972afc78f0e4a622a17a32b1fccad4bf:

  dt-bindings: MediaTek: Add binding document for the AUXADC
(2016-04-20 13:32:57 +0200)

----------------------------------------------------------------
- add pinctrl node for mt2701
- add mt2701 pmic wrapper binding
- add auxadc binding document

----------------------------------------------------------------
Biao Huang (1):
      arm: dts: Add pinctrl/GPIO/EINT node for mt2701

John Crispin (1):
      dt-bindings: ARM: Mediatek: add MT2701/7623 string to the PMIC wrapper doc

Sascha Hauer (1):
      dt-bindings: MediaTek: Add binding document for the AUXADC

 .../devicetree/bindings/soc/mediatek/auxadc.txt     | 21 +++++++++++++++++++++
 .../devicetree/bindings/soc/mediatek/pwrap.txt      |  1 +
 arch/arm/boot/dts/mt2701.dtsi                       | 19 +++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/auxadc.txt
