Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA11C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 13:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HyyuhuQoR315g9zHf4Cshh0ZxeJkb2o1TfPzxsc0+L0=; b=HhKuQwFY9xo40lE7Fi00to/mRg
	+nxDgV/mAszgb3phYD3m3NnvuL6K0HtS8+L5wizwuFBAFsbpR6ZCz3hTQ+wy9zplt5uXoprNBaUpT
	ldNHO0XGlhZ4JMjDxoxeG1NQ86/rK/H0NIePIYn3WirCQap9VGHmmhsH2Wp6ByFONUa+xCT97kNUf
	2vg89PzV08tUOpThFAyvXgrsILee2VskmqgCORqtjVPXI42bu882hsRnnnmPijUexj4GyIJ6oeN/r
	FkQZSlrTFjXnXNEYL/XB9NDO5QBzE7vCwqegZhZ6ffvYY5H0duQVP5sNfv/60eD480TnF0wgg+ZPp
	9lyYuXDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox6ys-00E0Z8-6z; Mon, 21 Nov 2022 13:37:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox6yc-00E0Pq-Si; Mon, 21 Nov 2022 13:36:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0A55B6602A03;
	Mon, 21 Nov 2022 13:36:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669037804;
	bh=jCj7p/2m5lxy7d9NG/YjgHLCUygY93EdQ0KK5hgNvZA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mAX2f8bUlgLnVsyJ4enAhMsz7tlnEUuGxUf25RPImr+HA5ujwyDYZOI70p0AczD7v
	 aQezIl/lWk90rKclG/R4aRjhEcNc0kPu2Wtgx18+/u6tFOx+aDch7W69Xol1xgea56
	 /yP3bIuRFOUv0CdorDNpMfNQqwbobWV7tP4eno/8yd4+EMgR0j8G3mlQNCrLls6q4s
	 yHRJAaNsZ0oEDP7QvZsWUtArgshvknj5cLWDe1JJsl5R9raD+1459ZxJSOxZrO1Kqq
	 pb9T38wq2e5WtzWOi3tetUZQmQrAGuUq+QEnPOpk5fR6YwxkBdmt0k3UGFZj2U1mnS
	 rKKQcac3aIn/w==
Message-ID: <fa456fcc-5252-27e9-ebb9-afe360edabfb@collabora.com>
Date: Mon, 21 Nov 2022 14:36:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5 2/7] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Improve pinctrl subnode and property descriptions
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221118113028.145348-1-y.oudjana@protonmail.com>
 <20221118113028.145348-3-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221118113028.145348-3-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_053647_113670_7AF990BB 
X-CRM114-Status: UNSURE (   8.61  )
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

Il 18/11/22 12:30, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Change "subnodes" to "subnode" in subnode description for better grammatical
> accuracy, capitalize pinmux description, wrap all descriptions at 80 characters,
> and remove literal style indicators from descriptions that don't need their new
> lines preserved.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



