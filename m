Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEE2C77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 May 2023 13:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKdJCBoWrsPtM4638h0eaCOjCnPYwdR4oiLVuVpHtqM=; b=CgheKprvfTQ27RWBwlq0AGUPsl
	lbrj26rWrnlY2WQXz5aAAkCsooZqJgoVW82DDr4rJvO1zH+AI6749377hUMVg5yP05XD635FZz1aq
	uW4p3X2LkGFZGJj5w5GtIBLW0rec+7trgXIdNPLEdeZnRWjbQCZJyEwC4k4wCR7WWKtQg1oxr0jAR
	5NMX1EoGQdUMk4TZjIrAI8XmGHfvAr32kkh6o5JwN6AfyU6nFDJwhohwffqpfLbDN+a88OBWC41BY
	W+h8Kgqr9gEKzng7fBckpd1Xj0bLOcSo5FXZl0tjZ6X2LADG24xysZbG3x6qTEllQaK3uCQfL8lIl
	DXpiGNsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyuZd-005t0q-1O;
	Tue, 16 May 2023 13:18:41 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyuZX-005sua-0R;
	Tue, 16 May 2023 13:18:38 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D148866056FF;
	Tue, 16 May 2023 14:18:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684243109;
	bh=w/ACPYPClgMV0n2ZBBqGv3rjEfAKIsaw1K9m6yZKhI0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RFwSTdSD+UP3b6jxWCclnczShVZiBWC1Tz+rVhwxwA++3/UBVpw9CIQzWpDqo8DK0
	 bRfm7TI99Rl1byR+OS7ut3GvePajjPr+NJoQOqdR8b7D33Bi0dRkpFdXst1nHkL0gI
	 6YpzJc+dcrUgriTex6wod48HXH2039oqfaXO1cg17kfSOcFCn6KrQgaQrF/Qvw1Rfm
	 OgUxEXEmR1GCPRFSmAJVlc3QHC6BntWJQvLxiEw2aPyrTKkKP0d2MFwEmbpSDQPMPe
	 V9Av5w4SlTFoM19iaBSxxkKEiRrnVc781rTndS/1KKUK5zuI3S0Y47BM1CH20+gokT
	 vJQGzjgy4Dy5g==
Message-ID: <863513c4-c772-6083-b5af-e80c10a9173b@collabora.com>
Date: Tue, 16 May 2023 15:18:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 5/5] arm64: dts: mediatek: mt8195: Add
 mediatek,broken-save-restore-fw to cherry
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 linux-mediatek@lists.infradead.org, Eddie Huang <eddie.huang@mediatek.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, wenst@chromium.org,
 yidilin@chromium.org, Tinghan Shen <tinghan.shen@mediatek.com>,
 jwerner@chromium.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
References: <20230515131353.v2.cover@dianders>
 <20230515131353.v2.5.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230515131353.v2.5.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_061835_321898_8CD9FB86 
X-CRM114-Status: UNSURE (   8.88  )
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

Il 15/05/23 22:13, Douglas Anderson ha scritto:
> Firmware shipped on mt8195 Chromebooks is affected by the GICR
> save/restore issue as described by the patch ("dt-bindings:
> interrupt-controller: arm,gic-v3: Add quirk for Mediatek SoCs w/
> broken FW"). Add the quirk property.
> 
> Fixes: 5eb2e303ec6b ("arm64: dts: mediatek: Introduce MT8195 Cherry platform's Tomato")
> Reviewed-by: Julius Werner <jwerner@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



