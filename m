Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B44CA101F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Sep 2025 12:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqb2CRdPlux5KWE2mtyji+dOVZljfEIfjqoSGnBGH1E=; b=vuprUnqbjZeeJgwgzu0IZExM4I
	0umdaRSVv2v9bL5WJv+3F+aRq7K7gijrfJDjKRYJrrlFpMCPLakbyVGjcpBvvDWPkVNV00v2flEyb
	SjBrbpBGyMTHnvcuAM+SDsim0hlAWmcBdGyN6mCluOfL+39C7mq8eNvEVWThjo6XHB02CkRbFXhiu
	zFrmIgCrI/bQfxum9KdphiCgQbizmmLnN+abi0//FwK0W+kpw6cTwm39ByQgjIU2MMU41rOboH9BC
	VNh5+nPBez5p/ig/S8U2JrfODhz5vECeb8fOK+lw3cpwPZ5IcXMbdQ7qKqQuW9A3d1Xt4Ala7ZP0J
	QwEpD81A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2il-00000009AxB-3eGl;
	Fri, 12 Sep 2025 12:17:43 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2ij-00000009AvX-1JCr
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Sep 2025 12:17:42 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-24cb39fbd90so16073545ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Sep 2025 05:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757679460; x=1758284260; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqb2CRdPlux5KWE2mtyji+dOVZljfEIfjqoSGnBGH1E=;
        b=cgVz16GcL9f2aBsFMf+itSiZb3ni/8QHHbnmOVKzE/qJo2TjEUdCrKE6IixC5ZJPGd
         gLYSLwoJt7vU+V5vSOHIpRyVIg7GoNWtBeLjBmhOcYquEZW9ltFNrT3h1ovD2z32XwJ0
         XXXXC+ZZGgEhy+bXjioy0iOvJjTKvVYPQkLD89TlAQKznbZpEbMcpjRxRGKqIOJCtExR
         rwp8QQuR/avv0RY/ZtnWoYT2MqeYgj6Zvb7ULBSQCYWhpAEo+rraO+pdpmRk9Myd0ZQc
         /ssjz09N8GLtFcDQjz7k8qx7cuSqwscTXjVeV57oJi44KFYeDzAl5rNIvKQ9weSOg53N
         cN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757679460; x=1758284260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqb2CRdPlux5KWE2mtyji+dOVZljfEIfjqoSGnBGH1E=;
        b=GuyCIkXV1YuvqXVdCVmfr98GYe9WTGmbRU4fVgC/W1TNkpi0G/vbFn3Qio3wIfVRDC
         YReCSvUTf0fjNGifQvONnFU7l0LxD7pSn0iR0qEmyREssc5JG/dce9WXK+GQV6VqlcnP
         3qva/ud/yT9yYBX6mufnsC86727XlC8kl2ly2j4+8Ghmc/LNRL6aVy+wz5nKYd5ZQf8L
         /W3kDIOrh+F+UKXiu3J8W/tFjs7w0sAXwJ2Me5NS+n2HZqYzjFmwA0MW/AD3kBinuIxE
         NJ3v3qFfYWDw9Qz64aaewysWhjnv2r883wakLgiz3DsjZ1F8Smxb2StsjXUybfC37v0S
         oOhg==
X-Forwarded-Encrypted: i=1; AJvYcCXOQhKytoRVFr+uq6DwzjQQ2uA3kbWBPuJuMBiBuCcHTYXcGYwoZIQhQo7DLg0WnaxO15szS89w2rARkmPjyw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6eoa7MbxzNQr07WISszHi2UEf00w390L12K82V/3w+XORl5UK
	5zKAKtb87E22UliRZVnGj5LkPdi5NFjg1fmoKUnzDP0EpiDo4MDs/902jo1DDKwaWTOtqfofP75
	aEE76U+cPYc7X+tTVO40s+hh6ynz8ur4=
X-Gm-Gg: ASbGnctV/SPjeKSpL08onniqat4bBzS7OV5CGY3V2M7bAK6hsdz7UeNWFY73NNevCqH
	EA3IaaGll+qnNyrM/ckNnOcMGeDF3hKyBaE9goREVP+r0Py8t3eOlwL8wby3bSkc4E2NoYumFBL
	/Mp59UqqhKmiaWuO0uM0UZ2E2woe0h5/lu5t40n1mByB/P+WjvYwWYYp+1+O/wKjQYtXCJBIxW9
	TU83Q==
X-Google-Smtp-Source: AGHT+IFwtZ97HGjsQnwDLaSscYiXyUyWaZRXiTzaM5M046FWDXCWxB8k2YOnMd3VJ+Y3cvmtimQrX/EgHhgmJ4CE7Ho=
X-Received: by 2002:a17:903:1207:b0:24e:7a4a:ec59 with SMTP id
 d9443c01a7336-25d25678b88mr27471845ad.22.1757679460088; Fri, 12 Sep 2025
 05:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org> <20250909-gpio-mmio-gpio-conv-part4-v1-8-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-8-9f723dc3524a@linaro.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 12 Sep 2025 11:49:01 +0200
X-Gm-Features: Ac12FXy3daR3VOEp5n6tNwKkhCq--fDPiLYS4w-Toaa60ZTGN2VkMzc0b_ryiUA
Message-ID: <CAMhs-H-1VrKiknwoukGY2i0ox2VNd=pmFrMcR50mn7tEZ0pZ5w@mail.gmail.com>
Subject: Re: [PATCH 08/15] gpio: mt7621: use new generic GPIO chip API
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
X-CRM114-CacheID: sfid-20250912_051741_344045_416AF23E 
X-CRM114-Status: GOOD (  10.43  )
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

On Tue, Sep 9, 2025 at 11:50=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-mt7621.c | 51 +++++++++++++++++++++++++++++-----------=
------
>  1 file changed, 32 insertions(+), 19 deletions(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Best regards,
    Sergio Paracuellos

