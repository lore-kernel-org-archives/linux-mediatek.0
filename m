Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB416C47071
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 08:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vywtL6e3/EEvYaLQxv7hvjeFWlKzXKbSoHplGmS4zHQ=; b=c6FoYXhdL1ygR6ymSEsdLfxMST
	USrUeKTk++x6+8gWe5lyK4e+qbdP3pKerXO/eZncL37yTKS/8HjAxS0tvblhchGaYL1jnOywzI9D9
	F56bfc7PqA3z1c9yxI786nxgGOoNq8F2xok+UOUnTH+6jaCoBCKYUj7gpfNJB91gUTlOrRHclWKjo
	dQwnEe7MqcRgOebPouLGEQk9Yp2UPFZVpGLKBHCooU+u6VVaBPZTS3NiO3a/29BG8F5sO7Pu4dVCr
	/JxuuZLaKkI0IhxR5cEjCkJG+D3O4G/sxP3LxRkSYFT4Qkan6qxjT1FbVnPLaykXzctrVdmvKAmpS
	eWRe1nUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Y3O-002u0w-1q;
	Thu, 16 Nov 2023 08:48:50 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Y3M-002u0F-0h
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Nov 2023 08:48:49 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6B2026607340;
	Thu, 16 Nov 2023 08:48:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700124522;
	bh=jLkSPIyvqaqQkTZh8S9BrSzwjIq40hrTZ/FEznVehN8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Mh5D2d6zWxfI6XpI2UjcSmUbhmKiTzYU4PAkRsggPwagPNpO2UlAH/P8A6BIEAaGN
	 +p/hLsx2t88cR17V/4czd6Og/nHBaCaVrv2YXETZRygOFsh0tReqqqdYp/Jp9GI2vc
	 uyNCWuWGqKEHtcRfjTWfvY8wAg50371/TvOP3wtTlRGMPE10IveUHAMGx3+pT7ZoOn
	 65Z+m1NrVQV/7h0i2oi36CkdKbpj6JJg0gAqsrMb6MMetDZ+umVfV0W9VJRB+zAo1Z
	 K4moEI60zB+2OcLH60aXclciHGSyusoIgvJfG8Y87eewaLaKjx/RZ+LRE8jgQf7h6y
	 7ksDBnRYhUXUQ==
Message-ID: <83da1819-15bd-4592-8713-e94978121335@collabora.com>
Date: Thu, 16 Nov 2023 09:48:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] ASoC: mediatek: mt8188-mt6359: commonize headset
 codec init/exit api
To: Rui Zhou <zhourui@huaqin.corp-partner.google.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, perex@perex.cz, allen-kh.cheng@mediatek.com,
 kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231116073106.3757618-1-zhourui@huaqin.corp-partner.google.com>
 <20231116073106.3757618-3-zhourui@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231116073106.3757618-3-zhourui@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_004848_418012_6C970F5D 
X-CRM114-Status: UNSURE (   3.21  )
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

Il 16/11/23 08:31, Rui Zhou ha scritto:
> Reduce code duplication, unify the headset codec init/exit api.
> 
> Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


