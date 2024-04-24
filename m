Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86558C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Apr 2024 10:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vv/xThjr+Xo5/Ng60TOhLSxSaz4c1XZ+sBRoUpuhl/4=; b=zLtPURe1GI744AUB6khymUhdaB
	8mYI4FhQhg642xPtmN7+Z0yZ2DozxujvbBROrJuzsPFJsXD0vg4+VnHtibdDiMyfbdpzCLs5XmdSR
	MJuTs1q/KkpN9r2ZOYHchGfDSNYEqnO3KGbiH51wVj4JpR6VWqmSEH050cA09nckO2k/bjjQCOAGU
	BzKs4OkjHaCrjymbiXG4tRcJM9Pu8Tk/QbIIztzpLcX8C3bnbuScpLMF1l07yhGcq41ige0rMkAZh
	1zmxxC6pHEehauZb5bqxv74yUvFIJIMWKtQS3KHmvjACjT/aP2y+8M3GR9x6gmZClj/SGNB8VK0IV
	I96OZgMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZQo-00000003baN-0yDP;
	Wed, 24 Apr 2024 10:00:50 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZQZ-00000003bTX-1tQV;
	Wed, 24 Apr 2024 10:00:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713952834;
	bh=R5WVkYvVKBubh/Xkg9FSD0bHakUX4sVUce8nhIJGf38=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q4Zf0lrKCA7W8EN2N7sw+LSgsWV+fEjN5FjnUoUlr5Bm2oZK5zbA1dyLrS28gOzhH
	 03d29FMJF3sJj88C82lOEb/Tg87p5CWzza8UfVArg0QwtxMDoeqayLgfpYaYFXqoUv
	 G44oIoNTbAfmBWQ/zp9wKTncSHbmAH7GQT+6D9aO+cAvluJ7mTXc9Ni9ZdGoV7zb26
	 oHKtFijfTPBZvypdJbX09+QjDBZ5pJENZzV86G0UjdaR+yFTDBczB8xMu+IDVDmqGM
	 qPFu2/qirSDIfZYgDpW9b9GudYTcSzDdjr89RE7xhHNPtCHu/lH6yHFDyOVis9Xf/v
	 SEK/ldElGYuzg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1B4E937820F9;
	Wed, 24 Apr 2024 10:00:33 +0000 (UTC)
Message-ID: <186a2208-c2b0-4a57-9a2d-53a651ccd408@collabora.com>
Date: Wed, 24 Apr 2024 12:00:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] remoteproc: mediatek: Support setting DRAM and IPI
 shared buffer sizes
To: Olivia Wen <olivia.wen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 jason-ch.chen@mediatek.com, yaya.chang@mediatek.com, teddy.chen@mediatek.com
References: <20240424030351.5294-1-olivia.wen@mediatek.com>
 <20240424030351.5294-4-olivia.wen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240424030351.5294-4-olivia.wen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_030035_652068_90A0874C 
X-CRM114-Status: UNSURE (   5.37  )
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

Il 24/04/24 05:03, Olivia Wen ha scritto:
> The SCP on different chips will require different DRAM sizes and IPI
> shared buffer sizes based on varying requirements.
> 
> Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



