Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00350CD4F2C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 08:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnKde7jvb8fbsVY8tcfCydhDZLMmYRmnejPI5g+nxu4=; b=ZFzR3D68lUVDZHr08KPAEb3a47
	8ciI68FHqoh/sqz3E3vdi2u3qMt34UT/rZhuqiCK0gv5cIZJYvG8IUKIKbr09FgYrL2pxSudykrg5
	yRjUtV4s9BpycR6ZJoSC21nFrJRGet9FOqHcWL7RvCGsADGiKIXrSI4cdPVvN4OGxwYKRl3Vexz6y
	4euLHnUK3UHnz3WHE0MnG8ydUtlCXe2aCH8m30sZFTkuNYNhJuYYcOx+wg5qx5RdpOp16ATZU1tfy
	ZKubhBE5uQlO/lQHyAC3ElSU5e2GjqB4XDa196yFLLn13eb4YEKfHiazD9Sf/C3TM7eMohkwdL0Cs
	//hwuR0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxjK-0000000AdAb-3ylR;
	Fri, 12 Jun 2026 08:59:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxjJ-0000000Ad9s-2aiD;
	Fri, 12 Jun 2026 08:59:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F1A343220;
	Fri, 12 Jun 2026 08:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3871F000E9;
	Fri, 12 Jun 2026 08:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781254748;
	bh=rnKde7jvb8fbsVY8tcfCydhDZLMmYRmnejPI5g+nxu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NjVZEBWxc/7zEOGV5VWzGrHB9qPk6pHu5yc1rlcYlA/uEvO+Xa74WpWc5Dkzcco+W
	 dG7t3yO79VoE/PygF5y44BixZQTMr3MQegNU1YfnS9N0XnS1UQlCsdM0m44O6+v3+e
	 I2AXvoIekQaAfkSAlyXInGvhjfVmO79BYbB9Nff6KQFSNn1JUM1/uwOaNRLPGRgFlY
	 Bf4Usd8NwR1uFxaBeDW1hq99RxaWf5X8NwcjiY8bw/7fI1z1rmN+Xm7HUf4MILCDUm
	 p4fKuMvRus5jb7p14HeduDDCSm4dyQGVhD6RhWloUEfR38uIbIUUwwfXmgll5HWvnG
	 bVj2G1A9X5pKA==
Date: Fri, 12 Jun 2026 10:59:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Alan Stern <stern@rowland.harvard.edu>, 
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v2 08/16] Revert "dt-bindings: usb: mediatek,mtk-xhci:
 Add port for SuperSpeed EP"
Message-ID: <20260612-light-turaco-of-patience-96eef7@quoll>
References: <20260610084053.2059858-1-wenst@chromium.org>
 <20260610084053.2059858-9-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610084053.2059858-9-wenst@chromium.org>
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

On Wed, Jun 10, 2026 at 04:40:42PM +0800, Chen-Yu Tsai wrote:
> This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.
> 
> mtk-xhci handles both USB 2.0 High Speed (HS) and USB 3.x SuperSpeed
> (SS) host connections. And there are USB 2.0 only mtk-xhci blocks.
> The SSUSB controller handles the device or gadget mode. Saying that
> SSUSB handles the HS portion is wrong.
> 
> Fixes: 454a1e3cd36c ("dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP")
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 4 ----
>  1 file changed, 4 deletions(-)

Please squash both commits. Reverting just for sake of revert is
pointless. We want wrong binding to be corrected, not to be reverted.
You revert something if there is nothing to fix afterwards, IOW.

Best regards,
Krzysztof


