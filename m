Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7305DEDE998
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 07:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvJvETjkgDk7E1lX5ncj6Lisi9Qe8JRpB5Qm4jmYFLM=; b=Psml/sTrgSMJBZTfzJTLyfdiqq
	32krlaMCnYz3YLGQb5rBymu3WcMv4njIYIV2Qm9A0UYafwShtKoGgptmYLVapT0fcKV/ftQs/hZ31
	Wf/6zwUoKJGPdJNueRjS/46lkw0LC1xDSi3SfW3uj9uqruvUR4GSGI0UYMi6GxsA5QYQjtpUi52Jb
	iL2BRfSKMRWoor8gw+V5IiDIRnuu6pV7kl930yWxqtkPVKg+lpLCFn5btyCwc/wsgVsnYsWiHe4CB
	c3oV07hSFFdJqAJGWsqxTXV0fFnywRf6yPbYEcPhAP0ic0Fv+21wNMtB6nYFoix2HLVNS0OLZopow
	+GHlmo9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soI2s-00000008VHf-0ZgA;
	Wed, 11 Sep 2024 07:45:46 +0000
Received: from a7-40.smtp-out.eu-west-1.amazonses.com ([54.240.7.40])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soHzr-00000008UiS-0RWv;
	Wed, 11 Sep 2024 07:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726040554;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=+z0iaYPRF8aOAeyudpMIOAITImEM365oGsItYDeMrNE=;
	b=GTLqK+Zxla3s5iAGSe/h9kxrPUSF87jCwiNhqceQcGgcSXvpl305psrUwII5SwKf
	b24gxrEovDeflPUEpV1YVET4Ls0IBxHJo9ORtqxk838sOZrsK8AjSL9R0opIdKx1WMB
	iTZBAayeKXwiqbZulfTtXKoqKahSzJPCaUNf0JUmhB7TQdTIQ+BpLOOHVu9/33/gsKK
	Ez6U4I0w0VT/1uxv8DxSjCNzUmUNX0gPWCuFTVq0WIRgu0QoD/0q1NoSBvmocQJVQz3
	8NE4JiZY1u9uci+sixDZINIEYt5O/OIK4XsrDtZpT8PqMNtlwFldLbtaouHBn8MCfFm
	qu6rNL65gw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726040554;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=+z0iaYPRF8aOAeyudpMIOAITImEM365oGsItYDeMrNE=;
	b=hbJ7HBdKOzai+xLjoaWwAVtHEd+Wao7fakZkcpV33sHkzS3JaM6vVCgzN6mD97Jm
	mVWtXv8wZyidNiSvh8UfItBq/8gnlS5oNFp+6HrWeDzrhpuz8oEzuBE9Fesx608DK1K
	CYAuH00qqq+JkPU+I7knFpOtsiuJmnPf0dwiuxaU=
Message-ID: <01020191e008baec-ca547413-aeba-4508-8a05-2c35b06150c2-000000@eu-west-1.amazonses.com>
Date: Wed, 11 Sep 2024 07:42:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/mediatek: dp: constify regmap_config
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
References: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
 <20240908-regmap-config-const-v1-4-28f349004811@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240908-regmap-config-const-v1-4-28f349004811@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.11-54.240.7.40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_004239_629351_6ACF6310 
X-CRM114-Status: UNSURE (   4.85  )
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

Il 08/09/24 16:21, Krzysztof Kozlowski ha scritto:
> Mark local static 'struct regmap_config' as const for safer and more
> obvious code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


