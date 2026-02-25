Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC478EFD209
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Feb 2026 08:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i767YM81rg16oZZHvqRpOQjd5YhsJg23jCgSi88ETAE=; b=iRQozEk7L5eXeEkmz1nb7mz8Pe
	j2X2pIwHg692RTQA/j7pP5UWYuqRLmlQsD9maBL6Pn35NLjjknW99IvwApYFU5XWM0NQrBZhlifUc
	ih88nm4ApuLXqpLG8uiNgnz2FDr2z5VQ2NZYuxD5xUHkammTMozisdUOhrUvJteYjv/yKm7SQJ+ir
	6tFfg7+bRZ91OVNRzzXB2/jBP7rt+Nm9q4iC4efeBzFL3/k24K2UxvAF2lBu6LaxQnVXG4n14BwJX
	7MR//ZDwpVxzCdjea7tp1QaEHt0YGWOb1jA8U2faHbMLJvvBO7rMtSUFCRMAvOJqg/tn1A5YINclA
	wUX4ZnUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA72-00000003Xj0-1gCW;
	Wed, 25 Feb 2026 08:19:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA71-00000003Xi7-0Le9
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Feb 2026 08:19:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 32CBF60051
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 08:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCCF4C19422
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 08:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772007553;
	bh=i767YM81rg16oZZHvqRpOQjd5YhsJg23jCgSi88ETAE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=m3MnF8kg8EdpV9TU8qMVIyRtyy9/e4Sc7qdBSw7Kmbx1O/1IQVhMe62U56el3Q/1k
	 jAqYvJ5zQWcCSk+wSu5VRgVyrERgCYFo0yLzeFapQxOGWNY5i38UYyNfKPQKIn2MFO
	 TbcLMBptwcoK3QOFNuZShpI9rnqwr+XKTnBdR8LT+p73sHev4Yna30R8exUDG6Ki0q
	 UOUjUjheFSk0BXDERTF5jqlIlnsHwIOPgB3vu3e0cn6ofmiMyx86oPNZyFXzQEvexL
	 yEfI8mKfouLgxGH51mxfnY6ke55/jie2AOXfv21aQCN/djFyBsC8M30M3dwDJexryF
	 HNda32plqi0Qg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38704f70ea3so57207081fa.2
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 00:19:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWkz+z6E61+EqULMWiZvIzt0G7uQvq2K+3QbK5JFwPleUHalL3cY+bW4AWuwxMlMEvFhMCPzhNNUYVeKQPw4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhTlZiwRiNkXbKGQ3dep/BsfeTcHZkYSHu3lAcT47Liwa7jJp0
	7+jPx2yP3KwSKphdAhdy8++rvoA+caYlumJgA8cQQ032CV0rQVsyWiIDFqLyW08Refis0ItUr7M
	Ebu35XUw9tm3TIVnSKgPWq3kbE5PO4hEJe5JOFWianQ==
X-Received: by 2002:a05:6512:1252:b0:59f:8993:df7d with SMTP id
 2adb3069b0e04-5a0ed8a2429mr4956665e87.26.1772007552569; Wed, 25 Feb 2026
 00:19:12 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Feb 2026 00:19:10 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Feb 2026 00:19:10 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260225072225.3345307-3-wenst@chromium.org>
MIME-Version: 1.0
References: <20260225072225.3345307-1-wenst@chromium.org> <20260225072225.3345307-3-wenst@chromium.org>
Date: Wed, 25 Feb 2026 00:19:10 -0800
X-Gmail-Original-Message-ID: <CAMRc=MefvP2bxdGqhw+Sn_MDqVcA2fPefCBygP=ZdFLnkPcHUA@mail.gmail.com>
X-Gm-Features: AaiRm52W52XmwIgwxtOACerr-UA7gcczLgZWX36auM-UC97DyKrwy0k9pm1Y2nk
Message-ID: <CAMRc=MefvP2bxdGqhw+Sn_MDqVcA2fPefCBygP=ZdFLnkPcHUA@mail.gmail.com>
Subject: Re: [PATCH 2/7] PCI: mediatek-gen3: Add error path for probe and
 resume driver callbacks
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
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

On Wed, 25 Feb 2026 08:22:19 +0100, Chen-Yu Tsai <wenst@chromium.org> said:
> The probe and resume callbacks currently do teardown in the conditional
> block directly. This is going to get ugly when the pwrctrl calls are
> added.
>
> Move the teardown to proper error cleanup paths.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

