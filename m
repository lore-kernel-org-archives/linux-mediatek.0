Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E88C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 08:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkDszUQBP0ctwqkz3tC8SEpLwCddU14viRbnUMm8i2w=; b=scHWugJuB4tBHDF0DW5uBjG4lu
	lcANembe5L9KvtUaeGLJXyfH3/lmr6Mv1ynH0p/1X3MWVm6PtNbiP1rxoa2F1pJz79st7CmcCUclk
	AFAl7sbpzvh6qTsT3zdjGgSny9WKqrQaXkx0d8a24N0NC/1tqbRHxZFnmAdncZtbZTwE+IiNsYLlY
	a4sZblssNypeXU0hyV3JOfIgtOSUtZqY9ERheT30+AKFY/J/cleAlev9ikrjIIDIKyo/OY7O0b+Ty
	2O54QHhJLMBfha8RNyCkdkykQvi2NCzSY6bYcX7wKA8vBL60wyf6Qz9cFGsg/gAW9YiMUD/7RfoRB
	5LIg3eRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHGh-00000007RgN-0TES;
	Mon, 15 Apr 2024 08:00:47 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHGa-00000007RfW-0G25;
	Mon, 15 Apr 2024 08:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713168038;
	bh=HSR6PBtfxo7EXtU/d2SXM83lh+wVbddu5sGZ+OvYtDE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=0LPjgSf19fzsF4BViUPiF21dBSiq7NMYVukcWBXgO2drb9VJRWQeY+7dvpeCoykAi
	 BFkN6IOUOlb03rW4a84O07xhRfWOi2ZMyTsiHI1oCz/hhGMYoW/9cdwpGl8iZw03Jp
	 GRTPb3oi/8vBg4Ve2qJQRbNkLFWpMeZgRMZ4fdyBj+65RpGCvPrjZyBlRCCFODXQEa
	 o+L3YgJfGPFhYmV7XXJdNi78vY14qnLCfLQ2GobzA2naA5CGH4NEVDlv6GF2Qn7B0B
	 Kt2DKqWRXfS6kp2ka8XEBV0W5dkXPnQ2iuDMccd+IA4K2LpUcJnMBCt/Rg7MkLVpr1
	 y7ZCjIvekOkyQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 938653780894;
	Mon, 15 Apr 2024 08:00:37 +0000 (UTC)
Message-ID: <1e62f1eb-f4cb-450f-9345-0a6f1a65468f@collabora.com>
Date: Mon, 15 Apr 2024 10:00:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: net: bluetooth: Add MediaTek MT7921S
 SDIO Bluetooth
To: Chen-Yu Tsai <wenst@chromium.org>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, linux-bluetooth@vger.kernel.org,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240412073046.1192744-1-wenst@chromium.org>
 <20240412073046.1192744-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240412073046.1192744-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_010040_271303_F9BC6DBA 
X-CRM114-Status: GOOD (  10.45  )
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

Il 12/04/24 09:30, Chen-Yu Tsai ha scritto:
> The MediaTek MT7921S is a WiFi/Bluetooth combo chip that works over
> SDIO. WiFi and Bluetooth are separate SDIO functions within the chip.
> While the Bluetooth SDIO function is fully discoverable, the chip has
> a pin that can reset just the Bluetooth core, as opposed to the full
> chip. This should be described in the device tree.
> 
> Add a device tree binding for the Bluetooth SDIO function of the MT7921S
> specifically to document the reset line. This binding is based on the MMC
> controller binding, which specifies one device node per SDIO function.
> 
> Cc: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



