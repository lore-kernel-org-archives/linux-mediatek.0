Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1390C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 10:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rul+VeOR/nse6G3oPJoyEbr1E0TgyB/c/3OPM8EP5Q=; b=o+xLMNHFC2Ks9IdMe/n9dr3Nw7
	H+MiZ09fY041OFwVcmSAPu+ibvqS5jedKYEasmR5Pxl3+pow/SEBXEDoSChs2819bqevSQdIPoB+Q
	GYo2gukRWUH27YmBR6GiEIpq2wP38jKFN1OKBG/svD1alvSsCjBsCvlUFlgNLT2X7pwsoaMuIeYl2
	K4yABeqPJxu3wWgT9cjxNHXqs2jDzLH8eX4uxngi/R8YZpqTkE7qdDE7YVCV2buQJghc3LNzal6Cn
	gx+ySytLXPvYf0EtH81ji4lmul+Ht0jBS0zq+cKJSp/iozSLuYP+wI6KHzGKZu8xUzPWI3vfIxq74
	sUi3XFtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx2KK-0000000FXZE-3lUv;
	Wed, 17 Apr 2024 10:15:40 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx2KG-0000000FXWL-3nkX;
	Wed, 17 Apr 2024 10:15:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713348934;
	bh=wDUM4X4Ysi+qIstEq+ysY7Ux3HsREZBqamdrLrY/+eI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NNnQV93mnxJuX7B3GIil2Zq6b1V01fdXRGrLRe7UT9FyhNdPKNhyp6JT0FkODDY/y
	 qBBAgKnzT3M+zXXbqKm9s7BZHxW1sOx2d83aeUw6o/5BZKdy4pjgWq2ggG/P+myF0u
	 nibHeRLGD3V5Y2s6KPSZKcHIeDG0Tdd6Yer+Ay/KSb04VnnSuc15P1hUboYcSPO646
	 4OPhEFiolH7t1BraY4UztSSkKjHtfbULcihCCmT+lLD4VALPEbq7noDaGvENl/pXKW
	 XbH2s/qQK6XRR7ZeEH+yj6VPN/JSdWdGxqNXLi8dBOLY5TmDLePqXaPTpnU/wcngug
	 26KlK2rcNGuKA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5D662378020A;
	Wed, 17 Apr 2024 10:15:33 +0000 (UTC)
Message-ID: <c603af5f-fe37-4bd6-aa27-7a797d11f1ae@collabora.com>
Date: Wed, 17 Apr 2024 12:15:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/18] dt-bindings: display: mediatek: dpi: add
 power-domains property
To: amergnat@baylibre.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
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
 linux-clk@vger.kernel.org, Fabien Parent <fparent@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-6-33ce8864b227@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231023-display-support-v2-6-33ce8864b227@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_031537_103934_3E5AE990 
X-CRM114-Status: UNSURE (   7.08  )
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

Il 16/04/24 17:53, amergnat@baylibre.com ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> DPI is part of the display / multimedia block in MediaTek SoCs, and
> always have a power-domain (at least in the upstream device-trees).
> Add the power-domains property to the binding documentation.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Please add the relevant Fixes tag and resubmit.

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



