From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] ARM: mediatek: DT: Move reset controller constants into
 common location
Date: Tue, 24 Nov 2015 19:08:09 +0100
Message-ID: <5654A789.7070704@gmail.com>
References: <1448019764-31723-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448019764-31723-1-git-send-email-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, James Liao <jamesjj.liao@mediatek.com>, kernel@pengutronix.de
List-Id: linux-mediatek@lists.infradead.org



On 20/11/15 12:42, Philipp Zabel wrote:
> By popular vote, the DT binding includes for reset controllers are located
> in include/dt-bindings/reset/. Move the mediatek reset constants in there,
> too, to avoid confusion.
>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>   .../bindings/arm/mediatek/mediatek,infracfg.txt    |  2 +-
>   .../bindings/arm/mediatek/mediatek,pericfg.txt     |  2 +-
>   arch/arm/boot/dts/mt8135.dtsi                      |  2 +-
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi           |  2 +-
>   .../dt-bindings/reset-controller/mt8135-resets.h   | 64 ----------------------
>   .../dt-bindings/reset-controller/mt8173-resets.h   | 63 ---------------------
>   include/dt-bindings/reset/mt8135-resets.h          | 64 ++++++++++++++++++++++
>   include/dt-bindings/reset/mt8173-resets.h          | 63 +++++++++++++++++++++
>   8 files changed, 131 insertions(+), 131 deletions(-)
>   delete mode 100644 include/dt-bindings/reset-controller/mt8135-resets.h
>   delete mode 100644 include/dt-bindings/reset-controller/mt8173-resets.h
>   create mode 100644 include/dt-bindings/reset/mt8135-resets.h
>   create mode 100644 include/dt-bindings/reset/mt8173-resets.h
>

Applied, thanks.
