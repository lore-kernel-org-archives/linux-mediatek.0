From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] fixes for v4.11-next
Date: Tue, 9 May 2017 18:57:22 +0200
Message-ID: <3fed6631-6f28-027c-94fd-09188098f66e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Language: en-US
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
Cc: "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, yong.mao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Arnd and Olof,

First of all, sorry for being that late.
Please evaluate if you can merge the following fixes into your tree.

Thanks a lot,
Matthias

---
The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

   Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

   https://github.com/mbgg/linux-mediatek.git tags/v4.11-next-fixes

for you to fetch changes up to 1c0803652d82b9a62980886e019c9f70576028a5:

   ARM64: dts: mediatek: configure some fixed mmc parameters (2017-05-09 
18:35:33 +0200)

----------------------------------------------------------------
DTS fixes
- mt8173: fix mmc parameters
- set timer frequency explicitly and force the driver to set it

----------------------------------------------------------------
John Crispin (1):
       arm: dts: mt7623: add clock-frequency to the a7 timer node to 
mt7623.dtsi

yong mao (1):
       ARM64: dts: mediatek: configure some fixed mmc parameters

  arch/arm/boot/dts/mt7623.dtsi               | 2 ++
  arch/arm64/boot/dts/mediatek/mt8173-evb.dts | 3 +++
  2 files changed, 5 insertions(+)
