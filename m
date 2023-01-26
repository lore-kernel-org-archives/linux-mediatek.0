Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272EAC05027
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 09:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSlFBKZObkED0RFUiofKNh0eKcgUCUlMKyh1W5eWbg0=; b=m4g/UHHYwv3mZtFnTF2++69HWQ
	ilHh4TFi2QmH8INSpJQG6Nuihm0vBKqnqfPGMWlOLrYoYQh6T7xdtom55ENkn2nNDYfVZp1AoGZvE
	uCFPDQZN7HssuPy1Y+nImP6S6oCOl5StBTOzQYCeCPNOxc3zbtvRT3LGKrPaZc3TNTrt8dRKed3Lv
	SEn/zH2B+bexLrfdfiZkp1NLPMYaedHa0oDSHO+MbUbReZKfXlOGxEK/FPPC6pX5eeRqkU6GBwYkf
	h0xJnQTMh8hldoPXic2Xrpz4X1MjkVU9sj23qdItH231E+/eY7fFr24AMf5/7VedofkND3urgARU6
	1MZ+C2ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKy9Q-00ACE0-1p; Thu, 26 Jan 2023 09:02:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKy3b-00A9Rn-DQ; Thu, 26 Jan 2023 08:56:32 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 199DE6602D35;
	Thu, 26 Jan 2023 08:56:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674723390;
	bh=NExhWW8+qHKEb+Y59mluNBtlYyERElOQ/akklblGo6Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q45+VSS04uWpGO+OM6sga/j6V7v/fQRsPkwLhmFyBbaN5Mm4nsoSxTSjoCtAPQRNP
	 asrHzMSDl9EMc001eOypKwbSTcVrsEcw1SVPZKGARRFDXfzAJ4nXB5RXDAHeH2j1Bo
	 8r4KkBi8nwOvwxsMhxEEC28RTTYZ7ALF0VjvP23zxV0jQ6BefnvssGSe3VDRLJfisP
	 GV7be5Zjy32C1xgVwEFP6O3P7Pf/TuyMlkpwOxtOFm3zfoXiFkvPOb9f4p+GT72C0R
	 vgu2RlZEbggaJ3r+uUS0m63rwcCMZ9qZQBUJJZaf+m6yuFtG2TTPC9ky1tk2PNLMo6
	 T/tg8g/q91vqQ==
Message-ID: <cc83fbae-2574-1ed7-63d7-e45e030d110b@collabora.com>
Date: Thu, 26 Jan 2023 09:56:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 2/3] dt-bindings: clock: mediatek: add mt7981 clock IDs
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Miles Chen <miles.chen@mediatek.com>
References: <cover.1674703830.git.daniel@makrotopia.org>
 <e353d32b5a4481766519a037afe1ed44e31ece1a.1674703830.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <e353d32b5a4481766519a037afe1ed44e31ece1a.1674703830.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_005631_634727_B5972689 
X-CRM114-Status: UNSURE (   7.32  )
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

Il 26/01/23 04:34, Daniel Golle ha scritto:
> Add MT7981 clock dt-bindings, include topckgen, apmixedsys,
> infracfg, and ethernet subsystem clocks.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



