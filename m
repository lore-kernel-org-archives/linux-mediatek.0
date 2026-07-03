Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DC8C43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 12:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZW1+Rwj2Zkkg4xFxLw7inao2NDBuiKLZLReMOE1kdHk=; b=FWTAQ0ZmLFj8C3D7Y4ajCSawc5
	xuoVZ+FNesYbK8x70qamMbwsTQVC6hS2b3tnSqM7jX+DkPcnFUeO2QVS0iaubbnN9zGd6l1bRbPmK
	JtDbxSIvs/51aJEzL2kTo1g7MHGeqDHvY6cIylORPOr+ZzvdHEKkAOwszXTxjrJHFB9zXSJzbDC1H
	WRoFPU36udMhEYXaP0lLOOm9j88Yzw6DWj9hWF9zMZezjg1eztJcRk3u+W/Vou7lip/5nRhJU96Gb
	jqwLsFdq4gTNLTGE8cW2XAK+5r/N8+5PDapHXxlh0NOs2vlPpDuH48a+aw7QYqxzmii2BiUOpgT3s
	kloCTABA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfclM-00000006uaJ-2Pfl;
	Fri, 03 Jul 2026 12:12:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfclL-00000006uZz-2BXN
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 12:12:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3168B40E3E
	for <linux-mediatek@lists.infradead.org>; Fri,  3 Jul 2026 12:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136861F00A3A
	for <linux-mediatek@lists.infradead.org>; Fri,  3 Jul 2026 12:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783080775;
	bh=ZW1+Rwj2Zkkg4xFxLw7inao2NDBuiKLZLReMOE1kdHk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=V13+C1TO7e0BLup6/ZXRFCVqSB8pr91oUvp+sZqGgDu6dy35z5ppYNo0lSuhKJf1f
	 vWZ5VzzvMkh6hoWyk1wdjkd//bAC1zhiP0ugdLwRvhYzJAIbRnGx1D76pMjOdo1k09
	 1ZUqjXfwW0JozzdJ4gTapT02eIULAj+Q0nw4EIDW+B5+ZavUQA7EZwi3FFbE8D5gOz
	 D3D8CInjn2ciHTHbs6DLk5Zl+AWG5YXG4gR3X2WSFDVsNqohzwWXIqSer0SUApbXqU
	 zlj2Ddp1yY39dCBH8RwqN4GhbP9u5/BPm7Xdp6VcIqfcI6DZaRLauZombNCO7ssslT
	 hMOavJL5+escg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb77b3afbso528000e87.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 05:12:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro9pNtuog2Fs6uXTYQwIsa1kyGo+d7LOfSdJx9YBzLI/opIy5sdOXTISzU1BBoyHiaeTo9W7+M0xZ4XwlmBlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFghN8ESohMrO9DubqFCwn79TEC7suje+FNPNwCTby1hdkvkeo
	cI5USTjeGLpF6YnoUrL/dixc0aJ2vOARLgI7EGO3BEGhZrDT19l5pnHl1WA9uszOdJyqOrPjK3O
	3rmGgFeIbAkJG4E3I/dvKkcxWa9/LPGecW9xFgs8PJw==
X-Received: by 2002:a05:6512:6383:b0:5ae:a702:6528 with SMTP id
 2adb3069b0e04-5aec67ac494mr2230940e87.26.1783080773854; Fri, 03 Jul 2026
 05:12:53 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 07:12:52 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 07:12:52 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260703110317.1283411-8-wenst@chromium.org>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-8-wenst@chromium.org>
Date: Fri, 3 Jul 2026 07:12:52 -0500
X-Gmail-Original-Message-ID: <CAMRc=McpxD325uVPO5NNZ=47DQgCBrD+uTOKUzoHTgbkPhqtiA@mail.gmail.com>
X-Gm-Features: AVVi8CftwarX-Z8K0VV5KkzRZ0nUoORfEc2vkRQt3p7UOG6R8Lwo7yu86B3HXFw
Message-ID: <CAMRc=McpxD325uVPO5NNZ=47DQgCBrD+uTOKUzoHTgbkPhqtiA@mail.gmail.com>
Subject: Re: [PATCH v3 07/13] usb: hub: Use usb_hub_set_port_power() to
 control port power everywhere
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>
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

On Fri, 3 Jul 2026 13:03:08 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> There are still some instances in the USB hub driver where port power is
> directly controlled by toggling the USB_PORT_FEAT_POWER feature flag.
>
> Switch these instances over to usb_hub_set_port_power() so that only one
> unified function to do this exists. This makes adding external power
> control with the power sequencing API easier and consistently applied.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

