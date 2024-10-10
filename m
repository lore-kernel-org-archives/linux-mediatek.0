Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463A0CF11E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 13:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q6XjRudogF7lJF0Cv8PQF6nqEJu9dn1W8aqjF+Ksrpo=; b=r91vTFJd2FrbTJQ+m56kZoQa6+
	wZ3LNp7mvFQf3fK2bIqoEs4lYKUXMijsPYQV4IwwACBS4BqoMq5llrr7On2vOHfbDF3Konx+703se
	VHsYBg+ff6yJsTc0VHFCKEvVR9e5+VlWXAAPAVXzIugJWPxqUh0UvjtrB2ltxLZuEI+vZdT7JMBd+
	sCl85/baFKE8bdyhinoeRrlEBPa6yMq8+fS/sph3e+dKG0JWtQzOWZ7LYyQWtudDa57EiYNesK6zp
	VHPp0JDMT7UuVwI6tU2scs7NQDg1nyXLAL/m5onvBvoPEOGOEiO/qaWP9lSZMXiiIu33PyU5SydTl
	hxXXF73A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syszV-0000000CsE8-3s4R;
	Thu, 10 Oct 2024 13:14:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syskw-0000000CpHq-1X1g
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Oct 2024 12:59:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728565140;
	bh=q0iEWP95qwwtGXsHq48Npy9+HyLqfY/XYIOSdxzTgaM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=laEKuPAayGim8pWgwRekogrjcQft5YoywLWptCKTVe+STMBrugzS/QVfiWVb2ndaV
	 d7GVSzFgGp7m82Nb5hxMNI9cTGaYoZf1lpxqDm9zQbvZcxgMosZSUnCjwo5QwDOo9C
	 WNYqOUiAlJfxUVdBZzuYYCsSZWr5KOjZWJBV5VB6vNPyHbPdIIIpVprACCM4KdfrF6
	 Gt+N33mHLjCPYzDwroQIDTJU3k8MOAJJxL2lsRomutci3WsYL84uh0mZpObqJIgsEf
	 FwPgs5pCugfKjoLA47svNZ7lxHd6LuVD7w0W6evhOFNK8qa13L0ztpfF80OPSCOg9p
	 nOWCZONvmn2KQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EA01817E35EF;
	Thu, 10 Oct 2024 14:58:59 +0200 (CEST)
Message-ID: <d74b0ce0-f0f1-4088-a036-f4872ba87a0c@collabora.com>
Date: Thu, 10 Oct 2024 14:58:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: clock: Add MediaTek MT6735 clock and
 reset bindings
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sam Shih <sam.shih@mediatek.com>,
 Daniel Golle <daniel@makrotopia.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
References: <20241010124529.78460-1-y.oudjana@protonmail.com>
 <20241010124529.78460-2-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241010124529.78460-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_055902_588914_42078CAF 
X-CRM114-Status: UNSURE (   5.90  )
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

Il 10/10/24 14:45, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add clock definitions for the main clock and reset controllers of MT6735
> (apmixedsys, topckgen, infracfg and pericfg).
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


