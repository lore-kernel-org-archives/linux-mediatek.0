Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691DFC2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 11:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwSEm/SuvZoq+OVSPOSFxHS+Ckfbk/OEFEX2Avuw47k=; b=KoBc/ulym09Xf/yyomUR4ObexL
	ljlXsPzEioTniJk/9+owfZN9Tko8Fj4Q2O09ZGtEvuOKhTp8rAZGR2srAiulmvyq7YIYcUlxnuVzv
	ffosFa2bDzTOYZ/TGMGvm/NgZPyQ3/1p4/yyKCMtz6yIeE/Y0GPxbCE6ct6zNq85wEGul7yX4NVrc
	fswI2lF1XMsVITiKNlYxolO8dOaaKj+ou+zyPdFGVrUk1AbakDy1azAHwxDdPJgptZBbAYNvKayH2
	afXv+lo31A9aLLF2xjTKeZCNHKm13nHYy/A+n2fCv48CBUFQM8cRbp5h1t3zaskKkUQdWCRxpxTM8
	YuIcx28w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnDp-0000000A94m-0GZl;
	Thu, 27 Jun 2024 11:23:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnC0-0000000A8mn-3EZq;
	Thu, 27 Jun 2024 11:21:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HwSEm/SuvZoq+OVSPOSFxHS+Ckfbk/OEFEX2Avuw47k=; b=WdReeRHHJQbMzq3lAfImuy/t+W
	9IEKAJcOo8w2YjB+CZk+9h3K1NhRt4zJYIAEoWKfmSKdxg857h93USpON8Rpjdx7RHtl6VrBVBUoz
	OnBb9RrKiJxg46kgz7qN74hUdbNhrBnvz1CWN+3g4xaa/MH4v9isIx7hj4ax9frJ+FcBTQqhS9tm1
	73EP64uBhI2ZjXgEkpNIj2RUK6f0gT7DPBnnfU8SaDv8Ey+h8upGaCWQGVpHb7sE229paN5sRR+ys
	CDX1G4r06OmXO1xovSrMUbOD/MREtORjeCiRtNgyioCizxppUywDGAspq2Gc22CpmM8mqF7YPqD10
	w97BOrBw==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMkka-00000008kuI-3UxF;
	Thu, 27 Jun 2024 08:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719477543;
	bh=EyoPoXrPDGo2VmUULjYB6t4i7WeQmc3bKPn161Uq5C4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aRvdGEAs/GUEQ0n0QxDwOX4pNpA2bj5xIypAsKVq3+ZqSP5/i0mH3Iss5UD4hTKAQ
	 JRAd62aimRIaXDW1Rfgyzt2AY2oadnB665vfEJcuLCtTOZ2ylxlX3gE5lKBJV9cdMm
	 rAbZ+Ry6xHvFzIlWDBhgM3FzZo1PvIILqSbw+UDH7bDOPoMKYM4OVAhNS++6dWOYYz
	 tqHXKh87FScwc63ckIolkzqrVkxG8PXGIG2Ix6MpqPAtBR9pXSXxwQuu1UDyutIEr3
	 4gc8e8F+QG+dsVtKVqRmAU0Tw69tF9lhROLrWVzW9kVrX06IlAuhEp8jLtVxciOa/c
	 gLgPzgMTHq8lQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 279AB3780626;
	Thu, 27 Jun 2024 08:39:02 +0000 (UTC)
Message-ID: <1e32a8b4-0cae-47c7-9112-f0b6e78bf31b@collabora.com>
Date: Thu, 27 Jun 2024 10:39:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] clk: mediatek: Add drivers for MediaTek MT6735
 main clock and reset drivers
To: Yassine Oudjana <yassine.oudjana@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Daniel Golle
 <daniel@makrotopia.org>, jason-ch chen <Jason-ch.Chen@mediatek.com>,
 Sam Shih <sam.shih@mediatek.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20240626202406.846961-1-y.oudjana@protonmail.com>
 <20240626202406.846961-3-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240626202406.846961-3-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_094515_840739_6CE0E04F 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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

Il 26/06/24 22:24, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add drivers for MT6735 apmixedsys, topckgen, infracfg and pericfg
> clock and reset controllers. These provide the base clocks and resets
> on the platform, enough to bring up all essential blocks including
> PWRAP, MSDC and peripherals (UART, I2C, SPI).
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

If the resets were properly bound, you'd get my R-b here. :-(

It's a 20 minutes job anyway, go-go-go! :) :) :)

Cheers,
Angelo

> ---
>   MAINTAINERS                                  |   4 +
>   drivers/clk/mediatek/Kconfig                 |   9 +
>   drivers/clk/mediatek/Makefile                |   1 +
>   drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 138 +++++++
>   drivers/clk/mediatek/clk-mt6735-infracfg.c   |  79 ++++
>   drivers/clk/mediatek/clk-mt6735-pericfg.c    |  92 +++++
>   drivers/clk/mediatek/clk-mt6735-topckgen.c   | 394 +++++++++++++++++++
>   7 files changed, 717 insertions(+)
>   create mode 100644 drivers/clk/mediatek/clk-mt6735-apmixedsys.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6735-infracfg.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6735-pericfg.c
>   create mode 100644 drivers/clk/mediatek/clk-mt6735-topckgen.c
> 



