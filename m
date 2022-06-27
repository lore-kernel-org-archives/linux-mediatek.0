Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69CBC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 10:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xKzlN2ODto4w+NFFcTZ8DeIbs88oypfIZitmo2Bk4Y=; b=GXZFHtK4wn04J8GvyxkAtPXpqm
	k5C889dfkb/6Fw3TqLdXcpDB6vSDI1q2G1rh1rrSBlqbrzAfMppIemCHqIBMNu6BYbdvaL0s7QBMQ
	WeJnv2wFEqWnVBfJcmJ+bw0v2/BA7b6NC8QNLNSOBnAQHVAXnSaXXkgSE27PfCGLmT4a8vKujUyiq
	76LBmnZevxgd4JtsOoK/Xzg+ex4JD0Xz1tFQmJw65bNBx8Pxls2RjAU8HUiY0zHPyW/w/dKugUbmb
	NIQAxA43iaTbs2VcWMR03BxR5mddGwIzXuISwlcdY3tOx1bNFwkRZzBwnmRM/h9zs2YYKgf4tS5VN
	HBBp3k3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5lq5-0003Ku-KJ; Mon, 27 Jun 2022 10:19:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5lpp-0003Dh-Gi; Mon, 27 Jun 2022 10:19:15 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DF39D6601822;
	Mon, 27 Jun 2022 11:19:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656325152;
	bh=ifo75he1zccAIukoq+Y8qsDgP4/nZXF5zclgYxbptVk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lVOS5KTI98Vc61DG5Wu6FehcIW9LZn6qFy4x9kE3Yms9Biycc8h1k3BSp22jHfw37
	 2BxgTCmUVocIqXwecu/NupfEuvcPB07kyR5zcsY5QGCcca+SLmuEd2A85xkr/Np7Es
	 Jnuq9nQ2FqqbPiLS/uNijdergVGxEPJvETQNoQQF50EcDvHCkhPQf0YTGnW9XIlwEs
	 TV7mIt+bhnFo21XPpc68wodVYGvUhiSYHH6rLPclM0imkfznCGs1TfMEAruDTHAW5L
	 q/MTD9ZhdaevACN1VNr2mly5ZSkbMxeXeLeHMAKFvwwliGXyeCDWs4MTDHOlXhdGGi
	 Sxru0TEIEteWQ==
Message-ID: <9e60dfa4-b648-8005-2cf3-f993dddf57a6@collabora.com>
Date: Mon, 27 Jun 2022 12:19:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v12 07/10] drm/mediatek: add hpd debounce
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
Cc: msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com,
 wenst@chromium.org, ck.hu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220627080341.5087-1-rex-bc.chen@mediatek.com>
 <20220627080341.5087-8-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220627080341.5087-8-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_031913_762852_16CA0EC8 
X-CRM114-Status: GOOD (  17.17  )
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

Il 27/06/22 10:03, Bo-Chen Chen ha scritto:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
>  From the DP spec 1.4a chapter 3.3, upstream devices should implement
> HPD signal de-bouncing on an external connection.
> A period of 100ms should be used to detect an HPD connect event.
> To cover these cases, HPD de-bounce should be implemented only after
> HPD low has been detected for at least 100ms.
> 
> Therefore,
> 1. If HPD is low (which means plugging out) for longer than 100ms:
>     we need to do de-bouncing (which means we need to wait for 100ms).
> 2. If HPD low is for less than 100ms:
>     we don't need to care about the de-bouncing.
> 
> In this patch, we start a 100ms timer and use a need_debounce boolean
> to implement the feature.
> 
> Two cases when HPD is high:
> 1. If the timer is expired (>100ms):
>     - need_debounce is true.
>     - When HPD high (plugging event comes), need_debounce will be true
>       and then we need to do de-bouncing (wait for 100ms).
> 2. If the timer is not expired (<100ms):
>     - need_debounce is false.
>     - When HPD high (plugging event comes), need_debounce will be false
>       and no need to do de-bouncing.
> 
> HPD_______             __________________
>            |            |<-  100ms   ->
>            |____________|
>            <-  100ms   ->
> 
> Without HPD de-bouncing, USB-C to HDMI Adapaters will not be detected.
> 
> The change has been successfully tested with the following devices:
> - Dell Adapter - USB-C to HDMI
> - Acer 1in1 HDMI dongle
> - Ugreen 1in1 HDMI dongle
> - innowatt HDMI + USB3 hub
> - Acer 2in1 HDMI dongle
> - Apple 3in1 HDMI dongle (A2119)
> - J5Create 3in1 HDMI dongle (JAC379)
> 
> Tested-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


