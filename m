From: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Subject: Re: [PATCH] mt76: use skb_pad() instead of __skb_pad()
Date: Wed, 26 Sep 2018 17:35:17 +0200
Message-ID: <dd3960e5-2731-52fd-d575-26582fde111b@nbd.name>
References: <20180925195251.10568-1-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180925195251.10568-1-hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On 2018-09-25 21:52, Hauke Mehrtens wrote:
> mt76 uses __skb_pad() with free_on_error set to true, this is the same
> as calling skb_pad().
> This patch does not change any functionality, but it makes it easier to
> backport this driver in backports, because skb_pad() is also available
> in older kernel versions.
> 
> Fixes: b40b15e1521f ("mt76: add usb support to mt76 layer")
> Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Merged, thanks.

- Felix
