Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5588DC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 08:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rVLOYpV1++OjIXADRsBPe5KxvHlYBZ/p3UeFRcE4WE=; b=o2i7pnjH3rATUj/u3DiuVgAyCq
	Di5pjMdSr4ZfPnPXaLLcfgGRIvMDdwrJBgbSRFsT0se5FjeBlF9h0XP9C8oEx1gUvHFbOivXHKRqC
	DvIJeMOLfRDXe4Ne0Gv00omGeiRoMj9KG33owlu6KiJxcT/bUZQfO1R1uj4LjFKh+pxhg4NTxM5La
	WoJ7a1fpRVJjb/X5vbK5kmnDHQpszMDSOGklmeKTB0I5oGeSgjXKF/QazjIv64cGrEE/+wUKryWRr
	CfbUGAh9PaPogj56Zzq7Djcwr8QUaE0YgZyj60XxYEVz1Z3aqRm8r37ULiuFiaIruTKB9MGRodxHz
	6xsUPdsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oln5P-006DJq-4A; Fri, 21 Oct 2022 08:08:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oln5C-006DFt-RG; Fri, 21 Oct 2022 08:08:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E48DB660252D;
	Fri, 21 Oct 2022 09:08:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666339725;
	bh=MwXEk9n4zFA+AG1gv3Y56fdU6wFaQLwUFj+QnnLrGvQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HhXp6ITXtHf9sBj55RIx8C0qo2GyL6Lj060l8ta1E+m/ZHTjOvOQTsJS+ZLbJFYa4
	 YqUtE41yTF3WTVVKbavl/d79ZTHGTdsSWn2fB5NwqyU7lygoYW0KoFDVFLSOkDMYmE
	 3d+HDH+g8POZ9KcGewQeuKiZTY7DaTmKOggQqwvgqEMziBZBpgeqG1K4kmHMaSY0ND
	 cTDy/bIiJbSeEHvip1KccI4seNUbSszWPbmKYEtARGFDQDvjsWNdVAh16/9lYtK6k6
	 EXG29KdmxLDsEh9ruF6OCMNbgtgmkuDOceGP6koF5uv6D2ec2fuQIvfyWB37CHmxwz
	 9xJCINotuOEuw==
Message-ID: <9bde77be-f4ec-11e7-e645-7c4465bcf6db@collabora.com>
Date: Fri, 21 Oct 2022 10:08:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] clk: mediatek: fix dependency of MT7986 ADC clocks
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sam Shih <sam.shih@mediatek.com>, Miles Chen <miles.chen@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <Y1GnFEjOWpplFjqI@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <Y1GnFEjOWpplFjqI@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_010847_039087_08BC3511 
X-CRM114-Status: GOOD (  10.68  )
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

Il 20/10/22 21:52, Daniel Golle ha scritto:
> It seems like CLK_INFRA_ADC_FRC_CK always need to be enabled for
> CLK_INFRA_ADC_26M_CK to work. Instead of adding this dependency to the
> mtk-thermal and mt6577_auxadc drivers, add dependency to the clock
> driver clk-mt7986-infracfg.c.
> 
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Sorry, I gave you my Reviewed-by tag, but I've just realized that you're missing
a Fixes tag.

Please send a v2 with:

Fixes: ec97d23c8e22 ("clk: mediatek: add mt7986 clock support")

...and retain my reviewed-by tag after that.

Cheers,
Angelo

