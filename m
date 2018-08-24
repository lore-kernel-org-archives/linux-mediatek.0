From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 00/17] mt76 patches 2018-08-24
Date: Fri, 24 Aug 2018 17:15:57 +0200
Message-ID: <20180824151556.GA32048@localhost.localdomain>
References: <1535109321-17126-1-git-send-email-sgruszka@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1535109321-17126-1-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

> This is the begin work of integration between mt76x0 and mt76x2.
> 
> Further development can be seen here:
> https://github.com/sgruszka/wireless-drivers-next/commits/mt76x0-draft-v2
> 
> Stanislaw Gruszka (17):
>   mt76: unify wait_for_mac
>   mt76: rename mt76x2_regs.h
>   mt76: merge mt76x0/regs.h into mt76xx_regs.h
>   mt76: create new mt76xx-lib module for common mt76x{0,2} code
>   mt76: fix mt76xx-lib module license
>   mt76: unify mac_get_key_info
>   mt76: add helpers for register access with mt76_dev struct
>   mt76: unify mac_shared_key_setup
>   mt76: unify mt76xx_mac_wcid_set_key
>   mt76: unify mac_wcid_setup
>   mt76: use mac_wcid_set_drop in mt76x0
>   mt76x0: use mt76_wcid_free in mt76x0
>   mt76: unify mt76xx_vif struct
>   mt76: unify sta stucture part 1
>   mt76: unify sta structure part 2
>   mt76x0: initalize custom tx queues
>   mt76x0: use mt76xx_sta and mt76xx_tx_status

Tested-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
