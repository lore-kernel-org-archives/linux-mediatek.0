Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9298CC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 10:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocZVDS+nuMXBjzUTcEax3wITLJOKc2Rf8IiphGk34w4=; b=bCCEbhqgkLJLnP6SYZNIMBti/O
	O9qp36pwTFTaOYSmgd/2IV7ZAzhGfmWKzOTKqEDh+h9tUhDeF0+CKzYOx5FYqOwgQXR5Y25ZZWGNw
	GXa8X1CeQD7OTOfkbf9R0WSOYEbGl0RYHarcNk2/6EQpaOpbdxC8ye7TqP3gmQQ6B8bpn4XGbA/BF
	c52gm2NQxfVcq9h/BjFqhu8noe09vbox5EFEBsksJnR2tLmrlGQvOwmNigs8BvHYfJMEu/HnNBjrV
	bzZdgWSAIXBUQSg6IX68E+rD4YGpqbk2DpPD25lQegTBymKgigq27/J3sGOcZHL6KQkSL1AKF4Fl/
	YTWIxdyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAqZ9-000d9y-SB; Mon, 11 Jul 2022 10:22:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAqYy-000d0d-76; Mon, 11 Jul 2022 10:22:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EE47466016BD;
	Mon, 11 Jul 2022 11:22:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657534960;
	bh=uNSY1KEUgiLFkGB3AzkLv6tdObowCzuDnC7wc0SAWcA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jaInF/oFJOarybKy7pplqdc+rLHn+dLm1J0QKzitXilrUM1PEx0vV2KNOJcnmdTk7
	 HO0KjGSoAigB8FuhjpPwLvOmzNJI2MmMuhuVtfgDe86pWqhOo/lWroTyw/DKV2V2OP
	 8gFc/3Iu65wdE48j02tuZsXbduJldgUBUEXmAtV2Hq0dDYfcbdfD6Cw5HJoDMqwWUA
	 fLfM9Lp2OmWrDNP0jrsTu2NbS3SvsRlBNAcHyzeSfEKIJyshgvbgIYh4580E1BXkzq
	 RAIdnbvQ6YAugn8qluz6iaEUxnZhyqaquElhKKPkHvzYhR0SnPWzcGL8GrsC81BXE5
	 q0MnMz+yehjdg==
Message-ID: <ae9ec58e-649a-0738-7dff-dffadea3de4c@collabora.com>
Date: Mon, 11 Jul 2022 12:22:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 1/2] arm64: dts: mt8173: Fix nor_flash node
Content-Language: en-US
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, bin.zhang@mediatek.com,
 benliang.zhao@mediatek.com, linux-mediatek@lists.infradead.org
References: <20220708021548.21453-1-xiangsheng.hou@mediatek.com>
 <20220708021548.21453-2-xiangsheng.hou@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220708021548.21453-2-xiangsheng.hou@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_032248_421998_EFD50124 
X-CRM114-Status: UNSURE (   7.66  )
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

Il 08/07/22 04:15, Xiangsheng Hou ha scritto:
> Add axi clock since the driver change to DMA mode which need
> to enable axi clock. And change spi clock to 26MHz as default.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


