Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AAAC7618D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 14:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4mrRlVbFGCJHepSxwwp0mX2TTFdq2ODwRlG2PIjv0Hc=; b=XfZPtw6BbYMO38
	rHLZPntQ35PLNu+I/EJ0PPMsydkmgLF4HUdWL2Zkw5ZQf3wCxqnlKOkFxR6XBBlAYn5/OkMIo4oaX
	Sp/AF+5uue+VNcXCJkAW8HMFbvfLm6qOPo9krz5ou/PUw1c+eqR4IH7aWovv9nCWVIZanO9RbLwDL
	UAZYVN053cWvY26hU/dZ5ELWKmTXSo+LzFsCGewS5G+56oHIOdBu/tHCwKNUAmFGB9Jio5UufcN0g
	b6RaJPpL0k9oayiNjxoJF6ZzJYqAqFYHh3RxE5oGyJ/dIuUeybCU9+mawuLhCJ/ASEzaGBu/9DCbz
	STyyQluTVcjh9XfwmdTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peGuG-009P20-2z;
	Mon, 20 Mar 2023 14:54:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peGte-009Oj4-24;
	Mon, 20 Mar 2023 14:54:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 10ECB66030A8;
	Mon, 20 Mar 2023 14:54:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679324041;
	bh=gX3AfBER4yWhg7VzBiuzG3a8578X4BsQJs/T988gQHw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QCDFaDsuSznaT2m02wCJ2IPTR4uuW5R92/+OPOqkNGb48sld3m6oGtLta+RATZw8T
	 gRV0a4qsIVxkLCTA01gZIvvTkFw8vP94J97vO5z2EI8tQ1I24oKgNtbh8HefHp4bEG
	 AG70OXyjB7aiUjkHjsbAENdttUHOqSqrleGR3QRhSz4otTFi4atBPsePh4JW17MCaJ
	 mt2qC2Svt4aC3dv0rQc9cxdMY1S7amKNxnvuKKsW/DL3czunfohAoC16XYO/JI9okU
	 GXhieuoybqCJeRiP7wUliBTYqgetfjgxcGXq4imLfLAi2WXJAlzXwM7Y9DGIzpeElO
	 wmnBRJKyrowsw==
Message-ID: <6e8167b6-09e1-0815-134f-ef3a40ab73c8@collabora.com>
Date: Mon, 20 Mar 2023 15:53:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 10/21] dt-bindings: pinctrl: mediatek: mt6795: rename
 to mediatek,mt6795-pinctrl
Content-Language: en-US
To: arinc9.unal@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
 <20230317213011.13656-11-arinc.unal@arinc9.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230317213011.13656-11-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_075402_838224_7FA89E47 
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
Cc: linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, erkin.bozoglu@xeront.com, Rob Herring <robh@kernel.org>, =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 17/03/23 22:30, arinc9.unal@gmail.com ha scritto:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Rename mediatek,pinctrl-mt6795.yaml to mediatek,mt6795-pinctrl.yaml to be
> on par with the compatible string and other mediatek dt-binding schemas.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


