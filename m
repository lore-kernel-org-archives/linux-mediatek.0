Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3431C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 14:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uk1paIY8euqKKlETQZ8oULEMJ7HstW0bVetbSs+wtjk=; b=FcXszQQRLlO8ecAdZl5QuqRgM0
	C10U2f/+h9UBeywm5zPIU9kkoom71LBgBD1n4NtZTAycvdM29v45jCtphxjXVTnSV2kyBrMm98saQ
	uAnM6UL1DoXSWNLqcIVU/KyZB4+RYm6aju/la16daHkyu8o2L2w8on22jXXBMDvh7LZVGruFyNILI
	GZHhVcUE/53v8vcVM6jCLb1NTDi4tgHao7zx0gFI2d6gGak335tJjk2L+Rx7Gt2h9UbcH2w8+ONnQ
	7N1btJyyJEcdZIenxKyc9yaRWMcXmI3us7CI8ZY4On7iKJroCtww3NLMcXIaPwyk3l/8yQLvJ0pZT
	bM7cNgmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whplz-00000002ll3-0N1S;
	Thu, 09 Jul 2026 14:30:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whplx-00000002lir-3Qr9
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 14:30:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E9B7D414C1
	for <linux-mediatek@lists.infradead.org>; Thu,  9 Jul 2026 14:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D076C1F0155A
	for <linux-mediatek@lists.infradead.org>; Thu,  9 Jul 2026 14:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783607440;
	bh=Uk1paIY8euqKKlETQZ8oULEMJ7HstW0bVetbSs+wtjk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=RPN0dW6PuazA0DKoZ2ps2OmJJ3t8w5Z4d769XH0gGOekHGK+UzxclezCPCuebxz0R
	 bMiCG7stnBWSKK4KUw/HHvytQteBYxb+DQedgiF5NOEq6xYCQGMoMr6OQ6NunZSUj3
	 gFsFhFyPU5SmiSGn1//yco5O2nFhuWD9OB73iL+0vl7qWkOcly5jCzj2aYNKbxUes4
	 DFuEg/5c3MgF0iAnb9feN4f+m3Pdd3yHZRP6C+15w4+uew5Vd7hj9VcqvuRYoG55t7
	 oUXGEPZouC4ZQ26OQFMOeB/ZIRmXJwSRzWJ4QVdO8UrF3KX8I95kFTNqSv4NjKxBrN
	 y39JW28REyEXg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b011edaf7dso907090e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 07:30:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpCB9TnncGyNS+y+uH+pdZJwObMORcO7xMRvcKCftR87oAaWjzLdYBIHYrvAL/Pg9dOTkLsrVvCr//bpzoaWA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe0a0sqbmwhOwycSPtVqnUgfBzKfS7eUoDWfhje8Q3YLYbrAd8
	/DRacM2tG8bejyy5eGGKpsOH1mwmD+1sAdpL0kDCoicIbBSu40AX+JbywBz08Ued2rhqfNpLRVl
	EmC1sujr0wJ2kaItbypPftEGgIMCyxZvfkPvWaHVJaw==
X-Received: by 2002:a05:6512:1415:b0:5ae:b88c:3ff2 with SMTP id
 2adb3069b0e04-5b0114afdadmr1759669e87.51.1783607439457; Thu, 09 Jul 2026
 07:30:39 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 07:30:36 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 07:30:36 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260709095726.704448-7-wenst@chromium.org>
MIME-Version: 1.0
References: <20260709095726.704448-1-wenst@chromium.org> <20260709095726.704448-7-wenst@chromium.org>
Date: Thu, 9 Jul 2026 07:30:36 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mfx1qoHWs08xOqNzmp3+RroPXQF1ps0Q_bu+17DWz0eWw@mail.gmail.com>
X-Gm-Features: AVVi8CcTCqwQAcyQVn3vmM3d_PiKCDTxzoT6aStAZSp__o8inJgUu4b7eftjDFw
Message-ID: <CAMRc=Mfx1qoHWs08xOqNzmp3+RroPXQF1ps0Q_bu+17DWz0eWw@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] usb: core: Move struct usb_port and related APIs
 to port.h
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

On Thu, 9 Jul 2026 11:57:11 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> |struct usb_port| and its matching container_of() macro should live in
> its own port.h, matching the split we have for .c files.
>
> Move them as described. Also move usb_port_is_power_on(), since in the
> next change its |struct usb_hub *| parameter will be changed to
> |struct usb_port *|, and becomes a non-static function that only
> references |struct usb_port|.
>
> port.h is only included from hub.h, as a subsequent patch will directly
> use fields from |struct usb_port| in a static inline helper in hub.h.
> The USB internal headers don't have header guards to help with this.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

