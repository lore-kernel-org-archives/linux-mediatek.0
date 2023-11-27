Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913F9C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 13:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7/SndALD4+0FHeorLZEe6KMjNXCBMqR+Yp4XbKmdCc=; b=ol/iY5fSeZtBP9YUnoFVeH5283
	E1KgH7M7JWJnxBN9teBorMcVstVQUnMkOlI0LLmK9Qbyab8QXvcxTufJe3GgQYuQJvToW1TvHEbuo
	EmXApSL+oB04x9RbNJRppPIGIS1HIey1vSAVbGCyl2kqSQ5S2gjyVRh39Ioko+9B6xkeJIATjeg4Z
	a8+WKWt78tWUVKgxfZeFXspULT7vNpsVK0MHsmadm3cxNiwaZFTA9dC5yp5UD3kQKSPBOeHzNzjl7
	D18TC1VqPPomKaimxyAqMjTyNJp7MzEf/YUO+CU8sbIFv8dYepmXipaeaYORPym5+VZ6nUYaK1uu9
	yivJL8XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7beF-002ZcU-1p;
	Mon, 27 Nov 2023 13:27:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7be4-002ZXK-0H;
	Mon, 27 Nov 2023 13:27:29 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F6506606F9A;
	Mon, 27 Nov 2023 13:27:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701091646;
	bh=0nSsPbuXWoKk+7HdWPzZrhSats/9dt9HQTUocoSOMIY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NY6yzBH3sKjPxQTJT5ebh3Se22W0/dlmKhnUn1O0aAKxsXe9bEi4GoN5b3EVp5arc
	 Ql/SfTE6/hEqW3Y19Xlw7OWj/s5KUbgUx1gXf7faihZDIajCLY+MDkuwBy7GYkZtvq
	 kOkxKgiZJ8oJMJ+xHkXxJNsFgS6V11S/lD/VGuEiI0eo3+XdwdmrJzX5fHdZBU/bBh
	 a21FOE/CdSyQL1J3SWLM4L7mb/eEGGe6X8lqw1qdXEANjhM9Akyb9T2yfP4dGgycxs
	 eT+V46AHpfzv4O6Ml/otF6PJRI0SLG5/e1L6NVq7wyl2TGHP3X+WhelzTtelr/uJgJ
	 IQxkB/cwdINHg==
Message-ID: <8ef6d57f-0320-4f2d-a75e-c078168b0087@collabora.com>
Date: Mon, 27 Nov 2023 14:27:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: display: mediatek: dsi: add compatible
 for MediaTek MT8195
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jitao Shi
 <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
References: <20231123133749.2030661-1-mwalle@kernel.org>
 <20231123133749.2030661-2-mwalle@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231123133749.2030661-2-mwalle@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_052728_250944_BB500139 
X-CRM114-Status: UNSURE (   6.37  )
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

Il 23/11/23 14:37, Michael Walle ha scritto:
> Add the compatible string for MediaTek MT8195 SoC, using the same DSI
> block as the MT8183.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



