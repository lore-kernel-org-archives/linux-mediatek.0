Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31331EFD208
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Feb 2026 08:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izXI3LMXbG6SsuVnD2N0XUXouX15pyDqNUn3MzXcNkg=; b=tbtW7+qFdAst6IQD5rMfDnIG+G
	B4YMjgAI6HSd0F8kjpcuAqeLQKlOHJkmSCDIm72ph9ybBCqZV6rvCwx07MFyAEoZzN2tZKAxZhS6t
	PlkJ2qSzcucMcsyr9Pmt6u2QIrEmw95OQPgUjMmW7C76Y6TbTGkp2TR7DF4gSmEjAwlhMmK2HEakA
	0NCGnpUujzxeg4zMX0Lng65IDM+9uy7/m1EJRN9X9sAeOkO86JaEN9A+hoUohUDXbAXDaw/iHfYiE
	Imtkr/rs22eiUYxxOQvFAGQajzht/XWqajQqczmEEAnt7rs2NtTP6G8T7gUOm+tIJKT5EJnZeBzwr
	2EeMFlJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA7V-00000003Xr8-1IPQ;
	Wed, 25 Feb 2026 08:19:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA7T-00000003XqM-1V4P
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Feb 2026 08:19:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 737EC60053
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 08:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29AFAC2BC87
	for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 08:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772007582;
	bh=izXI3LMXbG6SsuVnD2N0XUXouX15pyDqNUn3MzXcNkg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=nkoF+QGtHikINmdkO+WRITa7gjp5vxoaDZ28534DqKhZv7NtsLJqwRShUxCdnO3jk
	 udphkiXx0bZvUj0nmyHDG2dMr9POE3NeLvmBYsv8L+Uuuml8ssz8kpiHkrUmHakMAz
	 oSYAU+r8aAmb8tReB6AmGiIDGLDPL32tgjaRESAJpSSJryOXpEk3kephw4Kr2xyD2s
	 xvp5hN7pCNdZ9oMPYBU3AtSsVDWHdOpA3jO1TsWjElTex6cWKGuTEFn9VeYZVLJCam
	 TBFGQ8oxg1r17xZJJvkwp2nG3h/frmQfl8qDPEHdMrKpOOu4Ie9wBYgZjd2hShHHM1
	 VX6X+WPjsHjDA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3870d178a9aso52124031fa.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 00:19:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtQOnRL03W5b9wY1Z7EGAxdJRdLFpLaxBbogZ8XhjJyTWpWAQ/5Kvrnt88wCczO611UIj3/uq7AsrsCeRCiw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQYo7B+fibohNtnkE0ni+d7u1tVzZA1zGgf0fgZHM57rgXjnOJ
	ibepiU8LRNy5tM6raCDsesGTPclG5Nl6A8Gpy/osbZl/ZhI24XEyQNhu9aYiflSzpXiTiVQFX/2
	F68CpLDkt6wRQtItWdji314cEEaec8E7iFG9A5K0Nfw==
X-Received: by 2002:a2e:9a12:0:b0:37b:a955:d497 with SMTP id
 38308e7fff4ca-389a5cdd726mr40354431fa.17.1772007580872; Wed, 25 Feb 2026
 00:19:40 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Feb 2026 00:19:39 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Feb 2026 00:19:39 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260225072225.3345307-5-wenst@chromium.org>
MIME-Version: 1.0
References: <20260225072225.3345307-1-wenst@chromium.org> <20260225072225.3345307-5-wenst@chromium.org>
Date: Wed, 25 Feb 2026 00:19:39 -0800
X-Gmail-Original-Message-ID: <CAMRc=Mfti5FqPsC02zrvY_YnrHrXj68SLDA_tCc0q0qAzRQawQ@mail.gmail.com>
X-Gm-Features: AaiRm52KsedqHnZlertAD8iUGS0ywXhPRvuHDAYeVDvIELIFM7DO1igrITzeqTk
Message-ID: <CAMRc=Mfti5FqPsC02zrvY_YnrHrXj68SLDA_tCc0q0qAzRQawQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] PCI: mediatek-gen3: Disable device if further setup fails
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

On Wed, 25 Feb 2026 08:22:21 +0100, Chen-Yu Tsai <wenst@chromium.org> said:
> If further setup fails after the device is powered on and link training
> succeeds, we want to place the device back in a quiescence state to
> avoid unintended activity and save power. This also helps with power
> state tracking and balancing once pwrctrl API is integrated.
>
> Power down the device in the error paths of mtk_pcie_startup_port() and
> mtk_pcie_setup().
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

