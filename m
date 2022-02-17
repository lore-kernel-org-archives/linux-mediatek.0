Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36893C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 09:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJyKeLhkfrOapuFGkUnLZ/bMkn69UtyJnEjUZV3BH5g=; b=fIGFI7B/iHEU1p
	XPVo0x9kEgNmk2hK5HmQGB/0L2zEHZMAMstaXZQBFuHhRpE+v195gqEwYmFN4gBQbl/5NZma5Mi8M
	oXVfFKRmnplJRw0HrsUFBtbrGx51iOfst2l6+I8KiJqkudyMtJwrc0S1gxyyoHikDBnQ2VtNyVJ80
	NFK0M38tot/IPx1wEWGQisVjor+ZoExra01ZUqwVek0ZXUqX5kM6XSYXXgMY6bmxc/FPGCN6IqJ/J
	v4hEhDrUSOB6GUPbS0rvZ68Bu1hJIQP29vzhGMIA7xe/7+wxJk/InW2LBILiFIABLbJwVq1zS2EEc
	HMsHpUnB1G8+Jv8wMM+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKdIa-009kTQ-A6; Thu, 17 Feb 2022 09:42:04 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKdIK-009kKx-8F; Thu, 17 Feb 2022 09:41:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D81271F45873
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645090903;
 bh=5gCnKVu2EnKN4MXtv85oi3T/aFkCocbc2QoSdjZi18E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iiXg+ttcnnw2yTaOFrDGoP8ZOg6sWslKxid6RC05HtUQkhEdocLjVucycg1cu1c4l
 wqaullkVBxeTlmRnfG9tXGbnDsgNE3lJ6nZ4nHNyQlO/0VLmQI05Tustwafd+xlX7n
 nwL0W3GZ2feSUiuaLpUKDRxpCAGUQ14vQ2maj+lt5EAMu0cp/+2yuj282daIA0BTyV
 eDbmQSFKvHm/Xvd3hRRHIToKeNKtcvsXD1LSiXva96YoBMnGGFfeO5MV4ELXQeP1iJ
 /VSHQatzRNGizbrTxEY4P55mHM8MXHyl10UNho2FU5qKMVNECdNaXCnoZ4UDMnsh7+
 3PcSd49Elj6FA==
Message-ID: <267c115a-1033-ba71-8d68-af8acd5b85e7@collabora.com>
Date: Thu, 17 Feb 2022 10:41:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [v6 2/3] dt-bindings: mediatek: Add mediatek, mt8183-jpgenc
 compatible
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 yong.wu@mediatek.com
References: <20211206130425.184420-1-hsinyi@chromium.org>
 <20211206130425.184420-2-hsinyi@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20211206130425.184420-2-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_014148_503934_199D718F 
X-CRM114-Status: UNSURE (   6.54  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 06/12/21 14:04, Hsin-Yi Wang ha scritto:
> Add mediatek,mt8183-jpgenc compatible to binding document.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
