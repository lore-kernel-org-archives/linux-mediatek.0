Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73ADC71157
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jun 2025 13:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dn2ph2mkRUbTFNZLkAEFvorPY5MaAM3g9LKeDgumlGU=; b=Rix7EZtox3DqHsC4jDf42aNp0Y
	8h3huoMQ+saI4Xw8aCQBF5VPy7CdkLpU0z+fqDTxdi65XCG3frKxuksqE2fYYd1GG9WUUSDeHObBF
	EmAtHGARAF7BD8kF5slE36gBZbLmC8odX4aGXjGTQNbo4RIbAc1+Amzr2pVe1IpZRv1pVSxg5R07l
	BroOTQe64eOuRPJvH8Mi5NLkf77InLje9g/5n0BVSTDC2wbdXLwfeULENw/41wu96taenOROWQRtF
	jQNS+QK3fSU7BayG+D/S8+dPdakE5DMH4uC0qsGcUJ9qhQom8IWN2wN8WnPwK39mT/jkSgpn7JVTR
	4m0Zy70g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsWf-0000000AEWU-3hnb;
	Wed, 18 Jun 2025 13:08:25 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRr1c-00000009wrg-11Si
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Jun 2025 11:32:17 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-553a4f3ae42so5848501e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Jun 2025 04:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750246334; x=1750851134; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dn2ph2mkRUbTFNZLkAEFvorPY5MaAM3g9LKeDgumlGU=;
        b=EKqWDH20QK05Yf9eqv9mZ/mNS0BQBJ1P/h0bxPKiQxuOKG5i4BoAF6+bltZm98KN2/
         cVBI3Ng2yJqcmOiOEK2bKvQI9jeRYlgdF8a63E96WrjYzV/barOSz0576jPaFvMBkIiC
         EJ+7W3yluJpq8u1VqCvOljHEw3eCcdokmuDYn/ODlzJl5l7LlqW/UBo9rvV5gR+s/bUc
         pd+LMxhnwaKlBgh2LCsu9IxIsygyCVZJe4/PII1ZUablH+08t1RUht109xuNW6CTTr2i
         dWBPcErxzoU4vHs8LMFcx8SIuPkmYtKRAIEWfmeSEjdSqqp9b6HOEodDUD0u0gCvOWEz
         GJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246334; x=1750851134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dn2ph2mkRUbTFNZLkAEFvorPY5MaAM3g9LKeDgumlGU=;
        b=hIpaREk2y/s+upTXDOU4sMQV43WLeBXvd7YSWvfYAXURDzKpHLP46QMusm08ptKcsO
         HamWsF1Y15iEW72IbrxYr2YbbZ+3k9zdUD5VFh0SG2UJToGj7pTQ+793ur2GwEpSsTUv
         mQYd6HWy8bl37myhvc68z2L9HHJaQRe+l5sVpZHRgnNGbHinmlGsDJ7Rx5DUDJxs6obR
         R30K+dEoHUDHW4IV112R05kmVis2vAF5QGa5FF3dOpL0tQgRTeogZepIxvYY5WNi5mPG
         ujnUztz/esmQZe0TFQmHskI7JeQICUKBJLaLRwtG0OlUsykWt4sZ99mIwRqBayW7BK5U
         Zozg==
X-Forwarded-Encrypted: i=1; AJvYcCVlPsLl4BixCwcocsvwQHWe7V0k882PwsDGqj80p0zrUAra/y+3hLwjJlsPwMiYNXhOSzkSVDeZ3zevWnVapg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxX7UYxvPZduNBlREhP06/2gbq086o9pyh3HqXA6m27i4+oKVmQ
	AlAZRwn0chYX7UWX0vUyCjlf51U5dfgDAbhmy4NFHR6g225Dkct9d/I4pOAC26UL0TXZSMPfE89
	7RRhSduU7gYNlbrm5ZXWeWGm0sPK90nwt5WojSQw5gQ==
X-Gm-Gg: ASbGncs0LGvrY7b+55a7Ozvc4QHK5msgZ+NX1m5iTHIFaIPDXFCBKWpV9X6FzwYZMM3
	/PytJt5eUWVNo0dIHnDLaa/DALrZEx4n2/mBEsri6lIdIiFX3vxgHZ6sIIVzVmrBnmQRezt7veJ
	iSe5Et79V/U+uWnFtPEF2tzF/8sf+OiWJb6/2j2G8q51c=
X-Google-Smtp-Source: AGHT+IG/cXE1HQ3EEXy0cPSnaDLNTuKJgzCF0qLdhOb/5CcGOOw+a/DTjj5TWhlAS5cXMjlqM/mbx0AMV43GUJjmW2k=
X-Received: by 2002:a05:6512:31d6:b0:553:2e4a:bb58 with SMTP id
 2adb3069b0e04-553b6e7337amr4658199e87.9.1750246334530; Wed, 18 Jun 2025
 04:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250611104348.192092-1-jirislaby@kernel.org> <20250611104348.192092-17-jirislaby@kernel.org>
In-Reply-To: <20250611104348.192092-17-jirislaby@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 13:32:03 +0200
X-Gm-Features: AX0GCFvVR50_3aX2UCUBcxsZuxXj9BpNTfKCs9hxZHJvTphADGhBSjR3yjyWU08
Message-ID: <CACRpkdYkgHzEnqN3VA2MqBChjtwjC+Fhem7Bo3PdnfGZQgQ99Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use dev_fwnode()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_043216_276364_26DA5151 
X-CRM114-Status: UNSURE (   9.91  )
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

On Wed, Jun 11, 2025 at 12:44=E2=80=AFPM Jiri Slaby (SUSE) <jirislaby@kerne=
l.org> wrote:

> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
>
> So use the dev_fwnode() helper.
>
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Sean Wang <sean.wang@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org

Patch applied!

Yours,
Linus Walleij

