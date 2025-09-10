Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DB5CA101F
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Sep 2025 07:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6G74mBlZ/fYakaHeDD39PtqJwH/riYmWWQl4lVzsu8=; b=rrN8hQv3JiBBSDKJd4ynk+/eLp
	LUya3FUnVGNcv6pMt3+6bT5tJMlnlLh9ndmMTOlFixcyWAB/96g0Ur3kPXmRbkCJa8QNFz0oI3aQR
	vmMOhJrkjbX7GrTZNxvoQIfq/fbhxHbADFaURgw6Jhu7z4TdpNCj7rxcmnGuNqTmagpeAh8Cu67c+
	d7dX1xHfYuMJEn5JbYP/173ZKWMwUqDvhoawUOecyerbF3REAKTmZTCNK7CMMYZLb+DM8EOpGX8wf
	saImDuOG2vljNcsjaPEZ7ZAadb/lKl7YU8izxLeoLCwbvf1NSdn/j0gIon4ZpW7xQYbPwEIJAMjqV
	b4yaQtqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF7N-0000000CWAK-0mKe;
	Wed, 10 Sep 2025 07:19:49 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF7K-0000000CW94-1McJ;
	Wed, 10 Sep 2025 07:19:47 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b045d56e181so965549366b.2;
        Wed, 10 Sep 2025 00:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757488784; x=1758093584; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6G74mBlZ/fYakaHeDD39PtqJwH/riYmWWQl4lVzsu8=;
        b=nmtbOvUg3gD1j1vaKhIIJDMm4666iHdBl7BQmckBjHw/giCX67SwuN/zmAbanV+2Eg
         YNwOO6J8g3pO7nYOVhIOZYvbloC2Oh4Wk4/nvf2cGDb5NMS5GIGRaUqOrih6lOGMU5OP
         bRYnDspMA9N3lX4Re2147J8hOLuvFIiAu78j2f+sItftrCWPZiJLJxwARWvFzxu3miXf
         0tpxkm/iZhRR9lVcDfKeD97BItQshJcyQkwb5mx7rH764MrBsO8Q+cwGyEN0qETYTWwt
         Pew5WWfLxmCRTdj965lMP3sEmz92uXf6magt/zEFlAL4ZFYLdre60COHFX5PO+a7rb21
         bQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488784; x=1758093584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6G74mBlZ/fYakaHeDD39PtqJwH/riYmWWQl4lVzsu8=;
        b=XbmgZsWB7ccUp8MQEXbAyyTDm1Vgu5b2P1HswQfW/allJrMXlmj138+gsIZjv0Ykok
         ObWqMv2GtIwMNG8raawl0Pc9Q4zbdT4m8cpT0/e5kMDh1i+qOzftZiwUsYXkU8Z7QWmp
         6DxLWvCi6sh2/gAV+C2iSr9eXJ8yQ4ro8EVqwkdZUagimFzZ8ywh0hRUdk2o5YiexfRU
         uAmyU4c/a7sQySBp23YF32NvGu5w2+p8OqYq6IGBGbQKm+u6GznQQPg5Y4iRFlVbYcge
         EjMdfVqOYnHAW5eVmiPGYFo6DXnW0/daP2Pnh6pNwXP4vhFcdpxbuqPhLFVNkNUrs6fd
         Pm5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoEB6drEcS7T1eOwZuzyu6Pqp8o19H83y00PqXmDJ06sP9u1bFJG43AoSpWapcMXRgH9IbY7hgRMBNIWkt+/Yp@lists.infradead.org, AJvYcCVJr/DPqsgZL4v3rwl8BMK872uo6lHL4hpsmkEX7+k4/+s+EUTi7DbEs5LLPLeeEVf30VaEh12ApcyTwFg=@lists.infradead.org, AJvYcCXDWeFfG65KYIkLgIzyC8U7H0E2Tj3RBDzib7gn9X66woNU9PqJqCk0BZxt2LpQp8BP7FghT8NR5ECl3Xw4N3c=@lists.infradead.org
X-Gm-Message-State: AOJu0YwASzkAJMCvVAGEIOzqZyxioAKa+9U5JhnDKaQpSlYFUhx3c54x
	Qdng/ejzeRrzbFH/8v711v7DfkYzqoo3xWgdImbENy1HLyNKJ+u3mqMY5fwsoetH5LwUqavq0CM
	zmZt1+qQMTuw9FIJaHMiCtatp1K3NozE=
X-Gm-Gg: ASbGncvl+xSrr4CL0XBT8P+wmFr6kDkT1EKaEbj/KuC5Llv0ZyF4pnRcjn63r+mKAD/
	EkqJsAj+YAKJhIX+t4fsqoY6Z/XtwQ6P3Y/ByfMb5pQkhyfJ+r9VGYEQ2WP/P8lebzIC30JXp9a
	9vjAcBeXHIFU4JByNXBZZRxGjm8y+vIxu3zyMWWwXQiyYfWqmsBWQuvUzKa1xCWyAizBXGwHtx5
	yJCVXA=
X-Google-Smtp-Source: AGHT+IE9VwmF/PsukJbTlBYgmvFE+e/pACvgJIHgxZN/6gBmWKACe4q7JDxVYTbF8agSRUuPrIlTk5gxzt1ml6Re7Ok=
X-Received: by 2002:a17:907:9301:b0:b04:75fe:e88 with SMTP id
 a640c23a62f3a-b04b167e229mr1292677866b.49.1757488783973; Wed, 10 Sep 2025
 00:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org> <20250910-gpio-mmio-gpio-conv-part4-v2-13-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-13-f3d1a4c57124@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 10 Sep 2025 10:19:07 +0300
X-Gm-Features: Ac12FXyVb169fyF2MyyUio9X-rBr9gKbOxdItUjj4Nc2RkmldZAztWEoPmp-bgQ
Message-ID: <CAHp75VcczAm_=XXAjwLFqNTCF72-UJfdisPvavadDEXJR2G19A@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] gpio: sodaville: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_001946_376467_E3846C77 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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

On Wed, Sep 10, 2025 at 10:13=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.

In case you want to take it
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Otherwise I can take it via my tree and then PR to you.


--=20
With Best Regards,
Andy Shevchenko

