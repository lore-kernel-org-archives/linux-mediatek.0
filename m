From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH][V2] pinctrl: mediatek: mtk-common: initialize unmask
Date: Mon, 4 May 2015 15:20:47 +0200
Message-ID: <CACRpkdY8CX2aErL8jSGYwZrBn45QQo7jeND3xwMNm9g7Lh-UMg@mail.gmail.com>
References: <1429545557-3404-1-git-send-email-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1429545557-3404-1-git-send-email-colin.king@canonical.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Axel Lin <axel.lin@ingics.com>, Maoguang Meng <maoguang.meng@mediatek.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
List-Id: linux-mediatek@lists.infradead.org

On Mon, Apr 20, 2015 at 5:59 PM, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> cppcheck detected an uninitialized variable:
>
> [drivers/pinctrl/mediatek/pinctrl-mtk-common.c:897]:
>   (error) Uninitialized variable: unmask
>
> unmask should be initialized to zero to ensure unmasking
> only occurs if a previous mask occurred. The current situation
> is that the unmask variable could contain any random garbage
> causing random unexpected unmasking.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied for fixes.

Yours,
Linus Walleij
