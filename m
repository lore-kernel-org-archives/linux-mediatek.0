Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEB3C07545
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 09:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxkB2f1imt1vqWM8S5eE51TBzlUlBQvLaEuSgfsPwOo=; b=IBlzxvlS4P1RoSWa1fxgUhtNFi
	Hzys4T9asUBOyBWVZAENOEy+8wmRNs1MZzMijx0RL1xzL1/o19Urtt2j5WGAvObqZt93Zzj/8BCWa
	KvTLUVsh/wuR1/9+NTYvr4PvJ4sRO/k4snJGahLuiGPyiURDMpz9ehbTkmKd8OllwNHkQfIhrfUN3
	1tgNJnWAZCfg/tBc2eW8TQ/vZjW5/yP/gQ7w2B3MCNjMIDapMeog03k5mK1CmcQ7aw5xDrwQrBt7w
	ZwqjG/3mzrvbwSb0+2HR3+YSwATu3dmkkoNaPh7nuT7+s3zAVId8eO9WoTsCT5HSiXA+ZF9zpcEUo
	pik85mag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDaa-009I3v-2c;
	Tue, 24 Oct 2023 09:20:40 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDaV-009I1V-0b;
	Tue, 24 Oct 2023 09:20:36 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6AEA26603102;
	Tue, 24 Oct 2023 10:20:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698139233;
	bh=aGD3rYDkHE1z+wGDnmzLG0zIhU826ZF/LKif2k9yn48=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aB8Ebdt/Q8va37fJTH2YZg4cqbC/oQmZa9L2yO0hkaFDrCMUpeNO5wu2bX/fKX1yk
	 p8la8GnvDRy3yhU+U8FVPsp6fzoTAvOr2nUZPprrjtJZyGEMNsyGZWUywuEd+KR9em
	 k8f3BOHv77yJUJEElmKwHM+oD8kP6LD5pQGY6u8XSJM1NXc6OZFEW8oK5hyc2lq9Mw
	 aJ50Sg+I34bB1Oe23DLrkZvu1o8OaHeWslpBtyVzcA57wFy2DQKMQCcb082niKS0B3
	 uzrKLkIflk0KaKo+95O8auLaD3Iuj4xwkPoUs3bqtMRp7AZzdU4BPHJe8IqSgOnWr+
	 WXi/aGLqmEA8A==
Message-ID: <f82c57dc-3ac5-40ea-873e-ac35dfa49811@collabora.com>
Date: Tue, 24 Oct 2023 11:20:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/18] drm/mediatek: add MT8365 SoC support
Content-Language: en-US
To: amergnat@baylibre.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Xinlei Lee <xinlei.lee@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-15-5c860ed5c33b@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231023-display-support-v1-15-5c860ed5c33b@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_022035_366297_957E3DE0 
X-CRM114-Status: UNSURE (   6.93  )
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

Il 23/10/23 16:40, amergnat@baylibre.com ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add DRM support for MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



