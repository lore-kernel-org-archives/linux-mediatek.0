Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FA6D6ACDE
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Dec 2025 10:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xZgigcPYCTe787T1RP1QJQQl9rmrKyQCyFERX1ZCJg=; b=rwq+DDvhu1iSNbBfb9rbcYQX1A
	MDtfz7wuXt3Rq+7qXz0r35W9XikRn30/qiwyJ6yl+7P4BtAfcBllVgSDkpkq0vV2V+ioZ76gJtRNB
	dKb/SKAX1wWI4BKPnedYv6a1Jos41yHCsTxfr7G48bzUr441rkTDyUSpEiBseLjc6xjMBh2Xh7klg
	CmRDXWTzi90gsj/r5MQtK/5Q0oIGotlFGbZUw8gJCJsv8lSYFwdScewmUTWK2yfqkKxFeEuwEBr8W
	v89SjpgHgZpvzzyF0glsuILMQM3Ngdl7o1IPhJC021FKLARWlB80rR7kdK0Rtx8dQtNGqiDYZErlz
	6eP/nvyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWB4D-00000008Des-0tht;
	Thu, 18 Dec 2025 10:17:05 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWB4A-00000008De9-2Oi5
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Dec 2025 10:17:04 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-37ba5af5951so4100991fa.1
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Dec 2025 02:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766053020; x=1766657820; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xZgigcPYCTe787T1RP1QJQQl9rmrKyQCyFERX1ZCJg=;
        b=JROJsTBezNI+aULa7OY2boKh7ZKQzO7iBmW2JHGCe+UqaQtOYaxE+a8rnnWm3MC0Hw
         YHA6Le7sWg2D0bWw+eR2ZJjSLYf4gSe1TJdEBzSHQmlvtexHYxiRZgO4HBvEXSDifj1v
         L86Cwd56R4ZWvPVjIKvhMZ1/F1XGhjd+2xbAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766053020; x=1766657820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3xZgigcPYCTe787T1RP1QJQQl9rmrKyQCyFERX1ZCJg=;
        b=YPfHB3ZkIOkqd4z0cYX8m6qc6AbLF7ir5Az/MexRJprP+7igwGqPUEisKLtnTREWfS
         EOPwepNjoGc2dAlIZHRnGjK7WQWWRR086OEzfnrgZENyi+22jgLLkjrtQAA9vXL9SKY0
         PTWZLRCCtsaqNW0ehGzw3fph8FJ92NVQ+d0dOrV8HKw9T8DRSbrRz8aDryUBOisBqwsP
         P+JyR+XfVKeeYwbQ09MExrr1sWs1nke55VDH2NyUVDEpTY1NnF30503TXoiCcALnEhbr
         VJ7U2N57kfL9+2bJCQn0TB5mJyf0IBoj1FBuAUplM1Me6u8nNcytkPLtRg1mLhyAYPIa
         kL1A==
X-Forwarded-Encrypted: i=1; AJvYcCXQLtNoGd25F5UiumOofT8vJBwz5L1KbJgXSoUH/VoPK+xjqFiEXgn3rwbUkYxfcHaIJxGgJGE3kmlqvWCbAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwV4TqHOwxG7Fgu2W9IEI1ZjfVg0caPKdrrAyIyB6su+TeHE4y2
	fNz85kSwSxAW0UFX6Q1JsURSxFHRlF5q/96/5ikI1PwxNOB4VjnDxndYxUFmxjxy3AuKO9hRZqf
	L5koxcvDOAP32MDv/U6PgQuqq3mIrTWIgYkMXuv/h
