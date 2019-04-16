From: <michael.mei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/2] Add Mediatek Efuse Device Node
Date: Tue, 16 Apr 2019 16:19:18 +0800
Message-ID: <20190416081922.21711-1-michael.mei@mediatek.com>
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
To: orz811017-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Michael Mei <michael.mei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

From: Michael Mei <michael.mei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

This patch adds efuse and soc_data device nodes to read via NVMEM.
These device nodes store data including thermal calibration, chip ID,
and drivers like thermal sensor will read out theses data to configure
dirver.

Michael Mei (2):
  arm64: dts: mt8183: add efuse and Mediatek Chip id node to read
  dt-bindings: nvmem: mediatek: add support for MediaTek mt8183 SoC

 .../devicetree/bindings/nvmem/mtk-efuse.txt       |  1 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi          | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

-- 
2.18.0
