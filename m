From: Sylvain Lemieux <slemieux.tyco@gmail.com>
Subject: Re: [PATCH] watchdog: convert remaining drivers to use SPDX license identifier
Date: Thu, 20 Jun 2019 15:16:53 -0400
Message-ID: <CA+rxa6qJJjFWmMOHL-mpJZ5e5YAan-7887bQPwC8KEfCmQaW+A@mail.gmail.com>
References: <1561048126-27578-1-git-send-email-linux@roeck-us.net> <20190620170736.GA10902@anatevka>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190620170736.GA10902@anatevka>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerry.Hoemann@hpe.com
Cc: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, William Breathitt Gray <vilhelm.gray@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Matthias Brugger <matthias.bgg@gmail.com>, Wan ZongShun <mcuos.com@gmail.com>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, linux-arm-msm@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, Jun 20, 2019 at 1:07 PM Jerry Hoemann <jerry.hoemann@hpe.com> wrote:
>
> On Thu, Jun 20, 2019 at 09:28:46AM -0700, Guenter Roeck wrote:
> > This gets rid of the unnecessary license boilerplate, and avoids
> > having to deal with individual patches one by one.
> >
> > No functional changes.
> >
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> > Note: Several drivers include a paragraph such as
> >
> > "Neither <name> nor <company> admit liability nor
> >  provide warranty for any of this software. This material is
> >  provided "AS-IS" and at no charge."
> >
> > Presumably this is covered by the GPL license. However, since I am not
> > an attorney, I am not sure, and I opted for leaving such paragraphs in
> > place.
> >
[...]
> >  drivers/watchdog/pnx4008_wdt.c         |  5 +----
[...]
> >  51 files changed, 54 insertions(+), 336 deletions(-)
> >
[...]
For pnx4008_wdt.c:

Acked-by: Sylvain Lemieux <slemieux.tyco@gmail.com>
