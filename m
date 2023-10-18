Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C42CDB47E
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 08:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6GePUwbSEc3giL57NXMYFhnQAD9yASukwheayrcrvE=; b=C7brd0w9g5rENRjGenX52FAob+
	j/65nmxJ1FIZsHyIgBxC5qmlFj/EcCJfzHOHzTfPJDIYZeMW9sZTfDY6jyYJ7gDvAmB51rNeI+LLT
	B2S9UJUqqq1jPWYDiUJXVImInna6hyT2w9W/cLkUeKusuXxEwFNpt4pGvoGDq3Feb2fORcK5//5Qs
	iQvyCQTKBfO10PfkmBM8v1gpjeeV2zrn+VatXPf8jyw1ug9F15iSwm1EDnyDo7nRmF8jfGYbHcOOu
	FUlEbAIAOkLirTl59AT2nZVnp11xIHYRwEp6+srYczsTOqnXGtxrEhSkQO9B/0U4+M/qaV8gaZTbP
	wkHUBaQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt1WW-00E5tR-2U;
	Wed, 18 Oct 2023 08:03:24 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt1WG-00E5kw-2i;
	Wed, 18 Oct 2023 08:03:10 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8164C66072ED;
	Wed, 18 Oct 2023 09:03:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697616187;
	bh=NZBceo1UrDJC+0U1E84JTtwh8BxlG/3QVtT5mYfLMpo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GIt28U9eLenzBpXXEt4AQF62FAgGQ+kccHKXchztEJ02I/fdsVPEyiSXmEy2lkC+o
	 LyVdOJijQFH3QzkO3Rao+dFnrwOK70SgsWUTP9+9s2XsWxa0H/LvqolBb8ja1XGIbR
	 /QIFt+8j8JT3+EMidl2ZDH114wR13fhRpJW33b9yuUuFSxSp1cS1xmLezOEWIvpQCE
	 QDPxGycsNT6ojiLm5FqM6D3vQkpxNNhY6Pjskhd8f75V7SZGx3ctUk6MpWqWO40dBu
	 CD4qp2eRtrSh67TLMNTvWxyXkcXTJR7N+BgMi+ZtPTKpDY9aBFH4i9/4DlKRGuBLs+
	 oeonPHBNIN97A==
Message-ID: <8a045940-3125-47a2-86ca-c4dee5e7a87e@collabora.com>
Date: Wed, 18 Oct 2023 10:03:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] thermal/drivers/mediatek/lvts_thermal: Add suspend
 and resume
To: =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 daniel.lezcano@linaro.org, rafael@kernel.org, amitk@kernel.org,
 rui.zhang@intel.com, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, dunlap@infradead.org,
 e.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, wenst@chromium.org, ames.lo@mediatek.com,
 rex-bc.chen@mediatek.com, nfraprado@collabora.com, abailon@baylibre.com,
 amergnat@baylibre.com, khilman@baylibre.com
References: <20231017190545.157282-1-bero@baylibre.com>
 <20231017190545.157282-3-bero@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231017190545.157282-3-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_010309_016579_4A1DA662 
X-CRM114-Status: UNSURE (   6.31  )
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

Il 17/10/23 21:05, Bernhard Rosenkränzer ha scritto:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add suspend and resume support to LVTS driver.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> [bero@baylibre.com: suspend/resume in noirq phase]
> Co-developed-by: Bernhard Rosenkränzer <bero@baylibre.com>
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



