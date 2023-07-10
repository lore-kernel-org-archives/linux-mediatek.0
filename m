Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659D5C001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 08:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5zxJft7OKBBuc5R/kTGs7xlwJpWjt806q/363FPFdc=; b=gfFqsVD8aJv2chJ5gIgoM9NaLB
	IS5yJLwzI5qnV0Qw6qlee3hD6XO9zbLUsTxomHJpASkO7ERVSBFh+lwbJKgFGkA+W0dGyjBcfvCDA
	Ur6lLa3Bf86urxBaLBdWPDpzZ4V03iSe5R/4YyN/g2M0mzsS19hQWg1Z1JA0+OeG3DB+YYQd3UfvD
	YbLOtbnEh07CPjv7e1ka7uoi8gTvCooTlZ6sAuFoaLX4+YFB6kv7OHOSHKrxOfak3nU+q2kkqh7G/
	dtCeEs4kaFN/7wBgA9uRmeVjaYqws0FbWf82A2VmVS5C6vTJJ6bDvQc3dl9WN2ZS+CSTZJOPfMltP
	1i77F3Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIlww-00Anah-03;
	Mon, 10 Jul 2023 08:08:50 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIlws-00AnZf-1S;
	Mon, 10 Jul 2023 08:08:47 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D7EE166057B8;
	Mon, 10 Jul 2023 09:08:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688976525;
	bh=OM7rflBYguD1maMIODmrv7tZEbI632CV+e5rw9umrGs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kxJzgMBL7nRS5ctWr9TCrAqewi9ak1OkH8fxcs+/Qd6cZYCG3l2BWUSUWwcpy+Pfk
	 KFsFsGaFSczMymtsZT/P32vVUuppOUnLtVIf/tfcOJnOlFVsng+t8PDFN2F5eNJ5/K
	 22d2coqLnyxteVEEEEcNqNjKCsfy76B+Am2z45EwoR9S5rF1EG6Pf/NFGASToMhYja
	 dBXzXptlugWoikyF4L7MhdZ487xW8bAFcFp255lV3yGh7Z+XgOE0QJ28we9VOp+W1H
	 NahtL8YtZh48QzD1ud0Lr19v9fgAAak+uD+sOLtvO5IRMSosRjAdKPUKoEvfAl83uV
	 w52tXwrU+cA6w==
Message-ID: <0b665705-eba3-74d4-c49c-586a485f736b@collabora.com>
Date: Mon, 10 Jul 2023 10:08:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/3] arm64: dts: Replace deprecated extcon-usb-gpio
 id-gpio/vbus-gpio properties
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Beno=c3=aet_Cousson?=
 <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20230615145838.1526919-1-alexander.stein@ew.tq-group.com>
 <20230615145838.1526919-3-alexander.stein@ew.tq-group.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230615145838.1526919-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_010846_625766_9F278F11 
X-CRM114-Status: UNSURE (   8.83  )
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

Il 15/06/23 16:58, Alexander Stein ha scritto:
> Use id-gpios and vbus-gpios instead.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Acked-by: Heiko Stuebner <heiko@sntech.de> #rockchip
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com> #mediatek

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



