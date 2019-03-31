From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 4/4] phy: phy-meson-gxl-usb2: get optional clock by devm_clk_get_optional()
Date: Sun, 31 Mar 2019 22:39:56 +0200
Message-ID: <CAFBinCA3L650-9s0-y_hAP=pS2n=E_YTxn3LnRL_CTs76u2H9A@mail.gmail.com>
References: <a8539bcf66065380069676fbea99a51254309803.1553914418.git.chunfeng.yun@mediatek.com>
 <c0d6e2a75efc26eb1af49506e6c2cead394abecb.1553914418.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c0d6e2a75efc26eb1af49506e6c2cead394abecb.1553914418.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Sat, Mar 30, 2019 at 10:12 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> Use devm_clk_get_optional() to get optional clock
>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Acked-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>

thank you for this cleanup!

if you also want a Tested-by then please give me a few days (until I
have time to boot with this patch applied on my Khadas VIM or VIM2)


Regards

Martin
