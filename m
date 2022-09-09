Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D18ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 07:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4gyYouUfcwtnRe80kQaHnPS4Li94Wu4xZ2I7eGi3FE=; b=touBcNfCqwrV7AE20N01MQPHQ1
	/CrgKnhTPlRAQK1owGzSTN94qnnWY3/zzvHZtS4V1BwClYbobYtibvfGDU8oljWR+YrkD7RR66er/
	c5ScVMyDzc97GrdRxW1u0kmMUMWGOoFGjq4qEcFAwLeah+K1UDonKsPACyscyDimuvrsm76qPYpg5
	GU047ASO9L8aQ5uF9HydLKnyq/oORWK3AxUEsdJD2lxILoxNQwxkLgC+F8rV/UAC5rFJaa84y/mDy
	CrOqi7jCiXEjDVpuStlC7l7sd6Wp0eYGoodjI++IM1j5WsXAOpXN+z7nF92zUFBIiVGvAP9Xp10S/
	obgKlpcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYXt-00DzTX-Cp; Fri, 09 Sep 2022 07:35:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYWv-00Dydx-N6; Fri, 09 Sep 2022 07:34:27 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ECB6B6601FAE;
	Fri,  9 Sep 2022 08:34:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662708864;
	bh=M/ImFX4OghN1Sdqc5u8HRD4U/spLXlNjoEztoXxxE1Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VV7I4GacRYbbGnJOBZylhdmQ1mJ6FLW8Y6tKEVxsS55KjFuXLa7WJtZmjBtAr+3Rm
	 ynGCagswN0JNdNnlv0NXuw6bHi/zQNMyw99Fc8DCwcOEGopnKhHKt9Ocms+Hnocb2Q
	 9g9HncPI5Ix4eMLFq0NpB3XkEaFO1EmW2k0eDTcWkjnWqrHpKqph5bEAtBuUbkAs5J
	 YvSiorEW0+3GmQV3xD+Rz/4KvrOsYEF8+RyYIT0HKzAP6mG+kWuMVBSKsORkO9vXEM
	 fpRTGYStE11oPnoAQ6D5zrTHCP/qg9A8zQClAiwwWSNP4ghCWP0ELwhu4ZcTRVPi5a
	 1xUgOsMa+COsw==
Message-ID: <be60c122-2c01-5963-0b49-9f55806f787d@collabora.com>
Date: Fri, 9 Sep 2022 09:34:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 01/10] ASoC: mediatek: mt8192: Allow setting shared clocks
 from machine driver
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220908161154.648557-1-nfraprado@collabora.com>
 <20220908161154.648557-2-nfraprado@collabora.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220908161154.648557-2-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_003425_932793_8717C502 
X-CRM114-Status: GOOD (  10.16  )
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

Il 08/09/22 18:11, Nícolas F. R. A. Prado ha scritto:
> Add a new function to configure the shared clock between two i2s ports,
> and export it. This will allow the clock sharing to be set from the
> machine driver instead of the devicetree.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

[For MT8192 Asurada]
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


