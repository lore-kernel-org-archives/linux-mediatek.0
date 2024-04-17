Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9128AC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 10:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vd/UAg102uWEHkttJya82i1nhDOxz9CIPycjMs2EW9A=; b=2O00V4GhQvuTzQte4Cs17hflsj
	VV52PW7uLmG/Cf41mfSQ/hds7vlZikZk/2CiYVnWZyIeJ+ARpiqkFIjq2r0l6mN4p5a1mn3f9H7Qm
	dYl1AzNc2xptWzqFwg6O3cm6JuFAY9xeDXzk53N/O8ZsUPKKiUiOPSj7Gv8beOofyKetZPIk+jN2l
	HKyrU0VtZeZOn8g0gQxTSfyf2zfehX49dwwynPg6CTFl5lU6+9hbriFhWMtwccS4cZTOVp2YL4D5G
	wMBzGtw3Up7wcsVtg/0+ImYz8OsSRuRIKepjTWFB+nG4cBZ6QEIDWgwRfOLsJ4EjJRO45UjAOP7r/
	F3NNBDWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx2OB-0000000FZ0Y-2kZT;
	Wed, 17 Apr 2024 10:19:39 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx2Nw-0000000FYoc-0Qsw;
	Wed, 17 Apr 2024 10:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713349162;
	bh=OivqhnUpMqFeeojlBGSOYUiH7mtq6DFbxtNBz50s9KE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vDSbxNMsN7AlnShyxPaIdVFfJAizJwHxb7CHyTuNez0PGEXedmuKR/TrTFdQ8vcOb
	 URBWG0/Ac6t2FtI7M6o5/OiR/Rp8XxVsLMwaPB8AkAl0RkfZbTZiTaWppHIe51AEpX
	 q6FqVBkFlT8Nd+usZZutHbQ3LFD8OIW772LC8dtU2G6j0WIJgUea+J+nzAp1zfAfaK
	 Tp3Y+fx6A+jSMvbsHIr/LHfdYPJpXrwTAia6oZ5hso+P8MSoBKaoIISzuMm0DSNBpQ
	 fHNuft1TaDzDzbLxU1o9PIkhSzOcEtXRz+l7bFu0yBSOqVKMHCYhBG/rLtqE6C5T7S
	 1jXDtIoHVwOXQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 73CB137820F9;
	Wed, 17 Apr 2024 10:19:21 +0000 (UTC)
Message-ID: <86cb43d7-1c1c-48f6-8848-04340e04603a@collabora.com>
Date: Wed, 17 Apr 2024 12:19:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/18] dt-bindings: display: mediatek: rdma: add
 compatible for MT8365 SoC
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-10-33ce8864b227@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231023-display-support-v2-10-33ce8864b227@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_031924_310093_DDBE412D 
X-CRM114-Status: UNSURE (   7.24  )
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

Il 16/04/24 17:53, Alexandre Mergnat ha scritto:
> Document the display Data Path Read DMA on MT8365, which is compatible
> with that of the MT8183.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



