Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B349CCA481
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 08:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0i5PUOr4gTuAN29X8RglYNmrpt8c4Mm+rMgTXdaOvGw=; b=AqntT7ewOMPLLHtBDAAxyrKRT4
	EKA56+7hJfhMO9YgsQeX6rnsc759h1vy2yMWiiHPnGoZPBzY5xZGsGsoh4266iWJsxabsrvrJL5pz
	3dOJy/QN1zBCm8N7MXGhG7g+F3r+3pZkwpkE9+Mty/beuaPCSmOjet4/ZhNew8xr2I6uHbiHo4fJU
	giHSah24g34T9AW5qRM//KmU2liHGsSmRB1kFjuNBJhqtfY7DAVEm4gWL6WqYoEkhzlp9LNgPNtuK
	coAfAzKzXAaY4i0RuoRATnpm9cG4qr4589/SkGifwvBM4790GnVNaRpkY7HDPQLKc8DjGbTtFnH8g
	AmUkd46Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGqt-005ovg-L3; Fri, 15 Jul 2022 08:39:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGqe-005osd-Qt; Fri, 15 Jul 2022 08:38:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D9A7C6601A3F;
	Fri, 15 Jul 2022 09:38:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657874335;
	bh=xceY5L9JgEvByY8nXCTLgaBCnqvDhcWlIlGmTkrx17k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TqlX6/gCeHEiZoI0yoHG+QC5sbGN3BKmS5kgMokC+Wf5J2LWsFFqOi2HA2YX4wuh4
	 rn2kkegT3gCv1F/+wbt5Q4rebneP3gep0ampKjPzTQgNdl9ohLXHiDhP5foQ0DC+uj
	 iB8aHJkjpB553i7OjjqK9xJu6JBSOEe5Nkd8RXFU19cJjbPbiPQKijjToAwgol3dOI
	 E/GbVxqPcHnq7YLmp0bWRWnae/8rvz4bC6F6wgv8R/h4038I6OrUizvscjwZPu9mbP
	 9vj2L9BH6MkfET0UMPcaqt4hXWZjCX1aFSBvAeXb2CiD1350CTuc9EAIWrKrmd4uMm
	 6+28pJslpu5CQ==
Message-ID: <86c06111-9c9d-804e-32ec-df4f3d4a8376@collabora.com>
Date: Fri, 15 Jul 2022 10:38:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v13 3/3] mmc: mediatek: add support for SDIO eint wakup
 IRQ
Content-Language: en-US
To: Axe Yang <axe.yang@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Satya Tangirala <satyat@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach
 <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>,
 Andrew Jeffery <andrew@aj.id.au>, Stephen Boyd <swboyd@chromium.org>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>,
 Tian Tao <tiantao6@hisilicon.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Yong Mao <yong.mao@mediatek.com>
References: <20220623090445.1401-1-axe.yang@mediatek.com>
 <20220623090445.1401-4-axe.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220623090445.1401-4-axe.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_013857_029786_F7E6E330 
X-CRM114-Status: GOOD (  13.35  )
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

Il 23/06/22 11:04, Axe Yang ha scritto:
> Add support for eint IRQ when MSDC is used as an SDIO host. This
> feature requires SDIO device support async IRQ function. With this
> feature, SDIO host can be awakened by SDIO card in suspend state,
> without additional pin.
> 
> MSDC driver will time-share the SDIO DAT1 pin. During suspend, MSDC
> turn off clock and switch SDIO DAT1 pin to GPIO mode. And during
> resume, switch GPIO function back to DAT1 mode then turn on clock.
> 
> Some device tree property should be added or modified in MSDC node
> to support SDIO eint IRQ. Pinctrls "state_eint" is mandatory. Since
> this feature depends on asynchronous interrupts, "wakeup-source",
> "keep-power-in-suspend" and "cap-sdio-irq" flags are necessary, and
> the interrupts list should be extended(the interrupt named with
> sdio_wakeup):
>          &mmcX {
> 		...
> 		interrupt-names = "msdc", "sdio_wakeup";
> 		interrupts-extended = <...>,
>                                	      <&pio xxx IRQ_TYPE_LEVEL_LOW>;
>                  ...
>                  pinctrl-names = "default", "state_uhs", "state_eint";
>                  ...
>                  pinctrl-2 = <&mmc2_pins_eint>;
>                  ...
>                  cap-sdio-irq;
> 		keep-power-in-suspend;
> 		wakeup-source;
>                  ...
>          };
> 
> Co-developed-by: Yong Mao <yong.mao@mediatek.com>
> Signed-off-by: Yong Mao <yong.mao@mediatek.com>
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

