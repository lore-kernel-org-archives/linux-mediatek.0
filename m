Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15779C38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jan 2023 07:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6qG3BxsU9DzBi96t2cPx3U6M9c7IcgwUtyH0SLYa4g=; b=42bjUE2Yy9sUMpWTdpo7o1/xBy
	CZAShZFXc6H+/UVcG81r3E+SAKkUKUReg2kO3i6AI6xT+AlfNPgMq3LIp6NUP87HT9KaqKNEiXZBY
	KZ2StbuNjebvbuC2e7sk28ZA3gm9rzc2mupz42Mc55frxGSPzDdD2kyhwDc9PofacRQGc7M+07yXz
	dZXf9ovEcNSGc5nOjPQTjXdSLit2mz9Fio2aDF1PG/QRMwASuokUURAXhcoXd6S1gK6Bfs3ze1MBY
	GPNJ7n1hqoiM5qpk4F+8EPcjNXkyypahtJnLG/ybuYuKZGC1y1yNsURKOLy5lxfkluoqpfVRFU7iC
	iQ2Cmruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKDkN-002eL1-Tp; Tue, 24 Jan 2023 07:29:35 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKDkK-002eJN-LJ
	for linux-mediatek@lists.infradead.org; Tue, 24 Jan 2023 07:29:34 +0000
Received: by mail-ej1-x62e.google.com with SMTP id qx13so36514705ejb.13
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Jan 2023 23:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=streamunlimited.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m6qG3BxsU9DzBi96t2cPx3U6M9c7IcgwUtyH0SLYa4g=;
        b=XQJEBD+Y7xXVzz/nDHd/S0HvH752rWzTMP0DGsUG38TNK8qbInkeX38e7aL20QWe6M
         kBVcoZbmlAMEKoI1tVfFsZpem66CouQRKsddSFwIgsX5WGdyHserqv6Cz18iyTVwfS51
         nRepPkKhPh77MF1ftu2fBC1KafiG0Apx3fp/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m6qG3BxsU9DzBi96t2cPx3U6M9c7IcgwUtyH0SLYa4g=;
        b=o841FLj4yYMC/0XJ5STZPH3zk7jP45bb1gwVx7CGgQQE0kfon8GAxWhgfh7jJYOLUv
         lcIvpX5f6UOiRHMP+HtGEmSv1f23OtkUB2OeTDMN2Xbd8sr6FetR0rDmMTl6FwOt/MsE
         9xt45nuvjME08dT4eS+oOH0vrSzq6lo0AL+3szSF5m5u30jRELu+HrtsXAysUMSS1kyz
         sgdGHcElHC0o7+gAdO0SuoAL+sCkxgFabnN9QzzHtUQXXJjaJdncCMkJjsHoXh0qFhVJ
         Xp6nShKrPODhBaxbS8Tvs6criJVMmNVn8FzEXlx5pIYfVPfYV+jNGs7fO5wrn8Sv0piv
         Wvcg==
X-Gm-Message-State: AFqh2koE069wy3whlaUKL6Gpf2r7vUy0z4yFZO8czjwFSPGlFObRvkW6
	n0mN0vholJ6JAtD9oMg6+Qtv+trbTmcSD5atwWRJsQ==
X-Google-Smtp-Source: AMrXdXvidJI1X9Ofw2tlxMTOMXNJKUk8KX9Nvo9V+Ox1qGGWLz9APdwv7vOmlMKgq5MPZP8u79+DHlr5adylHiaktg0=
X-Received: by 2002:a17:906:f9d5:b0:86e:65b8:e908 with SMTP id
 lj21-20020a170906f9d500b0086e65b8e908mr2065436ejb.450.1674545367480; Mon, 23
 Jan 2023 23:29:27 -0800 (PST)
MIME-Version: 1.0
References: <52861a84-0fe2-37f0-d66a-145f2ebe1d79@gmail.com>
 <20221214134620.3028726-1-peter.suti@streamunlimited.com> <c6863a3e-8855-50fe-25cb-0b38bc3a05e0@gmail.com>
 <CACMGZgZY4Zb+3vHUDAS0+3r55K4_J40dtbsTPTFZMd6duBikpQ@mail.gmail.com>
 <7c4aa0d2-d8e9-416b-b2ad-f5c3c8ea33de@gmail.com> <CACMGZgaS7z2YoViA3jV-gVBvASSq1maiGj_6hfrJQ3zr69esgQ@mail.gmail.com>
 <c6d797f8-8177-75c7-4522-eea3da6b56d8@gmail.com>
In-Reply-To: <c6d797f8-8177-75c7-4522-eea3da6b56d8@gmail.com>
From: Peter Suti <peter.suti@streamunlimited.com>
Date: Tue, 24 Jan 2023 08:29:16 +0100
Message-ID: <CACMGZgbR_aE9Wph3ZGZ8yGy+V2qjG6GXV8w6JMkw2WYzk8gdow@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: meson-gx: fix SDIO interrupt handling
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_232933_013595_22DC2322 
X-CRM114-Status: GOOD (  14.66  )
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

On Thu, Jan 19, 2023 at 8:37 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> > v1 and v2 also fix the issue, but v3 does not correct the bug when
> > WiFi is stressed for a longer time. And therefore it should not be
> > used.
> > Could you please give us some advice on how to investigate this further?
>
> One more thought:
> When checking device tree I found that my system uses IRQ_TYPE_LEVEL_HIGH
> for the SDIO interrupt. meson-g12-common.dtsi uses IRQ_TYPE_EDGE_RISING
> in mainline Linux, however vendor kernel uses IRQ_TYPE_LEVEL_HIGH
> in meson-g12-common.dtsi. A wrong interrupt trigger type may result in
> lost interrupts.
> So you could check which trigger type your system uses for the SDIO interrupt.
> If it's IRQ_TYPE_EDGE_RISING, re-test with IRQ_TYPE_LEVEL_HIGH.

Thank you for this suggestion, this change fixes the problem fully.
With the interrupt trigger type set to IRQ_TYPE_LEVEL_HIGH everything
works as expected even when WiFI is stressed for a long time.

