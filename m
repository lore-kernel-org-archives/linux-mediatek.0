Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF86CDB487
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 10:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRLO1Yr9bZbRlGTzQcD71G5xwpPPzFiN2NaugC/ZU4E=; b=g2tlThR3wO4rxOaN9Ne/rl1rQf
	7wUig5fUdHYaoTbEUo2qIh1XtTROyR0K2WlaN/5X5cGCSYQfczx1yinPfCfJG0ewfyHwTmXTHISNb
	Jm2YfWD0SLXfVhYyHsugMcXa/OgQJqfa8ZWHbtsDU7pQWp+48+2L/Z31ftnitZgyHlPzzXM/g7cQ6
	dKtnY1wC2uE0QReDtGkfTlddzVJfMnkyyg9fAwxl99W100L1dezMSVyMfNDeaGH7sEt47t85zjiKo
	0NDjXHtG+j17F1o+tOA2TElrDhtCdrhCKrOLvPy9iApiog1pUvbYJ3lkUeylPKUvp0b5O0QhQh9XN
	wwWTS0mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsrH-000eem-15;
	Thu, 12 Oct 2023 10:23:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsrC-000ecW-2a;
	Thu, 12 Oct 2023 10:23:56 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AF721660730F;
	Thu, 12 Oct 2023 11:23:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697106233;
	bh=EH0UlIYMDGYTYxLZU/+hOuPcJ7E2NwwQpH/7jhzm9OU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VvWgXwjUe7RlKiAvb5UpFvxRP4FWWE03tI5pOgRFOOcnCS0wLR6xr6KvRGrJwxUsz
	 CSM7EdyfqzJzVJhONU4WX9fUfhUmidj3yuOG+2Abx1mYB0qjt6xYYgglrMZQmi6Nmc
	 lZ5VUG6kJfGDuGm/Z05kIjTaBnaH+g3Au5qCO+RMeoyOsh4wXVpAOw/A0U/lNM6N/W
	 Nl4WZDO+UwG3pqaScyohEdVM8xSFrSk2owimKrXpWlwg3kzRmXXDoB5zEyJzrf/X0Z
	 YO1/DmMJMxkto5hAX+LYKctI0NMoirgCs0LDk/NBvBGMqY3GkNX3dPNW49QKKO3exk
	 seQasIOhJUGyA==
Message-ID: <1e578544-b062-6585-2574-1b40168a82af@collabora.com>
Date: Thu, 12 Oct 2023 12:23:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v7 04/16] dt-bindings: media: mediatek: mdp3: add
 compatible for MT8195 RSZ
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20231012084037.19376-1-moudy.ho@mediatek.com>
 <20231012084037.19376-5-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231012084037.19376-5-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_032355_002029_8A88FB94 
X-CRM114-Status: UNSURE (   8.03  )
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

Il 12/10/23 10:40, Moudy Ho ha scritto:
> MT8195 RSZ inherited from MT8183, add the corresponding
> compatible name to it.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


