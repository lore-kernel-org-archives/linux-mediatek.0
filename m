From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH net-next v2 0/4] of_get_mac_address ERR_PTR fixes
Date: Tue, 7 May 2019 11:07:31 +0200
Message-ID: <CAMuHMdVra2h00OUCxZ1s=ExpkgkN_SGZdUtdohBapjNHf6hesQ@mail.gmail.com>
References: <1557177887-30446-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557177887-30446-1-git-send-email-ynezz@true.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Petr_=C5=A0tetiar?= <ynezz@true.cz>
Cc: netdev <netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, driverdevel <devel@driverdev.osuosl.org>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Heiner Kallweit <hkallweit1@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Petr,

On Mon, May 6, 2019 at 11:25 PM Petr Štetiar <ynezz@true.cz> wrote:
> this patch series is an attempt to fix the mess, I've somehow managed to
> introduce.
>
> First patch in this series is defacto v5 of the previous 05/10 patch in the
> series, but since the v4 of this 05/10 patch wasn't picked up by the
> patchwork for some unknown reason, this patch wasn't applied with the other
> 9 patches in the series, so I'm resending it as a separate patch of this
> fixup series again.
>
> Second patch is a result of this rebase against net-next tree, where I was
> checking again all current users of of_get_mac_address and found out, that
> there's new one in DSA, so I've converted this user to the new ERR_PTR
> encoded error value as well.
>
> Third patch which was sent as v5 wasn't considered for merge, but I still
> think, that we need to check for possible NULL value, thus current IS_ERR
> check isn't sufficient and we need to use IS_ERR_OR_NULL instead.
>
> Fourth patch fixes warning reported by kbuild test robot.
>
> Cheers,
>
> Petr
>
> Petr Štetiar (4):
>   net: ethernet: support of_get_mac_address new ERR_PTR error

I didn't receive the patch through email, but patchwork does have it:
https://patchwork.ozlabs.org/patch/1096054/

This fixes the crash ("Unable to handle kernel paging request atvirtual
address fffffffe") I'm seeing with sh_eth on r8a7791/koelsch, so

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
