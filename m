Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DCCC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 10:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4g1p4LyJ9o1xP4tKDPgLgph5bfoBo0BgWS3rn0OF0V8=; b=0dS2+OdvH17XehlxYsq1Svt86C
	DblYFXozrlBwNN+YogUR6rIT+gs19JMv0KRXEWgYOjfzcgssUKDdUF6nH8cAlmMFEQH7ril7g6w6u
	WrV/2TtzixbqG1sRPNbAoYpz3u39C5V5m8SSzsLgEPBAgW6ELs3OJu6Y8YpAFZqBWiEfdoULn1OeP
	D8pr0HP9adBn8gg4gCUY8opAP/K5/KiK325hPH2EOFRlcsHr9jhiylXazdyL++j07rRrdHUSD8Vi0
	X07EavWtcd4X6HnuuX0bsRGsuGOBLWK73digEGR/Hc5EdXyheW8l+8AaBa7kx1JFRF/o/wFtiKNxQ
	uX2msFYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p52nS-00Foqm-R1; Tue, 13 Dec 2022 10:46:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p52mw-00FoCD-Lg; Tue, 13 Dec 2022 10:45:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BA77E6602AB2;
	Tue, 13 Dec 2022 10:45:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670928326;
	bh=uplpfhEN6RmyAtuxsuSug50gkJOXSHec1yz8xB64QX4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OSPTw/wyqkLD69Ap07pXFqSSC0XEq7gF01g+KFB9E+NXHRWa4YAlsJWuD/xTNM8Z0
	 JwOL6FFumMHMmBEL/867Z0F0S4ggG3H3euRxkOc52f3ngcYSHS4uxH+f8XcsiyFMgv
	 n86GuWECw39I2xKqSq8qTyalhtMk2VW9lTBe62DR21xnPF2MDg6RAVeoda/wB5Ae/W
	 jz/adww5OPm5DKI3//39M+MSbQBXnst5kk59N3Zn8N1/GplaTYF0U9VLdJqZ9G9Nrq
	 /BUSMSRMc1hiNKQaO2BglRWZZNL88eZ4PeNejBsZDKUvsfE6lMbXn6JErDRnd/J7ic
	 imHFADLcqxEYw==
Message-ID: <ff9ba731-8d17-b98c-5b24-4ff831f6aba0@collabora.com>
Date: Tue, 13 Dec 2022 11:45:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 04/12] ASoC: mediatek: mt8188: support adda in platform
 driver
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20221208033148.21866-1-trevor.wu@mediatek.com>
 <20221208033148.21866-5-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221208033148.21866-5-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_024530_952200_4F8E07AF 
X-CRM114-Status: GOOD (  10.33  )
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

Il 08/12/22 04:31, Trevor Wu ha scritto:
> Add mt8188 adda dai driver support.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> I don't add Reviewed-by tag because one new header file is included
> in the patch to resolve compiling issue found by kernel test robot.
> ---
>   sound/soc/mediatek/mt8188/mt8188-dai-adda.c | 632 ++++++++++++++++++++
>   1 file changed, 632 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8188/mt8188-dai-adda.c


