Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42024C282C5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Mar 2025 11:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnJsnFczeaBjeVgc9yqG9GzwNe0aWD0Cw69SRWDHTwQ=; b=GIQLSxm7K/l7MLtQ6DGzfP6I3N
	e5cvGM9OfVxfSAhsDmnbHoGNCGaEd3Fjyh/MfCDN6A7MsXuO/Z6yoDdqj02I6kGXEUKnD/TpJT7Uc
	SaK4SUdfRlKunrw5hUmnom3wGDZBqo6dbpPwXt0DOmHf/6MPgRTQTLXYuFCnY0v5Uc+x5cayU7NfZ
	eoLmPpc/BIH5AraMyNXZEJncda5njDCIIdg8bfcy6KurVpvOBg0c1rX4941Pc4e/IfsDNSzBNykPu
	M6QleJwSOuULRPEWOV+6onhnytJLesshQ8nv58VmdaMbpdsIWjZflWaL333YMndL1v13eISPayFXl
	MoVfrxLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3rU-00000000Wm5-1glK;
	Mon, 03 Mar 2025 11:21:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3ds-00000000Smj-2snQ;
	Mon, 03 Mar 2025 11:07:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741000043;
	bh=YFi/CQNiPmpq7VS1aEO8k340+7EOj2la8l5QkoY6kNg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oskTJkVgg0gn8zI8fkmXE4o6td6hBteCpj2dJjhjyONhRmXxb1+ah9X7CezKeuyQy
	 wKnC/Q+8TO8be1qb+TeE8o5Xbl6o3beX7gdFcXTpa0NpkQzEwVvalbs1Lg1t/cI42r
	 I4nivpVg4vd0XfjAVda3gS5JVVkrJMLY9z/Qb3zRaJjs9PRAbEfwi0dMUWtlhFS3DM
	 sfFS09o8jYKiS2XBr5YCqxESgBQmD4cEd2chiE9kLna6VlwI4Rit3WOB029wgt4VvI
	 kFbkKwtuEjOCOpewcTltZiuLM7MXOQe0Hq1T+h7tEg8lZPYfalCQj9FMQ0WUBgyRg0
	 x0yzwNuLFc4Lw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 111B817E068F;
	Mon,  3 Mar 2025 12:07:22 +0100 (CET)
Message-ID: <7bce0cec-3a44-48ce-af55-db20135f696d@collabora.com>
Date: Mon, 3 Mar 2025 12:07:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/20] ASoC: mediatek: mt6359-accdet: Drop dead code
 for button detection
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
 <20250302-mt6359-accdet-dts-v2-9-5bd633ee0d47@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250302-mt6359-accdet-dts-v2-9-5bd633ee0d47@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_030724_887071_989E931B 
X-CRM114-Status: UNSURE (   8.34  )
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
> The button detection functionality depends on a calibration voltage
> value which is currently not updated anywhere in the driver code, and
> hence it doesn't actually do anything. Remove this unused code.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