X-Gm-Gg: AY/fxX73nzReBPPDMFLLltufYWXuqQWQN7n6NxEpCR/jSv4MIjJel7h7e3kHLBvQ/ad
	eLEgn5xWRx7ASBqX1YTAdGxIWjmOMnzknVQIJP4qPvfZkx/3dt5ZOjvsthv12FArIzQ+UrEgehs
	o/+FiaZOCGTGex7UIflhdM1GF6b/fLQnBaNkzsM6NVI+W0+9qilq4GIc44zSvBuJaXox0zRXeQt
	4HZLXmr1X3cz0ox5EGy/BXDBT0ABsM8cDybSiQWAFFEH19m4Q0aN+5L7dd9e/bYXb8txDWUfgN2
	QFT6PSm7M6RA+5WTGEAd0zTJ3g==
X-Google-Smtp-Source: AGHT+IHB81Hph8P7HruRVDQAIKOQdKRNQiGl+MjA+C8Ci7aTBMAjTA2jqbR6yldsfAEZEnO2RaJwd1MZhXG0cwE2BsE=
X-Received: by 2002:a05:651c:e17:b0:37c:cf34:536c with SMTP id
 38308e7fff4ca-37fd071a3bamr62956651fa.3.1766053019890; Thu, 18 Dec 2025
 02:16:59 -0800 (PST)
MIME-Version: 1.0
References: <20251105062815.966716-1-wenst@chromium.org> <2qojq77l7xeivmvt4mqjpdelj2ph2rht44qzkaf3ikq5qpq6gp@tj542kt77dkg>
In-Reply-To: <2qojq77l7xeivmvt4mqjpdelj2ph2rht44qzkaf3ikq5qpq6gp@tj542kt77dkg>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 18 Dec 2025 18:16:48 +0800
X-Gm-Features: AQt7F2pYozdj3ewu2whsibplWc-nkUoD49f-6hqeRMBbrfWkPAqi5mARhpOxjHs
Message-ID: <CAGXv+5E1qc7UDUPBz9htA5RC18cPDGeRt1wW5exkoAkUuFxpSA@mail.gmail.com>
Subject: Re: [PATCH] PCI: mediatek-gen3: Ignore link up timeout
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_021702_661005_0D3A72FB 
X-CRM114-Status: GOOD (  26.86  )
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

On Thu, Dec 18, 2025 at 2:11=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Wed, Nov 05, 2025 at 02:28:14PM +0800, Chen-Yu Tsai wrote:
> > As mentioned in commit 886a9c134755 ("PCI: dwc: Move link handling into
> > common code") come up later" in the code, it is possible for link up to
> > occur later:
> >
> >   Let's standardize this to succeed as there are usecases where devices
> >   (and the link) appear later even without hotplug. For example, a
> >   reconfigured FPGA device.
> >
> > Another case for this is the new PCIe power control stuff. The power
> > control mechanism only gets triggered in the PCI core after the driver
> > calls into pci_host_probe(). The power control framework then triggers
> > a bus rescan. In most driver implementations, this sequence happens
> > after link training. If the driver errors out when link training times
> > out, it will never get to the point where the device gets turned on.
> >
> > Ignore the link up timeout, and lower the error message down to a
> > warning.
> >
> > This makes PCIe devices that have not-always-on power rails work.
> > However there may be some reversal of PCIe power sequencing, since now
> > the PERST# and clocks are enabled in the driver, while the power is
> > applied afterwards.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > The change works to get my PCIe WiFi device working, but I wonder if
> > the driver should expose more fine grained controls for the link clock
> > and PERST# (when it is owned by the controller and not just a GPIO) to
> > the power control framework. This applies not just to this driver.
> >
> > The PCI standard says that PERST# should hold the device in reset until
> > the power rails are valid or stable, i.e. at their designated voltages.
>
> I believe this patch is no longer necessary once you adopt to the new pwr=
ctrl
> APIs proposed here: https://lore.kernel.org/linux-pci/20251216-pci-pwrctr=
l-rework-v2-0-745a563b9be6@oss.qualcomm.com/

That's right. I already have changes locally based on v1.

> I plan to get this series merged asap for v6.20 so that we can apply mtk =
changes
> on top once you send them.

Great news!


Thanks
ChenYu

