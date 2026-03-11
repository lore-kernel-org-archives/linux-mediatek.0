Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3F4FD0653
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 08:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7aVyH8gC2iAwka4GOoRBYJZUC2V8UwKcglbeRFr/hv4=; b=I+nFXdytzdsfUZCZUS3ezFHYuv
	5TXsD3Q/ZLChnLgt2MqY4cHh8SuMFippJ6W4ay8XepdKu3QX5mbRpeHNbddKE4AaSFuC7bZ251dsw
	fp9jlU8bbwMe0ZwlbonzMBfiYadh9YNG7xBqnsVjPWPsbRdAGknMke3mep+2U/5KtB4q2Ev/pFaqH
	Ha2Z/AoqDcHEgVouswZLxiT2gfH44HV9MksGK+waqrB3+GcwDZSnfx8/i2SP2rasujTLjmdo6QCx6
	1Se3gY6sosJEAfCYAx10fCWAUIBZmjDdYw9sk8a0Id0lbPO/3sit4HrPrb3wszmNr7JR0536e6bZb
	irpfS0Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ElE-0000000B93t-3cc8;
	Wed, 11 Mar 2026 08:17:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ElD-0000000B93S-1Sxl
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 08:17:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 845856024D
	for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 08:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A643C2BC86
	for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 08:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773217062;
	bh=7aVyH8gC2iAwka4GOoRBYJZUC2V8UwKcglbeRFr/hv4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=D4WmvIdV70qZooUtYD0GQAKRaPHYl3y1t2MYESRk25Ah/gC+e8nh/iguEwOuKhjQw
	 cXlSdkZYsCS7YsCDWOw6zPdURHlDkIhJ52gTRuuwhifEX9lUM2YT49cjkhTOT5kUIQ
	 kxOlkASTpHvnlKK/GMBMri/vJIbFUQiBeq0290Wb9hfoaZmsPmuffz+r2VpJwgrI6X
	 Wij85BlIT/Bkt8v6s29m1VWnOVLN/OnvBKUBRCiRVfMPw1hS/CACQVi9v6K0nGhBZy
	 Zf3uNd1Z1w9vaA8MEF0V+rYVQ+5k6//kc8SqctnN5g1l8XTBolUzwwzsI28hEKJcYh
	 R1x9+uw43BVkg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a12cc20e71so6237732e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 01:17:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9RhujMU0y3apgUnbtt/IP4VHkO2t89fJkntdOEVaYPONZSLFWJDAm7AjBsPuH8o/4Po6YWAyggRg5pqGL5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpKawABs8LV2+BhQIlx5rd4FzN0Bg33ub+RKwtaeLfBSYOG+CH
	aTd5L63f76HVoWdquW8++6rdGuHy1zLlJbyAOWgp+I/w5BHV+2VI3s48PPkE1uVSRC4U1ipO+9c
	gA0WCiz1qJoHEev2SGl6O7AyqSjiLVYy2HWlMXW7bEQ==
X-Received: by 2002:ac2:4bc1:0:b0:5a1:3447:ac38 with SMTP id
 2adb3069b0e04-5a156ba89a2mr541449e87.2.1773217060868; Wed, 11 Mar 2026
 01:17:40 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 01:17:39 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 01:17:39 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260311075223.3303497-4-wenst@chromium.org>
MIME-Version: 1.0
References: <20260311075223.3303497-1-wenst@chromium.org> <20260311075223.3303497-4-wenst@chromium.org>
Date: Wed, 11 Mar 2026 01:17:39 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfqXmq+PcFFaCi8Abc6xDVwy41GRqATZhdpKb79iJTj5w@mail.gmail.com>
X-Gm-Features: AaiRm52ZGd8wfgNcadvnRvKWb5u5DQiXPBmMXTqNTn6MKr5B7mZiuJiWoJMteX8
Message-ID: <CAMRc=MfqXmq+PcFFaCi8Abc6xDVwy41GRqATZhdpKb79iJTj5w@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] PCI: mediatek-gen3: Move controller setup steps
 before PERST# control
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bjorn Helgaas <helgaas@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
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

On Wed, 11 Mar 2026 08:52:18 +0100, Chen-Yu Tsai <wenst@chromium.org> said:
> Setting up the translation windows and enabling MSI involve only
> configuring the controller, not the device. These can be done before the
> device is enabled.
>
> Move these steps before the existing PERST# control. This provides a
> cleaner separation of controller vs device setup. This also allows the
> later patches that split out PERST# control and add device power
> control to have cleaner teardown.
>
> This change only moves code. No functional change is expected.
>
> Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> Link: https://lore.kernel.org/all/20260309215056.GA603013@bhelgaas/
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

