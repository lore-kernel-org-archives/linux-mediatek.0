From: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Subject: Re: [PATCH] mt76: fix return value of mt76x02_wait_for_mac
Date: Sat, 22 Sep 2018 14:11:53 +0200
Message-ID: <b2ba069e-5ba8-17bd-e51c-7edbb1209689@nbd.name>
References: <1536226714-17201-1-git-send-email-sgruszka@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1536226714-17201-1-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On 2018-09-06 11:38, Stanislaw Gruszka wrote:
> We need to return bool value in mt76x02_wait_for_mac.
> 
> Reported-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
> Fixes: 2735a6dd7df3 ("mt76: unify wait_for_mac")
> Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Merged, thanks.

- Felix
