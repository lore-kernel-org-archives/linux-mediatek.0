Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F395FD3777
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Feb 2026 17:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jpUJEtvyUfbAfsM/AsYdfsmRudWk2usCr4zOgiJsVxI=; b=pPwqQ9RTYofK9VUvIb0PuKSOH+
	22nqCEU80BEGyxbLAVJ5yRn+fp4X8hhSUdFMP5jj5BsTQrCGZMnl6OV2Z4S5TgW6MahE+zepAL1KO
	Lfenjlb3prx5r/GlkotEXSB50wQDyorNosxzsDk2hEHZnPnXJ42IUixWitQ1wbkJdetLkDR77KO/g
	ZhIMfCUYM/L+PHzIrQWPDElvYFriGlgWo17ejjf1ni843rujrl1nsv9AcQIkzHb3y6h7pz/Cn0zXs
	rtsAY8TR33DejPSSczXNCLe2Rr00QX88KWN0OpYsKBtrAWXahNWzFUDGSXIg+XH1+reRkajA+3Zw1
	KMKx7m6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIRb-00000004cmZ-3ukV;
	Wed, 25 Feb 2026 17:13:03 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIRa-00000004cln-0uhG
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Feb 2026 17:13:03 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-12732e6a123so1158410c88.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 09:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772039581; x=1772644381; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jpUJEtvyUfbAfsM/AsYdfsmRudWk2usCr4zOgiJsVxI=;
        b=UK1cq3Cvi3maVM0MczpAmQQmC2OhCa+5ankVUDqsT5oPwAN/nIvJvhxgHEd8cGgOQH
         wYLs91wh0MX0OocgG5FjpvqJlVaONJQCdPm+4qNGav07zmQ1w4ZF2jYebNtUqM5TOdsw
         3dAqBQNuLakYEAnjpq78ZrFZU9xZqQQrWXRKLps8Gi3zWNNg/9g4iPzkq/qFIYyRJxIo
         +VOOcHJd+MfF2Pp6ofezuJMOrV+xiJbyzCKiKMLk79bpFI0gtahQdELgB4/yspAfDke6
         d1lEQO8VJRVzXgzDceMK27nvOZ+VbvryfyYz0e2DWbupa2shlchPIMqkByr3cLIrgdTw
         iRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772039581; x=1772644381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpUJEtvyUfbAfsM/AsYdfsmRudWk2usCr4zOgiJsVxI=;
        b=L85uNClBQcPksVtuS6K+5qmniR0lHLA9HWZ3/J4Aw8DXCajk5EUUpaK2mUC4jKIpLM
         YZRG/kRcaC+LNkiR/qMp7s+nmKfNC9L7lWQNWpdzJ2T+QUe+YvMJNcpsZ1vAlqp4P1ez
         9yeKSKnorbHG6DQsI4lq78uW0AcQAFABHTpfsJi+1LLeD+5AcoHbOZ0dsir/ERslpZ2x
         VvO2f6O0CmZqAJXbbYsgs8WjkY9pxORHBl4/glGCxGTwWG5ZUBG/GcFi0w92tOC1GdPF
         u/qFXIBYsI/jF8C5odksyF5+XtbHH7Q87EknSllmNbmKK+642DjS4ZMg+31sKntGM5Ep
         Fzgg==
X-Forwarded-Encrypted: i=1; AJvYcCWDJrZPJO3B3Yvj+hSONu8tho++joQd+IRb/NSntgK9vkZRJHWRO59Yw8xOEc0G1wNEmr7Sw8by2mq1c1li2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdDxQ44tH7ow56OOVmtNl2Ww70V5keq194JJemj7UAMnhmV7Nz
	JAmsX5V/HqLm0RSBQJ57xBxuusirm2OohEysD0uRRDOgqzaj3vizSbAg
X-Gm-Gg: ATEYQzzKzW3HECBU+XyAaq2lB4tcsK/JFVPU1O1YK9Iv+As9o0C6hYNCjYCjMBiL0n6
	IuXmo3DftJ6RbeCziXtn5tzLcn3ZyC/wWWIz0lebfn58iF+eVvpLjFvftv4wvTGcefolCiBM9BC
	1CQPAZqRjdR/5CRDFvtYNmEroKSdgeuYHcWlqEvvISjkb3ylW+n+No0v0b4DL/46eX+86Wo9lyK
	jCZn/zkSyq4WMKj5HFZeLbN+z+FvyjhuN4PYhipwRCmkdPI0GNczE2nh/4UImh64dWJBOoRT/3O
	US0j2l+KChjZ/GIOLtWCzm+s2vGfXQg5Wnl/L+jmmtLgHMVoRA52zS57HJZOW0pzyiVKQQ4e13Q
	B6ud9PegYphbbwyIupvSwMMpYEGYUS/jAYxs2ucm0GgNEmvIvwsK5Or/dtbxPHJv0d7zs2q7tlu
	W8Czk43z6QsFe/dhLEJfs+rR0uOpsBSpFafpiClsH+7hQrFOJpLrFCv9QG1EK+XFhU
