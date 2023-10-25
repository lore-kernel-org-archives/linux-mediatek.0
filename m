Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52549C25B47
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 08:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JqoLKfYPsJh6dzmTNY+2XLJSbiCtSOZ40zcf20WqmGU=; b=hQOXFGpBfsqO+0
	hOZQvcrCyEtGTDX3Fe/NemPwWGzAuwaclTFjhK7iHsP/gSlw3PRf1Ewfehq4+MR08FdxaQea4y1dE
	Sz4GV1Hh1o4hq9BpT/3j/m5GFa/zQUUy5ypb1h8akmJ3H1nVh+CD7ZWGPi0/ztjkEQDA/aWQiSsYF
	6hrT5PeCOhxQtyUDp4bZFLm+XM5vghjJePcw84V+AzeLdWEkWE6irTwybY8E/CQOvk4CRbVItvlqG
	pXU2gnhrSpd0pvVlOt+NUNQJ/qF8TeWQq0NxCk3UYvZJb8USVy2wN30wfyrKkQmzunCJViVB8quOD
	oNDQ2c9wgDvIrmUQw5jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvZCw-00Bhlo-13;
	Wed, 25 Oct 2023 08:25:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvZCs-00Bhjz-1N;
	Wed, 25 Oct 2023 08:25:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9D3FA660733F;
	Wed, 25 Oct 2023 09:25:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698222333;
	bh=1lSLOD1SNY62x2kvty7CxHvQhFKkLJODoGmO9QGF/io=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TMFGAD8vGD1PMKqywCxbp6nFDvBack73i11WS9XPAnMg6zvEtJEr58Rj2bYmPbK+l
	 xNAxPLq9DGk/gYMWCTPYwIxSO7Q0mceqSbdbY/WioXa+6OCbjpVWitNyCAERe21Nqr
	 m8RnJ+3pPU+KW7nSZcFZbOkCNjh8uuBS6UhhhG413t/J86Pf95yd6neIzQi+6Q3Gwp
	 U4G1b8Z5QubHtC7tIkAa2AFXr7u1550vTao8rf7CCVdriR5tBwvrU/h9csBm6iq9T5
	 fnp9hnqhy15oNR1K3QmU/ys32HUrfaAVpsOrLe5XXddlhLAhKm5+xOCXGg7Y3UyICF
	 9v7FWPX5TYsQA==
Message-ID: <1239aa95-aa4d-4465-ab91-c239e4c1eff8@collabora.com>
Date: Wed, 25 Oct 2023 10:25:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] arm64: dts: mt8183: kukui: Fix underscores in node
 names
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20231024212618.1079676-1-hsinyi@chromium.org>
 <20231024212618.1079676-2-hsinyi@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231024212618.1079676-2-hsinyi@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_012538_641579_DA708B9B 
X-CRM114-Status: UNSURE (   7.36  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 24/10/23 23:22, Hsin-Yi Wang ha scritto:
> Remove the underscores in node names.
> 

You're not removing the underscores, but replacing with hyphens...

The commit description should therefore say something like

"Replace underscores with hyphens in pinctrl node names both for consistency
and to adhere to the bindings."

... reword that to your liking, of course.

P.S.: This is a fix, but has no Fixes tag?! :-)

Regards,
Angelo


