Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD7BC54798
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Feb 2024 11:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXq9gtaixlPPlxeYNVBBekla+96XUpC/xgFnv8Gi6Og=; b=EduM67XLQoK1g0Vn3jD7rADHHE
	smLLPcE9j4Smv5hFLFyMLe9zpzf5cuxCpFDDx7ydFNdcBagwsnXDJagllH0Iz7K9C/+ySNySFYfZc
	hztlDhrpEWmWdDaHO3d80lnVS7M3Znl4eNP/mK+Zkhtuqbjyp7OXR3a1Y2fCEWQRLTeLsBColROTJ
	hOYl+Pv722ZV3Rdu85C8lNRe8p/Q8KBrvEcVES7J9fRfq14vEGQS1CvD5T1BfityBTHlWXJjM7WZJ
	HYAXAhOpgeFviOEGX9c2fEIdxi4INtUzfYYNCRvU/VfaRbXTJY++xdZtHk/KRTbUbTJkvRe9FeZHZ
	cVS+bQ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdTgM-000000096Sb-0kgD;
	Fri, 23 Feb 2024 11:25:34 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdTfw-000000096Pq-1Uwm
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Feb 2024 11:25:11 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-218642337c9so68998fac.3
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Feb 2024 03:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708687506; x=1709292306; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXq9gtaixlPPlxeYNVBBekla+96XUpC/xgFnv8Gi6Og=;
        b=aUslCvR5rCel3B/RJg5qEA5YbTs46dItVR3HQGQIYAcPoMhbEsz04nIIjJ/js5hM3H
         zwxQFvnZbrSlpiqysyTZqXhYYTqzOBw/77fmdvYm+hUywtzFuYQc+mVRMJr1b3iugHHm
         6jugEft4Y8eI5jID430vObJTBLPB8QrkghV94DbO1nLX85hXIdQ3jE+WpTokDOaxzwX/
         sIdlE82jfYPNFqzTxvMPA3Eau0d9YBSH1QSIGf5B7fprkRcTrtwMmpBtlbvXLvjlutSf
         OZ1bI0CBFeYhoUvmlObg61qr72GCZL7UPLR+I6muw1L4hZQixASd8t9rxfBBpML4eai4
         kSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708687506; x=1709292306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXq9gtaixlPPlxeYNVBBekla+96XUpC/xgFnv8Gi6Og=;
        b=GatPPJ0c/ymh1ehWJ9mSSWVxYW/QPla2Qi9nPhIWbicoxsu2ykSTBV7SWSlHwQDwe0
         /ekTP2Ydw5H8sc9uyQaQr6RcRTzqyeQ8rNuW30YR9iqKf6QMdNeaA1LWbIn4EJ9HR2/J
         Yuqv7CCbaAlaQ+98nFlvhWgyWJT7gYGp4pHjlRhYOhUb3z/NwdOE63mFdZmbDgotideK
         zWHWa/vP4B6ll9gcZ1bWFmtKrkkg3KQJeJVIPW99k3KoC/UAdxyGFLIVsMYS+eiTAMxH
         32bjra3ovz5c2A71EeQcAx24NdcNYoESCIyQ9ISPUQJpToPO8/bHCDTwEmL6EVVF9+63
         +HEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8B1YUA7Y5rvtKf8EruymSCZv2gYk8GGSer9IJM+JPPECwZFhxN4d+MSVs9zofodgwmV1Q5nCSwAC2zCMRCw2Fy5IaMNBHr+lfgyz+6gqci4L/
X-Gm-Message-State: AOJu0YzDJGbgXYx+8pyNb7GtbIwyWFyMKW7OWKwJqfliUXs8p+ZXcxwk
	VcO0wJWS/UnI6aCGv1vuHCnWugy3qPgkKOz8Vc1f5K8YNrlQI3XizaQFxr2EnQsiKZa58Xg4J3Q
	gRc8+yXOe2kxsxKUbT/RXh5PpAlc=
X-Google-Smtp-Source: AGHT+IELKXL4lOnAECyKeuiwWmv2laqK/6mYRv/GITMbekabCwned9k99ADdDnL7P79u0FjEkWClvyPmjwEwJSjFZJc=
X-Received: by 2002:a05:6870:8087:b0:21e:673f:96cc with SMTP id
 q7-20020a056870808700b0021e673f96ccmr1747204oab.51.1708687506353; Fri, 23 Feb
 2024 03:25:06 -0800 (PST)
MIME-Version: 1.0
References: <20240111082704.2259450-1-sergio.paracuellos@gmail.com>
In-Reply-To: <20240111082704.2259450-1-sergio.paracuellos@gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 23 Feb 2024 12:24:54 +0100
Message-ID: <CAMhs-H-Nab+NAcdZ4+VoiikzXgDH55USREhYA6=6xd6ac_OCww@mail.gmail.com>
Subject: Re: [PATCH] PCI: mt7621: Fix possible string truncation in snprintf
To: linux-pci@vger.kernel.org
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_032508_519406_CD70803F 
X-CRM114-Status: GOOD (  15.32  )
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

On Thu, Jan 11, 2024 at 9:27=E2=80=AFAM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> The following warning appears when driver is compiled with W=3D1.
>
> CC      drivers/pci/controller/pcie-mt7621.o
> drivers/pci/controller/pcie-mt7621.c: In function =E2=80=98mt7621_pcie_pr=
obe=E2=80=99:
> drivers/pci/controller/pcie-mt7621.c:228:49: error: =E2=80=98snprintf=E2=
=80=99 output may
> be truncated before the last format character [-Werror=3Dformat-truncatio=
n=3D]
> 228 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
>     |                                                 ^
> drivers/pci/controller/pcie-mt7621.c:228:9: note: =E2=80=98snprintf=E2=80=
=99 output between
> 10 and 11 bytes into a destination of size 10
> 228 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
>     |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Clean this up increasing destination buffer one byte.
>
> Reported-by: Bjorn Helgaas <helgaas@kernel.org>
> Closes: https://lore.kernel.org/linux-pci/20240110212302.GA2123146@bhelga=
as/T/#t
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  drivers/pci/controller/pcie-mt7621.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controlle=
r/pcie-mt7621.c
> index 79e225edb42a..d97b956e6e57 100644
> --- a/drivers/pci/controller/pcie-mt7621.c
> +++ b/drivers/pci/controller/pcie-mt7621.c
> @@ -202,7 +202,7 @@ static int mt7621_pcie_parse_port(struct mt7621_pcie =
*pcie,
>         struct mt7621_pcie_port *port;
>         struct device *dev =3D pcie->dev;
>         struct platform_device *pdev =3D to_platform_device(dev);
> -       char name[10];
> +       char name[11];
>         int err;
>
>         port =3D devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> --
> 2.25.1
>

Gentle ping on this patch :)

Thanks,
    Sergio Paracuellos

