From: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Subject: Re: [PATCH 04/17] mt76: create new mt76xx-lib module for common
 mt76x{0,2} code
Date: Sat, 25 Aug 2018 11:02:04 +0200
Message-ID: <13595ea4-e052-5448-7e24-9b6c0d59cb81@nbd.name>
References: <1535109321-17126-1-git-send-email-sgruszka@redhat.com>
 <1535109321-17126-5-git-send-email-sgruszka@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1535109321-17126-5-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On 2018-08-24 13:15, Stanislaw Gruszka wrote:
> Move rxfilter and mutex to common structure. Create mt76xx-lib.ko
> for mt76x0 and mt76x2 common functions and create new unified
> mt76xx_configure_filter() function there.
> 
> Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
My previous comment about mt76x2_regs.h applies here as well.

- Felix
