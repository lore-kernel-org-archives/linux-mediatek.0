Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65125C48BC3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 15:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtqjDq7b8wcrDC4AGAD+cNM6sQbHlLHki34HivSo8UE=; b=H1iQPIhr3fiSf9WsWP9AaDN7Pk
	o8NQGtV6G35pW9gVhskkxdkY7xST/nXx3sdaOCYljoLRFUxn/b2ne1wmEqzWd7A4AmRsY0iDmlgcT
	Kht53VCaNA4KqtNr1HB0r8cEDBAE+LRI6xNzNmXNDX/vaFKtpRXzBAeg1xw3a8FZUpdt/rehXOstN
	nMISDbpPrYbbYeo+kIQB8ooNnerhflI17yGnmkHcHW0Nvkt4b8YzL9foNoSnAiBDZgLFgqLXrCHTS
	f1jHbdTD7+JvIsHvEN9Pzp1eUBdxxaFGbH63xr5eqFW6I1SiSW2UAOa4qtJ9T4m9XsysfHSCyUoLT
	6IiJJViQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raHdX-0000000DPMq-3uI2;
	Wed, 14 Feb 2024 15:57:27 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raHdU-0000000DPLT-29CE;
	Wed, 14 Feb 2024 15:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707926242;
	bh=9S1I1UJjz/X6ER5LhtT7IGanpvGoyXhIkt7y7jddGRM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ChCecnFtsuu89rAx4oQVrab/J7YJwvcBTw7poUim+4V7Jh/s9CaJ7kvywmUU3WCjL
	 duyRWlOvU8VNDpkvnV2nHr+SKCdSvF5fX9GdEDC4MwI0SbL6k2jqK9NfwLd/WxWhbu
	 d+jfED/0i2tVJQHpocJ1Fmtsvuy9vmoHE+rTsqrdloypio1kwatMgjdu1W2EwxoUXC
	 qZlNrwEC05xdXUMQBJV+eAqh4SxbI7eP/+S1s5DiAPyE3rp9mTJKwFPMQxS+qJp3gg
	 RjRZSqC9FP9kIFgiqG+gJP7siRfIbsV+wepS1oeWv6LBMWJF7Xi4IP4zMzVU9WSWOY
	 mvyj/c67OmLJA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A6AF93780894;
	Wed, 14 Feb 2024 15:57:21 +0000 (UTC)
Message-ID: <137bc832-80fe-4dec-bbe5-caca2c1c5b97@collabora.com>
Date: Wed, 14 Feb 2024 16:57:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] dt-bindings: pwm: mediatek,mt2712: add compatible
 for MT7988
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, John Crispin
 <john@phrozen.org>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240214140454.6438-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240214140454.6438-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_075724_872950_BE01A12B 
X-CRM114-Status: UNSURE (   6.30  )
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

Il 14/02/24 15:04, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> MT7988 has on-SoC controller that can control up to 8 PWM interfaces. It
> differs from blocks on other SoCs (amount of PWMs & registers) so it
> needs its own compatible string.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


