Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A7BC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 09:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxK1rfpQXHIfX97JHrfl0zHvIF75+oG/luaW4VIsY+U=; b=kmZQwW/Dc5JIaMqph5oN/+GsRK
	HgEN/bs9mx9f+sEexG0Z8ihpem0wVcbXDWNaohpqSmhgydNxV0b7sV/cKPqDVFreS7K5U5goMdg9J
	NdgwKCnOII1sw7ehNrTnGyex/YzKg3WVZLs4UyTrVAB0ux50P7dUe1jqQHfjjmcGVJ+YEYU0bOMkl
	KDopSZIXKZgvLcWQUjT2CEbDm1LjnoNmoY03A+RRH5EZ/3c5O1NQQpDvN7spgwtnX7HB4u73acmjR
	t89ailoT7/0CbOXQAGO2I2N3T11l+MLKDIeWOvEcteed3rdpl+YeiMQ9MtcCGSZfY+8S0h7FfrLk8
	9pytFwPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqW4p-00GnUC-Vs; Thu, 03 Nov 2022 08:59:55 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqW4e-00GnSa-UH; Thu, 03 Nov 2022 08:59:46 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E11BC6600366;
	Thu,  3 Nov 2022 08:59:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667465979;
	bh=yyA4nshyOejFruW2qTCDX0nI9Crc4tmHokItn82rW+k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PSxgdhGag8XE9XK1B8mnVZNqTZgJqYvHfsY6M/w7vbYXSfwg5wEBe2fcxRHdEnAtw
	 eH2tk7CntQM2Sq2k/5WGSqqdihck3cW3gTa+HyapP8VbDiGGhedTgj8crQAfBt3JZD
	 DSlP0Vna11jsKz2p5ZWY+0RPOXRSWpkP9VEUWg4z+BUgeoQOIt/8L5n4MzRlN2AxYG
	 Zx75XWGTnh7eFoTtz3mFSPwAxJjbI8RuizPdnv3uZpUePnrnp/7HS3NtC7sWD5YXnw
	 Fm8gAYD2gcPWfPqq8fYgERwbcfCRvm7gKhsON8Ddz7T41ju1DUz5KLF5MDPvGyv+ld
	 z9Cyi8mG96KWQ==
Message-ID: <128d8f47-1e60-bb64-e457-d61ceb17c176@collabora.com>
Date: Thu, 3 Nov 2022 09:59:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v6 2/2] ASoC: mediatek: mt8186-rt5682: Modify machine
 driver for two DMICs case
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
 <20221102125936.2176748-3-ajye_huang@compal.corp-partner.google.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221102125936.2176748-3-ajye_huang@compal.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_015945_215960_65345EBD 
X-CRM114-Status: GOOD (  11.18  )
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
> Having two DMICs, a front DMIC and a Rear DMIC,
> but only host audio input AUX port0 is used for these two Dmics.
> A "dmic-gpios" property is used for a mixer control to switch
> the dmic signal source between the Front and Rear Dmic.
> 
> Refer to this one as an example,
> commit 3cfbf07c6d27
> ("ASoC: qcom: sc7180: Modify machine driver for 2mic")
> 
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


