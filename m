Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844C0FD3774
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Feb 2026 17:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6Fai54Ul21d21qsppL/OgbjNjE4u/Ww2JyK/Frhu5U=; b=Ot7PrLR05zU4PiBKKQF+PNOAAH
	VKD7pLz3cJjcwOBZRqFNkcSxHyuSC0s3l5j2UFEKupQklkYKeM8qfVFn19SQW3b1puckUwSFLxyef
	n8BQHnbs21REsmC+y+hJkFSMzlCgNN6k3EfGrMQ+WadX85SJKI99PxVIsqqYrr8bd9j0EVpMw2ppe
	L2F/uuV3inVyNNo3dEwlgff0kq7j4gEzTDugCFodcv/a++akOsft4mmIhxd9i1+gwAIYP6guxT+vN
	qjZmd7bpyXETetyA4DoV2IqmIsxXFXufgdFEewWYoTi+3sGsIEyME1JWlShitzqa7Pfrjm9dpqTTG
	3oLvWSJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvISu-00000004cxe-1qnY;
	Wed, 25 Feb 2026 17:14:24 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvISr-00000004cwY-3ld7
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Feb 2026 17:14:23 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso7012461eec.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 09:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772039661; x=1772644461; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M6Fai54Ul21d21qsppL/OgbjNjE4u/Ww2JyK/Frhu5U=;
        b=Jn1fUzqpKKXAxIzP52etZbRa668MaA+YbiBY2GyYDQ9lVa85nSP8xtXhlctoWPfVEV
         YMdQBLyo/caf5wo44+4FPFp/TkMMj6QrE6GLseu+NH6DBN4RgP1ViZTgufZMIAIHlnC9
         Iwyron/0lo/bko6FQ66YG7Ijccst0o/0HkryjtJv88MFHqf5C0qgjEEkZnJrJAQH7E9s
         Na1FjYDbGtU38Oi5bMgkJQ8LqfUl5mbQQXEbHSSG6B0IfUKFxEn+4doJ+/IWbk8FHAJn
         Tdxg8ytnDdfrprSznKqo64YUHLkntFzlnZegltm8PZ8yOP3Cyf1oJf9j8W9HRrl0WkAp
         xSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772039661; x=1772644461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6Fai54Ul21d21qsppL/OgbjNjE4u/Ww2JyK/Frhu5U=;
        b=ceZiMIJVyN2lHZ+aSGEUaJI6Y0b3ieptQLB0wITZupotIcXYzbnr/6U503vV5bldZa
         7sP2LTUKznCiAkMC7N3lx8+hVztmwRxJ7kF+L0I1+prxvZlpLjX3sTFABYTVR1XL9t28
         oqrWlknU1KWW/OoS74ETyOzFeHZJ4AfLQOEc1gOeY+p9FSd1AR1x7lJoD1nrtmEdOOpw
         B/lG3CSm/qLGPWXpqMwKfhxxqvr1PvJKEuwsot1EqLLZIw+8F/aUlDDiCEyCU+X8fOkS
         I/TggTzEGD2ORdGwpICcXmgQCVXuiOsBrV4RQ4BjobjqPOZ8iDWgfnEwl6d1878BUowR
         PIYA==
X-Forwarded-Encrypted: i=1; AJvYcCVCdpFLFGQyBVklaKn+g0C5rpuOoBtYw8iYzxLUBwwWkQt3zcWkx6PUH9nGVj4Uz+CCLYhGRbh9bOoDrRCxhA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMQzi5ePlYibcqksLGq6MjBB3LWEnkwyrQ2vLaCxToJkiI01Js
	bJBJnL+XdY1fqlX7YJ3RdTPNm4c1TJ+Th6BWgeGnGg8JcHfQv2p11upg
