Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8153C4451C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 09:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvM+G7VRk/YqTwwm/37jHxsh/YM0a3jwdT/iGpNt7ns=; b=o1wVLskXXj8F8nMmAoIMWlV9pp
	A6QNArQY5KStn/2VnH4Qogwhjkh+6Xmf9v60qyImYhGw5x9G/mRXZNdfpSmVCdFZ3T/wMM8nkp+Hd
	XreoAULmuD8Un6SEnRnF9C8KEe5iYX6a9HxpJeLgGkeH9WW53fQsTYKSAP3xYJMAjL40kCog7qYzE
	FB0lpLjkyVT4qM1FCh6yR32GKd384uihvSECZKz61njs0a/qMNtTxC0fexqpa5T4YrK8Cja7SHtnC
	dY2FAxFdxufjxqFrf0F7LsgWASnoULrbASAY4/JeyM2bKI8a8uKtVTmHUxIjgEGY3BjCI8ALFva0Y
	HIywlP3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6U3-00000008vqs-3ais;
	Tue, 21 Jul 2026 09:09:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6U2-00000008vqI-0Rkt
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 09:09:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D91D443B10
	for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 09:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD81E1F00ADE
	for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 09:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784624989;
	bh=uvM+G7VRk/YqTwwm/37jHxsh/YM0a3jwdT/iGpNt7ns=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=MVQO9e13QUrl1ydM9tLxQtUaLCsnbcAtu8NgunLGYE4inVyVPW19Oav9+VQRrvtqa
	 wmKELzHocua82VssA7btIuIuDdOSyzsdxQUjVe1815Zw/htwZXJ+yQtpe+a+6wt5wh
	 +4j1aVXPzGCBf7oD26cJMav8pl/WEdSZrXJuFV0Zy0Fg4XrpxIa68x5pQQNY8vbOon
	 2Jb4Om5yt/pVv3lweKK87+3r6/K0Ayn0C1tuO52khz0O+QvalM2yny3NEZ0hZ9HF7h
	 frdv1XoaboFv7IEsh69K3VaUb3f5IZL78qHP2sWT5Aq9Z3gHI3BUoRl6RBQJCedg/p
	 0FRgkMqlPYC1A==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c94d4fdb9so66642241fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 02:09:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqBoLY0eP9+wzB5Ml0vow8PObNR6fv9JlySxXickI8OabgGTHZrZKWrNz/WTJijH2+/b9is5cbzgaBt7b04jA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYQ0X628ovKopoKJr4RVfplqtxv2tptLAB/V9ZX6JJUrfUvFJZ
	fEDoRecPZEUV2i6kfJnPGxgy277n5gG/XlffKHykAIefwhKAp9bIw3hiUbtEbecAvp0k1jBuWM4
	rNdLjIGAjPucEkuASwtsbxquvD4e0Q10sskzhRpT63A==
X-Received: by 2002:a2e:b8c7:0:b0:394:8fc:8c3d with SMTP id
 38308e7fff4ca-39eb273c8e4mr29254061fa.4.1784624988499; Tue, 21 Jul 2026
 02:09:48 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 09:09:46 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 09:09:46 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260721065413.2306137-5-wenst@chromium.org>
MIME-Version: 1.0
References: <20260721065413.2306137-1-wenst@chromium.org> <20260721065413.2306137-5-wenst@chromium.org>
Date: Tue, 21 Jul 2026 09:09:46 +0000
X-Gmail-Original-Message-ID: <CAMRc=McBNjvJK-dMBgifFxtgw0-bM_jaMYwJOWCRnV1PTLt-2w@mail.gmail.com>
X-Gm-Features: AUfX_mwsGGPfxToi9CFWvHg8F0vayIDb1DET27lB_HvrcHXw8Ht65VkjHJmkwKw
Message-ID: <CAMRc=McBNjvJK-dMBgifFxtgw0-bM_jaMYwJOWCRnV1PTLt-2w@mail.gmail.com>
Subject: Re: [PATCH v6 04/16] usb: hub: Use assign_bit() in usb_hub_set_port_power()
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

On Tue, 21 Jul 2026 08:53:59 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> usb_hub_set_port_power() open-codes assign_bit(). Just use the
> assign_bit() macro instead. This makes subsequent additions to
> usb_hub_set_port_power() easier to read.
>
> This change does not introduce any functional changes.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

