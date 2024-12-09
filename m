Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6E3E7717D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2024 13:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=68O/QV5YEbg31tyhJj3ek64H5Hv55tMkxFiDo3YEY1k=; b=q5aw7CKQGHdmZo
	XdkfO4m/BMPbwvv7lhmh7jd8NyigQ6MMrVufbeaqjaKFSy1K2s5+czXm7O7ZJBEOiWiMYOYhvJSrx
	KOKTX5XowTZcWB2KjnFmIiBwZ62KKqv80P7Iy/f9GQt+QAaTt6Lfow7SQIvrTSpDSWkOjM5UjNDWP
	wo5+mzq68KbZxIWqLb0IRpXQBYBInMevI+6/RePBAan8o4pB0MsSipXyp91ChR83AdAbBL+QdpM3s
	g94/JF3/G3Dl1oODcWW6nLXgO6oTERH6O9O5T9dEvzxPHNhRWaK9fMJdjUUW1rVSvrP8ghkVuihDh
	TaKDnX9bB1t++8w5tCDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdUH-00000007sJk-3qdL;
	Mon, 09 Dec 2024 13:07:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdBb-00000007max-18j4;
	Mon, 09 Dec 2024 12:48:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733748505;
	bh=6Esgob/eXCtbOdjh9toU3Ca+CaUbyN17vrQM4nXKqoE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nxlcorysF3qLOWqSN5xIktWcXP/FYoPk30xXSud8QdoE0/XElsvYF4EtYSC8ACZ08
	 NV12Wd47dRS9nimVC20wluLMLcwRWJGgwbFJt5a3vXTsqMreP1ff3awsKeuvieqMqk
	 dcW+f9d+sPWpZzd8GZ8YnBXpjQEYFPqlVp/sAWLlAetQkSDo1dvhcVZmlIym7n4CYO
	 /GRO/hO8aoUNSVmdVxm9FlQfufzlGpypSg2v32fIIG1bWFXv1S9bwQnw4EfDrjyFVj
	 eAn2f+Ues8EJfdGIGmG2vLIZp2K2YwiIOQqYvJSIJ38cqKP4AO8NJ30rxq2e1o0eRs
	 uy67MYV93uapA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B515617E3750;
	Mon,  9 Dec 2024 13:48:24 +0100 (CET)
Message-ID: <94c80573-b18b-4328-8663-db9d6455fafd@collabora.com>
Date: Mon, 9 Dec 2024 13:48:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] pinctrl: mediatek: add support for
 MTK_PULL_PD_TYPE
To: Frank Wunderlich <linux@fw-web.de>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
References: <20241202110045.22084-1-linux@fw-web.de>
 <20241202110045.22084-2-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202110045.22084-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_044827_470051_22CA898B 
X-CRM114-Status: UNSURE (   7.53  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 02/12/24 12:00, Frank Wunderlich ha scritto:
> From: Daniel Golle <daniel@makrotopia.org>
> 
> The MediaTek MT7988 SoC got some pins which only got configurable
> pull-down but unlike previous designs there is no pull-up option.
> Add new type MTK_PULL_PD_TYPE to support configuring such pins.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


