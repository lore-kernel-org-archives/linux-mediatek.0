Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FEBC04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 09:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXSv6WWmHQn9FHdutaQk99BxKYfXAJQoKj61lMpU2fo=; b=pMseQNLtowUabwE6UvM0x8vz0W
	SuQ9LcvVGV2VhueQRFm7YH9qKbnS96l9heGdO0uWRatMd0XJQQGPDh2r0KsdJ42DuNBRNNEDkBYAY
	Zar2POryujefIiYzUX6v0fvI9bC9BydSAZPbGVkT6jYGsKMxg/NDKyTQKwkeOJiuO31F+XDYb5KhG
	wRlAxHyCh4VKEW0MuA7ei4k+yv8cHn1E42V9Vf8LVcQ3ZnlNtacRnpGwdRSht05ytkY+LQhNKm7Cm
	qSrkgFb7O/FgT06QSuuuOWlV4RTA8ZDfu7oFCe9P0IhnRJkTeXQXbBlALM/9pePOjHbfLLFgZY7RD
	jnel+wDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8zkD-0000000E3ZC-1Tsj;
	Mon, 20 May 2024 09:55:49 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8zkA-0000000E3Yb-1P8f;
	Mon, 20 May 2024 09:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716198944;
	bh=rzE7nnaPg+u62UlsV6bG5IQXkGCAxUqcoHM8hLYB1OU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=4gFFiyZpSOvXFnhQYJ3KqTyRJEbDDkrgy1aZsXHaxvVvjado3VaUT0E0Bpvni3tMC
	 erGzuMR6kF2FJtwMH/YhlKMWPQLI6cFaizPwvFuaMaY5DFOmqFLKCpK6JEa6m5X6Qn
	 RZGGi7dVEAN4fSAVlWij5D8ub2gTdBfPWxgpRLbqhV5YIjXvE+vgBjnhKlieocvJJh
	 DdXvsXAcLke8ibqtcjUH2oOpg/RhcLOrIZIibrNXVj3v2E0aKsX1uWQpe/4dqQfRTt
	 r/CE3dFpFiloVdx3uAam+zxUpcHMHsHwvx+k3XBihTmf5gFDyMgYzHvShEYNGtZcrm
	 7loLBm5oWzr2A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1820B37820CD;
	Mon, 20 May 2024 09:55:44 +0000 (UTC)
Message-ID: <f42ef151-6eee-418f-91e1-5ac08d161119@collabora.com>
Date: Mon, 20 May 2024 11:55:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: mediatek: mt8365: use a specific SCPSYS
 compatible
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240518211159.142920-1-krzysztof.kozlowski@linaro.org>
 <20240518211159.142920-2-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240518211159.142920-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_025546_559404_7CAF5CC4 
X-CRM114-Status: UNSURE (   8.83  )
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

Il 18/05/24 23:11, Krzysztof Kozlowski ha scritto:
> SoCs should use dedicated compatibles for each of their syscon nodes to
> precisely describe the block.  Using an incorrect compatible does not
> allow to properly match/validate children of the syscon device.  Replace
> SYSCFG compatible, which does not have children, with a new dedicated
> one for SCPSYS block.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Technically, that's not a SCPSYS block, but called SYSCFG in MT8365, but the
meaning and the functioning is the same, so it's fine for me.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


