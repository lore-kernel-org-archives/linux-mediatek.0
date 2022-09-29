Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20A0C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 12:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljGOjQbWFCVLFHvi20uvdG2jvdebfUc46v4KGb1frLM=; b=IdWm6DIHRo6J1JrU8V5+BhvNLn
	wYqqqef1tdOGTBOEczWZkoAkIObcpwVea2kmXrNHXvUiRjRQQdl43MPUaded0RDijdRmD5cp4frBN
	sSqjiTckhfJRbe1JCrKM5yMkS6xaHwGNeLK2RjYpa+TE3/DvNi3zil+7oHOvQVxEq31gMdd2qCcMc
	kIPio5dMhphDyX6lZbByOsZF3j3lDOF4V+uhc95JhNIvwPrVciUcPNKcmVCd/XsNfJNlVoH4IHmor
	l6n+05Gw+SlrTbTBRKv++CY4nWDEXsdpR3YYJ7OjsI/a3QEhmf3rSqJYzrkkorKonptx/irgEFj33
	evMPlEgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odt0C-00364y-FP; Thu, 29 Sep 2022 12:50:56 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odszz-00360Z-3l; Thu, 29 Sep 2022 12:50:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0419566022AF;
	Thu, 29 Sep 2022 13:50:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664455841;
	bh=W4hvA7XiCHkweWKtVQQQDwgKeQSoZdrUIBJphAwsUv4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pkv1TP36XZwPEoSz/b4qGlcU78aN0fXyPvtAVCymrUncaArQ+2gPdy+HXRj7Rb/Mv
	 TVTqMXNfnNmbInTi3/xUUPQ24Y1XA6vLBDOeLGQSL6Skyom66NDfJxGvbC6qZJzacp
	 mCjAnTX0ot417sHgpNzDh4WuGGTroDI3+SXtNrg5RVNv9g2oKKogLbYoBlixWnzIPO
	 gAfZBTY5uRdkH4NfXb2NYXXI9g80PBdDqocT0JWZdEo8YIsVwA+Z5U0PxMeY6YwXBD
	 AMXu8mRxdiiWQgZt6eDBmX+/9Si/3Dalu6+VICb8Kb90d1QXJ/nJOPxA99okSbv8vQ
	 uuqx1rR25kzMw==
Message-ID: <17c5cc9c-50ea-aeac-04e0-20b6c093c7ec@collabora.com>
Date: Thu, 29 Sep 2022 14:50:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3] reset: mediatek: Move mediatek system clock reset to
 reset folder
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, sboyd@kernel.org,
 mturquette@baylibre.com, matthias.bgg@gmail.com, p.zabel@pengutronix.de
Cc: runyang.chen@mediatek.com, miles.chen@mediatek.com, wenst@chromium.org,
 nfraprado@collabora.com, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220929121031.17523-1-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220929121031.17523-1-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_055043_313339_EBAC26BF 
X-CRM114-Status: GOOD (  21.33  )
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

Il 29/09/22 14:10, Bo-Chen Chen ha scritto:
> To manager mediatek system clock reset easier, we move the driver to
> drivers/reset.
> 
> The modifications in this series:
> - Move clk/mediatek/reset.c to reset/reset-mediatek-sysclk.c
> - Move reset data which are scattered around the mediatek drivers to
>    reset-mediatek-sysclk.c
> - For mtk clk drivers which support device, we can ues
>    mtk_reset_controller_register() to register reset controller using
>    auxiliary bus.
> - For mtk clk drivers which do not support device (only support
>    device_node), we use mtk_reset_{init/remove}_with_node to register
>    reset controller.
> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

I've just analyzed this idea a bit more, and there's the outcome.

This driver would be fine, if some MediaTek SoCs weren't shipped with
a bootloader that supports only very small kernels... because then, if
the reset controller is not available at boot time, it's unlikely that
you can probe the eMMC or the uSD, so it won't be possible to actually
compile this driver as a module and load it afterwards.

Please don't misunderstand me: I like the idea of having the MediaTek
SoC sysclk reset controller as a ... reset controller driver but, to
make that work, one fundamental issue must be solved...

If the kernel is configured for, let's say, MT2701 and MT2712, we're
always building in reset controller support for MT7622, 7629, 8135, 8173,
8183, 8186, 8192, 8195 - and this list will grow with MT8188, and others.

Obviously, it's useless to have support for, say, MT7622, if the MT7622
system clock controllers aren't built-in, nor modules.

So, to make this idea to work, we have to find a way to:
1. Build in support only for the required SoC(s)
2. Put the reset index mapping arrays in SoC-specific files, or this
    single file driver will see an exponential growth.

Wrapping it up - as the driver is right now - we're losing flexibility:
we need to maintain the current flexibility while keeping the improvements
that are made with this proposal.

Ideas?

Regards,
Angelo

> ---
> Changes for v3:
> 1. Add reset bit of PCIE and USB for MT8195.
> 2. Rebased oo linux-next-0928.
> 
> Version for this series:
> v2 : https://lore.kernel.org/all/20220923045738.2027-1-rex-bc.chen@mediatek.com/
> v1 : https://lore.kernel.org/all/20220922141107.10203-1-rex-bc.chen@mediatek.com/
> RFC: https://lore.kernel.org/all/20220527090355.7354-1-rex-bc.chen@mediatek.com/


