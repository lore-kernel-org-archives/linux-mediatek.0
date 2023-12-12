Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886B7C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 09:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CfEljMPtLje3MFlJLiWuaUqrgTviRxyWKDYddo/arU=; b=yuZ8W1kpVembk25C8XKYf7Bt+z
	lfcO0CvfWjd0xiYBA4yrGZCDRyxzraMFq3nF5Eu0wG5ehWrTYLoRV/wSqM8+3Qggd3nPd3IHDPYsK
	5EtpDUUXhYWDs25f1JCSj5xh4O9J/Pa9meg1SMEfHvhrL7gMUtLpG/CcsnRvZlfJepBQCFlo9+peh
	sTnCDlgkJ/Y4y9jZzlwSBz5nwHjAcjZ5Ar72/A7yDJy8zhbncFpq4QVCwN98SazgMbewP3H21IGWm
	OtwQPdSEAVtvnDwJi2aexKlCIsWFN/61Ocj3vRLCqnEEc3hH+TQ2Rm7LjICI9RAv91WXwTkZ11HaI
	O91JRk8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCz6d-00BCgH-1l;
	Tue, 12 Dec 2023 09:31:11 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCz6Z-00BCeu-1o;
	Tue, 12 Dec 2023 09:31:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702373464;
	bh=Aj1SZsdyMWon6M+Vhhcwq+fa3T9vjrPvnP1Vckxo7Ug=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=arygweMMH6v3uzypbrzzM5Cn35/VFezVpvPO5GsUTytF+NPfqWQ+07JPOgvgbkugo
	 A6pQ9VE+UTHB46JDlp6OT52D3XmiCu17Xv2Vik9Zk+x7z+BqvI3Tyi7rfgODmlwwkq
	 4m2LMvukpKAwWgMUjtwaRpfqCLrg0qKRpaEJLYCcQRoARVYznkXFn2KJQgmI1o/dXV
	 +zlXzGJ0lp/9zi+dfADmwxuQHvZsvekVEsZQgBDK7a1iaGQuc0+eduAe4sSA5MPOuV
	 shEXtPGuqcQC6OSiJZ4QsWxALOjWzHxRc3Azn2Xw8csR66M1BDBD35bAxMQz2VXOPX
	 Vl4bfMZeeKhxw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6B3373781423;
	Tue, 12 Dec 2023 09:31:03 +0000 (UTC)
Message-ID: <27d8ce67-fb8b-403f-a35e-3e03a1ffd1a0@collabora.com>
Date: Tue, 12 Dec 2023 10:31:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] clk: mediatek: add pcw_chg_bit control for PLLs of
 MT7988
To: Daniel Golle <daniel@makrotopia.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sabrina Dubroca
 <sd@queasysnail.net>, Chen-Yu Tsai <wenst@chromium.org>,
 "Garmin.Chang" <Garmin.Chang@mediatek.com>, Sam Shih
 <sam.shih@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 James Liao <jamesjj.liao@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <152b256d253508cdc7514c0f1c5a9324bde83d46.1702350213.git.daniel@makrotopia.org>
 <a43ad2a0131ea35988dd490ab235d16d4119bc3a.1702350213.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <a43ad2a0131ea35988dd490ab235d16d4119bc3a.1702350213.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_013107_739019_7DC23788 
X-CRM114-Status: UNSURE (   8.10  )
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

Il 12/12/23 04:19, Daniel Golle ha scritto:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> Introduce pcw_chg_bit member to struct mtk_pll_data and use it instead
> of the previously hardcoded PCW_CHG_MASK macro if set.
> This will needed for clocks on the MT7988 SoC.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


