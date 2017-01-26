From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mediatek: Use real dependencies
Date: Thu, 26 Jan 2017 16:26:29 +0100
Message-ID: <CACRpkdah+XHgyePTEFU0t4x8C_VkViNKNFWbCJLNne5LOWToog@mail.gmail.com>
References: <20170125103209.1d97b0bd@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170125103209.1d97b0bd@endymion>
Sender: linux-gpio-owner@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, Biao Huang <biao.huang@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
List-Id: linux-mediatek@lists.infradead.org

On Wed, Jan 25, 2017 at 10:32 AM, Jean Delvare <jdelvare@suse.de> wrote:

> Do not hide pinctrl drivers for Mediatek platforms using
> conditionals. Doing so actually leaves the symbols present (but
> always disabled) on all other platforms, which is confusing and
> inefficient. Better use real dependencies so that the symbols do not
> exist at all on platforms where they are not relevant.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Reported-by: Andreas F=C3=A4rber <afaerber@suse.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>

Patch applied with Matthias' review tag.

Yours,
Linus Walleij
