From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] mt7615: add TX/RX antenna pattern capabilities
Date: Fri, 26 Apr 2019 07:22:20 +0300
Message-ID: <871s1pxuo3.fsf@purkki.adurom.net>
References: <4f0780666982b3e935f46abcfe434bc68c232fb0.1556249572.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4f0780666982b3e935f46abcfe434bc68c232fb0.1556249572.git.ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
        (Ryder Lee's message of "Fri, 26 Apr 2019 11:36:17 +0800")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Roy Luo <royluo-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, YF Luo <yf.luo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yiwei Chung <yiwei.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> writes:

> Announce antenna pattern cap to adapt PHY and baseband settings.
>
> Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7615/init.c | 2 ++
>  1 file changed, 2 insertions(+)

Please add the driver name, in this case mt76, as a prefix in the title.
For example the title could be:

mt76: mt7615: add TX/RX antenna pattern capabilities
mt76: add TX/RX antenna pattern capabilities for mt7615

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#commit_title_is_wrong

-- 
Kalle Valo
