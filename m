Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF24C282C5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Mar 2025 11:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRWQGI3UGJZ2+SBEPwHsQL9xASXg7AR7etTB5zWHs/8=; b=brdKlqdhgYGEEUwQWkXUKmhEQP
	K+S1F6q/TxZfeZ4s9ioeBvZgvpidTooyQtiRz4nZGYQMBx0xCU/Ay9sNmTES4HT4aD2NAKDlmnyVX
	UHNFjHgOXUThXCZ1ZK50HrrS9OwFGUZ1nWNIfaGIH6bFSGiBeW+/fkJxO+9oGFrpV+cPBDyks+CW8
	YA1eOGEXnrrWhQBCFvo9MACTj0MXsuPOqxl21qqe5GC9vjN+pPLcGk7eDfoBgAUBFTJA4tK7lmK5b
	ext1t4thrkoXkln9lisF4P6e/qPwjg9LJxUqZi9wbGtjSC7iFKD4sHmkdelZHtRaFWYT8c3GYtlbA
	XpyLWudg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3oK-00000000Vub-3pJ6;
	Mon, 03 Mar 2025 11:18:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3dn-00000000SjS-09Be;
	Mon, 03 Mar 2025 11:07:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741000037;
	bh=ydv0dj1ouNGeLIsMSrdmifpN8XSR2k+C1xJp556epXA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZxjwzTn9DG1Pr5gPvxeMA7NkqV9WlwenNxppxHdRieVmqAV2Jk9E87NVFkMNauokQ
	 huaeMbWKcT3YA7rLwlLJiJFbzNF0a+3ovxRSOLGV1eJtK0qZBWMuHgjmCfI6gBUd9P
	 VxQkgsYGRL+Jlt9Mx8C4FkiB8sd6VonRq+tyKL6+w8RCrcN5+7Azv1SMlTOB6Ok56Y
	 QQp4VUWFQtNz3zFr/GSyiBzuY3ZKIEsLxiSsuRKGvwJQz0cG9wVCdC/00voSEsShAy
	 Ha5QBufSL3pb+DAL6KDcIwNr8myT0qk1dnPEouxXVhP3h7APf+wUPJIZKmR+CgMrTI
	 RJ/J1ZWPQCv2Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3820C17E0881;
	Mon,  3 Mar 2025 12:07:16 +0100 (CET)
Message-ID: <ddd4b401-68ff-4b6b-8335-1feb29bfc243@collabora.com>
Date: Mon, 3 Mar 2025 12:07:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/20] ASoC: mediatek: mt6359-accdet: Always use eint
 detect mode 4
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
 <20250302-mt6359-accdet-dts-v2-14-5bd633ee0d47@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250302-mt6359-accdet-dts-v2-14-5bd633ee0d47@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_030719_219430_F97452D3 
X-CRM114-Status: GOOD (  10.43  )
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
> The driver currently reads a mediatek,eint-detect-mode property from DT,
> which determines certain register configurations. Since there are no
> users of the property, it doesn't directly describe the hardware, and
> the default value (4) is known to work across multiple boards, remove
> the handling for this property and always assume mode 4 is used. The
> property can be properly introduced in the binding in the future if
> different boards actually need different configurations.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Same as the internal resistor one, can't find usage of this property, not even
in downstream devicetrees for dimensity chips..... so it's safe to remove.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



