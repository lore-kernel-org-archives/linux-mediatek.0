Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A20C4452B
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 09:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wB31opfSJxQGOyhrpE5g1SMhfmWmHTES3FuDZOGSPA=; b=M/Fu9EO2YtIOtgkA4d8Dugxw7G
	nMVPH25+4FK5AFd6hImMJu5iPjJCy+5UNBCFKEE/Z7tBFR0gctTW1Drg9+kCcXINgIO+ZoNXuLUHm
	KfmziNebupKWLWEav9bM4bxHZIGwPF08CbjEBlR/8NJ+tz628yrbJpwIi7ulCjqCYOtlEALNY5dh8
	1muwuG6EdD6RdQJDFygpHZX4N68h6CwEaV/7Yx8rExo0tSKfkYTDzKTo3ZTo2sMMv3gwYNIQ1N+pM
	ZxZa43j1Zs2sOKdkZtjznngwCKLHlZPkQfSkBo+lkST0LYMA/6I9QBkjK/lhvEQu3aKtY8SMctGzb
	X+ZRokYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6Te-00000008vdx-2Tfu;
	Tue, 21 Jul 2026 09:09:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6Td-00000008vdQ-3nvW
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 09:09:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A873143B10
	for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 09:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880481F0155F
	for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 09:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784624965;
	bh=4wB31opfSJxQGOyhrpE5g1SMhfmWmHTES3FuDZOGSPA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=IC701rNZje+dgfTqbLnJ30zaA30NDt/Xo4YfQs5LzmrHX9HZyeYyKzyUX2HvEPF97
	 1u4VvvvWC38WaQa274nSGTyUrcyKsap2cHKcgCYFePScep8erTz1dw5qfrFDKomFZn
	 dxFq+CVi3oKPHbY7xwFOFO38JVrztihw1pXlx7pbJOzO035qZw8vWmiYdourkFBo0U
	 okYvfFTI0oetvbPPM+HdJfbKD8rfTpQplzEcPEEF6w0l4wzzNgOjYGxRifx3uNrh1B
	 l1zWF7sG1v2LTDfKq78JBivVrcm9XKWD+bI1GzHNk3frZd6RQelOQNwbDInWQy+Fsr
	 SkkgFzrv/BznQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b15dcaca31so7961981e87.0
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 02:09:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpuzzEU0CZ20T48FZ+cCWCcM+Hxrpvi9jRYmgdMZVyIiw4TFfE1+D1nB8BB1U6nQojTgg1CrSMdOguyoeBzyw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUMa6kkOzYLxA2Mm9Fk3+pTh2zg+ShEGwcehlabHZ7/6tdz5Sg
	2EZPT2P8hPGj1nC+aCUbNDPEeyF1sqzX87+/i3c5OK66x13TT9cAd7cvt0u2YmoIPLDMhhsr2r3
	tIz3D+abuyiuqS0JGJYLAdckfnI4HIOT781c2/4bIIw==
X-Received: by 2002:ac2:4846:0:b0:5b2:8ad7:93b7 with SMTP id
 2adb3069b0e04-5b28fabf50cmr2774646e87.53.1784624964271; Tue, 21 Jul 2026
 02:09:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 02:09:22 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 02:09:22 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260721065413.2306137-16-wenst@chromium.org>
MIME-Version: 1.0
References: <20260721065413.2306137-1-wenst@chromium.org> <20260721065413.2306137-16-wenst@chromium.org>
Date: Tue, 21 Jul 2026 02:09:22 -0700
X-Gmail-Original-Message-ID: <CAMRc=MedLNu+xzDW=L6_EhVMQphkWEp020HC9hpmDcueN1R6_Q@mail.gmail.com>
X-Gm-Features: AUfX_mx6IxoN9pFtIb0B19rivB9mMh-kCXBeeOUX0vuwCx66Zlnj8MCY6QcZGPk
Message-ID: <CAMRc=MedLNu+xzDW=L6_EhVMQphkWEp020HC9hpmDcueN1R6_Q@mail.gmail.com>
Subject: Re: [PATCH v6 15/16] arm64: dts: mediatek: mt8195-cherry: Add M.2
 E-key slot
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
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

On Tue, 21 Jul 2026 08:54:10 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> The Mt8195 Cherry design features an M.2 E-key slot for WiFi/BT combo
> cards. Only PCIe and USB are wired from the SoC to the slot, along with
> some auxiliary signals.
>
> Add the proper representation for it, replacing the PCIe wifi node and
> vpcie3v3-supply property under the PCIe controller, and the vbus-supply
> property under the xhci3 node.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

