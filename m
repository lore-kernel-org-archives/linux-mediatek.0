Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4082C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 10:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IIcVLm7ZqE1rgNbQf2dIyDB4bC+Deq6NVdo/3C5VS7I=; b=Ca76tpWFzI7E/vx646/XA8/zb3
	8K0LejGcEZSS1CD2J/Noe/BbwDifAg1TlSAoT4vUdPVvURJ4Tx6Tmye/DlIqp+O+JtJN1pMVpEpoF
	SMbShj3L9aJbz2YppjdN1Q+2xYiFCRLsdGpF2dd38NYtAY8/FAA1XC7g0tq8fBOE8XpGSvVyOkMfU
	1haxPE3WnBTBa6Zo43K1gns4hxQALgRXNGo8I7WxIt3n6QTv/vHjlsoTft8uUsplpchFsGi8B7Emh
	jOu9mismIMQtrtHOnwHlWZJBQqnqfW2jFHlKzFMxNtJj4yISko9Q38U8iKG7ZQdwBaS7paQ4zdLD6
	c4STy+ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx2Pz-0000000Fa97-2mvR;
	Wed, 17 Apr 2024 10:21:31 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx2Pg-0000000FZzr-3G7R;
	Wed, 17 Apr 2024 10:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713349271;
	bh=joxtA6/0uRZPXJAeMzV2wF8DPGHHcwx6t1T7AHClb7k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FZf2J5j2qPVponPppon3nSlh8EUciQ+SLJONQKf/unyHzoBfaCeaClDlXrUkNh7+z
	 uWkWjMhrU1qgsg0u/9+OHuGb2CG58/eM/XqgX2yJmejqH6JS5GvXO9VRj2sqjCGBg0
	 OEgiVJVNX9WG0dEi9OmMI7c3tJR9RXOejvdDrf3ViaaukvZjHdQ4oVqn53mFFmsewr
	 5nb/dgokG/iefGwpxwooNqHhBMzXQhyQY3OYLIFbnFZXUFpxmEjT9ks6nkDDfmKvG9
	 YxZ3mKEVZpk4huDFE81C5e7/H5F2Qm7OuRfB8G0pxwVAC75jEPcfiuqGV0oGddBAZ4
	 +FGBSrcjmFRmQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DF67637820F1;
	Wed, 17 Apr 2024 10:21:09 +0000 (UTC)
Message-ID: <5aaa5f0b-4c0c-4e7f-ae73-d0c735343f37@collabora.com>
Date: Wed, 17 Apr 2024 12:21:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/18] dt-bindings: display: mediatek: dsi: add
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
 <20231023-display-support-v2-5-33ce8864b227@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231023-display-support-v2-5-33ce8864b227@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_032113_201977_34DF99FF 
X-CRM114-Status: UNSURE (   6.96  )
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
> Document the Display Serial Interface on MT8365, which is compatible
> with that of the MT8183.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


