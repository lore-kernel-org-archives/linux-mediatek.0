Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1344C48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 08:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1/YPnj8c0qWfJ4BJv+RXuVwn4+kNGtQXlLVR3vfWSH0=; b=0Na6WOoDIWZbrd
	+nTkMm/HgfzJbISlbQm4iOOyOBBOIdTWe0qCIf3d1GBk0jAFVHsbtopIv0nnPnfu+tGM124uNB6a7
	/eMCKQyiz0AU5jKSXVebJZgC4FWVZ2evKKwIA74RczaKQ70kVeXQ6b40KN4wbN42iblvFnQTIr/gT
	8fIhdOK2C2hjgsP8m8YD+wVc1cW7CSzUbbFZZaasirpVBgIPvKDYk0CGiXYuRzHln03+qf6IcIwcO
	2xO3wLiPBaXnKedfVVpnSWqWKt+vz5EnI5eFDzMXyZyT9xp3iGzWe75N2zWAZPvnxALxpW9UMqhFE
	KOtKFdUDaSDAdFCaFQng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfc5E-0000000Ck2E-0tNq;
	Thu, 29 Feb 2024 08:48:04 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfc5A-0000000Cjys-0Ztu;
	Thu, 29 Feb 2024 08:48:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709196478;
	bh=mmWBDdhK273ffFAgPs7rWmE/50GwPeyqlWRJZXegMnA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=380yPiqQqqJKDZt0x+KbL2NbQ+iLD/BrHgNvaRrn5G2TozHwO2ZAvEyjIBOajnT4I
	 cdrMf8rpIL0zKbkoCWzQm8y1uSl0nSfN9NxGhirZ4IuaJoUGAGj+UmNM5is3kEF/dW
	 PFFTiv4J9LmmhsM7mfSz6pJzTW328bLnxgAYNzgdjln59757yKiInEKRi7FWQW7Nwm
	 PVKddXN9BVtcvAoMhpQXKg+JJb1z8DH7TIQvzYk+/90yVfHliWZNjoTaUPM0lrXyzZ
	 nFjDSmsSRgYM/6S/zPAlIBM712C6pfRaBBPjpHJRNE3jJC59l0djzSXoEmW5kYntXG
	 CP6Pgjopfnhtw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CA78437820DD;
	Thu, 29 Feb 2024 08:47:56 +0000 (UTC)
Message-ID: <96fafea3-d5ff-4568-a026-03d870b9f109@collabora.com>
Date: Thu, 29 Feb 2024 09:47:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: display: mediatek: gamma: Add support
 for MT8188
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20240229023522.15870-1-jason-jh.lin@mediatek.com>
 <20240229023522.15870-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240229023522.15870-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_004800_347854_BAD77E44 
X-CRM114-Status: UNSURE (   7.40  )
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
Cc: devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 29/02/24 03:35, Jason-JH.Lin ha scritto:
> The gamma LUT setting of MT8188 and MT8195 are the same, so we create
> a one of items for MT8188 to reuse the driver data settings of MT8195.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



