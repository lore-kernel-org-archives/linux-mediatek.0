Return-Path: <SRS0=uG8S=M4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1383DC4320A
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 07:48:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE32860E52
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 07:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE32860E52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Qg+bWxkyjDbt22TOHruJuW/HvCKXhtKengUIfr10aI=; b=3whRlgv0rb2LOU+V8vyMZXhgfP
	Txdr0K9Twx3S6Yz9xhDOc0uUv2WdW4DInvP5L4kPlQ0WQ1aFQaJ2jKC1dlG3G8CDwicNAHHwS2OyQ
	ZqqQy8X31iUSwa/oC+8D/5oCAgKzm56kPJ2p306rumZthiS0p93F69lHBPdc4Jbzq6ogqDWp4DMiQ
	HEPZybHDueWjpnscuZ5+WxZaORdn4FhoSrozFVRM9gIFaT8lHarzbpgHG3EvuZpoG34Q7W/7ga0tD
	9MUOmTQVb/VvXfZaee57LOWtU7O49W+hd03TsLDc9VWSvSW/x6WSshJsXVysxfwE96Vs86Sahf934
	N82l1z2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBY6a-008SdU-Kj; Thu, 05 Aug 2021 07:47:52 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBY61-008SQZ-0e; Thu, 05 Aug 2021 07:47:18 +0000
Received: by mail-wm1-f54.google.com with SMTP id
 l8-20020a05600c1d08b02902b5acf7d8b5so2296598wms.2; 
 Thu, 05 Aug 2021 00:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I526ijbe8/74kjOA75IwkOyaPcqEXfx0YMdi/ub5h0M=;
 b=dpFfID67Xzirz3XVhTaatL2G0npF7FC53V240w2mQi1VJ0MCVtw50J1x+SkRze22qu
 VTj9cOBP1Pl16NiRG/9yw5/Z6Uxyt6iw2ilpFqnSUb24tBO95nLTmcHae6uisxgiDQUs
 baoUFoBoP5H4r70NWwPCLMF+QUjcqq5it3jbQzvMw+a4gicpSc0+z+kGcHI8IeIH97xW
 W0pU/n/AKkZTrZQmtPgeYqWMACn7bjUaEWkCvrIhcLwRNatacTYup2SkuIw5M5cBslW6
 o5t4Wi+U/j18OFiF7TyCZzbpUGcL28CjWZi5F7DKDPkFISmyVGKbBZiTjBomJHvs4nd+
 Vqfw==
X-Gm-Message-State: AOAM533m9IICnDbtyLpC/u84U9bywvApXr+cPoTbuOMs30oEeeyeIYBx
 W8wfBkw1WdDAmVfzzbNStpW9nxtTj48SKOGF
X-Google-Smtp-Source: ABdhPJwvOwnv09InkfauY/5dCjERsBYo1U1VQMOeA1IMI5PuQsUW4j8b79rm41Lbc7bMwllLsM9EwQ==
X-Received: by 2002:a05:600c:290:: with SMTP id
 16mr13385731wmk.71.1628149634054; 
 Thu, 05 Aug 2021 00:47:14 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id t1sm4985968wrm.42.2021.08.05.00.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 00:47:13 -0700 (PDT)
Subject: Re: [PATCH printk v1 10/10] serial: 8250: implement write_atomic
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kuldip dwivedi <kuldip.dwivedi@puresoftware.com>,
 Wang Qing <wangqing@vivo.com>, Andrij Abyzov <aabyzov@slb.com>,
 Johan Hovold <johan@kernel.org>, Eddie Huang <eddie.huang@mediatek.com>,
 Claire Chang <tientzu@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Zhang Qilong <zhangqilong3@huawei.com>, "Maciej W. Rozycki"
 <macro@orcam.me.uk>, Guenter Roeck <linux@roeck-us.net>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Al Cooper <alcooperx@gmail.com>, linux-serial@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20210803131301.5588-1-john.ogness@linutronix.de>
 <20210803131301.5588-11-john.ogness@linutronix.de>
 <YQlNtr7TNAWtB8XF@smile.fi.intel.com>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <931ebc1a-3cc9-677c-44c3-7cbd645eb4f4@kernel.org>
Date: Thu, 5 Aug 2021 09:47:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQlNtr7TNAWtB8XF@smile.fi.intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_004717_116793_F668505B 
X-CRM114-Status: GOOD (  21.52  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 03. 08. 21, 16:07, Andy Shevchenko wrote:
> On Tue, Aug 03, 2021 at 03:19:01PM +0206, John Ogness wrote:
>> Implement an NMI-safe write_atomic() console function in order to
>> support synchronous console printing.
>>
>> Since interrupts need to be disabled during transmit, all usage of
>> the IER register is wrapped with access functions that use the
>> printk cpulock to synchronize register access while tracking the
>> state of the interrupts. This is necessary because write_atomic()
>> can be called from an NMI context that has preempted write_atomic().
> 
> ...
> 
>> +static inline void serial8250_set_IER(struct uart_8250_port *up,
>> +				      unsigned char ier)
>> +{
>> +	struct uart_port *port = &up->port;
>> +	unsigned long flags;
>> +	bool is_console;
> 
>> +	is_console = uart_console(port);
>> +
>> +	if (is_console)
>> +		console_atomic_cpu_lock(flags);
>> +
>> +	serial_out(up, UART_IER, ier);
>> +
>> +	if (is_console)
>> +		console_atomic_cpu_unlock(flags);
> 
> I would rewrite it as
> 
> 	if (uart_console()) {
> 		console_atomic_cpu_lock(flags);
> 		serial_out(up, UART_IER, ier);
> 		console_atomic_cpu_unlock(flags);
> 	} else {
> 		serial_out(up, UART_IER, ier);
> 	}
> 
> No additional variable, easier to get the algorithm on the first glance, less
> error prone.

Yes, the original is terrible.

Another option:

bool locked = console_atomic_cpu_lock(flags, uart_console());
serial_out(up, UART_IER, ier);
console_atomic_cpu_unlock(flags, locked);


Which makes console_atomic_cpu_lock to lock only if second parameter is 
true and return its value too.

BTW I actually don't know what console_atomic_cpu_lock does to think 
about it more as I was not CCed, and neither lore sees the other patches:
https://lore.kernel.org/linux-mips/20210803131301.5588-1-john.ogness@linutronix.de/

thanks,
-- 
js
suse labs

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
