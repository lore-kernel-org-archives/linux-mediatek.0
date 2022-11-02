Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8829AC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 09:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94lKhMZJjthMOtl8dzM+48sXJwhdmAoczjEvD4TnYik=; b=p5PeTKeK7qChIX536d7/vL+J7V
	Wl4a5R0TCBr/F+qI0bU5J+OZ2cKpHoM/A2T9CC65/sZB8KO+lR4Fhb+27/KGQi3NTPHw3cF+a3a8g
	czD3mn6JwKvwo7EKGYP+pBy2Pw75dDJ+qU7Mw+YDLpdxp0vLZo5tdj5pJ7JuvhS2SD2H/rGByULkR
	jfYglcenIHDg9COzKEbwuHjOvGZDUpw8DHJPsPP+NpQ9vpdjvYAtHE2LUebd0aUkCAgDtO5XCrErN
	sUePzdqlxKyRPh3S3e3Kh6UU4QVeoZrgeXq0XtXFcPjZo71uNDsFJPJ+fExGY8hJ2i9z9lnZGWR+e
	rQo6p76w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq9d1-009L8c-Mm; Wed, 02 Nov 2022 09:01:43 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq9cp-009L0v-JC; Wed, 02 Nov 2022 09:01:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5819F6602929;
	Wed,  2 Nov 2022 09:01:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667379687;
	bh=B3S5ofvq5lBgOYCzOV4yVG6oWPC54xPQLQoltYPZikI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ESnzgT/r7UP1N7AQGWxxtrlqvyB8qs7KPLjxgUkvh7JTk1fZwC+0rZB660jBLRW3q
	 aQnSvFDR3Zh7Au8A6yHDARpl3ttYVfj1aqbZhaGrFXXj/NoEGVdRy7U8lv9k57LkI+
	 ReO2PGLXGfLVG5Rt2w3mYKh/IIC0BL/kH4nGmNw21ecz5I4AEboU3lG9yEK/DLRIPS
	 NMDA03giCBftUj+RwS13C2s8XAujF95q6UYlb4Hm3tIEu3MsNe1SRIeoDCK/0fZTbB
	 /q45z79DJzHY8ALw8nl6lxnsuoZXEfCu9RMPtoHsZRRWBPZDcrfTtsps78nXhEEwE/
	 K+Z1kK8Z261Mg==
Message-ID: <d73a9850-07fe-e6b1-33d7-02da2ace9b54@collabora.com>
Date: Wed, 2 Nov 2022 10:01:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 3/7] arm64: dts: mediatek: mt7986: Fix watchdog
 compatible
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: nfraprado@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20221101090116.27130-1-allen-kh.cheng@mediatek.com>
 <20221101090116.27130-4-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221101090116.27130-4-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_020131_789192_12DB34EE 
X-CRM114-Status: UNSURE (   9.22  )
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

Il 01/11/22 10:01, Allen-KH Cheng ha scritto:
> MT7986's watchdog embeds a reset controller and needs only the
> mediatek,mt7986-wdt compatible string as the MT6589 one is there
> for watchdogs that don't have any reset controller capability.
> 
> Fixes: 50137c150f5f ("arm64: dts: mediatek: add basic mt7986 support")
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



