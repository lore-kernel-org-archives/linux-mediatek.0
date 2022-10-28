Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDB4ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 09:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ogzomy0GT3QWJu1/fcztvf+fqugnfMJ9ijQj6+g1mYM=; b=ckB5+/1jQSgjDxAtdcKLLrBO5T
	Kukzh+3z5HEOsETL9c+t+pshBWx8IkRQKY/CsRtJlI04kpbn91kxCMXdnmTBlOzL2wQ1jhyrjGq7J
	HvFpZ1liW6PGUWBsppviZJoyBkDetZzXIY8DNudrueFr1hHaul6dXfTNQH6ELX4JKkYenq1bBlciu
	BjUOmCtRKRUWMtW0DzH8ydqzWMNKE7PCUApYa8rzkUiq0ZrVARhAuV6GdH9x9bzYh3AyHCtuqdBdn
	ibNJM3bS4wlFXzbo+wzQFZRhdSJgF3RpNJC7mzMTUDdYWLuI7pE3TEdJJBJSAeSNjqyVZQKA+642b
	BfCN9v/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooLcU-00GIwN-Tv; Fri, 28 Oct 2022 09:25:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooLbw-00GIkg-5I; Fri, 28 Oct 2022 09:25:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F3BCB6602910;
	Fri, 28 Oct 2022 10:25:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666949106;
	bh=f6ptsnReV3a9VJBtHj0GZyQSgb/myI+fsdeM0fiT+jI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Biu+pmWwfqcoNzL/LIPjiksYzL/0MpFKje9T6GXG3CeyHZkmz7oSKFdDhP/b//v+O
	 Lf3NxoMopsfcwwx2dVT177p8LEW5rQh5MIsfjzmVcsMUmM/6FkQzsnlVtGndSiOaYJ
	 Lkh4J0N8w2OE8xunH8eXl20CI+LCK8YwUobFE8YMDd/Qyv6YWsVnVqxAvuORdCsSqS
	 pE6QCiv5zagm8TKOiaBz3lV5WNrjV8WO82KiS6SBJZzlFDR+4BcnlayBlaz+ATAV4E
	 u+8Qtg3Q43SDFLRBsbsk4m4yIJG+8+UXdAeo/Wr2EOX2hOxC9cOzVTUmVlx4T9pcBQ
	 ds455YPvEUfJw==
Message-ID: <e797d832-a6b7-f153-f01e-6320216375db@collabora.com>
Date: Fri, 28 Oct 2022 11:25:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v5 2/6] dt-bindings: mmc: Add support for Mediatek MT7986
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Wenbin Mei <wenbin.mei@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
References: <20221025132953.81286-1-linux@fw-web.de>
 <20221025132953.81286-3-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221025132953.81286-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_022508_376650_9AF56F31 
X-CRM114-Status: UNSURE (   8.28  )
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

Il 25/10/22 15:29, Frank Wunderlich ha scritto:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> This commit adds dt-binding documentation of mmc for Mediatek MT7986 SoC
> Platform.
> Add SoC specific section for defining clock configuration.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



