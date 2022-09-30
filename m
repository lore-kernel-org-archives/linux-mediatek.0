Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AB4C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 08:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9UZpruKeLYR0zRhCoY5/AQsGUbpu0aIHUOk8oVF3GZA=; b=yANevtWYcR7OQOKvtouCA3B7gC
	tCcqlEOKlajlzpwTBXpA29mnEhqCVuxpwV7afLNYaf2J3hb8ra4XqA9ZrUapGG4w8W064pKbk/MBZ
	tJC81RCzWg0se6YULEK4fJQ1sr5SExoGW1vOCdfeSr/k18qmI6THOj8K9qKU4RmBBTrpCQKu/ngbk
	ycKd6zzEDNXRbn5fBoMsFv1gh6F9Ou7b0scHJ0yAAIF5JzOpPthoQu3Rhisy7Lg8nFrjZ0xHeO0uu
	OEX3ES7OQuP+84VBPXRTgYalqmj05L1Cc4Hs4MdFarpKh7EadCMmsTG+GTrInZiaPXbsfgsDh2t4p
	7oZZOeAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeBTt-0086Ba-9k; Fri, 30 Sep 2022 08:34:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeBTe-00865B-OH; Fri, 30 Sep 2022 08:34:36 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CE99D66022C7;
	Fri, 30 Sep 2022 09:34:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664526873;
	bh=9eWFbwDttTEa2f7UeZOgWcaEHQPOEJ/G5ia0l+QXprE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ie3b4ifyK44UNVbz3GwiBV3b1jgXjrIAn5at4UtYJX+nyINa1ufdrsHNDNKx+5ZqK
	 Vl6AOJ2hHXoJOQBVGyRVCGovCI6hlWzolmk4atsvLHl1YK8QUsCsQZaOIPGiGPLEWM
	 y1t2b9bhLFbAcUv/wCLGTFC8/lAueFFDLtzQso+drK5Hw4pyd0/Tmrj//q/wi7HKiZ
	 A5t/h7fpzMx9/0vywOfTGNMw6OYEwc5Ga4cbbiYJei1jCnfNz00r+mHLRACHh/4nMM
	 nEsecc7juymxqZTiD2FH/NZvk66KTyxVgO1waTesQ6vXFjD7vXTme+swciqoyH+/R5
	 fxtuZpbWO4/iQ==
Message-ID: <b5443902-ce49-10df-600b-ff3112f183ff@collabora.com>
Date: Fri, 30 Sep 2022 10:34:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 1/2] media: dt-bindings: mediatek: Rename child node
 names for decoder
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220929131309.18337-1-allen-kh.cheng@mediatek.com>
 <20220929131309.18337-2-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220929131309.18337-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_013434_944359_A73204B2 
X-CRM114-Status: UNSURE (   8.89  )
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

Il 29/09/22 15:13, Allen-KH Cheng ha scritto:
> In order to make the names of the child nodes more generic, we rename
> "vcodec" to "video-codec" for decoder in patternProperties and example.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Many thanks for doing this, Allen.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



