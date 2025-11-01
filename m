Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D711CCFA00
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Nov 2025 16:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOOA+C1R49pgXQracXNdHSHDAKyKnXuVu8Nt5iEqIfs=; b=h9+VTHSFiup8UaH47hTbl6U3sp
	QSlh1TBScquas1o4a4kOLcQzy+mJmJEZoGFVctxTuYyA6RMOK7pyvEdLAxETI3Frtw1LKdBSott5j
	I8sz+T0dD0bT9HC5VIKghPQxU0jiQuJqIVzQygvWxAJ1+oWA36OPvnEZgifYbhXnf4EMkov7gdpST
	wAjbtECsh0Bw8EFcUi+KxuHfm17RqjCQG54o6zBFRl0cLMwIlMP4sspwG3UUmvbbPKIZoQjiZO5Z4
	2jWeYwLM4cBgDvGBgTpEM02FcIa8uZ593veyrt4qfupgN9CIojiesGE2sxSEYbUDn7sIkN17xEg0x
	Uo2+3i0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFETa-00000007w1q-391u;
	Sat, 01 Nov 2025 16:29:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFETY-00000007w1D-20UD;
	Sat, 01 Nov 2025 16:29:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A57760142;
	Sat,  1 Nov 2025 16:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F9A1C4CEF1;
	Sat,  1 Nov 2025 16:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762014551;
	bh=mOOA+C1R49pgXQracXNdHSHDAKyKnXuVu8Nt5iEqIfs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BQxafMp292Sny2DJvfsRfD7LhATGsqCEfaNqeuS3nkX6fiGe9K4VSs3PErA1U+Qwe
	 bQaJjq8HoT3eYDlg9HlkLZkQGv9wFrZyIfibLEwtMMgaUXcV48dyrh0OvHFxSvx2kH
	 3GQxMudvC85ucDa7qDMg4fz0qLmSlNvhRmZWBJ9CN7zZ82zIqQxVP3cfvzSlhaDdVs
	 2775tQVZalnjFTHwZXq+U2k8zgSZ9D6Q6DIDIsZrrtt7zbXa9xTuYSCigvUBi0HgU2
	 Cgyajanlb/PE/oUxRiGAzE5shY/3J4pwOd4dvL8NIYwUosAhwpGoiTrkH4FgqRygoe
	 hM6GjFdp4rDVA==
Date: Sat, 1 Nov 2025 16:28:55 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Jack Hsu <jh.hsu@mediatek.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, srini@kernel.org,
 ukleinek@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 daniel.lezcano@linaro.org, tglx@linutronix.de, chunfeng.yun@mediatek.com,
 wim@linux-watchdog.org, linux@roeck-us.net, sean.wang@mediatek.com,
 zhiyong.tao@mediatek.com, andrew-ct.chen@mediatek.com,
 lala.lin@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 02/11] dt-bindings: iio: adc: Support MediaTek MT8189
 evb board auxadc
Message-ID: <20251101162855.303b3e5e@jic23-huawei>
In-Reply-To: <20251030-deftly-lent-0588c4e910b1@spud>
References: <20251030134541.784011-1-jh.hsu@mediatek.com>
	<20251030134541.784011-3-jh.hsu@mediatek.com>
	<20251030-deftly-lent-0588c4e910b1@spud>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 30 Oct 2025 19:30:39 +0000
Conor Dooley <conor@kernel.org> wrote:

> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

Applied.

