Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D855C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 10:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X9XVuR9ISofslWxbOhXfbu/jxSRnEbZygtUYJnSaSPc=; b=CGWFgLOP8PkeJNgcWClCJ9eTkG
	y/5tl4xm0xnZXEQJq7AqN9NEkp5g0H6EAX9d6wF6Eg4T81Hzj5/iEVio6wisJ3Dt7vprWA0kiqUqw
	be7j7Cd9qKpuHaqkuYYqC1LalYtMi3oBUUsqGH8gqhYSWX/PHheaM+jTKjDqseEIzlQXItN6Cju5Y
	d6mBm4rqeV8ZVN28thie4JQmUOJKTuEUtV2zW/F+3IUwX0MDddQWzGHJJhiijdhs38/p6bGR//2LY
	ev87uxch7F1Ico9mkJXd1nPnYoVttcDcIQB5RgRnxEy3dSTwECHqu09U0eAy2T/1GZ70JOiRkke73
	INUrtzyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx2Nz-0000000FYqu-0Jxl;
	Wed, 17 Apr 2024 10:19:27 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx2Nu-0000000FYnw-3Ehp;
	Wed, 17 Apr 2024 10:19:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713349161;
	bh=ZXvKnOxAWKtA1ZyEyD4xHHi6jtBiRKSNgjQUwwOb1yU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IlCqquzrqUlQvCl+clDNR1MpbKDu6k//HytgxLI1g7MrwNNTpm5Rx0l8/2tqSrorC
	 uDwRQ7dnsfDiZIX339ue5ahjkjK4fmI4+YbZy5enye6rbMpldSSI71ZrR/av3jiGY1
	 st6A4Z3hzYqTuyxQxL8Pq81AWby27Xn7zukuc42lO9ajFKdD6UfpLHU3Xa3y+nTy9h
	 XkQSzZCCCszHy4P57NGwXnin0UpC5ur80SC2uNQhXqeb/c3Le/rcSR63/uNPCysMEW
	 PQNc4TrOySDRAStEXSJA6Sk34nRnV6Kkjln4VA42e3rfohLmBo55BWB3XjWN0Pp4fa
	 /XlPbG5u7uwPA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BCBEF37820F1;
	Wed, 17 Apr 2024 10:19:19 +0000 (UTC)
Message-ID: <1db01bd8-0936-40e5-9f1b-7ea34746bef1@collabora.com>
Date: Wed, 17 Apr 2024 12:19:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/18] dt-bindings: pwm: mediatek,pwm-disp: add
 power-domains property
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
 <20231023-display-support-v2-11-33ce8864b227@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231023-display-support-v2-11-33ce8864b227@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_031923_210859_406EA9A5 
X-CRM114-Status: UNSURE (   8.11  )
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
> According to the Mediatek MT8365 datasheet, the display PWM block has
> a power domain.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

It's the same for at least MT8195, MT8183 and I think MT8192 as well... so
not having that from the beginning is actually a mistake.

Please add a Fixes tag and resend, after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


