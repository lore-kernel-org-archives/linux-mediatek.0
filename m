Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AB5C5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 11:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtDaa+21S0GNWjcSPbLhIAnwsk/dsZPPk0S+d6zVyrQ=; b=LDc79sIotbJNNQfAJvUpkKjmcp
	8/KcoT8+PxM5KBbyt1c+4dOcOZmgbcZzysGSgAKT+rCdUDUE5AGxzG59Gs61hx1WIrpRgwb4PivDe
	DljWt5ENNE/Lmh3v3204aLAlfiQiS6fn0dAxODrkPWFSTw3d+5mdNek1NWhoS0D7oIL5UBicKJ62i
	GLGDr5PjFqhD4dZvC/AVmcCM2AXnFV3Q6O67+lA11qvvU2AXGUow+uC6Ti6PEJenKHRfdKsedqbvQ
	GfOuBH5tjLGNj0iMZ/r4u+1DGAznxJtELRYGauerQB03RV02nUGB/7f+ZHYVWMYHTc1Wk2xtUbMqt
	dORw5OxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r67i2-004UE6-0g;
	Thu, 23 Nov 2023 11:17:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r67hz-004UDN-1i;
	Thu, 23 Nov 2023 11:17:24 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DD3586607399;
	Thu, 23 Nov 2023 11:17:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700738239;
	bh=2iodxh4WFdUN0YUDs8e2jORssg12+fCUm/I386AK+n0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UtE+qT0blWGNvMpufqC2Ubyc9FWynPNxujH3YsMq8FjcF6hy5CTCxElfzz6oeV0sp
	 Lqou3s23pBgY8+WDrGh0n6JuLA8ZDWiT/1L6U6leovnk38fnvULQOWtUhPqBaD9yKs
	 7avw2udD0LiKgmSs5U0X67ave7Bh1MhfmGf53Xy9MC5ts/o6zUt6YibDSA0sWtWUOg
	 WV2WUUXnXgpW3kp71HqVO9nqMu/QevDthr/cMpznrMBEuuExabn2LR7bMAPSzzh0ba
	 XVqgdI+yUjWZNEDgEkEFmGHIDCSjwjSZJ15g+NK7GhK7VkHiSz0nonfDluE85sljnG
	 gORtC3C2h7j/w==
Message-ID: <0311dcdd-1c70-41ff-b170-dc2782f7ea49@collabora.com>
Date: Thu, 23 Nov 2023 12:17:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] dt-bindings: arm: mediatek: convert audsys and
 mt2701-afe-pcm to yaml
Content-Language: en-US
To: Eugen Hristev <eugen.hristev@collabora.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, Rob Herring <robh@kernel.org>
References: <20231016203915.9793-1-eugen.hristev@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231016203915.9793-1-eugen.hristev@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_031723_708278_A65F5BAA 
X-CRM114-Status: UNSURE (   4.61  )
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

Il 16/10/23 22:39, Eugen Hristev ha scritto:
> Convert the mediatek,audsys binding to YAML, together with the associated
> binding bindings/sound/mt2701-afe-pcm.yaml .
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



