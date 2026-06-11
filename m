Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2CDCD98C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2026 08:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IU3Izek11DlTn3+eMp02gjkvoPAVU9+fiOHobFbbBk=; b=VxvjWQat5ZPnOnmgeWP6kzk9ow
	yCCLn6Qn8bjkptskKvPbydDag1nd3lBPwy/bYMtTlVDTBoDRO5r7aDDhh0j9zRIe+yaWjND1mK+am
	1S7TnLMdb5ilVTVdxBhuITKhIckmygLtPU/S7GuxgCKtY6YWpZIz3/BdBjxdZsx7G1WmekOL1LslZ
	agSU3hPWb/219SLF75RJvBLG1ksaRg/A8pZfiADq436fwJf78E6GagHj9r3s5UhE3rnxDzHInel1u
	UmBnHMrHGn5WIvq/o+B8c1e8HjE/pEC11T3CNGAGm9EmHipYt7bQJdbtT7NbTz+iR7AvMcQI2D2Kt
	HbOJVFGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaZW-00000008ymU-3mCh;
	Thu, 11 Jun 2026 08:15:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaZU-00000008ym3-2ka9
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Jun 2026 08:15:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C1DC44635
	for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 08:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E101F0089C
	for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 08:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781165728;
	bh=3IU3Izek11DlTn3+eMp02gjkvoPAVU9+fiOHobFbbBk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Mxqvtf9GUyqLB3lebhuDlBkwWgHZy08FDeXuf05d2nQn97E0800e7lAuzgRyD78mg
	 FePUjbDskNKhPP1N1IaVGqD6MRETwfm3vAd7gFZ8mU4xFsGaoplZUdsr4XdASR6djR
	 TwX882i6gWvvPd2zKF4PlalfLQS4f6U8TUNc5XwGd3Zj50dw4iSP/t0pdktzcLMHmC
	 lbKUOd6DsEDOh7sc5WuAWXONKmaXej+t7Eez6qHdckhpATWLU/bocNlSfIHYhdXAjm
	 SJAaXzOhmwDttuDlFu9QH90ybomml41dYDu4BLJnOL/eJcagvXbtaqn1A4Sqcbt4f6
	 jzfZU+bhTvZfA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa68dbb38aso7490601e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 01:15:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+dxO2pYbg2DZyZawRAoGf05J6oxPQOMjP71kkov9ynM+kcIBBY1pbG17T1TFtjk8Cr26DyaiSDvHyFNQvbTw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYva2lojpySnt0RGguTBLgK/x1H3vHCcp2QEOAZizbNyhIaK3G
	LGdjDtJj3hZY4TiIlRiluJU51WRDsr6KYx51Bb5KHLvQbZxRO/EdiHb4U3yY2rWi9JVFiB6cMdS
	x1J1+XUCu0Iyq3/84gueHUXAGlDgs8WN54xGgQhwVaA==
X-Received: by 2002:a05:6512:220b:b0:5ad:a04:e62b with SMTP id
 2adb3069b0e04-5ad27cd1f4dmr556504e87.32.1781165726578; Thu, 11 Jun 2026
 01:15:26 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Jun 2026 04:15:24 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Jun 2026 04:15:24 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260610084053.2059858-2-wenst@chromium.org>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-2-wenst@chromium.org>
Date: Thu, 11 Jun 2026 04:15:24 -0400
X-Gmail-Original-Message-ID: <CAMRc=Me0zQYLLuiyYBOtD5quL_LeK_Zg+WoL0vzXDhjB5e+gzw@mail.gmail.com>
X-Gm-Features: AVVi8CebXQLKBQMIYKPsMbHoISglCZVr32F3LvdIki_eZQgsmFxJVcEwTR4qpYo
Message-ID: <CAMRc=Me0zQYLLuiyYBOtD5quL_LeK_Zg+WoL0vzXDhjB5e+gzw@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] device property: Add fwnode_graph_get_port_by_id()
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
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

On Wed, 10 Jun 2026 10:40:35 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> In some cases the driver needs a reference to the port firmware node.
> Once such case is the upcoming USB power sequencing integration. The
> USB hub port is tied to the corresponding port firmware node if it
> exists.
>
> Provide a helper for this.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

