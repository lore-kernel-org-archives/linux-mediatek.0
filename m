From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] ARM: Mediatek soc drivers for v4.13
Date: Fri, 23 Jun 2017 12:32:10 +0200
Message-ID: <CAK8P3a2jG9TZgqwM9_2iE7bUsW9duCuXw+ZpW8NfMANHO4_T7w@mail.gmail.com>
References: <25946bae-31fb-ab97-aedb-92681cf603c4@gmail.com>
 <a24f9e49-3c5e-052e-83ef-b58705cf7b11@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <a24f9e49-3c5e-052e-83ef-b58705cf7b11@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, arm-soc <arm@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mars Cheng <mars.cheng@mediatek.com>, Shailendra Verma <shailendra.v@samsung.com>
List-Id: linux-mediatek@lists.infradead.org

On Tue, Jun 20, 2017 at 12:10 PM, Matthias Brugger
<matthias.bgg@gmail.com> wrote:
> Hi Olof and Arnd,
>
> Olof merged my v4.12-next-dts32 and v4.12-next-dts64 branch, but didn't
> merge this one.

AFAICT, he merged it but forgot to send an email about it.

> Actually dts64 depends on a this branch as it provides the dt-binding header
> for the scpsys on mt6797. Not sure if I screwed up here having such
> dependencies between my branches.

You did, but it already went in unnoticed and I now get this build
error in next/dt:

make O=obj-arm64 ARCH=arm64 dtbs
CROSS_COMPILE=/home/arnd/cross-gcc/bin/aarch64-linux- -skj30
In file included from ../arch/arm64/boot/dts/mediatek/mt6797-evb.dts:16:0:
../arch/arm64/boot/dts/mediatek/mt6797.dtsi:15:10: fatal error:
dt-bindings/power/mt6797-power.h: No such file or directory
 #include <dt-bindings/power/mt6797-power.h>

I've fixed it up for now with this patch:

>From 10c235cdc9350c6da40760f7468d1189bfd4e7ff Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 23 Jun 2017 12:28:34 +0200
Subject: [PATCH] arm64: dts: mediatek: don't include missing file

This resolves a build error in the next/dt branch:

In file included from arch/arm64/boot/dts/mediatek/mt6797-evb.dts:16:0:
arch/arm64/boot/dts/mediatek/mt6797.dtsi:15:10: fatal error:
dt-bindings/power/mt6797-power.h: No such file or directory

003f5d0c3462 ("arm64: dts: mediatek: add clk and scp nodes for MT6797")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index 3512c8e6dc65..31088a9f71de 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -12,7 +12,6 @@
  */

 #include <dt-bindings/clock/mt6797-clk.h>
-#include <dt-bindings/power/mt6797-power.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>

Once you actually start using the symbols from mt6797-power.h,
you'll have to add this back, but after the merge window it will be
there from the drivers branch.

In the future, please make sure each branch can be built by itself
and produce a working kernel image, including "make dtb".

      Arnd
