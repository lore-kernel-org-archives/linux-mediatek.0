Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4177AC77B72
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 07:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQEO56cHNurnbyrh46F5kNGflf0wq6c/JVNtTzZVaKQ=; b=DBpIelg7z+HgR4t1JP1kH/+xvW
	+AWFJxhIe9P6Rfxp7PC7LDUM+D4vVnO/RJRUWq1dj/UWo+MhegxJV78FcOSiGr+yUMCHvdyRSaW+X
	JD1H6RfBarroMwV0MLA7ZS0UwSJ6V2z916g+peP4yz8qPjQPDc91wWBiojOSA5e574+xkBexIJsnT
	ayY4elPLrB7sAWpp9UNk1xzm8kLnwl/5kctZ1RBRTd1O8WIoJEm5XL6sh6Md9vmgTB/ChuyhNTqqK
	5VqLkognGpnm8uToQPNxOyt+9REdhuMsmUeIJWr6vuPzknq+R4PgbNou0e/zaVA7wJBxMvg3PaNBn
	X6wAJm+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppP1Y-007JWs-2m;
	Thu, 20 Apr 2023 07:48:12 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppP1U-007JVR-2X;
	Thu, 20 Apr 2023 07:48:10 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E413A660311B;
	Thu, 20 Apr 2023 08:48:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681976887;
	bh=ve3558rEueim/3DSO9HICQByD/TQeBsw1a5e6r6QaCM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=XJT/f7MLZtDmbcF1Y65jzSIVFsO4NYO1j7sksvk2HJZQXVE+Y3AuCURqxGcRDBRiy
	 fpXCE9jpmWLFeSVcioL1QlFZFv4m9GTF3QQo3Q+LFlC6GobddS/gtAP7y9ibSJqs5U
	 w+8yDDYbjgeeLboD7zTNOoa6ykI+DSX+E2g8YCP5jMfLarDvC3p9wcyLbZrfVg8+/7
	 tAGl4rNYsyIhIVq99hq9nNzBJfrT9RNBYEXW9PX4qTHl6JpZgbsmQoptj5samKTeiH
	 34rwFBAAPv6CowhEnrOrHA6P1Ou7EmuEDiiIEkUfZVYaglkdFfBX2YMU1s5Z5Xyl6W
	 iTHpsOtvu6Elg==
Message-ID: <48aace56-0965-b111-7644-b00b3dd7dda6@collabora.com>
Date: Thu, 20 Apr 2023 09:48:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] dt-bindings: pwm: mediatek: Add mediatek,mt7981
 compatible
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>
References: <cover.1681932165.git.daniel@makrotopia.org>
 <4877689269af862ea9ddd199d8aa96b2d7fcf6fe.1681932165.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <4877689269af862ea9ddd199d8aa96b2d7fcf6fe.1681932165.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_004808_952525_23301BDB 
X-CRM114-Status: UNSURE (   9.83  )
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

Il 19/04/23 21:24, Daniel Golle ha scritto:
> Add compatible string for the PWM unit found of the MediaTek MT7981 SoC.
> This is in preparation to adding support in the pwm-mediatek.c driver.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



