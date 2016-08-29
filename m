From: RogerCC.Lin <rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/2] mtd: nand: fix writing incorrect ECC parity data in
 OOB region.
Date: Mon, 29 Aug 2016 19:40:03 +0800
Message-ID: <1472470803.11041.4.camel@mtkswgap22>
References: <1472443093.27061.4.camel@mtkswgap22>
 <20160829101006.2b200e0a@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20160829101006.2b200e0a@bbrezillon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, steven.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

This series fix chances to write incorrect ECC data which may cause
uncorrectable ECC error when reading.

changes since v1:
- separate patches into 2.
- use shift operator with byte access to avoid endianness conversion
problems.
- follow linux coding style.

The patch passed the test of UBIFS file-system read/write on Mediatek's
RFB. The tested driver is checked-out from LEDE OpenWRT project's
upstream driver, which is pretty much same as nand/next branch upstream
driver(git clone https://git.lede-project.org/source.git).

RogerCC Lin (2):
  mtd: nand: fix generating over-boundary ECC data when writing.
  mtd: nand: fix chances to create incomplete ECC data when writing.

 drivers/mtd/nand/mtk_ecc.c  |   12 ++++++++----
 drivers/mtd/nand/mtk_nand.c |    8 ++++----
 2 files changed, 12 insertions(+), 8 deletions(-)
