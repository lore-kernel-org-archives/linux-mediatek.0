Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC92FC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 13:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/3TZBA7wngMbPoRF9J9OQnH3p7LhbyrXDZ/t7LVDUo=; b=3FV6/tXyO/CQcLIFepo8cOqDuK
	zQl8kq27y+5SudlUfJGjVB2XlKIx9rNfSncN1QAxsc1lTAsId0sO80ms73th9UzSTQqY8qcS1uNzD
	06MTXLtreo4dv3dIz+1Lcq4DoQNaOvwwFr17vREULjVgBqABJaxornV4gLvCO4LsADXDv/1M8IttH
	b5iASKrRauvYBX8tm1aYR3AfjdRakqGQR7u3krSRIL2XpCu61621Ndf2DL1WG0+iyLZNqQh14xu43
	VttAxnN3NP0tcEHmsL9YR80Do++NZpCGaXf0IKOiJhCM7FJswapqD6e7GhIcClmXLJWcIIbSNfwvv
	lJnZ3rjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox73m-00E322-7N; Mon, 21 Nov 2022 13:42:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox73a-00E2wy-Az; Mon, 21 Nov 2022 13:41:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1862E6600368;
	Mon, 21 Nov 2022 13:41:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669038112;
	bh=LEKyP7Lh1CGJUl09TE0Fs4DL19+CS3JViR/Mmqqgwrs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cSpESSFnz3CedZ2akD3CYVMgONzrJw4c6KypoOO4AiFgKjce6U8DtFf5C/iftIiRj
	 iC2XUupLKdaWDA2M8B6Bwlzy1tN8+s31SRO39vEwA3RVQzpwgbTGjUUZMWrizMjsab
	 WpiJSvJvudOO9HW7TxXmjiss9ddm+DRt9G/r7RlQGtGEcjvowgraMk8g4yosyyGRuT
	 d+0dAQUAnymgfIpGTdA8uEI2VDatrig6KfcSVnsvraOJ8oskUL8QLW00ab37sdYi0V
	 gmySM/oUrY7iQFcjDm6PPzAOFYwkrtBXv4+C0VFP8vssN0JFYzVTbQIBPwQ//VYXD1
	 nySEVAS7dOwuw==
Message-ID: <fce278a4-b983-ffd2-52bd-0cbfed6e5294@collabora.com>
Date: Mon, 21 Nov 2022 14:41:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5 5/7] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Document MT6765 pin controller
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20221118113028.145348-1-y.oudjana@protonmail.com>
 <20221118113028.145348-6-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221118113028.145348-6-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_054154_531617_3679B072 
X-CRM114-Status: UNSURE (   9.16  )
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
> The MT6765 pin controller has had a driver for a while, but DT
> bindings were never documented for it.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



