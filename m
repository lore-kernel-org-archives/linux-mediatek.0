Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A6CC7115D
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jun 2025 08:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6dytGOT4dmF1lEUoP1fMW1tNejx8UKxC6eLzzb7UPo=; b=OdWLB4O5fKvPu9RWbmNR0i344I
	VBB0k/eFpgQwzKhkOTEG45v+GWPYJ++xNnw+qiWEh5yX94hraH0InJisSQ88+Dyq+W1Pg5A6HMHZo
	Is7JsgpAxur2rCWM/dNoQDGb3w+4SEhe0Fx/pNzXCt9fmiWKJhWIkT0KvPPMSOuqmmakchrmJOABI
	1zgh5L6fw72TvTqWVyZTY1d80wyD/vKFM7DvB1K5AaSUCZ7wGUdwe0Ba8Ltv8++uWIqTqUDqQUrzz
	/S/7hEA7Fk4lVFEM2s/NW4sa0FFCpdsua8hUDlwnfbrKPAEdIdmzCWXsdTLwt3Blky9GBTWu1T0vr
	uIYK8kfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcnB-000000022bF-3ptg;
	Mon, 23 Jun 2025 08:44:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcdz-00000002147-1NuN;
	Mon, 23 Jun 2025 08:35:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750667709;
	bh=35i94WQPeCQMWaQEOF+6oteQPVu3yuDJq4zvDX2DSKU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cgBalYUoaAz+rwdk95p5gTmgaJPASLpd6yzel1ek4h2zrXaBTW980IpLM+rEEnq9d
	 orgAF14zmcpZ/WHYedyv2OZrP2h0sieF339FpARklvdVoLW4+Q+ZT9Px/9HjPT/K9Q
	 sWPIE/aeTLpYsulMmm5JnPmqN0mrJyFmQ1ypluEBKlKPZGAY8l9/UoJB/OQUhuc1E9
	 ztcnTt/dner+0C3KhloZuOuJssHjd8cdkuWRweKRBN8JJbXvMgm9XVZiLOa3mg2ZKJ
	 sePSWI2TZAtXVtPTG1S8S2i1711g6+dmNTTwoS54KZnx246KcnRxOXAsgTErxg5VnZ
	 JLPeudnHUu4fw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F03FC17E017D;
	Mon, 23 Jun 2025 10:35:08 +0200 (CEST)
Message-ID: <28085813-5b29-48af-8e54-5bef41ff659e@collabora.com>
Date: Mon, 23 Jun 2025 10:35:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] dt-bindings: interrupt-controller:
 mediatek,mt6577-sysirq: add MT6572
To: wctrl@proton.me, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
References: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
 <20250620-mt6572-v1-2-e2d47820f042@proton.me>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620-mt6572-v1-2-e2d47820f042@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_013511_544459_9097A33F 
X-CRM114-Status: UNSURE (   6.48  )
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

Il 20/06/25 17:40, Max Shevchenko via B4 Relay ha scritto:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Add a compatible string for sysirq on the MT6572 SoC.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



