From: Mars Cheng <mars.cheng@mediatek.com>
Subject: Re: [Patch 0/2] Add mt6580 basic chip support
Date: Mon, 15 Jun 2015 11:08:45 +0800
Message-ID: <1434337725.21703.2.camel@mtkswgap22>
References: <1433319533-24803-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433319533-24803-1-git-send-email-mars.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Yingjoe Chen <yingjoe.chen@mediatek.com>, CC Hwang <cc.hwang@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, MY Chuang <my.chuang@mediatek.com>, Scott Shu <scott.shu@mediatek.com>, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

Hi all

May I know if I miss anything to let this patch be reviewed?
I will do my best to fix the problems.

Thanks a lot.

On Wed, 2015-06-03 at 16:18 +0800, Mars Cheng wrote:
> This series add support to mediatek's new SoC, mt6580, a 4-core CA7.
> Only basic I/O, including interrupt, timer & uart.
> 
> Mars Cheng (2):
>   Document: DT: Add bindings for mediatek MT6580 SoC Platform
>   ARM: dts: mediatek: add mt6580 basic support
> 
>  Documentation/devicetree/bindings/arm/mediatek.txt |   4 +
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/mt6580-evbp1.dts                 |  34 ++++++
>  arch/arm/boot/dts/mt6580.dtsi                      | 130 +++++++++++++++++++++
>  4 files changed, 169 insertions(+)
>  create mode 100644 arch/arm/boot/dts/mt6580-evbp1.dts
>  create mode 100644 arch/arm/boot/dts/mt6580.dtsi
> 
> --
> 1.8.1.1.dirty
> 
