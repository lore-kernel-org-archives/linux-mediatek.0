Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F33C38A2D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 10:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cnHNGKo8T/13gq8s4zAlCN1KGglFlQUgEx/pLDvFW0=; b=gTkyZ/b4vXtazG2UaJR++RJXvB
	Wao7ryq58G+ncr8/QnpbT3Y4Cn2cK5gOdPtwxH3ztSMGh1v5nDx7ql53y86H2dD9Sd7EZPH4MUx28
	DPlqlUJiTZ55kU6GzUyyIno3JXd5siJjoso1Zs93rl5eDBp0Bu5qf9m6GOX89WQAWMqhfd+VgGAZT
	qSxqDBIZculCy4abzRPwwRR+sxAFWjThAv355H0aVBxkJCoWTg2xbHvWzc8gzhukuV+VgQuogNtgs
	xH0STxfBPLp4qSIGHKliR3lRZs7U33yu7GIuUWzaUEQiIEDGjn7iVoEpyP7gjUziDJeKUYVAXCfKB
	cEvZO43w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onHYG-004rHu-P6; Tue, 25 Oct 2022 10:52:56 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onHY5-004rCv-EU; Tue, 25 Oct 2022 10:52:46 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 872AC660239E;
	Tue, 25 Oct 2022 11:52:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666695164;
	bh=SzdPiBYNWocdiKOHMHJ7iv+TcTpeRmBI/i9El5W824Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mAOMNf0UO0+7xSfeErCzx3yn5i6/gpXzdqqSp6MLZGVGUgXfzgVCd4hTe3NKjvV75
	 cN+NH9qsXKwGuEIKFke8p9cmtFE30ifenB7o9OQncAKZaIu5Gs8fUXIWLm+jQ1S519
	 uN6F9EirwhavJzZ0kSPQOoY11tV9S0NPyjPoXhLFQ5Ir++qfyQNKPA/5Ct7Dl1GquL
	 UT8Z4Uqc79E8pAAUrX1k9l8V7b5dd5E9M0kfpOMylhL8B40GHA1eJ+glbE/9IeeoaQ
	 p1N+5iIU+L9UW1jYf9TkkPBtps3eW49wdaVoaTi0GKp+/YpXcQ4c0fvaN2o7atsddE
	 vvDQNCo6dGWGA==
Message-ID: <aae70248-878a-5e36-ad4c-82849a184926@collabora.com>
Date: Tue, 25 Oct 2022 12:52:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 6/6] mmc: mediatek: add support for MT7986 SoC
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Wenbin Mei <wenbin.mei@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
References: <20221025074238.18136-1-linux@fw-web.de>
 <20221025074238.18136-7-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221025074238.18136-7-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_035245_643669_F92F48A0 
X-CRM114-Status: UNSURE (   8.45  )
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

Il 25/10/22 09:42, Frank Wunderlich ha scritto:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> Adding mt7986 own characteristics and of_device_id to have support
> of MT7986 SoC.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



