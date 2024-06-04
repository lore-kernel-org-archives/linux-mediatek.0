Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A441C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 10:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDj6XyLMkdypUs5XebPk9O6Y/tAg4OP0rl7m8sDWpro=; b=JMc3pDGTHHLqMRnhHC7vI0REvy
	eJ2x/x1TnPjePFbJxsUL8GFDHQcWG0oYiFzGbSIkfPmemngu5/4/KOAesmkKsVGhyPq0KYAc7896x
	2LcrDb4zEqznAuu+ninwpiCIQNzKxAJm8vJAe939UAJnXAscnMFBtTPlDFOeGU+3f1Sj7d14PgHBn
	Ye4+ojKVaTeEWcw3TOnfvs9Fx0A7pRRstEBRqLQ4AlqburAvGsC7ZsiwXaBNoMve+EllP92zP5OOO
	m2lFIAVLOPwdeWCHQcw861t4b7UT1iPc3vBOcV1Y1dvqoelCvQV6ljF78h0K80L732A1OhREwSc9Q
	bpSh05GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sERpV-000000024Ic-3p20;
	Tue, 04 Jun 2024 10:55:49 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sERpR-000000024GN-1VXZ;
	Tue, 04 Jun 2024 10:55:47 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-57a6fcb823fso1678315a12.3;
        Tue, 04 Jun 2024 03:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717498542; x=1718103342; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDj6XyLMkdypUs5XebPk9O6Y/tAg4OP0rl7m8sDWpro=;
        b=DeXQctIQGWSgfFy29CT9e9K4CBgHmsuGBDWWFXRS7R4YPhMYUtnw6/vXoGPL8nF3P0
         UFRdeLOUQMYKH5s6NIhRemBEqi/s1kjFzwhKYA/r5ex1qUvfokbH5qlSZMAXl4NteRaG
         ZdeptX11RAWCnoeegKbAJMg9jxSAaMJmM87UzX5uA/WOt/umrH/KtJN1OA0Q9QWCwdjY
         DY0U9y0J+sVk8VHR202vU5ZTVSOrouQJR48Hw2fkHI9Cy/2uZMWzFrJ8rhkl8/g4bp8f
         lmaj/2PVBFU637DNncfC9Qb9Q1vum7qfa+doi6mMDbAKWRfkge0QktgyxkJj7vaQHZ1Q
         q59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717498542; x=1718103342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDj6XyLMkdypUs5XebPk9O6Y/tAg4OP0rl7m8sDWpro=;
        b=r58JSIcmxnjOGa/AItmdwg8pYq/XzP2hwyyheWOZ32IPiZUkoCdAjcybjNsl+blxu3
         3frlHh+ABA1HFASMOyBA2lWmMASzr/c1if1+OwVgD4GI2HI9P6XkGz23A3sOZXPOiCZP
         EBvxNrM70wXBfc7EF2zQxZ0IWXPCMXzxEW8cR9yZyuH+BXQnhapUUnd6BOljfgOcoIwB
         wI37WPzRFfB93+0UnTHG7IfiKQcSvmIz/JsdiBzfgUl7t+izWYSNaXmAaCR2a3LWBZ5L
         QkuYOylYZciFrLz5wPw293wePZvTohRcdbGk9yjQDF4NZFziqRWq8vCGRUcRnEth2nb5
         mLSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUq8kqse/r/M33ovCugDvS8VjCvVCxT140qXqcw+qyc5DRXM5SDEvzoaUjDj0iyMESQfMlMFJCg/3DY3PHN+PalLwRxblzv4JxYl8yfdj/pyXiiSle238cmrKRQ3xcu5Y6A2eUoA0Sh3kSZBgzEfQpqrjivMbJbiR4=
X-Gm-Message-State: AOJu0YzqgBoYCKIej765NVSis/5/BdlTNBkDrK5Rnc+xpsiueYvPWvf9
	ockqW9ZxUL+cOhwRaHdQP7py8VABtJrxn9aQTKy2qHvH2TOv8mEoK7XM5bwSNoRFQQJPkhI217d
	CV96aJkScsMOb+CGjBl6v6mCKNyOoq0yQtBI=
X-Google-Smtp-Source: AGHT+IFmZt6Y9UJZxMqsQKH1greIZFtT4Z7hrqbjSEJ/dY7Mmt/YlBYihOWjiM0e7kzDgcBKFTWWMMLnuGmhwMU9t2Q=
X-Received: by 2002:a17:906:6acd:b0:a65:26dc:3c25 with SMTP id
 a640c23a62f3a-a6821b71ea0mr796196266b.54.1717498542174; Tue, 04 Jun 2024
 03:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240530093410.112716-1-angelogioacchino.delregno@collabora.com>
 <20240530093410.112716-3-angelogioacchino.delregno@collabora.com>
 <20240602111141.0058f39e@jic23-huawei> <60e55919-2a8c-4d83-89a1-6e4ae156d34d@collabora.com>
In-Reply-To: <60e55919-2a8c-4d83-89a1-6e4ae156d34d@collabora.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 4 Jun 2024 13:55:05 +0300
Message-ID: <CAHp75Vf5a8VVyOXQRt9P1QnM6GHZ3rLuvnBF63H_83QBHOTJ9w@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] iio: adc: Add support for MediaTek MT6357/8/9
 Auxiliary ADC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jonathan Cameron <jic23@kernel.org>, lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org, 
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
X-CRM114-CacheID: sfid-20240604_035545_421602_55080F22 
X-CRM114-Status: GOOD (  11.40  )
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

On Tue, Jun 4, 2024 at 12:42=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> Il 02/06/24 12:11, Jonathan Cameron ha scritto:
> > On Thu, 30 May 2024 11:34:08 +0200
> > AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wr=
ote:

...

> > What are IMP channels?
>
> Honestly? Well, it's called like that. I don't have any clear description=
 of that
> and not even datasheets are unrolling the meaning of "IMP". So.. I don't =
know.
>
> What I know is what I wrote in the driver, and this is:
> * IMP has IBAT and VBAT ADCs
> * It needs different handling from the other ADCs, as shown.
>
> ...and nothing else :-(

I could speculate with confidence that this means IMPedance (since it's ADC=
).

From MTK6329  datasheet:
"The hardware also includes necessary modes to allow for simultaneous
current and voltage measurement
which can be utilized to estimate the battery impedance."
And googling in vendor trees also suggests the same.

--=20
With Best Regards,
Andy Shevchenko

