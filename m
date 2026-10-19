Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B61DCCF2D6
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2026 09:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfIgP2F0UjnpfeyonWfYgy6p2kSRUt7R+KarqRZ8Z3g=; b=vojYb7C0CmWZJ/YyPg8Ln6cTmT
	tX9ObvSWNjSHjAF7ftKTNIEdaDfi6UQML+qo9Vw29S5kGnqaN71jtDr9G7mG1n0SurxiS86EF3fxg
	dU7UARNQf25tTa5QNrMtGPiNK1Ig92DDAJHph1jR2v6Ljvhg8+VuvU5nM0AAoK8pOusstem+zMW57
	zRmtQ/T8ErRMr9/C6XX2ushrFuBeG4eMX5HEGRoJDihSpVg2YiULRGW/YmJ0ZmDMcI+LHeVY9tXUP
	pODRpzl30it3ndT7H2cMCNgP1tCIlrdznmJRggpXNrqwOFoz3lNNgcFD+crSE2eJ6suxW47eVVgID
	lCbd5vlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjvh-000000072yg-0TLV;
	Mon, 19 Oct 2026 09:45:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjvf-000000072x4-1Vww;
	Mon, 19 Oct 2026 09:45:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 80193601DB;
	Mon, 19 Oct 2026 09:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B961F000C6;
	Mon, 19 Oct 2026 09:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792403114;
	bh=TfIgP2F0UjnpfeyonWfYgy6p2kSRUt7R+KarqRZ8Z3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pi8Az5UEDU724xgXcqeSPm5CHi2yKWAtm5vrkXCTezJYRKgoR704E3Ew66vkxS440
	 nEuRREEKz/FsjFE/mnZZP6Tf0OVl/VrJlO4M9aLm7fHC5Z23wUw5MqkKpvadmwet4R
	 FYqIyW0vdQX32ego0GtSqJXzC6ZtKjsKILh8hP2PhaAIM2tjUiqzdUbSyH34zKTVGw
	 UANh1+cg6c5692prADQGy0b1JckFIJbGwK+MRA2iNW/OnY3QHK1MhkuEacGKC9KCrM
	 VC6gsvPfmZV5WFLVMVr2U5OFN/ORiuAGkAuR9xuKkTBFSOzPHvm8tSd9DDSGKJwAhf
	 qU+K/vDP2C30A==
Date: Mon, 19 Oct 2026 11:45:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ben Grisdale <bengris32@protonmail.ch>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 4/8] dt-bindings: serial: mediatek,uart: Add MT8163
Message-ID: <20261019-friendly-notorious-giraffe-dae2e9@quoll>
References: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-0-f2462b2d2437@protonmail.ch>
 <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-4-f2462b2d2437@protonmail.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-4-f2462b2d2437@protonmail.ch>
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

On Mon, Oct 19, 2026 at 01:40:00AM +0100, Ben Grisdale wrote:
> Add a compatible string for the UART controllers on the MediaTek MT8163
> SoC, which are compatible with the MT6577 UART.
> 
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
> ---
>  Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


