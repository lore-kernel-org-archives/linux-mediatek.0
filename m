Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E1EC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 11:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dqMvfAfvPFSl16dTW9kYSMhQwEgZ7RSlx8z/hxj8qbA=; b=RpRH20ZUIr1bIJPP7SLKfQ9Cdx
	CC9LY3S0oNblwQDzvB0Ehl6MXTteT4vPO8JpsdgUQoyW7RiUm1VA6W0wLekKMfblEGpv8i7zFNmPq
	TZivuRQ7wgUZ88Pu8I+4NjgR5IrzmrIbJ9lsDnc4qYn0BdmE1G5LVhiqmaSZlCZkPfToINJxZIdLc
	kskkWHG+tIpnqi73jB+lA2TzJL0YYnQrCYylWWk2kMGfMnDXSQylCWHKHfRLTPVsD2fREOcS/uUup
	mlLXTlitMOV4WYgv5q8vmqmk9/rfe7gjSRBa9Tn42d7phnTQBM5PQgOoQDIj735qXsyY5zfllGcJp
	ryJIVrrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXvA-000VQW-U6; Mon, 14 Nov 2022 11:46:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXub-000V3R-0m; Mon, 14 Nov 2022 11:46:02 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 67882660232B;
	Mon, 14 Nov 2022 11:45:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668426359;
	bh=RYjZ3sdJeNZGdnIwnc0jKWFK8+Y+5HTVCty3jpMDWQc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gfPMSeoVMTMEFgqAF8/Fn7rxO6gIoSQDRZdyE/bhdtfx8mXIwApkmPrxAV4l4fKom
	 yEIKm0vM0cgymem9DdE3nL+3JCzA2u+GTQE5227qLu8otO7hvM0yPWRVcV8acRKwV5
	 IbYFj1K10eKqz0N+kRw/cmWqL4p18yszeicX6VlMaUHltSp9ztR5IlJxt9mX6b3W3D
	 ECH1ITDJqIf9QZgatRKwjrPC92/2mB+wSrYW3Mdo+4zdpKOL4mJYwJ32NlvUnFcUjH
	 VayVZiDQJJj6v7v9bKsgpjsswbPC1FOiy9AgGeKrrmQUBTVEEUF+R+zOhINrGe1/Q0
	 LfE50+Tz4UOBQ==
Message-ID: <fdd2c144-6c71-734a-2209-948f9ef5c6e6@collabora.com>
Date: Mon, 14 Nov 2022 12:45:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 03/11] dt-bindings: usb: mtk-xhci: add support for
 mt7986
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Bo Jiao <Bo.Jiao@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20221112091518.7846-1-linux@fw-web.de>
 <20221112091518.7846-4-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221112091518.7846-4-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_034601_276394_5E92D8FF 
X-CRM114-Status: UNSURE (   7.30  )
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

Il 12/11/22 10:15, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible string for mt7986.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