X-Received: by 2002:a05:701a:ca03:b0:127:3440:e5d5 with SMTP id a92af1059eb24-1276ad627ecmr6367928c88.21.1772039581204;
        Wed, 25 Feb 2026 09:13:01 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:64dd:9670:711a:678e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af10481sm14411000c88.3.2026.02.25.09.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 09:13:00 -0800 (PST)
Date: Wed, 25 Feb 2026 09:12:57 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, robin@protonic.nl, 
	andy@kernel.org, geert@linux-m68k.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, hvilleneuve@dimonoff.com, mkorpershoek@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, lee@kernel.org, 
	alexander.sverdlin@gmail.com, marek.vasut@gmail.com, akurz@blala.de, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 4/4] Input: charlieplex_keypad: add GPIO charlieplex
 keypad
Message-ID: <aZ8sjwaKk5MCSDlg@google.com>
References: <20260225155409.612478-1-hugo@hugovil.com>
 <20260225155409.612478-5-hugo@hugovil.com>
 <aZ8fXXGMx3fk7gKs@smile.fi.intel.com>
 <20260225114155.3ee2efb002aa0f52a905f535@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225114155.3ee2efb002aa0f52a905f535@hugovil.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_091302_257451_CF4BA3CC 
X-CRM114-Status: GOOD (  27.86  )
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

Hi Hugo,

On Wed, Feb 25, 2026 at 11:41:55AM -0500, Hugo Villeneuve wrote:
> Hi Andy,
> thank you for the review.
> 
> On Wed, 25 Feb 2026 18:12:13 +0200
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> 
> > On Wed, Feb 25, 2026 at 10:54:01AM -0500, Hugo Villeneuve wrote:
> > 
> > > Add support for GPIO-based charlieplex keypad, allowing to control
> > > N^2-N keys using N GPIO lines.
> > > 
> > > Reuse matrix keypad keymap to simplify, even if there is no concept
> > > of rows and columns in this type of keyboard.
> > 
> > ...
> > 
> > > +/*
> > > + *  GPIO driven charlieplex keypad driver
> > > + *
> > > + *  Copyright (c) 2025 Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > > + *
> > > + *  Based on matrix_keyboard.c
> > 
> > A single space after asterisk is enough.
> 
> Ok, leftover from copy/paste from matrix_keyboard.c :)
> 
> > 
> > > + */
> > 
> > ...
> > 
> > + bitops.h
> > 
> > > +#include <linux/delay.h>
> > 
> > + dev_printk.h
> > + device/devres.h
> > + err.h
> > 
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/input.h>
> > > +#include <linux/input/matrix_keypad.h>
> > 
> > + math.h
> 
> Ok.
> 
> 
> > 
> > > +#include <linux/module.h>
> > 
> > > +#include <linux/of.h>
> > 
> > Is this in use? Or you wanted mod_devicetable.h for OF ID table?
> 
> I need only OF ID table, so will replace with mod_devicetable.h.
> 
> 
> > 
> > > +#include <linux/platform_device.h>
> > > +#include <linux/property.h>
> > > +#include <linux/types.h>
> > 
> > ...
> > 
> > > +	for (code = 0, oline = 0; oline < keypad->nlines; oline++) {
> > > +		DECLARE_BITMAP(values, MATRIX_MAX_ROWS);
> > > +		int iline;
> > 
> > > +		int rc;
> > 
> > I think Dmitry prefers 'error' name for this kind of variables.
> 
> I hate using "error", can be so misleading :)
> 
> I would prefer to use "rc" everywhere, but if Dmitry chimes in and
> specifies "error" or "err", then so it will be.

Yes, I prefer err or error for variables that carry error code or 0.
This allows to write

	error = action(...);
	if (error) {
		// handle it
	}

which is very clear IMO.


> > > +
> > > +	err = input_register_device(keypad->input_dev);
> > > +	if (err)
> > > +		return err;
> > 
> > > +	platform_set_drvdata(pdev, keypad);
> > 
> > Is this needed?
> 
> No, will remove it, and replace last lines with:
> 
>    return input_register_device(keypad->input_dev);

Please use

	err = input_register_device(...);
	if (err)
		return err;

	return 0;

It clearly differentiates error an normal paths, shows that function
returns 0 and not anything else on success, and allows to reorder
or add additional actions easily.

Thanks.

-- 
Dmitry

