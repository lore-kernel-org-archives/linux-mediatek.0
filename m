From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] soc: mediatek: Add compile dependency to pmic-wrapper
Date: Wed, 27 May 2015 16:27:47 +0200
Message-ID: <CABuKBeLD9wpMqErGmFD6c_LTem_DXxu19CEvu0DJ4c6R4CeotQ@mail.gmail.com>
References: <1432729865-32319-1-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432729865-32319-1-git-send-email-matthias.bgg@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

2015-05-27 14:31 GMT+02:00 Matthias Brugger <matthias.bgg@gmail.com>:
> The pmic-wrapper calls the reset controller. If CONFIG_RESET_CONTROLL=
ER
> is not set, compilation fails with:
> drivers/soc/mediatek/mtk-pmic-wrap.c: In function =E2=80=98pwrap_prob=
e=E2=80=99:
> drivers/soc/mediatek/mtk-pmic-wrap.c:836:2: error: implicit declarati=
on of function =E2=80=98devm_reset_control_get=E2=80=99 [-Werror=3Dimpl=
icit-function-declaration]
>
> This patch sets the dependency in the Kconfig file.
>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  drivers/soc/mediatek/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>

Applied to v4.1-next/soc
