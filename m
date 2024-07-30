Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1986FC3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 09:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVM4JJGu3yecUXxU4dtaQTi+aV6kAEuBhkcD63jOzT0=; b=X1mi7VpuD1KSmuU9u/ihzfQ4Kp
	o+zQsXFuYxfgKCz62D+LzR9MP861p/crOJ4LsqSKSZ73qvPlC29BbA+3xvI7yheHRtfnkEcuw5Kml
	mpujLwhhNoruRL9+UZnvu+12t99h86Q6VLC1aFGUIl8aTgrwo7ud8mpP5tOYTMfH7wOy26D08UXgu
	ZZpftw77wtRUNxCskbYp1UsUVb7nblD+ZlazsVfn+Pah4tRAcqgMthRRhCk9dCU6ycVQG+E4hUdmh
	npj6iKmjFE+EdlU7uevg3A3KuOlJtUPdDjUZp5TLd45gP7cwaHsZbghIy8IKzNcXHP5zPBKfE6C5c
	zHzp1HCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYitx-0000000ESjo-3AKC;
	Tue, 30 Jul 2024 09:12:13 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYitV-0000000EScA-0tHT;
	Tue, 30 Jul 2024 09:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722330703;
	bh=VcHUV45OnR/P4rH+ZMKCrwA6z7qM9dVHe0VZ6bJuT5E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=03U7/hSjHPnwcRt2nA/bVEJReHSHah/YVmM+DP5olTU/asgL+dWtJepumPCVLHIhl
	 xLL++d+KPLMWFnQ1wJfqO6GdNJQYFPuMh1mcxrkTybYFlLl947NDTJAPPk/Mr5iqBp
	 6sElZDfC1Cp7zDu7NT96grsRBxFqvm933xnZLZM2DZr1AAFNK25NVvxjE3FkGp7ilH
	 XI1RcpfnGphQf4CY25dqc6dTzhqI2dPzWiNVi8v4kDsI4J/FIGlHWtb60AlEMsi+EK
	 6jhKUMqzX+ydzlcNFdK20Fn1BZ5c18gbP089ynGfOpY2MXOicznkJsguJDmzftWV/v
	 Gitu7cmJSaPTg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DD31D3781360;
	Tue, 30 Jul 2024 09:11:42 +0000 (UTC)
Message-ID: <7773be18-a767-455b-8914-4e84b578a8eb@collabora.com>
Date: Tue, 30 Jul 2024 11:11:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt7981: add SPI controllers
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Leilk Liu <leilk.liu@mediatek.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Daniel Golle <daniel@makrotopia.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240727114828.29558-1-zajec5@gmail.com>
 <20240727114828.29558-2-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240727114828.29558-2-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_021145_395714_3631C602 
X-CRM114-Status: UNSURE (   5.10  )
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

Il 27/07/24 13:48, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> MT7981 (Filogic 820) has three on-SoC SPI controllers.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


