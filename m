From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 01/16] mt76: unify wait_for_mac
Date: Tue,  4 Sep 2018 08:05:55 +0000 (UTC)
Message-ID: <20180904080555.D07A160708@smtp.codeaurora.org>
References: <1535541407-27149-2-git-send-email-sgruszka@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1535541407-27149-2-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> Create new mt76x02_mac.h for common mac functions of mt76x0 and mt76x2
> and unity wait_for_mac for both drivers.
> 
> Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

16 patches applied to wireless-drivers-next.git, thanks.

2735a6dd7df3 mt76: unify wait_for_mac
89e1b1bc075a mt76: rename mt76x2_regs.h
797ea2407825 mt76: merge mt76x0/regs.h into mt76x02_regs.h
108a4861ef19 mt76: create new mt76x02-lib module for common mt76x{0,2} code
c378f2473466 mt76: unify mac_get_key_info
d413127359c3 mt76: add helpers for register access with mt76_dev struct
047aed1c38cf mt76: unify mac_shared_key_setup
46436b5ef9dd mt76: unify mac_wcid_set_key
32bb405fe2bc mt76: unify mac_wcid_setup
516ea2a2a9d4 mt76: use mac_wcid_set_drop in mt76x0
459e237f14cd mt76x0: use mt76_wcid_free in mt76x0
98ff26e5e217 mt76: unify mt76x02_vif struct
f5a7f126e5fe mt76: unify sta structure part 1
b2d91fb30223 mt76: unify sta structure part 2
78dae93fd8ff mt76x0: initalize custom tx queues
16c8a792ea44 mt76x0: use mt76x02_sta and mt76x02_tx_status

-- 
https://patchwork.kernel.org/patch/10579835/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
