Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189A6C07545
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 08:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGW+Ssmyy4MwXNh9rplFKo//VpciDIHIyVQNuCfEdTc=; b=qkjFbUD262Hi14ONJPVwtwvB0F
	Hm28gO1++i7cV35YjQc1kDUYYRP+UzhhK8RFINu08vIuAV//KRhmzEU6xqKWF+gRQ8dlakJB0/eWW
	okncbO/0zdI4uubk84Xv6zUtqlW9fjJVML5XAOhsOO/24wspMXpCmlDIfzliywVMMcamwjAS9ch/p
	Sn2Q5TB0D3DGNvDc90+IAg6TNsjMfsEU6ydZHEoIkwjlEfXe5ONURp0bl5MZoPh83d8RfK/8IcBhr
	ZTp0t8E6V4UOHCuDD6ElxuTD8sxeXudNh4Aev5KGCfCtC+8YnoreN54mrfhY+ZB1EZ0LHwr0Lyf96
	6aDBY1Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDBl-009F6l-0J;
	Tue, 24 Oct 2023 08:55:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDBT-009F0l-1G;
	Tue, 24 Oct 2023 08:54:45 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5BEDE6607331;
	Tue, 24 Oct 2023 09:54:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698137682;
	bh=VI/Y25XEqSA3SbhcywY0RAYmG7kmKXN4kUFw9lzcX+k=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=j90A8ETr4geEi4CEGY63sExDY6LWoWzC9w34VLmFbz0Ax27274b3bX6FLA5Yla7Ye
	 NrvHZFwdSWyZFEV1FV2AkxkUpE/uT/dcNVpASPz2NOgr+WmX53SHpee81XPUdzxx2T
	 VQrE89O2dlVmhg74VaAI77C0/JKZytqyKv4VQx6T2O7VnWSvnBxTvNhJa1E9dwWeTq
	 dwgAX6K71QVhXaU102he57qygE3ubL4CBtJIrP9dUER7mAYpixoOZotRZltP4yRR8X
	 qzAC91kVbLPsz9qwuKOIR60Tec2gtPiWVDY8EgQtgbpDBHbWPazJHQ7YNTsAUiuzFq
	 u+TOsYfNg1szA==
Message-ID: <72e5b30e-d65b-4530-ba6e-31082a059cb1@collabora.com>
Date: Tue, 24 Oct 2023 10:54:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH 12/17] ASoC: mediatek: mt8183: Handle component name
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
 <20231023095428.166563-13-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231023095428.166563-13-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_015443_555491_86588E5A 
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



