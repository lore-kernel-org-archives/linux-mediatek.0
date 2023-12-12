Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FF4C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 09:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WMDoPjpN3JTFxt4ypPvC3ouSs8rcvHaNdDJFTNYykR4=; b=WKJeo/tWR3bRt1/SQ6TL50EPeR
	sAzwxPYYDn9ptad7CjrFBQ9Hczc1hNBM04+ySfih+oMncAoNijg6Ep5gjqkFEDurmhhcN5i3BmnT1
	jMr9v3xGh/RcA2WJEkMRcEm9jdju/jM51X/7WfxnSmoK9cxUZ6SQSCzVTHSMEQeePhkcLK7DqEPFi
	A8mZg7f+fZux0Zq9K6WORqq58JxC/aL0aHFN56kpOpjPgk9vME7NpIVM0UAbtqBVsN3X1ixJvUs72
	cOKcuVxSfkeZJVLcxLIEum95WhBUKa2SRthdo8hlComd2Vx5lONh8Xr0QbqgnRuxIhfurzfrAUZ6w
	1CJdBu/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCz76-00BCry-1G;
	Tue, 12 Dec 2023 09:31:40 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCz72-00BCqB-2I;
	Tue, 12 Dec 2023 09:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702373495;
	bh=63BaG8+UnODbNllY/PE5UFPUBy6aPrVHxXNq6unqZyY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Dm+Q7ExCKkKTJuhUnjwEyNwJM+krOm1JuYCk9nSgkwJSCWzdxuOm3EVOK3+CSPIM9
	 qk8iCFiBNEKWBR5WNHU+85HGJ4fxI/uOUqwHmiQw2ubrzMMZU2WpyoUY19aKaxRRBR
	 W8mV6t8z6BIb9L5eD2cjzsz1K5J7n9PLPVKkVghu/pzAPHU7CmyEi+TwLOqjM47BcV
	 spCfjrfAor/pVbCOW5LCKdXmD9fjxmISwcwU3P+6JVG12PJLf7mhyYMrRzPJLbYYbd
	 V0cz4CXasjsdSAAS7ErqxNmz2OtAtK9V6PRi25JCAdLASQQyfh8e1vGpmv7hvkW6kS
	 61XB5S+uwBNoA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3B23B3781423;
	Tue, 12 Dec 2023 09:31:34 +0000 (UTC)
Message-ID: <1cd5446a-37fd-4fbb-8c17-e0046e58c29b@collabora.com>
Date: Tue, 12 Dec 2023 10:31:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] clk: mediatek: add drivers for MT7988 SoC
Content-Language: en-US
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
 <14b00d8c9d1fcfdf8cd6b9b02e5a19566d970e6b.1702350213.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <14b00d8c9d1fcfdf8cd6b9b02e5a19566d970e6b.1702350213.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_013136_883147_B75AA576 
X-CRM114-Status: UNSURE (   8.36  )
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
> Add APMIXED, ETH, INFRACFG and TOPCKGEN clock drivers which are
> typical MediaTek designs.
> 
> Also add driver for XFIPLL clock generating the 156.25MHz clock for
> the XFI SerDes. It needs an undocumented software workaround and has
> an unknown internal design.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



