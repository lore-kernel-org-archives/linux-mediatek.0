Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D8DC25B47
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 08:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X9obi+dFD4ZozxhiYuMcykiHogKYWSTwiNLe6dQZ3lc=; b=gQyIhA3LKwKU9QU0Ag17yBdLI2
	NRn+FeO9O4dlJDR2MwJG0oMoj+jbI4KzcR1S55OewLYZ/aWfRMK5B5RTpIAdsqtyMXFtPEFPrhIpS
	gRb7AddYiAHSbUg/5iZwc7I+Woig24EVBbmp9cPSq0e4boCH/N/qmU4tCqz2Tof6v/hIEYS3UnkaQ
	H0gIhZ2exaRwNwxUzSXMAA09yuOtaCUJp2xZ/KHLhwUA4EFa0h+MNVo3uzlQ+Y4zEIMmQD/J5+fP9
	wZkEY3tUo3v510A5ugHd3GIOiqDoYHvNl1cqoDzMz65LokfKhhaJQPSOQTiYsKKA+HQ9mxdevxPPX
	vyHjULTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDBl-009F70-1M;
	Tue, 24 Oct 2023 08:55:01 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDBT-009F17-2p;
	Tue, 24 Oct 2023 08:54:45 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BCA126607333;
	Tue, 24 Oct 2023 09:54:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698137682;
	bh=dr+lBL0FhFKWb9fkKS+Z6wsuWwCRxXkpjetaSpWWU+U=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=bPW+1ZcdTwOj8FBFdw4I1Syr+MSKAzRplZWmKVS/Oha2M90esVoa40WRkeVK6YskO
	 ApEVEqmiNecwv6GeZZUYLGaKA0ENmqYZzd0uEJ5nOZ1F3VjggVuL112IH1bSN4PwUz
	 BPX8ehk3k/QfbNBxFzEqij0ZP4ScW2EEFBCR5+SPeXtujlLhGddPioGPNYDMDtNhIa
	 AcreHulGkzPzw4tHY89U7nnqI2HmQXEVf1M1uJONmTdnSb368Q4KXe6Bny81oRs8AX
	 3/hrOPRv48li6rfPnCgbVH2CKyw4txDkHZL7wyUcxmN1P9N+P7yq2jCGJLhq6mZOn9
	 yw4/8S1kzLmGw==
Message-ID: <faee7aea-bf08-4a5b-be88-e04656039844@collabora.com>
Date: Tue, 24 Oct 2023 10:54:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH 13/17] ASoC: mediatek: mt8186: Handle component name
 prefix
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Lars-Peter Clausen <lars@metafoo.de>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Oder Chiou <oder_chiou@realtek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
 <20231023095428.166563-14-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231023095428.166563-14-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_015444_065511_CD15031B 
X-CRM114-Status: UNSURE (   5.62  )
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

Il 23/10/23 11:54, Krzysztof Kozlowski ha scritto:
> Use snd_soc_dapm_widget_name_cmp() helper when comparing widget names,
> to include also the component's name prefix.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


