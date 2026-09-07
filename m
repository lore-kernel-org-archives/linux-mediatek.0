Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96ABCC79F9E
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2026 09:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjLu9VrLjkkIFyZBHjXkyXbiDTKuqMsK2HnFc+wZ1js=; b=Y17UYxDkcl1TmULUD6wr3rbPW4
	8pbNV4FxDFmimNfo+w03iFzOdS7gY7qW/HP/GRZmQduM/7c+7OOUEcvqBv2b1ghA2MI+UGyK1EGlD
	VCcMVHoM3ShbbDUMYYXY660VNiCTkkaIZHtJ4P6PRn+Sr3/vX7ybzYhETp/VFF7cNcyZ+yCGsBR3W
	qbVd6HXorZaPwTbsCwqqko2d88KjpJ81wgaofNdNohRWHlo5byOpNlocuyidEhW/4LZ1omV5DyCOm
	p/VCgS3EdweUhb/9g5giCImWzoJQtEpnl4aCqpKMRmvNDtedA7tsNOso+m3ITnFM4rQ4G7QErcZqB
	Aige8HkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3VRX-00000006LwB-1fiw;
	Mon, 07 Sep 2026 09:15:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3VRU-00000006LvL-3rCo;
	Mon, 07 Sep 2026 09:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788772504;
	bh=yAZBsyqAUs5mrF94dZw5BTxiKBfvU5TkPnHaBKxFCrs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oDZsHBddIrpQ1YJt7hAIxSHZzRGcMCY4t0+bAIUzbvZapgskn+gsYmxHXnr/Hbavc
	 9SsTTSRghDCriMKvdiOkYC00DSVpkprvD3EhybYRt1cy7tUiHJIrwWYvTGl8SIuAyw
	 Y+WXr9N5v4Aea4wAyBIPGbCt3pLOibMNkuPwtzFCMa7OCb3RoUDA0/ax1R13vadeZm
	 gSWZxcOuo/8enX5Nk1umBVGaPZ/CmlYQHb9fXUqfDxRY5QYrUEoC8nmG7r3j7Q/fzd
	 56YRkvm0Mkuj9JustA4wCwtaiWevDUiC0XyotMgXupiapDfKBwjKf3hqsDyWcJzwbf
	 4J1NrWiyPegaQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4AF3717E0699;
	Mon, 07 Sep 2026 11:15:03 +0200 (CEST)
Message-ID: <468b57bd-6f82-4dc7-82ad-71838b6ac12b@collabora.com>
Date: Mon, 7 Sep 2026 11:15:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] pinctrl: mediatek: use devm_gpiochip_add_data()
 for GPIO chip
To: Justin Yeh <justin.yeh@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20260723035823.2041832-1-justin.yeh@mediatek.com>
 <20260723035823.2041832-2-justin.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260723035823.2041832-2-justin.yeh@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_021509_118254_03D4E34A 
X-CRM114-Status: UNSURE (   9.30  )
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

On 7/23/26 05:58, Justin Yeh wrote:
> The gpio_chip is allocated with device-managed memory but registered with
> the non-managed gpiochip_add_data(). This was harmless while the drivers
> were built-in, but once they can be built as modules and unbound/rmmod'd,
> devm frees the gpio_chip's memory while it is still registered, causing a
> use-after-free.
> 
> Register it with devm_gpiochip_add_data() so it shares the same
> device-managed lifecycle, which also lets the manual gpiochip_remove()
> error paths go away.
> 
> Fixes: a6df410d420a ("pinctrl: mediatek: Add Pinctrl/GPIO driver for mt8135.")
> Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that implements the vendor dt-bindings")
> Fixes: e78d57b2f87c ("pinctrl: mediatek: add pinctrl-moore that implements the generic pinctrl dt-bindings")
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


