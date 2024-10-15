Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4690ED1D88B
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 18:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+ea8ccZvUXgrS7wSLnvXQm/IOSNZR9uPNXAF5KAZsk=; b=c+lSPs4ZlIdh8HLd6dpWCY0twg
	IxADhgIe6R0qqscJR3w5UvdSJGqXCJXTZ1WNI0fdIzMs2egUTNdhoN9BcF4hfoZGbrgWeJFGR+jRX
	TyhrgoJnunHySnO7DEUP9zNbdd3uXKwduuwv8TO5Lb9PozmyLUUC6xrIzTL80605leky4nkai0Ey9
	UWCoTRc5v54/Ga4sI7DNpmYIx/v3KMP9gKAuYiPZyks8DUFr7NNKRsZnDS5fdY+SH17JWY3cfn1Ki
	vTIkqmpVRrzmbaeRPYvEGFsrsoSSf94HMChlVvtsd5Ah+sX+umzRo8i0g8l/dyv0Da/bW9C/sZCrH
	5oa57NlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0lqQ-000000096wj-2pSD;
	Tue, 15 Oct 2024 18:00:30 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0lp0-000000096gj-3rpw
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Oct 2024 17:59:04 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-539f2b95775so3272381e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Oct 2024 10:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729015139; x=1729619939; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+ea8ccZvUXgrS7wSLnvXQm/IOSNZR9uPNXAF5KAZsk=;
        b=IRirfrf/hJvwnBEEEBDeL6AZfRBTwU/2t1hc7ZGvRK6muuZEXfpT4d6tZq9L8btSu5
         qYDvw+JC4KtKryuE6F+C72GLMNvTOdXkTDOtv+56oJb1BvuThrCPLX01J+ebsjXzcUu/
         RAwVm4PUcSzyvTz0dbfnASCLMscfPkvPJU7fY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729015139; x=1729619939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+ea8ccZvUXgrS7wSLnvXQm/IOSNZR9uPNXAF5KAZsk=;
        b=GKhVeQXog0CpPbo/20OIDPZS/K5sqAajZWxE8WRVhTzWh9DDyYbMSn1k1Bdnp9YmUq
         Lrl+HOJ8IP0y8sUPMQdzFJgwc02RoNQ44PWDXsD8Ms+4AXtRaP8sxrdsccGUy7T/oAJY
         3/0hLYmduC78a2VqrKAO3tDQ0fIkK1ueP162iCAhutieMY853i6IM3iZ8ETGBOzpHgy8
         QSK5wB60n2vzSMqALL1hoe148DzR2XvY6KrXgy38ogYKQZ/i7VbbHw9IM2phVUJHJFcQ
         alIvRZU4T+rG0+t/5Rj9qJYbRrvYsSaCGBsTX0jmU7Qc7qhxIHQbSQVqng2hsJpZuu8l
         9EeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCswXaVXbf/hcNFmBQo1RIZSPNd3lvH+kTuorXIWp4qs9S9q3QrtcnEvqdHNWFjGkZYDBXZiUiozznfR4oFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxuDgIvtex1Qm/y67gkCshPWPFmknSwAawHalZRr0JdsaW+bLmW
	zuILrtqaS0f2ERuYQwT1HNzEkM9g3/mG+w/xGrNP0UM0p8faxJBV+Nke6dYxkXhkIC5P57d3WNa
	96pkx
X-Google-Smtp-Source: AGHT+IF8goMNj0FJo2DOSE4GhX3ZJjRZ2cf//bjYu9OYUFGJKAm6iuabnTcbN2eJM/KsH1Fr0vbrww==
X-Received: by 2002:a05:6512:1252:b0:539:e0e6:cf42 with SMTP id 2adb3069b0e04-539e571ce19mr7531462e87.43.1729015139384;
        Tue, 15 Oct 2024 10:58:59 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffb1e37sm223809e87.83.2024.10.15.10.58.57
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 10:58:58 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539fb49c64aso3280336e87.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Oct 2024 10:58:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVB3fIg6o5/TeWetLtK172JFLT1CEWwav0TVSkh7D77zC4Xo/azwVKjEzKstsT0jpunuiUDCtEa6Yq9bJYl7Q==@lists.infradead.org
X-Received: by 2002:a05:6512:3e01:b0:539:df2f:e114 with SMTP id
 2adb3069b0e04-539e571c9femr7438846e87.45.1729015137476; Tue, 15 Oct 2024
 10:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-6-wenst@chromium.org>
In-Reply-To: <20241008073430.3992087-6-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Oct 2024 10:58:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vs2bekyqBN_Lro_u32Dg9WM-bjDZr_tx-KyYH_toabVg@mail.gmail.com>
Message-ID: <CAD=FV=Vs2bekyqBN_Lro_u32Dg9WM-bjDZr_tx-KyYH_toabVg@mail.gmail.com>
Subject: Re: [PATCH v8 5/8] i2c: of-prober: Add simple helpers for regulator support
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_105903_055672_3685FB42 
X-CRM114-Status: UNSURE (   9.52  )
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

Hi,

On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> +/**
> + * i2c_of_probe_simple_cleanup - Clean up and release resources for I2C =
OF prober simple helpers
> + * @dev: Pointer to the &struct device of the caller, only used for dev_=
printk() messages
> + * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
> + *
> + * * If a regulator supply was found, disable that regulator and release=
 it.

nit: was the double "*" starting the line above intentional?

Other than the nit, this looks good to me:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

