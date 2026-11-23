Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153C360A260B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 09:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P5PfX+DQ;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=XsEEV1cv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tMwSrV2ZjOeBiqelWNaRKRM/bJC/BjHhSGkPihEQE4o=; b=P5PfX+DQxqbVUL
	d6KYhhrP7ZRUNSvO89RXSFIyooUsklfzfmPw1whyuSRtcln+eKrlbPORfU0x2pC2BohsNKkiwKKYQ
	4r5yl3Mf7a4E7536YeNImd3XBuMN/+aCVS9b/Rt0HujfNI07nb3ZEdiUKn9MpQzdV0NAfPPefvxRk
	/zpy5DastmxSVjY+QgCjE6bZ6fK/Cpbp1B9sW3b0O2NPD3PXVXw/g54YOkAxFVA8+yyUHgEka1s+w
	RLgnNwp3WUvJ/h7AobzNq2QYhWAq+xutx7++Km/qHcyHHAFr6Jjnd12VnlUy+oLHQxI0Q1gBZSALj
	2IS5hzLqsB2m42aoNa8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQgT-00000002pIU-1QqV;
	Mon, 23 Nov 2026 09:50:01 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQgO-00000002pDV-0rWG;
	Mon, 23 Nov 2026 09:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795427394;
	bh=dEpbWbiWtLxirOo3e2Y7hCJY0RRBzW/Rgxc+4UBphNw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XsEEV1cv0fqWuh+8ZuPPCMrRGNWlKv+AaTbW/j1LNcnpOVToHvahyGCnwToD4wPxl
	 meEfKwqBhJTlnynQSvzh13ov3p4A/TaM9H2Pe2OFDDhrNduv/ZXahQVmzP2q9s1ZWB
	 SSZ6elK/gct7HR/vf5ywMBS1aYj9ByoSil15qI4Omb+YkpScc41uASC0btHGAj5iQm
	 Fbva/+qWSGoAjH7X2JtSc3s1T7tp5zjDiT9ykceUFm9XP5kUKE+cYm2CQWXz0r/ZCl
	 lRaHivzB+ioSSORdbbc4nEfr5ZwkmLLL1+/8WGMP9aczpmf5e80J7NY9EDjZdWu+nW
	 2tPYpjCJb/r8g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BCF2817E04F7;
	Mon, 23 Nov 2026 10:49:52 +0100 (CET)
Message-ID: <d4ae0697-2d1d-4c8e-b160-fc8389898121@collabora.com>
Date: Mon, 23 Nov 2026 10:49:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] arm64: dts: mediatek: Add MT6895 SoC
To: Alexander Letuchiy <asalde.le1@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
 <20261113-initial-mt6895-v2-8-4ab0aa9fa391@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261113-initial-mt6895-v2-8-4ab0aa9fa391@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_014956_418286_700CEC7E 
X-CRM114-Status: GOOD (  14.32  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/13/26 20:05, Alexander Letuchiy wrote:
> Add initial support for the MediaTek MT6895 (Dimensity 8000/8100) SoC,
> which has four Cortex-A55 and four Cortex-A78 cores sharing a DynamIQ
> cluster with 4 MiB of L3 cache.
> 
> Describe the CPUs with their caches, PSCI, the GICv3 interrupt
> controller, the CPU and DSU PMUs, the architected timer, the system
> timer, the pin controller, two UARTs, the watchdog and the keypad.
> There is no clock controller driver for this SoC yet, so the UARTs and
> the keypad use a fixed 26 MHz clock, and the system timer a fixed
> 13 MHz clock derived from it.
> 
> Only the CPU and cluster power down idle states are described. The
> deeper states that also power down the MCUSYS or the whole system need
> the SPM and the vendor low power driver, which aren't supported yet.
> The system timer serves as the broadcast timer while the CPUs are in
> these states.
> 
> The cache geometry was checked against the CCSIDR registers of each
> core.
> 
> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


