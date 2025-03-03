Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE43C282C5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Mar 2025 11:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssMtErUWzCw1AFWzYwVJJWVCO87aSkg4uxHQv2z5914=; b=jXxZc9IuzdxlDYvK67RSOyeirz
	p9rF08RwEq+w8S1kkMBmvoxlRNo6vL4UiFkaJWvNoQmg6cKRduczPirF6VkPmg3jn8skPd4zyfDvL
	dC+SEnfuc2nX6dOIOOjH4XSMYsL5fflWcsoRd+cGk4KaZGDFJVYMveiSgMNRfRr1yFj6/ftpzv0ZJ
	2rBPDiATfS7RkL4B6kb/AQo0ussFeU1ALflhZ+RDf10mIO4/5c1ebB/5l8jNLb5aDTHE+vqVvP5gl
	qynykgA0AmtCpyQMd2oTWpWLOTc7+/bBXq7es+WlEUHSc8m43wZdSw4vRHT4AghS8mwwlLZ8fYHO2
	7D9tSgAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3uY-00000000XbA-2apD;
	Mon, 03 Mar 2025 11:24:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3dy-00000000Spd-2uBR;
	Mon, 03 Mar 2025 11:07:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741000049;
	bh=vFfigEl9JtFE8tbSRW6zvkOLxEZfMTm7xZiNuaYSepk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UqrBbBBoRzhmFeT7N9CYWxuGC7e0mvHYcx4+KjVzEwmoaZYsp8OVRZoFxcIaUBOPD
	 OrQZTJuPbzuXayGOVKSoLxCSPKYP0zpC12bTZtL4Zz8vsCP1Bm0pUfNnxDqfWudaX3
	 7K40ONJS8mBsPTvRp2QAaHZv+TImuv6sq6FkO6/MexVeQ2S/COe8+OS5LlpRhgBATy
	 ibOfWr33zSuMvXPg4WYcMcF2mQWAkXiex4wczG3beVqw+MNXO5PTjItmHNhVzTwJRs
	 3lElGWMTpCvIpOxFWmmwV3BQuLthKSxqVxwPc0gZHekTAYP2D3gLmogRtr8Cb1Ct/2
	 T29tloQ5HAcQg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DC24717E068F;
	Mon,  3 Mar 2025 12:07:27 +0100 (CET)
Message-ID: <40c421e1-efc4-492a-9e48-077a95509a18@collabora.com>
Date: Mon, 3 Mar 2025 12:07:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/20] ASoC: mediatek: mt6359-accdet: Drop dead code
 for EINT trigger setting
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org
References: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
 <20250302-mt6359-accdet-dts-v2-8-5bd633ee0d47@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250302-mt6359-accdet-dts-v2-8-5bd633ee0d47@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_030730_871294_5C2E350D 
X-CRM114-Status: UNSURE (   7.51  )
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

Il 02/03/25 17:30, Nícolas F. R. A. Prado ha scritto:
> None of the EINT trigger options are implemented and the DT property is
> not described in the binding. Remove the unused code.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


