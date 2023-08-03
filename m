Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F401C001E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 08:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZX1EFKjajbvM4euDiO1AE5iDiTewauJGqSqIY9Kbqgk=; b=QAy4DY4oUAm2cO26+iwyzJw69N
	2M4GxC5fggqZVo7tK7UF2jAhOG/6kNFBSB0ISompjv1g6QIPinlnH5xiqZCSnj1tJTet5MPELjosR
	nPZHT0O8TJhDOlVIeuLUqRUfIKhZGY7KoQcNElm5rixOcDYYxc8KZa+3D7vnuzjfCYO2PT6jNNCCb
	GP/gn0iGUiB66cNRUr9S/kQfcKgsxPJIWEChBpF/qEnB29ZtmTfP+M70Oy4opor0corgcnbAvrGuF
	9MK6je189lueqB/r0qwtR4QtzCgS5ZRezPOGkx9TkXRwcBWoiPbb4wQwWbbaQ7fYDZ4W+21X+14PN
	KcQqsXPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRTc8-0070ia-24;
	Thu, 03 Aug 2023 08:23:20 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRTc5-0070hi-30;
	Thu, 03 Aug 2023 08:23:19 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2B92D6607194;
	Thu,  3 Aug 2023 09:23:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691050992;
	bh=oK9desb5EWhnphr9ikanL/R6Rwryfv81Ndw2kNrxKEI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WiQJxg4TgF966hL+X2NGTvpIhFDRhPoSiwl8sARMWo+MlrvjqefrCzxXXu6/FLfKz
	 dQtKFkn2sWI9+NvVVBPxXYgFq+iVrBunxOtQhVgydcCnQaCsBK4KsLZJlxf1fVVll9
	 mcfkwQVQfNfQXkOK0RWU3ShDGt+Uw23Lyp2O09aTw71SxmLqwgEhs/W2Y2KaxzsouB
	 dH/V4xDWsIhPMTgOz8xXq4pOCTvECEgLyVTwgleLMF9xxEpzlhiwYFBXzeGdOjkqY1
	 6niWPcZgyNaCi35hRrDHfSixUs/er4+s0yjVHhJ/bWd5hwD8t7AaBkJn0P9/C5PBYv
	 Atrem9ZJAK9zA==
Message-ID: <f345b310-94c8-e3a6-58c0-770569152a92@collabora.com>
Date: Thu, 3 Aug 2023 10:23:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/3] ASoC: mediatek: mt8188-mt6359: add SOF support
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230803052607.25843-1-trevor.wu@mediatek.com>
 <20230803052607.25843-4-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230803052607.25843-4-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_012318_160131_193EE790 
X-CRM114-Status: UNSURE (   9.57  )
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

Il 03/08/23 07:26, Trevor Wu ha scritto:
> SOF is enabled when adsp phandle is assigned to "mediatek,adsp".
> The required callback will be assigned when SOF is enabled.
> 
> Additionally, "mediatek,dai-link" is introduced to decide the supported
> dai links for a project, so user can reuse the machine driver regardless
> of dai link combination.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



