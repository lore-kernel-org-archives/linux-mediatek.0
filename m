Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDA4C05023
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 07:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2VPdUWG5Lus7CUBcd8XNvPeagopSHn9WkTx872oXsI=; b=m8+NTC29hYjKhIaPtMqTH5J5+J
	N2mAvQRSW1bJwgkD3dMi87oso0D1n82p87cWvnz6hGOK1/YDM61Gte6Td+JgGMq6/F1MiYRDzQthG
	b3+ezIC4zQc6cBb2GEiYIkA1snElVDZNCa33wBKeBrfEeu+JbZ8y1HVFsmpO9jinSR16MYnQQLwel
	EI6xhC3PEB6mGdWZ1GEDRuiwa7+tRtpMsN0na2a3moJ68Q+MSP35oHu0ytQWKZ52Y/AVhlfxYwn47
	sqzzKUrRjNqXpngyL9T0IXr0cH/G4cwUdVRhil0rVDVLKHtHHBrwqjKtu2MySBMyIDmmkwM2weKvR
	bxOm4+5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxifJ-00000004mSD-0Qe8;
	Fri, 19 Apr 2024 07:28:09 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxifF-00000004mP5-0A7c;
	Fri, 19 Apr 2024 07:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713511680;
	bh=zw7eqyLTCYpzLSY9EaMU3gS3464AZcknyXMq4TOLyec=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UjQ/y3acphHaIV9MFM51DsH35E4dA1gORYFEcz4Qnyf/dk/UoB2DoB0FpEp5wfqEo
	 tVQ5/EoySNnmwXsb/XsERTyqU9vQkDZ1XY2VuMK69r52P/tP4nBmVoRfdPMRT/SCBl
	 hxyv+E5Lt/zNe56ubf6Yia265rxvNCyledkMfHhlMwWgx4EQwj4tkapmC9biiO3oVh
	 hwZhmhZ8+RtHkaeMOc8k4s1N6Kn+t8UGVH0lFT6ey+Pr2B0+lRuOIhQ/u3LSt4ZU3P
	 UKdIj6jc9ec/RSlrXve14FNY5jw3H0P0so9o5kvctHy9Rv7PAt2pGGpBLu5XoZiYd2
	 HPa3xeGW8lJMA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7C3E23781104;
	Fri, 19 Apr 2024 07:27:58 +0000 (UTC)
Message-ID: <49399153-bf70-4709-b020-f40e2654a53e@collabora.com>
Date: Fri, 19 Apr 2024 09:27:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/17] dt-bindings: display: mediatek: dpi: add
 compatible for MT8365
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Fabien Parent <fparent@baylibre.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
 <20231023-display-support-v3-7-53388f3ed34b@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231023-display-support-v3-7-53388f3ed34b@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_002805_224705_962E24FC 
X-CRM114-Status: UNSURE (   5.29  )
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

Il 18/04/24 16:16, Alexandre Mergnat ha scritto:
> Add dt-binding documentation of dpi for MediaTek MT8365 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



