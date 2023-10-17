Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35C2CDB483
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 09:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AE/JTLGzXINpRZTMGc+5b7BK2SoTIXkg5WysDIvW8H4=; b=bbvPdgTQLSuagZ
	pqVPHZitVXjPMxGiCzKvoqFLkNjTivFR4H/WiwIqpJuwwYK/OL5Kew90xFKGm4uwhELZk3LDK9G8Y
	GokWwtEOSdtq9XHSs0DLT0uT8ZV2bsg/fIYvoWi9B1RxmSAoJmnxCxV4ZSi4V+M2ayrWxkTGwJ6wc
	BLcZnnnJ0vHnKOmtCclQ5djpRSQ1kaeAFx8iQJ1CXnRy5eYepePkkLGLQsfBHABX7hI1sK/CW6+iW
	oKA16tfYYSo938dlnkrdCI9mHMe0dSh/972Pnl5bLSBAldUsFvBMgQ8rtKBLZKsv6CCYEViSTZFna
	HTV9HO7v69UboZx/kQgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsgiY-00Bt8l-2C;
	Tue, 17 Oct 2023 09:50:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsgiV-00Bt7T-1w;
	Tue, 17 Oct 2023 09:50:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5C9A366072C1;
	Tue, 17 Oct 2023 10:50:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697536222;
	bh=/IVWmEUUeKec+p2h20V+PyRQsxOD5Ro8h2MtpXwOpi4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F6bhqpsMdsoAlFPsqSccUzblahcTD4SQsJLPeI/TyhzwPog8GSBth/xfy9VDwnRZh
	 ek2KtKCjJTPrF6X+rw1STgN5CTTTRTdBIhehWsBRZ4Swn441G0HWvNlJVwl8mH3UCd
	 FTPagCwrYVvxSjlP0V9rmdrgGfH2US46u8qa1x7ATtWyaZrP1NERYdyAcpE03GOWaX
	 REm/UVc4KG/GDRr1V5yk8pXmOEQbCg1ZZYfmzAnsyNnw+Q5BT7qm1d2hNBgvjVm8c6
	 Hgk1mKMt6NCNWYGsd5sQu2hCpx0ntFey/qllmPewDtAQJsqClZdQm8NPBDlBJyT8VP
	 V+2MSVyDuuaLA==
Message-ID: <72441e62-6dd6-4df8-add9-f6dad82d2b20@collabora.com>
Date: Tue, 17 Oct 2023 11:50:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 21/23] drm/mediatek: Fix underrun in VDO1 when switches
 off the layer
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20231016104010.3270-1-shawn.sung@mediatek.com>
 <20231016104010.3270-22-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231016104010.3270-22-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_025023_768212_583CB9DE 
X-CRM114-Status: UNSURE (   6.54  )
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
> Do not reset Merge while using CMDQ because reset API doesn't
> wait for frame done event as CMDQ does and could lead to
> underrun when the layer is switching off.
> 
> Fixes: aaf94f7c3ae6 ("drm/mediatek: Add display merge async reset control")
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



