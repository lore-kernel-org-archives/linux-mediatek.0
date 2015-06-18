From: Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/6] This series adds SMP support for the MediaTek MT6580.
Date: Thu, 18 Jun 2015 10:46:21 +0800
Message-ID: <1434595587-25466-1-git-send-email-scott.shu@mediatek.com>
References: <Scott Shu <srv_scott.shu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <Scott Shu <srv_scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: scott.shu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, srv_wsdupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Miles.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Mars.Cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, MY.Chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

This patchset adds support SMP on MediaTek MT6580 Cortex-A7 qual core SoC.

This is based on v4.1-rc1 and following patch series:
(1) Yingjoe Chen's "Add SMP bringup support for mt65xx socs" [1]
(2) Mars Cheng's "Add mt6580 basic chip support" [2]
(3) Sascha Hauer's "Mediatek SCPSYS power domain support" [3]

The secondary cores are power off as default on MT6580, this change adds
a new enable-method to turn on power to the cores during booting process.

The System Power Manager (SPM) inside the SCPSYS is for the CPU MTCMOS
power domain control. Please check [3] for more information about SCPSYS.

[1] https://lkml.org/lkml/2015/5/16/33
[2] https://lkml.org/lkml/2015/6/3/113
[3] https://lkml.org/lkml/2015/6/9/172


Scott Shu (6):
  Document: bindings: DT: Add SMP enable method for MT6580 SoC platform
  soc: Mediatek: Add SCPSYS CPU power domain driver
  ARM: mediatek: add smp bringup code for MT6580
  ARM: Mediatek: enable GPT6 on boot up to make arch timer working for MT6580
  ARM: dts: mt6580: Add device nodes to the MT6580 dtsi file
  ARM: dts: mt6580: enable basic SMP bringup for mt6580

 Documentation/devicetree/bindings/arm/cpus.txt |   1 +
 arch/arm/boot/dts/mt6580.dtsi                  |  25 +++
 arch/arm/mach-mediatek/Makefile                |   2 +-
 arch/arm/mach-mediatek/generic.h               |  24 +++
 arch/arm/mach-mediatek/hotplug.c               | 228 +++++++++++++++++++++++++
 arch/arm/mach-mediatek/mediatek.c              |   4 +-
 arch/arm/mach-mediatek/platsmp.c               | 107 ++++++++++++
 7 files changed, 389 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/mach-mediatek/generic.h
 create mode 100644 arch/arm/mach-mediatek/hotplug.c
