Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A788AC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 09:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRrHvOZYuM5KX40xF30bBSi+pN7wFv49dxFQ5W+F8H0=; b=UQjuKF8ckm+0iIEjxXFLNiWTAF
	SE3h9Ac1aZucH6vnGu6tWw9w8bUIyDfief3i+K32He3DjfZMiH/4lO6rSu+df8R8BknyhRHlFi+We
	ENW94LB9Sk8JbkIxHqWYhHR/7jBbtgX4bYjb6Z0uHZz+50Z0W5K+xhblwFNFWSJoTxMfImonkMAHo
	tR4LJaKl2nYsAVZyiKHfQiPrnCWhPDMkz950jkD/KQxyE32ORqS5qblX3O5SULaYsrNXe074Xst/x
	5S9i6pVKW+uecp6nfOW+9EF/CdPuIRD4ZH1a/hRr48OMf31gunImeY7PF3IUTns+RBGtkcISj5P+h
	Jz3LIadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqW77-00Gno2-Uh; Thu, 03 Nov 2022 09:02:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqW6x-00Gnlq-A6; Thu, 03 Nov 2022 09:02:08 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BD62166028FD;
	Thu,  3 Nov 2022 09:02:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667466123;
	bh=510sRv24hOV1wpfQEDVR+KdeGI/4GV2/R4TwmE7oPTo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b7JGsFlCs/MU7fEVavBB6XxS8v6BhCjRuqpMmoKIDO0a9l1RNaXW2L6iFe3r/bG1m
	 X4j4kgy+y0d4+zrajo5whvXJtsV0DikSKzE1O0Uec1JtRvpNfbkvz7+1Wg3WkL3laY
	 7t1A28s7Am24y3vQ9ob45CGTcv7KATTpkQVdQB/V7mptozX1qdg/UJjC3qhXFe0DwA
	 B3TMK4xzBt9x+72LdAZoLXYZD1NTtF0jXy9/FAfQzwtEgjOlZShw1SWYhICP+oVd3E
	 F4IVMalJrfqjvG+0qsBie820NHmgh3y7yEG+zoJtNsI29MndXzqYpo65JIebFAnuMo
	 GQH+u99wHyRHw==
Message-ID: <c1b8df00-2be6-9cf2-0e1e-b4c838fd12cc@collabora.com>
Date: Thu, 3 Nov 2022 10:02:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v6 1/2] ASoC: mediatek: dt-bindings: modify machine
 bindings for two MICs case
Content-Language: en-US
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 "chunxu . li" <chunxu.li@mediatek.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20221102125936.2176748-1-ajye_huang@compal.corp-partner.google.com>
 <20221102125936.2176748-2-ajye_huang@compal.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221102125936.2176748-2-ajye_huang@compal.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_020207_524244_CE9A1A8C 
X-CRM114-Status: UNSURE (   7.45  )
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

Il 02/11/22 13:59, Ajye Huang ha scritto:
> Add a property "dmic-gpios" for switching between two MICs.
> 
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



