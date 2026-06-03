Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B40FCD6E5D
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2026 01:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfa0xqifL6vDOGACfxfGJ3JF4SFfMplxwiS2lFwtPkg=; b=NMO/O9NnEE7rJ5mbC69CaUCvMk
	Xz/j8ZHvYul+h05Cv3TLLUAW9ybFssNQgeFUHOoCxelboQSH0st/UyiUdg0DIyEw/byyokWW9L139
	43ECy6ESNnitNxkY2uZTdI4gTwssxAwQPLoR/RGBIkSab5q66t/QkGTOb6ecIBZPhHRJvPxpmJBzw
	MHv8Cv93zJXF35NmBf8q+iyWkelO3rqnrbSeRiqNpOd3uHkmZQClUWhcyiASf8IbBRJTqsuv2jCQF
	X81DxLteW1Q4JMqmoD+woh1oCsl2A+BQKflNw2Vwca0eQ2Qf+wdebGIyHUIKtpbG4kswR2i9xIPpM
	0ymWmrWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUa99-0000000E1mW-3pet;
	Wed, 03 Jun 2026 01:11:51 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUa98-0000000E1lJ-0fyT
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jun 2026 01:11:51 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8422524cb38so1206596b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Jun 2026 18:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780449109; x=1781053909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wfa0xqifL6vDOGACfxfGJ3JF4SFfMplxwiS2lFwtPkg=;
        b=PID7lL92qRk3KyHCIWK+APkZH1VIxH4uY90I0X/HJs7AaUS0CXesFUou7LOXnPrpep
         y/DxT9QSPL26Zj7zyxpt0Yey2eWYEpIHYCdEOy+2LroYMlZvJxfKx8wL/8JV5Q31srFY
         GfWKoN2IPz+NEUzlPGZZw5S2JfNmw7HCYiyqQXTPy5YC6/Wi7BfMq0Is7nFKfnWgBF4w
         P1OFJlHZm/IZZKKGsBvIvQlLK4h7+Cre7/8Wcc3vdZpVyc9aXVsFeoyxO5mfv69jhgUJ
         tV888XtZ7c2YxR6vwfoiBRwzVvuNT5IIeCrHWrr4BkeivRaaw8yo+aOTLkK0UjUo+xaz
         Y4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780449109; x=1781053909;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wfa0xqifL6vDOGACfxfGJ3JF4SFfMplxwiS2lFwtPkg=;
        b=W3mjMxAN1Z5zFvYG2+DXw0eni0o86F49FBCCQOH9vJFOc+ouJc9zwPjsfG5QyhgaoB
         3IqGE6k0Qz8qt8/fLHKpusJdQwr3McqSy91HS5ehkcyz9cUco4Nb/5/PAP+Jlbn3JIRg
         rcg0ebg3bSHuEWG/GGnu+gsC4hfuYaO4gk4YBGqx/i3C8gY60PI3x2Wsxu/xE9TM9UJ/
         2OFEh8wl6Z0dZxMyb191n3OZ+eZIJI9qfshcHjZpy2UYuQLk1XqYmiQROMaxQUkNJAMm
         WmSw/VgbfYwTSxW7+894agGm4Q1qugdvnw3dU5ObfC3ZzQjdK7TxDnmu0sF6V8TGAORx
         C+DA==
X-Forwarded-Encrypted: i=1; AFNElJ8I97zptJJ7YeOZHcA0AZxADNwLyMcQj8LqOU+n2APj9osBNAN6eMbmPMLEHpSBAioN3jEWajYjapYJWXX91g==@lists.infradead.org
X-Gm-Message-State: AOJu0YySzYdmKvP5j6BkwILjkejwcHlcxfDZbaWfXoMFD4E8Kc27eSkD
	IwAphhAbLZxZDGWeiLy7+YLAXNul1F5xy2OiqM3EqrayqGNKQO+sFRlv
