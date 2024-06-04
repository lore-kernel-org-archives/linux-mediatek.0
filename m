Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA94C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 13:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4HtLoTVU3H+eyUhPZTSVo5LCusxKwB+BLH0C2Ip7jQ=; b=Aulqu2AUh5dBzrC7ALCdjxlMEm
	krwn7cXsXrVdgKDOkNW5OnAxdB0Y5hrgeXsQbGdfWM1VMo+2euAYlXS6enliBjOEwAtskblt/5lnc
	rLaex9xcZ4iGQXk3mbwfd69Q5DABrKd7clNlFOTQKPpYybEIl/MWQAj4Nwd7F9j5ZZ3CxFqgvYe8x
	U42K7iKPJLU4gQa/bAYS1yj5uGQSUauGCiEvGRJufEI0W8MI1svaLOkbNXE/tzLBs7SnEAmtZUZU0
	mkywoN9ya/XI7H/iggalOWYlD4oRkksIVP8RNElQhA+jqrPSw2KkgQZo44jv0fkfBQHaBdV4FLnb7
	8yIAYykQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEU8N-00000002Uq5-2g22;
	Tue, 04 Jun 2024 13:23:27 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEU8J-00000002Unq-2WOv;
	Tue, 04 Jun 2024 13:23:25 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-57a20c600a7so6301498a12.3;
        Tue, 04 Jun 2024 06:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717507401; x=1718112201; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4HtLoTVU3H+eyUhPZTSVo5LCusxKwB+BLH0C2Ip7jQ=;
        b=Hu2x5ymR3O8EiiHkr2vxKGZ1MRaNOlaZDjVqXS+4K2elDHoqvUVKiL497zNvV81jBi
         30xHyvEX+5BLq/UWq0Ir7aPiGQ0JyFF3bHMVMz0W6wBbJV4e/0pjz2Px9W1pQuwlQ58O
         pA06NiIrD5d86xBdfucJMqbAYjEobVkK7gZluz5waEuk9++aS1FuRg9lrarS8ccsJR9o
         ySy+Bv/pR/6Fu1OqNYqAl5pwmR7dDSkqLTQoEKqwHRIAgNndc8OI/GVoo7VQ/nDMhRPx
         kBjliZGAe+w5hllVXu5Ch1Ht5qHTA9gWfZ1iZkblqQqxz69933tQJbxsiIJCasDHzb/M
         D8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717507401; x=1718112201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4HtLoTVU3H+eyUhPZTSVo5LCusxKwB+BLH0C2Ip7jQ=;
        b=ldGWhR+16SVGNKlJhNw6qlLXgdNLAzBZzTWPz+FSh6nj4MJ5DZXPp2PnZKP1bE3PYl
         SDoQcldwciBfrK/Bi4T38YyZtS4IAK92bRfEUm4YINvdFrDP5z1ihtRjVjf7z2Z3cJ0I
         cWlUF5kbG6HuMa0ExqJvTEsn1cwq02fNjGvd8BGaZOBrEhEoqO84kjTpr034OCRG7f0K
         9oq4eVn2FXpVG9bJVZPTLjoCGBuXpYfXOQTQp1Y3wrlUZw8npjdG5zT+At0uPdmEp8V9
         etQgAelDveY6t095tEedCLtZstKCTAegmt2+tU0Nqgpb1+xDjxNAZqAk/WEaSxE+AivX
         kRbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbYwJNu+aznhi3CTO+wwK8o9q/JAIlW6F3VnrXCh7w/HD2GpQKEArflKMwyo5k5ji5cH7pF2pQ0f1aqJqiHllPhAHMRQwf09RBDehcB+JuCrha5n9vW7Laqae+9qqX8fs16ovMZs0gnYytbwvBuLo09hchck9m9W4=
X-Gm-Message-State: AOJu0YzRchY/4pqC516OpLQzi5xnjQRY2fDnUGxXygXW0uX2uOx3Hvzm
	mUEuw4AV2cQ8g7+shbQBPO4iay4LLbnxqU8vhrV1tRZRD5WQH/K/yi36NZZ0xGZi7mqZkEO9ZfN
	1jJX1TeqQzkaDAk8E2eK5Lv2CHArqowa6
X-Google-Smtp-Source: AGHT+IE5s5ADNfYnbPI8bDw/CpMfi1LzejGDjcTFcbYzZnvQgliM5/TmXHdkT9xdHYahqyYsZ6pgxgeQxvDpCe8I2qg=
X-Received: by 2002:a17:906:2b51:b0:a68:cc6f:cb5a with SMTP id
 a640c23a62f3a-a68cc6fcc2emr493202266b.68.1717507400768; Tue, 04 Jun 2024
 06:23:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240604123008.327424-1-angelogioacchino.delregno@collabora.com> <20240604123008.327424-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240604123008.327424-5-angelogioacchino.delregno@collabora.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 4 Jun 2024 16:22:44 +0300
Message-ID: <CAHp75Ve8qPLu+gS8o5Q5A20j_+AP_UVkOzdKqcnhUawA_sW+VA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] iio: adc: Add support for MediaTek MT6357/8/9
 Auxiliary ADC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jic23@kernel.org, lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, lee@kernel.org, andy@kernel.org, 
	nuno.sa@analog.com, bigunclemax@gmail.com, dlechner@baylibre.com, 
	marius.cristea@microchip.com, marcelo.schmitt@analog.com, fr0st61te@gmail.com, 
	mitrutzceclan@gmail.com, mike.looijmans@topic.nl, marcus.folkesson@gmail.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_062323_713892_37A21FCB 
X-CRM114-Status: UNSURE (   9.60  )
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

On Tue, Jun 4, 2024 at 3:30=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add a driver to support reading the Auxiliary ADC IP found in the
> MediaTek MT6357, MT6358 and MT6359 Power Management ICs, featuring
> a different register layout, configurationm reset and ADC reading

configuration

> sequence from the other already supported MediaTek SoC or PMIC
> (aux)ADC HW.
>
> This driver provides multiple ADC channels for system monitoring,
> such as battery voltage, PMIC temperature, PMIC-internal voltage
> regulators temperature, and others.

Seems all my concerns were addressed, so
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

