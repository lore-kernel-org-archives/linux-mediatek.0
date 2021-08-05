Return-Path: <SRS0=uG8S=M4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INVALID_DATE_TZ_ABSURD,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121CFC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 08:27:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B990A60F43
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 08:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B990A60F43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SuGmKQTFg6A57zPDkoVYsj86qfNpMIQpqr+EQtIFg2s=; b=uEh7P1e9XWmOAQ
	8OLv6HCHQp1PSgT+VBYqdxugw70aZrUq15bVJ/BOy7h/86rOGLAGCQmMZ9ShUSrJCPA7735wu70Iv
	x0AuV8opyOhzo6EuMNxLinZ49KXVmrBw3ALkVtTpaBnOey3kqlq74uV6KSBHRbw6zPrUyYYBgozBL
	HXHZ6M4PCvGIih4oZ4leqU3v+y/QrSIZoChWxYXxPunEARgF/sAlZNqGXEheAT+ODz2dziRgW9QDb
	sBpTzh1VPbXjsdPWJu+mJyyCwokFAR2HPYJ9aD2np3lZ4qYVYJDNnPZ1+0r3VIB1FOUPosT9XZn8g
	Q9Eptyavs56HCc7ylagg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBYiO-008fHq-Hk; Thu, 05 Aug 2021 08:26:56 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBYiB-008fFi-81; Thu, 05 Aug 2021 08:26:44 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1628152000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sDS1DpN+l+aAEkSP0+4dZetYVLkYHfUOpL7O0zwMLwc=;
 b=MImQslRh8bXrcBZeI2HDBMRTK4c/v9imWShtcDMCrlnPalgFEqSiy2FGo68lC1I7yc2RkE
 Em8eGKX0qzihnzwENOEW+Oh9efhvYi2oZJf6xdQ139MGwJguEVfmXcMJL2TxERNkPayZBy
 OtHmI8wIs5nobQLvfZS7PRnMzQtYNnCetnYyIQ5iFpuA6pWaJyOnHOT0oemivFz8+ZGHdk
 UHNiMhA9S69jhkOCxfC2Yzu79L7UdnADSap+2nvqBlEAyjCKqCIgpBoFQZEEgAoE2qNOOJ
 SpRxIr/lpvUnfbS992agNZC/gE7b35WvIK5Spo2m7hQw/axnaea8Z6xM7cCfag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1628152000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sDS1DpN+l+aAEkSP0+4dZetYVLkYHfUOpL7O0zwMLwc=;
 b=/S1XK1SD2cNKm5oAne6Zd473q9DfZCgTAnfgMziAxO0ToB6fXXJLqRt7JMYFx4wKuVe2sm
 7SczodRzMkLRhxBA==
To: Jiri Slaby <jirislaby@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas
 Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Cercueil
 <paul@crapouillou.net>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew
 Jeffery <andrew@aj.id.au>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, kuldip dwivedi
 <kuldip.dwivedi@puresoftware.com>, Wang Qing <wangqing@vivo.com>, Andrij
 Abyzov <aabyzov@slb.com>, Johan Hovold <johan@kernel.org>, Eddie Huang
 <eddie.huang@mediatek.com>, Claire Chang <tientzu@chromium.org>, Hsin-Yi
 Wang <hsinyi@chromium.org>, Zhang Qilong <zhangqilong3@huawei.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, Guenter Roeck
 <linux@roeck-us.net>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, Al Cooper <alcooperx@gmail.com>,
 linux-serial@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH printk v1 10/10] serial: 8250: implement write_atomic
In-Reply-To: <931ebc1a-3cc9-677c-44c3-7cbd645eb4f4@kernel.org>
References: <20210803131301.5588-1-john.ogness@linutronix.de>
 <20210803131301.5588-11-john.ogness@linutronix.de>
 <YQlNtr7TNAWtB8XF@smile.fi.intel.com>
 <931ebc1a-3cc9-677c-44c3-7cbd645eb4f4@kernel.org>
Date: Thu, 05 Aug 2021 10:32:38 +0206
Message-ID: <87k0l0wb41.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_012643_477630_57438FBD 
X-CRM114-Status: GOOD (  19.01  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2021-08-05, Jiri Slaby <jirislaby@kernel.org> wrote:
> On 03. 08. 21, 16:07, Andy Shevchenko wrote:
>> On Tue, Aug 03, 2021 at 03:19:01PM +0206, John Ogness wrote:
>>> Implement an NMI-safe write_atomic() console function in order to
>>> support synchronous console printing.
>>>
>>> Since interrupts need to be disabled during transmit, all usage of
>>> the IER register is wrapped with access functions that use the
>>> printk cpulock to synchronize register access while tracking the
>>> state of the interrupts. This is necessary because write_atomic()
>>> can be called from an NMI context that has preempted write_atomic().
>> 
>> ...
>> 
>>> +static inline void serial8250_set_IER(struct uart_8250_port *up,
>>> +				      unsigned char ier)
>>> +{
>>> +	struct uart_port *port = &up->port;
>>> +	unsigned long flags;
>>> +	bool is_console;
>> 
>>> +	is_console = uart_console(port);
>>> +
>>> +	if (is_console)
>>> +		console_atomic_cpu_lock(flags);
>>> +
>>> +	serial_out(up, UART_IER, ier);
>>> +
>>> +	if (is_console)
>>> +		console_atomic_cpu_unlock(flags);
>> 
>> I would rewrite it as
>> 
>> 	if (uart_console()) {
>> 		console_atomic_cpu_lock(flags);
>> 		serial_out(up, UART_IER, ier);
>> 		console_atomic_cpu_unlock(flags);
>> 	} else {
>> 		serial_out(up, UART_IER, ier);
>> 	}

Some locations have more than just 1 line of code in between
lock/unlock. I agree this looks better, but am unsure how much
copy/paste code is acceptable.

>> No additional variable, easier to get the algorithm on the first
>> glance, less error prone.
>
> Yes, the original is terrible.
>
> Another option:
>
> bool locked = console_atomic_cpu_lock(flags, uart_console());
> serial_out(up, UART_IER, ier);
> console_atomic_cpu_unlock(flags, locked);
>
> Which makes console_atomic_cpu_lock to lock only if second parameter
> is true and return its value too.

I am not sure how common such semantics for lock/unlock functions
are. But since this pattern, using uart_console(), will most likely be a
common pattern for atomic consoles, I can see how this will be useful.

I will choose one of these 2 suggestions for v2. Thanks.

> BTW I actually don't know what console_atomic_cpu_lock does to think 
> about it more as I was not CCed, and neither lore sees the other patches:
> https://lore.kernel.org/linux-mips/20210803131301.5588-1-john.ogness@linutronix.de/

Only the lkml mailing list saw the full series:

https://lore.kernel.org/lkml/20210803131301.5588-1-john.ogness@linutronix.de/

John Ogness

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
