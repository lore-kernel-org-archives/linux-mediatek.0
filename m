Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6449FC77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 06:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zu0H+clsiX3AVRoWHqNldUtjeaEORn1P8QtQGo9Q9gQ=; b=2B6WaDevzvnW3A
	h9ELCgIgWLm8LBiEMBjczBcxatii1sMF8/JtUDwvwbc39HH9KTx18BQjfqBpL0ix1VvhOwOi+69NT
	gcEnfrHEDQVJ7MugQBWi5WN1eSXAwrdZT9nxM8Pz6ClnWui/yXzy/WIkH66VYIHxdNuvGKUkUMcMH
	Wgh2ij/3eH0uJXN7VkoBChYL5+bBpcEFaPXIT8p495EfrTgxLMLb3THEhqLMS1kCD5Tw9OUe+v4ux
	MDNpXyghG9bVqzmTmxJ2WtTXw7W3Q+D4NFzziTJSmCa0D/qDOMQXy6oSbBA7vSKrHNijq/BYyC54E
	4pJfSmbq1Eo/INnNQhgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3szu-00Cam4-05;
	Tue, 30 May 2023 06:38:22 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3szp-00CajZ-2l;
	Tue, 30 May 2023 06:38:19 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7541866059A8;
	Tue, 30 May 2023 07:38:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685428695;
	bh=8o4Psj+iWHmd5PzAtr5IbEWMuq+mLFzTJfPSvIhx3Ec=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B8iLBjBQLyjJgL1wG0pBTKld8L1psgnLxwm+Z9Yo0vX3mHfqv0WlvjjJjY6CHHBib
	 5NcLWj9U67EAgivudDjYdM/8A894ueTFalfWpcR3l4mW1/DPPW3+jWnHW0BRmWRe5K
	 HkBzMpuwsHdfLs1wDwrBRz7kfDn0gmkUcHFHE0yEsWYUg/3YJNEJn9DoRlqaY1iMGo
	 NX8RlZ1MaCLzBjeimCPMqZ/CRK1/wmGB4xYw1OkyPZ8ClguLMtKoD26UrVLqVgcQIB
	 bKa0EQTigwyewAY3CBx2EmgffALcTSx038nAAIP7tFsFofu5I4s0Sr2yDUrStplcV/
	 gNoak5k67ACtQ==
Message-ID: <13a0ad77-539a-9c14-7a57-2893dc703a2e@collabora.com>
Date: Tue, 30 May 2023 08:38:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 3/4] arm64: dts: mt7986: add thermal-zones
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230529204258.65238-1-linux@fw-web.de>
 <20230529204258.65238-4-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230529204258.65238-4-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_233818_025667_3018E05E 
X-CRM114-Status: UNSURE (   8.53  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lars-Peter Clausen <lars@metafoo.de>, Lala Lin <lala.lin@mediatek.com>, linux-iio@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>, "Hui.Liu" <hui.liu@mediatek.com>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jonathan Cameron <jic23@kernel.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 29/05/23 22:42, Frank Wunderlich ha scritto:
> From: Daniel Golle <daniel@makrotopia.org>
> 
> Add thermal-zones to mt7986 devicetree.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



