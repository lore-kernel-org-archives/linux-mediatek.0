From: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Subject: Re: [PATCH 09/22] mt76: remove q->hw_idx
Date: Mon, 10 Sep 2018 11:19:01 +0200
Message-ID: <019f2c32-5a77-625e-cfa6-374501519581@nbd.name>
References: <1536072075-6990-1-git-send-email-sgruszka@redhat.com>
 <1536072075-6990-10-git-send-email-sgruszka@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1536072075-6990-10-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On 2018-09-04 16:41, Stanislaw Gruszka wrote:
> We use q->hw_idx in very few places, remove it and provide hwq index
> by diffrent way. This will allow ot unify conf_tx mac80211 callback.
> 
> Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
I think this patch is a step in the wrong direction, especially when it
comes to dealing with extra hardware queues for powersave delivery, or
beacons (on MT7603).
Also, removing q->hw_idx is not really necessary for unifying conf_tx
callbacks either.

- Felix
