From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [v2 PATCH 4/4] phy: phy-meson-gxl-usb2: get optional clock by devm_clk_get_optional()
Date: Wed, 10 Apr 2019 19:59:05 +0200
Message-ID: <CAFBinCBoQ6C7MrtwSctDgFPpXnaRVKm490piGOFmN2i2PV3GOQ@mail.gmail.com>
References: <a8539bcf66065380069676fbea99a51254309803.1554874961.git.chunfeng.yun@mediatek.com>
 <9f04a619e8a2cc44f5b1fe299a08f237f069d56d.1554874961.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9f04a619e8a2cc44f5b1fe299a08f237f069d56d.1554874961.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Kevin Hilman <khilman@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Motoya Tanigawa <tanigawa.motoya@socionext.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, Apr 10, 2019 at 8:13 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> Use devm_clk_get_optional() to get optional clock
>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
now also:
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
(on my Khadas VIM by manually adjusting meson-gxl.dtsi and dropping
the clocks in usb2_phy0 and usb2_phy1)
