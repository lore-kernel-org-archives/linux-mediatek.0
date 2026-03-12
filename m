Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD49106ACC9
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 16:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3UeY5pu9w23zqf3XqZlvtlFA2ndSXKRbw7aNwE9W7d4=; b=oaKPnorGy8QI2TJ2u5DOk5NQje
	KhdOrIOU/79DnDme5gzurMPrUZDtdSjXI9t+Q3mrPGcx32qEcN+SFvccyUkIGITKISlGh3bj0AvqQ
	kZVQcGmdUac9TZ99uFJW34P9Ml9eh3L/rRjzdDSCQDQErckkypIY55hCBUAoE1un+bEKzj9zX/sQf
	6fxJRRFEwgt93qGP3iKDhRHmmhOzEwi+sSMTa6SMH8Njs1FVqdXBKszCZLuAgFsD+ieYhUpKYq+aZ
	qS1MPWbd1WgD2wlDztkh8Vr5Dp6tyoqzlBB1fw3Ms+vCZsn9NFoho2DQf1Q7nogmG/x0SdGtqmwjM
	OmPzJoOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ieA-0000000EVUw-17QD;
	Thu, 12 Mar 2026 16:12:26 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ie8-0000000EVTp-0r05;
	Thu, 12 Mar 2026 16:12:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=3UeY5pu9w23zqf3XqZlvtlFA2ndSXKRbw7aNwE9W7d4=; b=d0h3OrG/LBtm/b0eInaGvDnYxD
	66XPnLPamntvvXAU07VBhv9o1G92E9m/daBkKCXiSCl3Y38dKXeZGVXej0NHaH7b4Vozxlnb1m2AJ
	L5YEKfeDpOw8pyM53jQJnPOVt/AeHeZoMf7BaDGK3uqKdQ3SHbqK8XAcfrDWXrNHfPtM=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1w0ie2-000000007FN-0dAi;
	Thu, 12 Mar 2026 12:12:18 -0400
Date: Thu, 12 Mar 2026 12:12:17 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: robin@protonic.nl, andy@kernel.org, geert@linux-m68k.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, hvilleneuve@dimonoff.com,
 mkorpershoek@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, lee@kernel.org,
 alexander.sverdlin@gmail.com, marek.vasut@gmail.com, akurz@blala.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 4/4] Input: charlieplex_keypad: add GPIO charlieplex
 keypad
Message-Id: <20260312121217.122a6e5b3f5bb1dc64ae8f5b@hugovil.com>
In-Reply-To: <aari1Y1CPZSYEVj3@ashevche-desk.local>
References: <20260305192101.2125660-1-hugo@hugovil.com>
	<20260305192101.2125660-5-hugo@hugovil.com>
	<aari1Y1CPZSYEVj3@ashevche-desk.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam_score: -2.0
