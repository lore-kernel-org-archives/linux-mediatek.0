Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D705FCDB482
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 09:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dDYwf+kx6+y50tp9gHBXuf03OSW5Mh5qWvzxv84YUoE=; b=R4uHo2ghSvxei3
	sO4VLl3+X4Y7ZXeTtFiG9YRTNv6s4g8p4TAhxHMCP5OrKtYr8oJFGLIoEacbsqRnfiTM35+Balvyt
	7Ug2xLc2i7+pkuzoqqYNlX0aL2BQ+63Ku7T7bezc9VM32CsZD0QU/ja7VCW6dX6BuVANkvmxN1EBz
	HWrScxYiHfzG9Pd6quBP2ZxVL1OCj7JmKJ9K/jVQqliac50z5iFgK610s157ynQUXPsgs/MHDzoJJ
	G7ivmvK/qfg8SQuzIk2dmS1gf6FXPm8frvphV/ORI4Irr+2V5CMjFvuKP9UW0/bDFrxE8VCApOfso
	NQVAgNPzFDwwYb7wmO0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsghw-00BsyS-2m;
	Tue, 17 Oct 2023 09:49:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsght-00BsxM-2Q;
	Tue, 17 Oct 2023 09:49:47 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 66DD066072C1;
	Tue, 17 Oct 2023 10:49:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697536184;
	bh=4ZfvZ2qZCHs/5Udb5xTCWL8g1HLQM5VCOQCXYVRFH9Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cbasNBHZa4V60Gju4qv/8XSxbkQjSGmBYB6GW/jNXTE4gizi7q3Oz0nF/yWoTPzlY
	 84xCxILji0Gv3leyzXwjxy00o1UPFc5zedw40k499FF5m+0e1oIxXjzS3W1EsQPj4u
	 4oWQttBqJkBrhAIQIA0jbZBX8MhpnVOKhG/xhlLNJxr91wtrtJlJUP5ltUp2m7qng/
	 35qHob2gZyO11Q1PRgfM1/a8V7OLTnG/kUahZtmzbRTRysOO/3YZZdthI9f5w0W2pv
	 eegV0imx47flifWAT32nLOg0h+/+FxPYx0AGrKTtE8/FBgeBhV+JEqjxpSLbHjR/KI
	 cZJ9m8YluqnUA==
Message-ID: <45632ad5-0438-40ad-81cf-482e7c1368e0@collabora.com>
Date: Tue, 17 Oct 2023 11:49:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 20/23] drm/mediatek: Remove the redundant driver data
 for DPI
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20231016104010.3270-1-shawn.sung@mediatek.com>
 <20231016104010.3270-21-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231016104010.3270-21-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_024945_926519_9D6D3615 
X-CRM114-Status: UNSURE (   8.12  )
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
> DPI input is in 1T2P mode on both MT8195 and MT8188.
> Remove the redundant driver data to align the settings, or
> the screen will glitch.
> 
> Fixes: 2847cd7e6403 ("drm/mediatek: Add mt8188 dpi compatibles and platform data")
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



