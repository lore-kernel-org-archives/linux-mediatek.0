Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E0EC52D7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 15:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1aWP5ST7eabEAmdy9MKRcrR2g/nQXN2UIw338entCE=; b=deWOIORZcLU9ucdDgr6tK1URwl
	BeDzAiJjqt1CC7rfiHSC9PBLECHbysVSI9DVVnznSzeQJJwurlvlxyY+eUXWMA/T7Of4j3XFCScSl
	rLiLJPHxM2ygnEC/D2dBeWLcoAvNrtLcUDL+W2cZVQR2Zm/Wb0Ue3M5vc6k3ss80zSW5w9IQ7my8/
	9XfL6aNBOnI1E8d+yXsSWysCrboeKDOZya5nlYNHVsjbdMug4ut0QWQgKdfxBkMoj4jWwnVc27IHT
	kNHYhzs7h6t4lZAbbfM3SohHfLllKPm+GV2whxPRzs8OywGHUekNjDbaNuhUHNY4lb4sGtr7rpPti
	N0yj+z9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWQj-0000000HM44-3gWI;
	Fri, 23 Aug 2024 15:42:25 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWN1-0000000HKx0-3MlH
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Aug 2024 15:38:37 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2f3f163e379so35464801fa.3
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Aug 2024 08:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724427513; x=1725032313; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1aWP5ST7eabEAmdy9MKRcrR2g/nQXN2UIw338entCE=;
        b=C3n8PjI9IiPOu+uzjbgZTcP+hQm/jegJcTChjERnYAzP/nvgoJj6oZP2auRVCTM1wr
         XNWe0pv+isAWE2NKq3ZkqMonXMjKYTYsjzwV0IYjgfRnbwGnc7C44B8dks55n+snI3Mk
         1DSj3iYP1L6+dWfhDoAPCjTH2R5ifz3KFFB909VvJC9/bcuS9XESqEbmqSKJb5zZuOZt
         jbbxL1UfEsfNa9NjNvFQzekz3qJaswk2xmD1BBn5pUn6R9aQjEswwRZx1E+m4pcdPWRV
         ++B4ebMw+0FDF4TaEWPyGBfzroIb03E9bCQKzbRjS0STpR19PiRk7NzGKWwBWqpDSKFG
         fwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724427513; x=1725032313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1aWP5ST7eabEAmdy9MKRcrR2g/nQXN2UIw338entCE=;
        b=eGU6WBd1IFafF7BQzOpCxFFYdYUM1JJFARlidYYMn0YqSVsRMWrX41S0EVC5PVFDMP
         0o6UN7lekgujsAapT17Nn05SC6UWts7YzVb/gKLYRtGb/hj7tqR3LoQaTnbUj6gZvC/u
         C/dsj/iWCBVa8Oo2jzsD+dtZlMi8f93EKR7r0obYUGoNGEqwxhVtXbm5NuJkq6cYbGbi
         V8yIOtvukK+vq1ty9nrPwtG31YzC0avJ/slLYgUs5qi7lMeDdqmNtx9uI4n9tA66Sanw
         HrUKA/4OlXdg85acvRxFUIJYlUjPz5bc9cSqwffITZFgrGb+vhS0EaAcWKqupufEtPOW
         CZqA==
X-Forwarded-Encrypted: i=1; AJvYcCUXb6C+F4MfwmLiYyrc5pbH2StBEDkAAASwUwOceRPbql8j7psc8eFK4ICS0YWALG3JpzyLoQZIHaNNV7IB4w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyO3LFB0CLx7UVldf9MzOwTRxTUZAFRUMmKjfSjpDKn0zwk1Evp
	oKUQ1kK7UCH8pqEX69N4tGed+N50bQ5sse894OLINMS81qoHL/SL/Ihupk9qcsgL56sx7pJJzGV
	mNUSpHsACD1dD8ZPItiEOHMCd/K4YAlmOovDEBQ==
X-Google-Smtp-Source: AGHT+IGoetHNeUNRdUhqkqZzFJx0tdmOHprFon9EuHG0B3EcAz/iUjVn5fTsqlDFXz4Pq7FWblIoahHetuYR1hUHo0I=
X-Received: by 2002:a05:6512:b22:b0:52c:ddef:4eb7 with SMTP id
 2adb3069b0e04-53438846f4cmr2384658e87.20.1724427512959; Fri, 23 Aug 2024
 08:38:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240731191312.1710417-23-robh@kernel.org>
In-Reply-To: <20240731191312.1710417-23-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 17:38:22 +0200
Message-ID: <CACRpkdYDn80SnyihbibDaEMf08F19G-uPCd3Pywcie5Dv13eZQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Use of_property_read_bool()
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_083835_844942_EB0D973B 
X-CRM114-Status: UNSURE (   8.92  )
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

On Wed, Jul 31, 2024 at 9:14=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> Use of_property_read_bool() to read boolean properties rather than
> of_find_property(). This is part of a larger effort to remove callers
> of of_find_property() and similar functions. of_find_property() leaks
> the DT struct property and data pointers which is a problem for
> dynamically allocated nodes which may be freed.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij

