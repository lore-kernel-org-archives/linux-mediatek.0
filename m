From: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Subject: Re: [PATCH 39/42] mt76: move some irq code to common mmio module
Date: Mon, 10 Sep 2018 11:33:33 +0200
Message-ID: <6759963b-6a37-f635-9d6a-4022624d867e@nbd.name>
References: <1536225538-16454-1-git-send-email-sgruszka@redhat.com>
 <1536225538-16454-40-git-send-email-sgruszka@redhat.com>
 <91c0c1d5-12a9-7155-c4bf-191a511080ee@nbd.name>
 <20180906104348.GE16539@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180906104348.GE16539-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On 2018-09-06 12:43, Stanislaw Gruszka wrote:
> On Thu, Sep 06, 2018 at 11:33:55AM +0200, Felix Fietkau wrote:
>> On 2018-09-06 11:18, Stanislaw Gruszka wrote:
>> > Move some irq handling code to generic mmio module.
>> > 
>> > Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> Please drop this patch. This won't work on MT7603 and later.
> 
> Yeah, I thought MT_INT_MASK_CSR is the same 0x0204 for all chips,
> but for MT7603 this is MT_HIF(0x204). I assume we can still unify 
> irq_lock, irqmask fields in common structure.
> 
> Anyway would be good to have mt7603 driver unstreamed, so we could
> easily see what can be shared in mt76 generic code for all chips.
> 
> Felix, do you have plans to upstream it? Want some help with that ?
I plan on sending it upstream soon. It's still not fully stable, but
that shouldn't be a blocker.

- Felix
