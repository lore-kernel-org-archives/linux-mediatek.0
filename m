Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D79C41513
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 09:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJp9ULJFgAOQxAZtEtcli4fmEeIuvds+f6gE5b8MyQM=; b=gtgV0vYgtCjUsU
	TFAyJygYKG7XFqmAanHLI9UhEipjDa6XF0vMrF/QMg3TzOcNFPRg8VbRPc1/2fRz8o9YmysAO4J/K
	LIBo0Cr+K2cqiFKiJv2mU/IRpe3XJlGndzpvpw6OWU3bxfXtEjsITUQ5rLFm7rd3v71ZjAFLB0sxE
	IdZefyyZgzOOYZ+IDiLJ85ripGatM+SH6ik8BpboUixo79z3rtSKR4vvOEC9nUNlMoF0CkccUUt6+
	ZF9nox+f3gw9FrDL9mXLgeVVSbGFCBAVJA/AEV1bVhc5gMjMRl0oYQ1eu3hjj6C8i6BpRjXfn/xD/
	yN64PCOQAsuyyX6qRzoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsggr-00Bskd-0v;
	Tue, 17 Oct 2023 09:48:41 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsggo-00BsjS-1T;
	Tue, 17 Oct 2023 09:48:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E9B6366072C1;
	Tue, 17 Oct 2023 10:48:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697536117;
	bh=YzKXJVl8pbT1OJptJTg1ONfOaAgrUeRJMmkISwud0mY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dVKS09CrX743nHJGLFQLvcN3+KNzr5wTRKvq7rY3phMiKiICxYSOxf2m4d9sV/YML
	 o1XHziWU8xQxrCKbqFGDVoXpgqd7HMXEfzo7DzQBspFURzV0JucFbnuHOeXdwpAiCf
	 r9dBz1Zd0xyeZA6SbGSpupkl4LDs8ufpBR3T/7e8jKQgLKWNmesXkhsQUSb1SaZL1g
	 Ah6bE1xClh7c9Y8SV0+SQkdUNTFhRiYVEWV9WiHMlw67xkSVY1CkAziDpaT/mpEBaM
	 DBoIyGiM0X25lRxyn2qkMIzJiKDex3gio+vD7pWX01Uq6TBS6Ogq3RKGw9qy+kK1ri
	 P863fr1X1ankw==
Message-ID: <c23d00d0-604c-451f-9c1b-407fa2118031@collabora.com>
Date: Tue, 17 Oct 2023 11:48:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 19/23] drm/mediatek: Return error if MDP RDMA failed to
 enable the clock
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20231016104010.3270-1-shawn.sung@mediatek.com>
 <20231016104010.3270-20-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231016104010.3270-20-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_024838_623046_4AB2C8AA 
X-CRM114-Status: UNSURE (   6.86  )
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>, Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 16/10/23 12:40, Hsiao Chien Sung ha scritto:
> Return the result of clk_prepare_enable() instead of
> always returns 0.
> 
> Fixes: f8946e2b6bb2 ("drm/mediatek: Add display MDP RDMA support for MT8195")
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



