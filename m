From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [PATCH 0/4] mfd: mediatek: add support for MT6323
Date: Sun, 10 Jan 2016 17:18:45 +0100
Message-ID: <1452442729-27154-1-git-send-email-blogic@openwrt.org>
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
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

MT6323 and MT6397 are very similar. Currently there is only a regulator
driver for the MT6323. This series is based on a patch that I was given
by MTK.

Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>

John Crispin (4):
  dt-bindings: mfd: Add bindings for the MediaTek MT6323 PMIC
  mfd: mediatek: int_con and int_status may vary in location
  mfd: mediatek: add support for different Slave types
  mfd: mediatek: add MT6323 support to MT6397 driver

 Documentation/devicetree/bindings/mfd/mt6397.txt |   10 +-
 drivers/mfd/mt6397-core.c                        |   77 +++-
 include/linux/mfd/mt6323/core.h                  |   42 +++
 include/linux/mfd/mt6323/registers.h             |  414 ++++++++++++++++++++++
 include/linux/mfd/mt6397/core.h                  |    2 +
 5 files changed, 527 insertions(+), 18 deletions(-)
 create mode 100644 include/linux/mfd/mt6323/core.h
 create mode 100644 include/linux/mfd/mt6323/registers.h

-- 
1.7.10.4
