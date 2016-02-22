From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] ARM: mediatek: dts updates for v4.6
Date: Mon, 22 Feb 2016 13:43:15 +0100
Message-ID: <CABuKBeK+zT85Z695dBGO-0tU26w5LBJqS53aecdZYGZ6V0GPhA@mail.gmail.com>
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
Cc: Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Bayi Cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Arnd and Olof,

Please pull the following patches.
As you can see from the description, this pull request includes some
fixes. Only a few developer have access to a Mediatek HW at the
moment. Therefore I didn't send the fixes to stable.

If you want me to send the fixes for older kernel versions, please let me know.

Thanks,
Matthias

---

The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f08d:

  Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)

are available in the git repository at:

  https://github.com/mbgg/linux-mediatek.git tags/v4.5-next-dts64

for you to fetch changes up to 3ea064b1e5adc263893ffdc3a11891c6d00d5e49:

  ARM64: dts: Mediatek: mt8173-evb: fix access MMC fail issue
(2016-02-19 11:05:09 +0100)

----------------------------------------------------------------
Add nor-flash to mt8173 SoC.
Add efuse device to mt1873 SoC.
Fix power-domain issue mt8173-evb which uses older chip revision.

----------------------------------------------------------------
Bayi Cheng (1):
      arm64: dts: mt8173: Add nor flash node

Eddie Huang (1):
      ARM64: dts: Mediatek: mt8173-evb: fix access MMC fail issue

andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org (1):
      dts: arm64: Add EFUSE device node

 arch/arm64/boot/dts/mediatek/mt8173-evb.dts |  3 +++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi    | 16 ++++++++++++++++
 2 files changed, 19 insertions(+)
