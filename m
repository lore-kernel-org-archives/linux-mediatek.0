Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B532C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 14:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3Mw8q4Nno0demwxgT9owXxN/qKewUThoyTmm2QW7F8=; b=CBR0Yrzjya2YUwqzF831LDPag8
	Di7KiL5yZ97GKmZF18JkvV35RzZg09Mf4JonrxFauq2aSqbLqpXVTmg3Y6sIh8ItzVWhcseDcCrFI
	ba/Xn9ZUiGNtdMhCQPqVs6RiPGA5wfYmJ/3xD2sHrcAnYKM4kfnz6p2wmyIBDAfTFoe8Hch5KhuOL
	ik7MSrsI2TvyDKQDtTb5KjzdyERfd2aPnUImGlcwN7wtrwHlA9w8G4EjUzq6yvY5Dv2RK0Nm42PHf
	HftTBSOoiuyx8Q2qHQB51UileGOvrvge2NcBkMEBkkIscIJujUP+RCrOvhMiH6PFCjCjto4FybKdj
	gHfJAVWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpmV-00000002m6K-2j8G;
	Thu, 09 Jul 2026 14:31:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpmV-00000002m5l-08ZZ
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 14:31:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BF8074348A
	for <linux-mediatek@lists.infradead.org>; Thu,  9 Jul 2026 14:31:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA661F00ACF
	for <linux-mediatek@lists.infradead.org>; Thu,  9 Jul 2026 14:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783607474;
	bh=C3Mw8q4Nno0demwxgT9owXxN/qKewUThoyTmm2QW7F8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=iLOZIDO+lyJhwkH2hmjAysd5QarjwYBTfZcs4s5flnO8wkm4BzWLLE6+SqDT375Zt
	 mhcwPGTRdwFWbcfcFDqrD2SR6x4e328QZ/GdjwL1UQpjIG1MIRvmJ8qjtCQS020ukY
	 DIKnWCJsybahgCObHZPqid4wiSalS1g2MIbJd5J7HRWhlG81Y1DO7eale792kvHxAX
	 n9QGRG8VUpEsOlL7/JRTX6seju7rdberuvBc1xzyb4mvLC8jxCeUydDD5+6I1HC+yI
	 jWyGyAIWRJU2ZYlE9joTS9K5JXltFrnwGmqkMfX1bL/gof401wvHNwu5QE3z6XpDzI
	 bV2kCg4wjnO6g==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39c8dbf4f38so6024841fa.3
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 07:31:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rofv4gSOxCr4BmYuakCZ3mo4QJXxsvC8mZAcMJZiMfOxObTF3PIhj0B1ZS82XDfeOn+M9koLh5DhCcSEIO0zg==@lists.infradead.org
X-Gm-Message-State: AOJu0YysX0wpcwI8/iIyMfnDj5mz4SfPtY2AN0oCCbHsxY9AqX9IpzUQ
	0v2ABM/no4u+BjiStnOYVtQo7mgR79E6rvN3mHfP/AIA3wwuxXKMwO3A+I7LWpzwOxDAkQ/6K80
	n0om4QYHLf+sag4t+Nx+9Ec9Oh20ebD9b7d6ERBBsBQ==
X-Received: by 2002:a2e:a912:0:b0:39c:6ea4:f0a1 with SMTP id
 38308e7fff4ca-39c799c85e2mr15206641fa.26.1783607473388; Thu, 09 Jul 2026
 07:31:13 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 07:31:11 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 07:31:10 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260709095726.704448-11-wenst@chromium.org>
MIME-Version: 1.0
References: <20260709095726.704448-1-wenst@chromium.org> <20260709095726.704448-11-wenst@chromium.org>
Date: Thu, 9 Jul 2026 07:31:10 -0700
X-Gmail-Original-Message-ID: <CAMRc=McZNHswz2E8-0-XKpUwrzw4vNooGrYe893hWe6_Fk72yA@mail.gmail.com>
X-Gm-Features: AVVi8CeE1ugyeFFTvSY6q0TqTEjoKIk_A1SAmSoXfKQhtfuqHopW23IvHHyz7SA
Message-ID: <CAMRc=McZNHswz2E8-0-XKpUwrzw4vNooGrYe893hWe6_Fk72yA@mail.gmail.com>
Subject: Re: [PATCH v4 10/14] dt-bindings: usb: mediatek,mtk-xhci: Switch to
 ports for USB connections
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 9 Jul 2026 11:57:15 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.
>
> MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
> and USB 3.x Super Speed (SS). The block can also be synthesized with
> either HS-only capability or HS+SS capability. The SSUSB controller
> handles the device or gadget mode. Saying that SSUSB handles the HS
> portion is wrong.
>
> For example, on the MT8195, the first two instances support both HS and
> SS, while the latter two instances support only HS.
>
> Switch to a "ports" sub-node for describing USB connections. Port 1 is
> Super Speed if the controller is SS-capable, otherwise it is High Speed.
> Port 2 is High Speed if SS-capable. This port mapping scheme directly
> matches what the hardware returns in its capability registers.
>
> Fixes: 454a1e3cd36c ("dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP")
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

