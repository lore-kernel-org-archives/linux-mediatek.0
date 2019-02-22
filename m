From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] net: dsa: fix a leaked reference by adding a missing of_node_put
Date: Fri, 22 Feb 2019 11:38:53 +0100
Message-ID: <CACRpkdYwkNrLk-GuV7gaOKYFOeBd0=DLN1wsgrYxeXOHuwtz+A@mail.gmail.com>
References: <1550819742-32155-1-git-send-email-wen.yang99@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1550819742-32155-1-git-send-email-wen.yang99-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wen Yang <wen.yang99-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Vivien Didelot <vivien.didelot-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, netdev <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, UNGLinuxDriver-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, John Linn <John.Linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, wang.
List-Id: linux-mediatek@lists.infradead.org

On Fri, Feb 22, 2019 at 8:15 AM Wen Yang <wen.yang99-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org> wrote:

> The call to of_get_child_by_name returns a node pointer with refcount
> incremented thus it must be explicitly decremented after the last
> usage.
>
> Detected by coccinelle with the following warnings:
> ./drivers/net/dsa/rtl8366rb.c:510:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 501, but without a corresponding object release within this function.
> ./drivers/net/dsa/rtl8366rb.c:518:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 501, but without a corresponding object release within this function.
> ./drivers/net/dsa/rtl8366rb.c:540:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 501, but without a corresponding object release within this function.
> ./drivers/net/dsa/rtl8366rb.c:548:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 501, but without a corresponding object release within this function.
> ./drivers/net/dsa/rtl8366rb.c:556:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 501, but without a corresponding object release within this function.
> ./drivers/net/dsa/rtl8366rb.c:561:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 501, but without a corresponding object release within this function.
>
> Signed-off-by: Wen Yang <wen.yang99-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org>
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> Cc: Vivien Didelot <vivien.didelot-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
> Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Yours,
Linus Walleij
