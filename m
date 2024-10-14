Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FB0CFC501
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 08:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4Mb4PDaqGtgz9tjpmej9w9p75yl4s6V9hUt0+CuQTQ=; b=eOHckKdUBhBEoxrNq8nZcaHlC1
	dzBBt4JmRBiKRMlHIKIfpvxRApQRrr6VNbtR2BMjP8H5kHD22oDyVsNr6MXluECvbSqUBU60Min9X
	ghbLyJup5SXdcov7JP3you+ouvq/721uXHKyZm+sGhcGp5InT9wGzto5lQZ1p3TkHOsO0/UnX8tHe
	C/Mx8yDi+raXtN/JG139lN1tJPKdgHsd2MqMXrFc+8PKubae6VXb3FDeqQ/sxdK0vmNyW0jvsjdnB
	YIYDJC2pe6w+eSTCXTuMLDu7yqS5XO6AbXmUPXf/bKtcKNTxOrg+GxIXAcB1/D4Y1CVRBH1OTNcxQ
	Am0PiruA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0GG6-00000004ESx-0hcn;
	Mon, 14 Oct 2024 08:16:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0G2L-00000004BoS-1MBL;
	Mon, 14 Oct 2024 08:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728892959;
	bh=TiyIYQOnUmjYuNLI/piusrRlbrSO+PoMNRcujoAwCIA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ENZfHS7CkT3hcy98SxB90vy6qSep8i3IKBeBixNCiGea4ebJxxEUahkGGjpg5Pk4l
	 We35a32Fi7vZxgzKZ6w/de2LWn1G1MoY3Oaki9vqPYxYHjnI8UtJAZ3OWNPLlMelgw
	 ND5TLo9zXSpyeEOBIQ5YBc61WAjsatRSxgAyl2Jc8THNmJF8JSD7sNq1lw7aXQ82rT
	 elwrvdV7EpvcOzk+7FNtOc8n30pBdCgeLu1dtOUgSbbBpTRCOdQ5kIUoUfHuM0L49f
	 HfwjOk2VIWyYszgj2YxDoShPpQwHE0buIQTJKFOFw2nc4bXamZfPmzas5wMyH6u5Zl
	 mshpveiFzvGoQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 342A217E10C2;
	Mon, 14 Oct 2024 10:02:39 +0200 (CEST)
Message-ID: <ea864524-0828-47b3-aa10-aa80ad993ac2@collabora.com>
Date: Mon, 14 Oct 2024 10:02:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add
 MT6795
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-4-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241011120520.140318-4-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_010241_698152_FEDBB5AB 
X-CRM114-Status: UNSURE (   8.74  )
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

Il 11/10/24 14:03, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Combine MT6795 pin controller document into MT6779 one. In the
> process, amend the example with comments and additional pinctrl
> nodes from the MT6795 example, replace the current interrupts
> property description with the one from the MT6795 document since
> it makes more sense and define its items using conditionals
> as they now vary between variants. Also use conditionals to define
> valid values for the drive-strength property as well as items of
> the interrupts property for each variant since they are different
> on MT6795.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