X-Gm-Gg: ATEYQzwAC+d5/JL8VFCz7NgG5EoBuGYABD4SZVqy00DTQU8HTBCRWFPY3nu6pI4x9mG
	NeBrJOVPT9x/kV6bMMkJxCv99Zw2kNLfCEGaOayF0zIP26TGrNRk1I8SBCtUeTnQqrULCOk0KFA
	Zvn+gowq5B0sDABhwQWcnUtxug9kT1NFfO0uXvFgwRVu/eojUDsyNpPXhqHtXvEev8ttVGhfo+X
	5SUWcNi5Ceg5KYlSaBCOKqLeEyxy+yVWvQjtPkwpIaN4rhja+nm/iKt7+KJzEYyYp8MlKhvihxk
	HXE+Ij7wVfv3DdoWvZ3l2Uqk6YYsuYAR9kwEGy++9P/87Im5b9EmV3i9SWsfCLqaCpWMnQj7LwO
	bTQKEDl4m1wpofc5RyaYMWX/RBVK0otVha9dc14n9ZrFbP9bKMrDJso24Ll9pKEW6KwUy0hvE5E
	n/xRA2mo2q95tnzAoBeyQncwCzaGkyNCKN3tL7k5AmiSycNhHhH6qjTi43wzVBxIXZ
X-Received: by 2002:a05:7301:d1a:b0:2bd:b2c9:851c with SMTP id 5a478bee46e88-2bdcc070e66mr620754eec.30.1772039660613;
        Wed, 25 Feb 2026 09:14:20 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:64dd:9670:711a:678e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7da4775dsm9332416eec.2.2026.02.25.09.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 09:14:20 -0800 (PST)
Date: Wed, 25 Feb 2026 09:14:16 -0800
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
Message-ID: <aZ8tocPCKqTXqbC0@google.com>
References: <20260225155409.612478-1-hugo@hugovil.com>
 <20260225155409.612478-5-hugo@hugovil.com>
 <aZ8fXXGMx3fk7gKs@smile.fi.intel.com>
 <20260225114155.3ee2efb002aa0f52a905f535@hugovil.com>
 <20260225115652.8beb1979df3824f7a95d22bc@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225115652.8beb1979df3824f7a95d22bc@hugovil.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_091421_934403_88BD10FB 
X-CRM114-Status: GOOD (  22.63  )
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

On Wed, Feb 25, 2026 at 11:56:52AM -0500, Hugo Villeneuve wrote:
> On Wed, 25 Feb 2026 11:41:55 -0500
> Hugo Villeneuve <hugo@hugovil.com> wrote:
> 
> > Hi Andy,
> > thank you for the review.
> > 
> > On Wed, 25 Feb 2026 18:12:13 +0200
> > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > 
> > > On Wed, Feb 25, 2026 at 10:54:01AM -0500, Hugo Villeneuve wrote:
> > > 
> > > > Add support for GPIO-based charlieplex keypad, allowing to control
> > > > N^2-N keys using N GPIO lines.
> > > > 
> > > > Reuse matrix keypad keymap to simplify, even if there is no concept
> > > > of rows and columns in this type of keyboard.
> > > 
> > > ...
> > > 
> > > > +/*
> > > > + *  GPIO driven charlieplex keypad driver
> > > > + *
> > > > + *  Copyright (c) 2025 Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > > > + *
> > > > + *  Based on matrix_keyboard.c
> > > 
> > > A single space after asterisk is enough.
> > 
> > Ok, leftover from copy/paste from matrix_keyboard.c :)
> > 
> > > 
> > > > + */
> > > 
> > > ...
> > > 
> > > + bitops.h
> > > 
> > > > +#include <linux/delay.h>
> > > 
> > > + dev_printk.h
> > > + device/devres.h
> > > + err.h
> > > 
> > > > +#include <linux/gpio/consumer.h>
> > > > +#include <linux/input.h>
> > > > +#include <linux/input/matrix_keypad.h>
> > > 
> > > + math.h
> > 
> > Ok.
> > 
> > 
> > > 
> > > > +#include <linux/module.h>
> > > 
> > > > +#include <linux/of.h>
> > > 
> > > Is this in use? Or you wanted mod_devicetable.h for OF ID table?
> > 
> > I need only OF ID table, so will replace with mod_devicetable.h.
> 
> Hi Andy,
> finally I need <linux/of.h> for of_match_ptr()...
> 
> But I will keep <mod_devicetable.h> ...

Do we need the dependency on OF? We may include of match pointer
unconditionally and the driver could be used on ACPI systems with
PRP0001 HID.

Thanks.

-- 
Dmitry

