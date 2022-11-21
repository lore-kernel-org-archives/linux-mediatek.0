Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8D1C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 09:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwSyV+uSv2qiI8lAnG3+DLtGPvEFmv0f18azhE+7j5E=; b=04Or2wDUqB/fw8k6qMv0c1RTH/
	FAmM7Lx74A21C4pA9eSPg0iV3bY76zftm1WWIyBOTdwEUKZiFVRjeVHkbHwSxhEOtROOYn8hM2m22
	prYeKxxl4yCbFGW0OIajga1YEikXjTTpO/aUmOJRMACRfsLNmi+1tHDcM9a2ZWeo/Ik+EUm85Et8L
	UKhxPZkm/ZOuoPuXXWtvuraoGB9Pj3E7a6AZAG62sbFWmbeBUOhjNvJL4ff0nzxlb9RtFEaJUfHiz
	E0DNy/iJC+a7AKJNTshPwRF5aZo9z/LF1ByMylUwOmUgQ79Wkw451WVIYkZ+8t8VQCXaaNvI1gG/M
	FodoZXKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2fq-00BaDL-Uv; Mon, 21 Nov 2022 09:01:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2fI-00BZki-5q; Mon, 21 Nov 2022 09:00:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5DEDE66003EF;
	Mon, 21 Nov 2022 09:00:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669021229;
	bh=GjoD6+ESt/0nC7WvRsDYNODjgEOQgbj3D/vo0DNgFs8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GX7ndQFc90mDHy9IVvkFjC11UQildBuY3gKGx5XKCYxu2dnDae9C9I1haWu3O3clb
	 4P3a5dBkRdW9cUo2QValv+k2lr27sWD6c6kEzfLFYfAHlxpEuyx+Gvkc84pyA/1K5z
	 ab+Y6oXZmDDujBGsEOpK6zDF44lpnE6mKZyxB/3xqXdHA4LIMSkqmipcFYDysdadNL
	 Qt18/u7pLXy2ASnjC1lm9jpJhu8hJOm7f8thB9Zf4b785JWYXYY0jsOu5M60YcZ/3L
	 j3bOvJV4YFLR7wm8Naa3B6kHbgKY/OSRNdm6Sk2CBiKcvEWdRZmd3CU6QgAPLog6mT
	 VjY7470Ij803Q==
Message-ID: <0ccc4c54-c60f-72eb-6efe-31915b6277d7@collabora.com>
Date: Mon, 21 Nov 2022 10:00:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/9] pinctrl: mediatek: common: Remove check for
 pins-are-numbered
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski@linaro.org,
 khilman@baylibre.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, matthias.bgg@gmail.com
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-2-bero@baylibre.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221121015451.2471196-2-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_010032_382552_2DEFE837 
X-CRM114-Status: UNSURE (   6.48  )
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

Il 21/11/22 02:54, Bernhard Rosenkränzer ha scritto:
> Remove the check for the unnecessary pins-are-numbered Devicetree property.
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



