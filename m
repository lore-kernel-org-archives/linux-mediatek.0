Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B1BC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 10:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICc/4mxQnPbCK+BlX7KbtJCGioCQC9oPGStz9kl0/UM=; b=0K2UJLXZfry2S1zEWLWEAGBw9w
	RfWMc5RJE1uOyPvcuZ7do2/WIfwD3rmP4qwS5ALxvVrIjDnUi8XG5LTQS/UUNq5/nWRvefjDuCUa7
	2qix1psgfS6C/CkI/e4rcnEFFHMYYlVM/WI1siqVVXxoxFMsYLm3qhy9j/9NisOCqRyzvo3mdpoOX
	HKIJMfipw7XRJAXDSZ3EdIH7BFGOKi0nkzaYOX3ZRBzhFm/JqviU7tIMN3fn5zmUqs1Pp7vBARZgR
	/dMtvyNTtAKZwKWnqjrmpu4ZTjJSBTcXoEtUrxpC1uLjcyr+dBPOC93stq7hvtlyuGmU94ExJP9IQ
	Uizw4Elg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy9Ki-007ZrM-0f; Thu, 24 Nov 2022 10:19:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy9KT-007ZkJ-D7; Thu, 24 Nov 2022 10:19:38 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 839F96602B10;
	Thu, 24 Nov 2022 10:19:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669285175;
	bh=fYzwZG+btrhJNj7qcJzSFCW1tTOHZHac4nQx+C+xmJo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ladVD4h/ARN4kZRmjQ270HjSLleSxaquqisDU36RMD2TrzBG1av3lgH5/NwutbCJA
	 KHeCMghCW5GrjkB6eQBL5u3gtoZi9xedOyOKf2X+rOfWxlOeD9ygiVlqhXOz4BmbDB
	 DrkMiMk3NyJKBZ6oLeDTFnSWMQ+2jeha9SOBdkzA896osv1To3KlBR1YF6EyLAGu39
	 Wy9zbsWKJMqKEpsN2Zw6VGlrN/pGNaT4WcSBzQvTnooeqJ8DwR5duWPsJB9F+M2GZu
	 D0H8FL4CeeTrWTw3IrIwveshAusTNB/Cbviv9bnABR3+nUJaj0cJDQAljsiho6ArW2
	 fBYF99C9wwrLQ==
Message-ID: <dad82c29-71f7-dfb2-a682-5aeedb1a2518@collabora.com>
Date: Thu, 24 Nov 2022 11:19:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Correct I2S shared clocks
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org,
 nfraprado@collabora.com
Cc: chunxu.li@mediatek.com, ajye_huang@compal.corp-partner.google.com,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221123161130.543-1-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221123161130.543-1-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_021937_651407_B8C44A44 
X-CRM114-Status: UNSURE (   6.55  )
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

Il 23/11/22 17:11, Jiaxin Yu ha scritto:
> In mt8186 platform, I2S2 should be the main I2S port that will provide the
> clock, on the contrary I2S3 should be the second I2S port that will use
> this clock.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