X-Gm-Gg: Acq92OH/7tnQ/JuX8gD8gZrFgOPH8o7rblP4+jXkJGHIbm/gOanwu0EJnb5fLRtSSai
	scSyGCsQ286W10PqMMD8OtSC+XH49zSRqWtZPjej2oBuphDtomBm/mp1zBS/4ktIDvMkneAGApU
	yVQeGhWlFCK+Riu6aHhEitMA5cYb+RSSupRGs23HEip3+KanK1U3upbT00jg/Pybj6pcIplKTYG
	zyDEGRgU7zKg4yljvZWTDI9JCSzD9BSUGD82rUDFkuclz2uQp+m3+20qCc4TJ999tAJB9LRcgPE
	y8c08ip2iYKMSx+uiJYYTHIrIm89gieVbnNuL6sVdU3JcNropSDCuxK/TftM8ZfkC3YByzcnU6s
	MOIg6zbNFWDn/M0ReZS/XJdSrSnvRrYtIxNbDMDv7PlTylzP9g+FtIcsZ4yneSnPVmZLoiU6qC/
	eEz8Dp/ukAoIuNchyblbBTxjJVv0crppyVykvOdYMXe/DYCwRoRoPrNjtdKg==
X-Received: by 2002:a05:6a00:1f06:b0:83c:928:6e5a with SMTP id d2e1a72fcca58-84284e22fd8mr1087363b3a.13.1780449108782;
        Tue, 02 Jun 2026 18:11:48 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2401:4900:8899:fcac:9fd7:3b2f:a800:e88c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828fa877sm1081497b3a.51.2026.06.02.18.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 18:11:48 -0700 (PDT)
Date: Wed, 03 Jun 2026 06:41:43 +0530
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
To: rva333@protonmail.com,
 Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?ISO-8859-1?Q?Nuno_S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>
CC: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>,
 Roman Vivchar <rva333@protonmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/4=5D_iio=3A_adc=3A_mt6323-au?=
 =?US-ASCII?Q?xadc=3A_add_mt6323_PMIC_AUXADC_driver?=
User-Agent: Thunderbird for Android
In-Reply-To: <20260602-mt6323-adc-v1-2-68ec737508ee@protonmail.com>
References: <20260602-mt6323-adc-v1-0-68ec737508ee@protonmail.com> <20260602-mt6323-adc-v1-2-68ec737508ee@protonmail.com>
Message-ID: <1F6728A6-BD73-4159-AAC9-82370212EF04@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_181150_207320_FA1FFBDC 
X-CRM114-Status: GOOD (  10.64  )
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



On 2 June 2026 6:16:55=E2=80=AFpm IST, Roman Vivchar via B4 Relay <devnull=
+rva333=2Eprotonmail=2Ecom@kernel=2Eorg> wrote:
>From: Roman Vivchar <rva333@protonmail=2Ecom>
>
>The mt6323 AUXADC is a 15-bit ADC used for system monitoring=2E This driv=
er
>provides support for reading various channels including battery and
>charger voltages, battery and chip temperature, current sensing and
>accessory detection=2E
>
>Add a driver for the AUXADC found in the MediaTek mt6323 PMIC=2E
>
>Tested-by: Ben Grisdale <bengris32@protonmail=2Ech> # Amazon Echo Dot (2n=
d Generation)
>Signed-off-by: Roman Vivchar <rva333@protonmail=2Ecom>
Hi Roman,
Thank you for the patch=2E
>---
> MAINTAINERS                     |   8 ++
> drivers/iio/adc/Kconfig         |  11 ++
> drivers/iio/adc/Makefile        |   1 +
> drivers/iio/adc/mt6323-auxadc=2Ec | 299 ++++++++++++++++++++++++++++++++=
++++++++
> 4 files changed, 319 insertions(+)
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index d1cc0e12fe1f=2E=2Ec9ad2417a3ef 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -16256,6 +16256,14 @@ S:	Maintained
> F:	Documentation/devicetree/bindings/mmc/mtk-sd=2Eyaml
> F:	drivers/mmc/host/mtk-sd=2Ec
>=20
>+MEDIATEK MT6323 PMIC AUXADC DRIVER
>+M:	Roman Vivchar <rva333@protonmail=2Ecom>
>+L:	linux-iio@vger=2Ekernel=2Eorg

No need to add explicit iio list for driver=2E
Top level entry covers this driver=2E

>+L:	linux-mediatek@lists=2Einfradead=2Eorg (moderated for non-subscribers=
)
>+S:	Maintained
>+F:	drivers/iio/adc/mt6323-auxadc=2Ec
>+F:	include/dt-bindings/iio/adc/mediatek,mt6323-auxadc=2Eh
>+
> MEDIATEK MT6735 CLOCK & RESET DRIVERS
> M:	Yassine Oudjana <y=2Eoudjana@protonmail=2Ecom>
> L:	linux-clk@vger=2Ekernel=2Eorg
=2E=2E=2E
Thanks, Sanjay
>+MODULE_DESCRIPTION("MediaTek MT6323 PMIC AUXADC Driver");
>

