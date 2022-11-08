Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37D1C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 08:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19inQixE+cAajKKNusigFmsdUj+SJA6P/T5pzhRONLM=; b=lef13kHJg4cNBGo1TPtYA+Cgm9
	vDbXIOR7ythZHCZIuyV79ve4pd7uC0v+46H0rT1PRtrEnIfGoF9PA8JT05xut8Vtx3r9MFLX6L9rh
	tNSieyXB1NOAIvxmD8mSW1yjKKY2NHIoxf4oPd7RsfuXAzEi4U8Cujo/1EY2w2jjoI2T9H5EXGffq
	v1k+TW7s7HjRpN3edFO7aD7l17VWGuv5RlRzaiUsm/mSIqzZcW1ReilYlitano5y+6B9fkTwjWgfy
	36mLR0xs7OeAqiomyGkI2hYoZXn/xhwHtIuvT4O4WPGuvpRsmMfBq93xVdfNPhPnCn/pwgVBBqh5G
	QFAuOGeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osKDT-003o2B-PX; Tue, 08 Nov 2022 08:44:19 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osKCe-003ngQ-Nb; Tue, 08 Nov 2022 08:43:30 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BC1AC6602997;
	Tue,  8 Nov 2022 08:43:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667897007;
	bh=q6qqpBqwMQgI0Wus+7X9VLIEmROhuwDUjEYSYZTBgvA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ll/zh1EE1DmKEzOsB/fOBmWolEOOVEkawd8dOmhK7SAuB5SnwenGn6UP7gBirDVQX
	 NvLxMfi6GY/BuuuzREL2jp5GCzlzO7lKpZkS602lC6xWXN+eE2gnxyN3XQZ9x2Bi+Y
	 EcaF1mR7PVsqiFEdy1dgWk0jSv33bOjj+ayGVona4+OLvryuTyd4+ZfJfBAM7ZafhC
	 yNmQK2/pnI3qA203TpP4goIg4jcjFck9UOSTahO34UJaxzesDivYOWHH4K263rlyW2
	 yxm2RddnEo1zjk5DnGw0XBNs7/9oApOZsOKnhgpCtcSsp0Yb5cPNwJzEG7kvpw41gG
	 oHRhfu4XJr9ew==
Message-ID: <47349712-9dd5-3657-3291-3d306cb6f4a5@collabora.com>
Date: Tue, 8 Nov 2022 09:43:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 7/9] ASoC: mediatek: mt8186-rt5682: Register to module
 device table
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Jaroslav Kysela <perex@perex.cz>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, "chunxu.li" <chunxu.li@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20221107160437.740353-1-nfraprado@collabora.com>
 <20221107160437.740353-8-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221107160437.740353-8-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_004328_988964_29549F7C 
X-CRM114-Status: GOOD (  10.82  )
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

Il 07/11/22 17:04, Nícolas F. R. A. Prado ha scritto:
> Register the compatibles for this module on the module device table so
> it can be automatically loaded when a matching device is found on the
> system.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



