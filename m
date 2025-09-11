Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB46BCAC58E
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Sep 2025 19:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJeew9YIVoP09p3LirTxwS5JzCuSaF7BlgkulwqqjZw=; b=Niurnq9mJcDbKMRf5HJygoPDF5
	z07S4bXHSLTRHHvW2mpqJLwCYlxbzFSTZCbF6xmoZzu+PQzapqt0otOF6uUi0X5fiZrH7JKU2Biqa
	t9nT9RbdT8kvi39p9XTOhrsHiYC6TgKPpbgQLJvtkstteKxXxIPTmZXCjlizfcB97ksTX3CwskV7K
	t8zDySz1omKoLbn/AsWqTQG95G2SnnLNBIMe7cu3vmQQt7fl4vXXnoxzMBUljqfWZQ6BVCxcejfFe
	hN7H7QRtDoEIfdNwJNkzAWFCnAWomVsN5RWtNjK9CGavI6oYb0GYNSwS9FYwyEzg+RXpQc9n+0ftx
	nR+SpMVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwnJh-000000054w2-08qT;
	Thu, 11 Sep 2025 19:50:49 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwnJc-000000054tD-31wL
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Sep 2025 19:50:47 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-24456ce0b96so13745195ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Sep 2025 12:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757620244; x=1758225044; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TJeew9YIVoP09p3LirTxwS5JzCuSaF7BlgkulwqqjZw=;
        b=VEgn7UxBuWQUaIcV+zvCRxJ9gD9zWWXkpuQn9qEVMh1QthqrzMiEUSjdK1V9Nvvfdo
         t5lTJu6Ql7fuQKgOZ5GwNHsi/P3sCkNidmUXPe7jAyBStUuU+KbFhwTVab4B8ihVjZ5o
         7lCsICLwvH3XKpOuEApC6PUkMi4M6/zy5bK7yBUz0bdx8v4qRVu6gH9NHOQSbUc1Fpll
         Zm81h/Z17Q/uPpNKF1t8A8PtJPTF8XGvuYEmHUshCFjgpqKoihozA4ssOHirPs/UlNO6
         ZCh/vxo+LXjEx1jRrsW0gDSlRqwHNbYUtq2CNLkJoWH7OxbmQTeShpagYen9QGA/j5xb
         IyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757620244; x=1758225044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJeew9YIVoP09p3LirTxwS5JzCuSaF7BlgkulwqqjZw=;
        b=GXKlJF/4rZxnIbIGsaLM97ntm8jJvQff9pY0DeL55MDGSuqjSkx6S//+l5FMwss2rK
         JUIzsMZ/H/5A4Fx9rLfdCssZa4sTzc7mUC182GU9zqrxHP7ITDNvCVvgPY+0yxKoY605
         YeTHsZXCA8a6Qw8du1TZaM0OgDW+fIuTZn1p9yXZUMOrDEjAlBvPuPuIq9xDGzXvGOlT
         RieXXM20/JjlML/OyY1RT0NoyMdkJb9jvhXwf0UNVVicf7w6B5DFH8nvFAY7eBGY9x+F
         hlOCDqwLBINLrFTXWBTzpAhibdooKMtwANh3HDosG2lpEJ5RRzmyi2Y9oeP4dz+fLT+r
         6aCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmGlvTpMlbUoG2vD1yaXd6SKKXaD7vff8mqaXJ2iY9orESeGU+klPA9YtQre04NuFZYDhf8H813JRIauMO5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YypkWhl2i7t/gaWSslXh3txCuf1OsY7snnc/ceeaxDXShCSM7wH
	OMzv6QNyi2C0pOLNhAdExX8KXaIv79LfnI1Il98xEkoDMvNNNmxYjYh2
X-Gm-Gg: ASbGncsvmLpftCF3AYHhzLdyKP8jIqSGrJn14+Y45dCNgVn8kJSwDA3Tib5/0aONvdm
	i8NPcYQaSvFG11lNFVo13/YO3BSxQx4awn6mngf9ScIQiBwjWLKn7Ix6K0y/4yQD9PmEkGRJdNE
	3zQznfEi33L0KQ/DiK1Kqh5VeJhPopCAQjj0YwCYnYfD41LxdtLDmA4dy9sKrDVQ1NhkPQhPdb5
	gyKVmnzylCBE/C7cblXJnbB6lrvYOIS63Cb7OKF3wDYV6ps/S8G9u3AY26CdCF7tWhzh35Ik4Cn
	sasUrepgWHCRs7QYRGYRt0kMWkh0WC4fhcUXvyKPXmJMW4zkdmjJ/tmeMfnhVopulVPDBq/acUl
	NQL8yWSyP5qcYvEofRNHti8DyQOZPSLtRDHZiXkLv/i/BHdmF
X-Google-Smtp-Source: AGHT+IGM3HY9cYe0k8sf5GxMMVgG9l2ykvqk4n7ayiGGr2GhLio6Ij8ygJsJDwHZ88T4ZvBeMdpxjA==
X-Received: by 2002:a17:902:d506:b0:25c:9084:4172 with SMTP id d9443c01a7336-25c908466d3mr25755745ad.14.1757620243626;
        Thu, 11 Sep 2025 12:50:43 -0700 (PDT)
Received: from [10.69.47.143] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c36cc53bcsm26957775ad.28.2025.09.11.12.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 12:50:43 -0700 (PDT)
Message-ID: <cfe7bc19-763f-4e92-b1ae-355c661bcc19@gmail.com>
Date: Thu, 11 Sep 2025 12:50:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] gpio: brcmstb: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>,
 Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org>
 <e0941449-7a62-4bbb-8790-616f393f2cc8@gmail.com>
 <CAMRc=MfZ5ss8Gd_TTPV8EYSv04ENp_C26b3=wukO+UTy_boXUA@mail.gmail.com>
Content-Language: en-US
From: Doug Berger <opendmb@gmail.com>
In-Reply-To: <CAMRc=MfZ5ss8Gd_TTPV8EYSv04ENp_C26b3=wukO+UTy_boXUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_125044_762750_9C19423C 
X-CRM114-Status: GOOD (  13.83  )
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

On 9/11/2025 12:56 AM, Bartosz Golaszewski wrote:
> On Thu, Sep 11, 2025 at 2:11 AM Doug Berger <opendmb@gmail.com> wrote:
>>
>>>
>>> @@ -700,7 +707,8 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
>>>                 * be retained from S5 cold boot
>>>                 */
>>>                need_wakeup_event |= !!__brcmstb_gpio_get_active_irqs(bank);
>>> -             gc->write_reg(reg_base + GIO_MASK(bank->id), 0);
>>> +             gpio_generic_write_reg(&bank->chip,
>>> +                                    reg_base + GIO_MASK(bank->id), 0);
>>>
>>>                err = gpiochip_add_data(gc, bank);
>>>                if (err) {
>>>
>> I suppose I'm OK with all of this, but I'm just curious about the longer
>> term plans for the member accesses. Is there an intent to have helpers
>> for things like?:
>> chip.gc.offset
>> chip.gc.ngpio
> 
> I don't think so. It would require an enormous effort and these fields
> in struct gpio_chip are pretty stable so there's no real reason for
> it.
> 
> Bart
Ok, so assuming struct gpio_chip is sticking around long term that makes 
sense to me.

Thanks!

Acked-by: Doug Berger <opendmb@gmail.com>

