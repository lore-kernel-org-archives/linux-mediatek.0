Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60717E7717D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 08:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XskHzUQ0wP3xisQAsDVTIVaMiwmap3TuSXWv2UwOOoE=; b=qLWZtLGl2X+u0v8X9tfLldmJty
	SIHCGBjflFZzKmZqYhbq80Zp55W5Vq4fC18gRq3U5BY+hdwfSUMm32HQ/GpFH6F/gkNc+if42va1u
	pueLqHszhfxhtJ9HWMIHW/YXuCVGgYYHY+aFfzGCadrtqM+ghkGpWxgGN/7TmmxcreeK2WHSHkUHG
	CXQDzdrxQRDvitkuzlANwCHdM+lfhn/35RhZU4V1IQdx2AVoFKcSy421nu3UkEaXwleeh+GjCi2SO
	yYyGss+k5bJiwNzn5DMsLRXprOVIuPJ7b0FoguYigZZtAtvqt+P+k9KJyeJQ1m6PfW4QUtiGxHRbg
	h96h0z+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLHvW-0000000ECIB-1ylI;
	Wed, 11 Dec 2024 08:18:34 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLHvT-0000000ECHN-0VjS
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 08:18:32 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-30227c56b11so25514851fa.3
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Dec 2024 00:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733905108; x=1734509908; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XskHzUQ0wP3xisQAsDVTIVaMiwmap3TuSXWv2UwOOoE=;
        b=GRz7gHA1pQvDu0Vacbcq9hQ+AWYpUYKp+9bGQMQrsrjcsiXNkSCwyB/E0cDTn6G91/
         W5EbKFvLfMVjr/2XEMSWyZXPupKuG57G0e0wtZ7GmZMs4aPy+ccS6+LIuPlwP3sa/oHA
         MGLlnNkWxnA/M3Oeyu+WeiPZ4nXoP1bddXoOdhmMOftv/kKY1+ZV5Q947IUHwpmbbXRk
         D2aKeNOf/LyAbeMwnuHZwPcscdiMDLsm7ha6u26eqkKEJiHMDfq+4GmKYojU0JYipeYf
         ZJDJWVMdEvLSchjHcXqr0rcSFgPKd9aQzThOOlsbUJbXwHeQ0ALVO3NKtIBaDVInBJUB
         c43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733905108; x=1734509908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XskHzUQ0wP3xisQAsDVTIVaMiwmap3TuSXWv2UwOOoE=;
        b=QzJgQZVh8LxIb3fcUQW7FNzfYH560Fnawt50iXV8GSgMAN5DHeigvs3OP+a2Bjc8wO
         j3bjwxr7cibloJNn/sBJ/yxL3VsrkwLei4xuZIDSIbnyZdNt3kkgYUiAbiglcoKgTfhO
         aEORTBvM29pi4OAlqFcCHLMTsskijCL1lIIzFr+KLGmXRs6ecPULDC9sZnOGOkhDqzi4
         V7MI9pdSTIGdfkwLYWyigyl4DHVq50kxPpMEUgn5bVJmioRnyVe9w4VdZO0cACdSQfTA
         Df940H7T86mpjZiQ65GscaSRXdso+dgrG2IMmxvdpaA0y0S5w+yH1RMd0bI1A86L/RI4
         HtSw==
X-Forwarded-Encrypted: i=1; AJvYcCWM2HIjFhtQEHWzb0PK1hq8xTIa7nSXXwEgj8Qx/QUsWs9DjAT5/+u9+JYbKl6sTqUn6c9LYLiabj6nIdd0CA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4AGlshAhHb7Iwy1hBSh6v9kykhgkM9oFrrGJqfJJijDD+7j/V
	D4p9I2xGOU7drgOKGbQgpmm+Wum5Ghmc3l61GUWGODJ8NOaM2OvqXGWM9JP0PnxHdjuK7ElfFey
	3fmeKoIDIu9Fjepc4CvpxmAnnJLPeN4+y/nC/kg==
X-Gm-Gg: ASbGncvz6a4wz4tC8E7BgitFH2A0VBZwLmEVMReVVBJuohuamfSqdbx1OgvSj8ZIDsT
	z731HpaxINeRTCjeDyb1+2xlAmUPRJfXhAHxWJHF5xXv8ftFMdMcpSqUzSBROGiELX+0=
X-Google-Smtp-Source: AGHT+IEyqSnEBMMtZyEj5jF6bo6/CxMQUAS8l/Vem+Q0Tg0zwJltPimb/BXxYNi4dNa8OIsM4j3xdj7bHzlce3zdJRY=
X-Received: by 2002:a2e:bcc6:0:b0:2ff:c95a:a067 with SMTP id
 38308e7fff4ca-30240d08829mr5734311fa.13.1733905108362; Wed, 11 Dec 2024
 00:18:28 -0800 (PST)
MIME-Version: 1.0
References: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com> <20241211-const_dfc_done-v4-8-583cc60329df@quicinc.com>
In-Reply-To: <20241211-const_dfc_done-v4-8-583cc60329df@quicinc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Dec 2024 09:18:17 +0100
Message-ID: <CAMRc=MdJuy9ghgLHxbygdHME2EkttZ7zBMJzCis=t94EUMbGiQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/11] gpio: sim: Remove gpio_sim_dev_match_fwnode()
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev, 
	linux-sound@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-gpio@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-serial@vger.kernel.org, netdev@vger.kernel.org, 
	Zijun Hu <quic_zijuhu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_001831_425820_4D321790 
X-CRM114-Status: UNSURE (   7.54  )
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

On Wed, Dec 11, 2024 at 1:10=E2=80=AFAM Zijun Hu <zijun_hu@icloud.com> wrot=
e:
>
> From: Zijun Hu <quic_zijuhu@quicinc.com>
>
> gpio_sim_dev_match_fwnode() is a simple wrapper of API
> device_match_fwnode().
>
> Remove the needless wrapper and use the API instead.
>
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

