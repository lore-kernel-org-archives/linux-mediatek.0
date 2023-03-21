Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A831C74A5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 06:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mssbRTMm5yno6PJfKDc1E8Bdud++L0/ZiunrGkpbE4Y=; b=2DkSi+Dv7BKy6Qr+pwu6a/eqxS
	6Bf8WJ5//vQ3UBrry5goiNdA6ZVDyzWEh9mCv9YTh7Zr5g5z/KhEgUMxOv06cj+CvXEICX5gEtj1B
	nobBVVEtwmIvaRE82iug8hvmQdfpQ0z05gHQ+mhh7XPGnRd8CV0zkYNI+4yTUWPog1cD+3ItPzAlt
	zAiVQmKCt01ar8XMKYMMIsXQz/gM92lWEVIUXf6T4ly+qs55zkbGtnSs0Oiem5HnDav6OoIeYXQSN
	tfLaJkIlB0e/dWx1GTMoAGGcFRkTonaEGtAT2LD0Tbqr5NKqP6hBtKdfxUzdkezUF1g6PvD0FhK2e
	ahzqO3sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peVn5-00BQLu-1w;
	Tue, 21 Mar 2023 06:48:15 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peVn1-00BQJD-1U;
	Tue, 21 Mar 2023 06:48:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E3445B80A25;
	Tue, 21 Mar 2023 06:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADE5C4339B;
	Tue, 21 Mar 2023 06:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679381288;
	bh=zAhzNf2FVAMCkoGYjb8wdeS65X5jjVy8UxYtpveB0zE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sOw/Uepo1U1ivrWB97hISCKv3yY9dsEm8dxwFQrKZ3GldmWCG0BhJ/BoAfKnvWtlF
	 aArOfVhruKPz6PWvBdiVHs5cpBWhACYEAgPhnzJ6SqID2x+VyV2GKgdK94hY4f5I4Q
	 95m9GRi8KSNsLWVMssBMAso2VNKNNjrye6HHqdfI=
Date: Tue, 21 Mar 2023 07:48:05 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Justin Chen <justinpopo6@gmail.com>,
	Al Cooper <alcooperx@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: Drop unneeded quotes
Message-ID: <ZBlTJbdAmh5H3PD0@kroah.com>
References: <20230320233904.2920197-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320233904.2920197-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_234811_644200_2D0CF821 
X-CRM114-Status: GOOD (  10.13  )
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

On Mon, Mar 20, 2023 at 06:39:02PM -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Or do you want me to take this through the USB tree?  if so, just let me
know.

thanks,

greg k-h

