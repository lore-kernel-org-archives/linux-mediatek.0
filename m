From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/2] remove qid dependency from mt76-core code
Date: Mon, 18 Feb 2019 10:32:39 +0800
Message-ID: <1550457159.18089.5.camel@mtkswgap22>
References: <cover.1550336347.git.lorenzo@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1550336347.git.lorenzo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lorenzo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: nbd-Vt+b4OUoWG0@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, roychl666-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Sat, 2019-02-16 at 18:47 +0100, lorenzo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org wrote:
> From: Lorenzo Bianconi <lorenzo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> Move queue id dependency in driver specific tx queue initialization code
> since new chipsets rely on a different tx queue enumeration scheme.
> Add the possibility to specify qid in mt76_tx routine
> 
> Lorenzo Bianconi (2):
>   mt76: add qid parameter to mt76_tx signature
>   mt76: move txq qid dependency in driver specific code
> 
>  drivers/net/wireless/mediatek/mt76/mac80211.c | 27 +++++++++++-------
>  drivers/net/wireless/mediatek/mt76/mt76.h     | 14 ++++++++--
>  .../net/wireless/mediatek/mt76/mt76x02_txrx.c |  8 +++++-
>  .../net/wireless/mediatek/mt76/mt76x02_util.c |  2 ++
>  drivers/net/wireless/mediatek/mt76/tx.c       | 28 +++++--------------
>  5 files changed, 45 insertions(+), 34 deletions(-)
> 

Thanks. This will help us to develop the new chipsets more easily.

Acked-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
