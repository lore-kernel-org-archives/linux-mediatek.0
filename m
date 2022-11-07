Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F080C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 09:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhLGW+FnchxQX9pi2UPLq3pees52JWwIu1ukM9gsZpg=; b=KxUnzrwexq8zBhMxsPUqiKkZtK
	ZLTuIxc3BvkdHbCKOH+CX/43ZSrCiQ/Sy+niUcEWf+RcCPrumG9ERV+e4a9CbD1cp+mtR2KMK9O1N
	cbbXsNudp6sHZJNyNYv+lXGUeqDxukD3IXrHU2Vzlh5gnjvmRupaaNbgMVWddn0HedI4t411AYNGY
	3HZ6v59wjIK1cyAiaATNDAMfh2vo9tUz3RreOAUXPuVBWYzscJ2N7KgIr/zURuP5jMcaykvpzUusk
	QBuanvySCb2CPEFv+bef1E5ACnzcrkFHGfrm3vNpinpOTmJ49UlevOdIHD4TXDEV6Rlf5WzoMIY7k
	IjrQAZjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oryVp-00DMde-B0; Mon, 07 Nov 2022 09:33:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oryVM-00DMLv-D4; Mon, 07 Nov 2022 09:33:21 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 523C066023A6;
	Mon,  7 Nov 2022 09:33:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667813598;
	bh=Ym/ve3dGuUXNciexSXw9euMcwMya4gk/aCexVTu+KNk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NFuasTuN/NSU9Y3uOchBqk0ZQoqmWWoS6Gkn3a3g0LPmfvGjYkDt6TKK7mRdi9MBQ
	 oTW5aIXxGhde7ocI/UzsR/vfIp5+NgEfst8tw+iWnxOlolFmaWZNEeJecIJmz/haA8
	 NqFUiFHrlibL/C33Gt+JxlC/uQdNLSxMLjVoUKn5ESmECNUlptEyobSXlY29+c3C/y
	 tqqdeHr/2zqiONg/7eyaUSi/TKs8tGUxd4eW1XVT0cNN9tDI/cPGCNVgRK5eSa4OrY
	 38aYhQ9FnnnAWcXiu9IFmfettzHF3imFLYBjC7OgTTVW3SrztWZYYzCk3kl4viLTWc
	 I4TYqHKOWuWdw==
Message-ID: <4b1fb965-60ec-66d6-f511-13c7f71a3a77@collabora.com>
Date: Mon, 7 Nov 2022 10:33:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 6/6] pinctrl: mediatek: add pull_type attribute for
 mediatek MT7986 SoC
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
References: <20221106080114.7426-1-linux@fw-web.de>
 <20221106080114.7426-7-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221106080114.7426-7-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_013320_633137_93B59385 
X-CRM114-Status: UNSURE (   8.62  )
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

Il 06/11/22 09:01, Frank Wunderlich ha scritto:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> Commit fb34a9ae383a ("pinctrl: mediatek: support rsel feature")
> add SoC specify 'pull_type' attribute for bias configuration.
> 
> This patch add pull_type attribute to pinctrl-mt7986.c, and make
> bias_set_combo and bias_get_combo available to mediatek MT7986 SoC.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




