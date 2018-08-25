From: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Subject: Re: [PATCH 02/17] mt76: rename mt76x2_regs.h
Date: Sat, 25 Aug 2018 11:00:39 +0200
Message-ID: <2172355a-0703-e432-96cb-fba2383c3890@nbd.name>
References: <1535109321-17126-1-git-send-email-sgruszka@redhat.com>
 <1535109321-17126-3-git-send-email-sgruszka@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1535109321-17126-3-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On 2018-08-24 13:15, Stanislaw Gruszka wrote:
> MAC registers are the same for mt76x0 and mt76x2. Rename mt76x2_regs.h
> file to reflect that.
> 
> Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76x2.h      |   2 +-
>  drivers/net/wireless/mediatek/mt76/mt76x2_regs.h | 619 -----------------------
>  drivers/net/wireless/mediatek/mt76/mt76xx_regs.h | 619 +++++++++++++++++++++++
I think mt76xx_regs.h is named too generic. MT7603, MT7628, MT7615 and
all newer chips use a completely different register layout.
I'd prefer to stick with mt76x2_regs for now and use it for x0 as well.

- Felix
