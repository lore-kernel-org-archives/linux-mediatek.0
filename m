From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [GIT PULL] dts64 updates for v5.2
Date: Wed, 24 Apr 2019 09:55:46 +0200
Message-ID: <47e01204-41b6-ba89-cbbb-3f684e3a7dff@gmail.com>
References: <5ea296e5-92bd-5790-c075-cf4bcb74d88c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5ea296e5-92bd-5790-c075-cf4bcb74d88c@gmail.com>
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
To: arm-soc <arm@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Seiya Wang <seiya.wang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Erin Lo <erin.lo@mediatek.com>, Fabien Parent <fparent@baylibre.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Zhiyong Tao <zhiyong.tao@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org



On 23/04/2019 18:12, Matthias Brugger wrote:
> Hi Anrd and Olof,
> 
> you can find below the pull request for mediatek related dts64.
> 
> Please have a look :)

Unfortunately the pull request has a minor merge conflict with the serial/tty
tree [1]. Is there any action needed from my side?

Regards,
Matthias

[1] https://marc.info/?l=linux-next&m=155606096822946&w=2

> 
> Regards,
> Matthias
> 
> ---
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
> tags/v5.1-next-dts64
> 
> for you to fetch changes up to a4599f6ec8e844f53dac15f719084d3b5ffe68c3:
> 
>   arm64: dts: mt8173: add pmu nodes for mt8173 (2019-04-16 10:55:30 +0200)
> 
> ----------------------------------------------------------------
> mt8173:
> - use assinged-clocks and assigned-clock-parents
> - fix compatible for SoC to a72
> - add pmu nodes
> 
> mt8183:
> - add sysirq binding
> - add pinctrl dt header file
> 
> mt7629:
> - update bindings description fo sysirq, uart and scpsys
> 
> mt8516:
> - add binding description for watchdog, timer, uart and sysirq
> 
> ----------------------------------------------------------------
> Erin Lo (1):
>       dt-bindings: mtk-sysirq: Add compatible for Mediatek MT8183
> 
> Fabien Parent (4):
>       dt-bindings: wdog: mtk-wdt: add support for MT851
>       dt-bindings: timer: mtk-timer: add support for MT8516
>       dt-bindings: serial: mtk-uart: add support for MT8516
>       dt-bindings: irq: mtk,sysirq: add support for MT8516
> 
> Ryder Lee (2):
>       dt-bindings: mediatek: update bindings for MT7629 SoC
>       dt-bindings: soc: fix a typo for MT7623A
> 
> Seiya Wang (2):
>       arm64: dts: mt8173: correct cpu type of cpu2 and cpu3 to cortex-a72
>       arm64: dts: mt8173: add pmu nodes for mt8173
> 
> Yunfei Dong (1):
>       arm64: dts: Using standard CCF interface to set vcodec clk
> 
> Zhiyong Tao (1):
>       arm64: dts: mt8183: add pinctrl file
> 
>  .../interrupt-controller/mediatek,sysirq.txt       |    7 +-
>  .../devicetree/bindings/serial/mtk-uart.txt        |    4 +-
>  .../devicetree/bindings/soc/mediatek/scpsys.txt    |    5 +-
>  .../bindings/timer/mediatek,mtk-timer.txt          |    1 +
>  .../devicetree/bindings/watchdog/mtk-wdt.txt       |    1 +
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi           |   35 +-
>  arch/arm64/boot/dts/mediatek/mt8183-pinfunc.h      | 1120 ++++++++++++++++++++
>  7 files changed, 1164 insertions(+), 9 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-pinfunc.h
> 
