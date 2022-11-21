Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569FFC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 13:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNUKk5+kFTflIU4SzzD/lQI7lJ01s9/rey3PP4SDPOQ=; b=w4Jz1y009vHYGBWR/3htkwj4RN
	Jc4vFM4yPPwIEL9HyREw93ng4RpEKgmIrIE8zMTjqSbpwQcR+CJ+tLH8SjOZuQXLtWXF/YHm9in9/
	hbmgCB2EBZ72PW1lmjQDWADg7Si8x4xtf46Qu0ozlxAl03Jw7o+yRsW/7+YyxWExjl9TljmML6avV
	efdJXMRpDtnDSkB73gNCDtfkB+224WVyjWGSflTQB3g+JAK4he+vOMmkf2/lnfXlyBCEcWexTWxnF
	N+3G2XdcszP89/9rtzVVXJBS+JeqvWaVZw51XJev+G8WYDQpl/gqVtwB+5j2lL22q36prmB4CzWKl
	EkhzCTJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox6zS-00E0xZ-8E; Mon, 21 Nov 2022 13:37:38 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox6zA-00E0m4-Gt; Mon, 21 Nov 2022 13:37:21 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 95A7C6602A03;
	Mon, 21 Nov 2022 13:37:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669037839;
	bh=0ZarEsE3Y3qiEP5ljnmmLq9buKbi0r2iD6ogpZeIH6U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z7AHKbYAMlBZMWLa6cbytuRAib1GjBl5guYz+SQ+3dE1dwTdhoQTbtZabVszQZ+Hj
	 Mg1pcLHqwiI4u9+ccKFDWx5pPikI6//1vPvO9vYFRl+KAgRrHtBTqh1dIii+x2fcsi
	 +a4My+eLhNZPB+wJOfVtmp+5p6d7UnoMATZuYxH1tyBkqC0LQzPf1vlkhnylob5t/m
	 /lFgrIot8ctoOkK3F8CTuMWfUhgHpx3NmJUU+nx3+qhYOg6goJR0anLia80aiciaH8
	 bRe5o/x/sDqtFWywSXnYYNYibaAF5DFZcuGubdPA/eXoYChjw21ow4yoAxkEaQDlbl
	 2xnSZ4WzKuHtg==
Message-ID: <1b4b8b62-2768-24b6-08c9-0d05bd051199@collabora.com>
Date: Mon, 21 Nov 2022 14:37:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5 4/7] arm64: dts: mediatek: mt6797: Make pin
 configuration nodes follow DT bindings
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221118113028.145348-1-y.oudjana@protonmail.com>
 <20221118113028.145348-5-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221118113028.145348-5-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_053720_725286_14418BD2 
X-CRM114-Status: UNSURE (   8.39  )
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

Il 18/11/22 12:30, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add -pins suffix to pin configuration nodes to follow DT bindings
> and pass dtbs_check.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