X-Spam_bar: --
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_091224_346757_8AAD33B5 
X-CRM114-Status: GOOD (  25.89  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Andy,

On Fri, 6 Mar 2026 16:21:09 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Thu, Mar 05, 2026 at 02:20:50PM -0500, Hugo Villeneuve wrote:
> 
> > Add support for GPIO-based charlieplex keypad, allowing to control
> > N^2-N keys using N GPIO lines.
> > 
> > Reuse matrix keypad keymap to simplify, even if there is no concept
> > of rows and columns in this type of keyboard.
> 
> ...
> 
> > --- a/drivers/input/keyboard/Makefile
> > +++ b/drivers/input/keyboard/Makefile
> > @@ -40,6 +40,7 @@ obj-$(CONFIG_KEYBOARD_LOCOMO)		+= locomokbd.o
> >  obj-$(CONFIG_KEYBOARD_LPC32XX)		+= lpc32xx-keys.o
> >  obj-$(CONFIG_KEYBOARD_MAPLE)		+= maple_keyb.o
> >  obj-$(CONFIG_KEYBOARD_MATRIX)		+= matrix_keypad.o
> > +obj-$(CONFIG_KEYBOARD_CHARLIEPLEX)	+= charlieplex_keypad.o
> 
> Seem unordered. At least the all around it is ordered AFAICS.

Will fix it.


> 
> >  obj-$(CONFIG_KEYBOARD_MAX7359)		+= max7359_keypad.o
> >  obj-$(CONFIG_KEYBOARD_MAX7360)		+= max7360-keypad.o
> >  obj-$(CONFIG_KEYBOARD_MPR121)		+= mpr121_touchkey.o
> 
> ...
> 
> > +/*
> > + * GPIO driven charlieplex keypad driver
> > + *
> > + * Copyright (c) 2025 Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> 2026?

Ok


> 
> > + *
> > + * Based on matrix_keyboard.c
> > + */
> 
> ...
> 
> > +#include <linux/bitops.h>
> > +#include <linux/delay.h>
> > +#include <linux/dev_printk.h>
> > +#include <linux/device/devres.h>
> > +#include <linux/err.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/input.h>
> > +#include <linux/input/matrix_keypad.h>
> > +#include <linux/math.h>
> > +#include <linux/module.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/types.h>
> 
> > +static void charlieplex_keypad_poll(struct input_dev *input)
> > +{
> > +	struct charlieplex_keypad *keypad = input_get_drvdata(input);
> 
> > +	int oline;
> 
> Why signed?

Will change this one, and others noted below to unsigned.


> 
> > +	int code;
> > +
> > +	for (code = 0, oline = 0; oline < keypad->nlines; oline++) {
> 
> Can be like
> 
> 	code = 0;
> 	for (unsigned int oline = 0; oline < keypad->nlines; oline++) {
> 
> as iterator is not used outside the loop.

Ok, will do.


> 
> > +		DECLARE_BITMAP(values, MATRIX_MAX_ROWS);
> 
> > +		int iline;
> 
> Why signed?
> 
> > +		int err;
> > +
> > +		/* Activate only one line as output at a time. */
> > +		gpiod_direction_output(keypad->line_gpios->desc[oline], 1);
> > +
> > +		if (keypad->settling_time_us)
> > +			fsleep(keypad->settling_time_us);
> > +
> > +		/* Read input on all other lines. */
> > +		err = gpiod_get_array_value_cansleep(keypad->line_gpios->ndescs,
> > +						     keypad->line_gpios->desc,
> > +						     keypad->line_gpios->info, values);
> > +		if (err)
> > +			return;
> 
> > +		for (iline = 0; iline < keypad->nlines; iline++) {
> 
> Can be just
> 
> 		for (unsigned int iline = 0; iline < keypad->nlines; iline++) {
> 
> as iterator is not used outside the loop.

Ok.


> 
> > +			if (iline == oline)
> > +				continue; /* Do not read active output line. */
> > +
> > +			/* Check if GPIO is asserted. */
> > +			if (test_bit(iline, values)) {
> > +				code = MATRIX_SCAN_CODE(oline, iline,
> > +							get_count_order(keypad->nlines));
> > +				/*
> > +				 * Exit loop immediately since we cannot detect
> > +				 * more than one key press at a time.
> > +				 */
> > +				break;
> > +			}
> > +		}
> > +
> > +		gpiod_direction_input(keypad->line_gpios->desc[oline]);
> > +
> > +		if (code)
> > +			break;
> > +	}
> > +
> > +	charlieplex_keypad_check_switch_change(input, code);
> > +}
> 
> ...
> 
> > +	for (unsigned int i = 0; i < keypad->nlines; i++)
> > +		(keypad->line_gpios->desc[i], "charlieplex_kbd_line");
> 
> Hmm... Don't you want to give it an index?

Makes sense, will do.

I will also change for "keypad->line_gpios->ndescs" in the loop
iterator.


> 
> (In case you go this direction, see the kasprintf_strarray() or
>  its managed variant.)
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 


-- 
Hugo Villeneuve

