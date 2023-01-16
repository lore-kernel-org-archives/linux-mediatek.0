Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1708C63797
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 09:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5ZOZlwM+euHERoJePCAenSMfv2YTDUFtrcmqVB7F+A=; b=Fg49h9VCbKmfFcXGC1S0wEO9eb
	3sCksSd9srIWo/uNvL1s0hy36jmVqt84usWbfPkSYeVQPIeTSbiNrt3mwUimSrhzZY48GIoa0pu8u
	m9TYf7kk3mbNLBF/LkejKzrxnk5Pm4d+MaV9kBvuKdR783f4ba+lnd0IUU8OvLRxctayYQMseh4i7
	trLroS6pj+xb2cpASP3xEv6BG89RIRtjyr0Zq/fUEdrxO9NzyQ/8BXOUF/edTCTQXAmDtPCINniP6
	xAebNsKEjDHdOMUbFoMtTXxWlVTUsCV+dwn0DdakwpYt3inurh1+GbGwoYdgzWXUX4KPgvHeAN3gh
	E2FIOHsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHLtO-009Ntr-Of; Mon, 16 Jan 2023 09:35:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHLse-009NVI-Eb; Mon, 16 Jan 2023 09:34:18 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 041256602BBC;
	Mon, 16 Jan 2023 09:34:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673861649;
	bh=l4d/nOWEMwXLposanFY9XKP6QnAoGbIqo4G/neYks9o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LgGE1XHpi12/cbaHd5nS1YmPfwt0H+LxxnXyHY+5nqqHsehK2yXFaPdVk6nGpimSG
	 mIPiCaYJ1Pe1ChCC8RFscpBoly3H9be/v3SGuoy/1CrTWeQOZi5TgcuYpyyRje2FuY
	 VW+KvDQ/ymHou8l/HqxR8mlvsYEnzv4fzcF/4dia1o5KZc6Eg40MJ7Mk4kuKQSbhKr
	 SnkJ7IBTD8gBvQ+95Km5vI7c0QjmRBQkfQtbpP9AsDDFbtQHEkwTgyyjyB5avUPiNp
	 ZvHdzzu5gquJiT1UzeJkgGjVHNJdeKNEfJqqz4XP2kYuS9aDwzBwDo/EA1VoZTgNLz
	 IH7T9Qyp18pVQ==
Message-ID: <0a129474-a3c4-eaf8-26be-1d1acf5c3513@collabora.com>
Date: Mon, 16 Jan 2023 10:34:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND,v5 11/13] ASoC: mediatek: common: add soundcard driver
 common code
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230116034131.23943-1-trevor.wu@mediatek.com>
 <20230116034131.23943-12-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230116034131.23943-12-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_013416_694912_269511D3 
X-CRM114-Status: UNSURE (   6.96  )
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

Il 16/01/23 04:41, Trevor Wu ha scritto:
> Add common code to support of_node of codec parsing, so codec phandle
> can be assigned by sound-dai in dts.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



