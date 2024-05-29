Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAAA2C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 08:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1ZUv6biZbluO5Ifq7QEebUIkaSSeblJgbjo6c/0cXM=; b=jzPt1TZ+CeW83cAOJYhyg/9mOV
	++8sSKbw8K/ACOjuAMv7mkljTTtvvtIVIN7RuI7/Akvw8iFT1k3wL63EEkhhMY5Eq5PXo/EPwiFbU
	QQ7jtor5eZ3wfkgFqEDEcwRrmdawHbzilyuaGC2/LtniMIM8n5VbHYeatBCK0M3A/5Fy8fOkUVK66
	VlcWyGY33X1bQhKex/6J3AK6DHwF/yXuLH2WCPRay6mgS+7VuHySm+ofTRL7Ktuny5zXc/5BG6OlJ
	SKqhXZfh6dZUuSHayVgPTKm9VPQWQLzBD2gyXhliOMCOSDd4MlSkweOMDChc6edoPrjUGum/88s8j
	wxH/7M3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEVO-00000003L8E-0nzf;
	Wed, 29 May 2024 08:17:54 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEVI-00000003L5Y-3oJ1;
	Wed, 29 May 2024 08:17:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716970667;
	bh=ifalb+C1W/X8LfMDch31OTT37glgZWacewpzUz7P2ig=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DN/ZQ/vUahdns/OJxM9r9j/RwhYyeTwYyycbwXDc0Yx9h27RI24H/qO+eZaQIGFYw
	 w0XEv4S4WkgOtNHvzzeg6o8as2rCZvlpN/SZ3Q3sXa5Utu9+K+ZI+tRUgBv6+//e0Q
	 pekm0oPkS4b34RugoLtmdVuYCQwD/eLIK0SirrywBTw/Ta3IiGEOXHomhHaciMPS86
	 zhwAyXl63uIBmzZQy+ofSIj/WntdqejJUlnrIis30H6lSPAyqbOwxBI6Usg97b3pXb
	 W/d80uvbUDMpcCwLn91dxYixZ4d/nLL88De2qlY8YsBe0aEEOdsU8TCrhiFI/euQ0G
	 aTh7Mj11qgm1g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5C72F378000A;
	Wed, 29 May 2024 08:17:46 +0000 (UTC)
Message-ID: <75826085-fd59-466a-b1de-b4c323c801c1@collabora.com>
Date: Wed, 29 May 2024 10:17:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] arm64: dts: mediatek: mt8186: add default thermal
 zones
To: Julien Panis <jpanis@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Nicolas Pitre <npitre@baylibre.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20240529-mtk-thermal-mt818x-dtsi-v6-0-0c71478a9c37@baylibre.com>
 <20240529-mtk-thermal-mt818x-dtsi-v6-4-0c71478a9c37@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240529-mtk-thermal-mt818x-dtsi-v6-4-0c71478a9c37@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_011749_119253_651F3C04 
X-CRM114-Status: UNSURE (   7.76  )
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

Il 29/05/24 07:57, Julien Panis ha scritto:
> From: Nicolas Pitre <npitre@baylibre.com>
> 
> Inspired by the vendor kernel but adapted to the upstream thermal
> driver version.
> 
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> Signed-off-by: Julien Panis <jpanis@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



