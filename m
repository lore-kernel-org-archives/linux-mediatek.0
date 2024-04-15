Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D39BC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 10:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8YdJOdb1jUdNhP90z81BZGu6aQkspNbghuEISX+iZ4I=; b=EjWOxNllTGpWoX8PgNM/rWX6t2
	lUjCoQ/nNpaYWH1uWrKvHMjsUU2NtD1eH9SWbAOiuG4NI1bM+NLB6lojshyMzeNQ11aEE6cdb74my
	8kpOF66mdrTofRcdSPiaRSm1r8NAh2Tp6skStdcAy5AQRWG3A2AP3ghIWDKNpKLPHsEJUd+uvwnkF
	/vC3pL4pojvI4h+PpXPhp6zSi4shnR8E4GzJVyP90AlVGKldLlHPU+5s8du0SL0zVTuaIyHudsBBv
	H+5eF+36W2nJo5DAUGPRZAKmH1qSk3l5dC08KU/60+O1YgeQjMfpCcMKW6FZwFxZfnVUnH0xJ/4v6
	55R4wYwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJei-00000007sgh-15pE;
	Mon, 15 Apr 2024 10:33:44 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJeX-00000007se2-2Wyh;
	Mon, 15 Apr 2024 10:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713177211;
	bh=hx5s8YmotvAhrLtLSctDiJ/fC4X9KfCW0JvNJiLtpmU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rnyFditB0BzFnFzj7LFXWWjVfcWdO2ownQtAnHtW/RJuScVy0ut63cuuSBiiz7uVV
	 eta1WWQGEXVAKq8TCju4WG4UwC8Qd5YkRHV5goSGmRrl9guqozlZCNb7h979b0HqrI
	 RtgNugSCXoO3MZf+7JcCUOPtwCqoMesh9pb8QePmCMgH0ekuBWzsY3PvP7MhYOW5B/
	 7y8likFp4trGknm1qAS7rd1HemBVb333JejXJRbJojkLYcmFXSSt/Ec1x8HTJsN9PO
	 ESrIPmGwUrAuiccmLQXZnmWjQj9Q4dVnmoCEkBtOVfyOXQJb7ebFo1FZKW9e60iiT7
	 o0uHgCje/szhw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 64001378042B;
	Mon, 15 Apr 2024 10:33:30 +0000 (UTC)
Message-ID: <799428ae-83ca-4c91-89d3-8cd1b489bbf3@collabora.com>
Date: Mon, 15 Apr 2024 12:33:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: Drop mediatek,drive-strength-adv
 usage
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240412075516.1199846-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240412075516.1199846-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_033333_822139_51CF1204 
X-CRM114-Status: UNSURE (   6.78  )
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

Il 12/04/24 09:55, Chen-Yu Tsai ha scritto:
> The "mediatek,drive-strength-adv" pin config property has been
> deprecated in favor of the generic "drive-strength-microamp" property.
> 
> Drop or convert all instances. A value of 0 disables the advanced
> mode, which is the hardware default.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



