Return-Path: <SRS0=RaJc=P6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57AE9C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 13:29:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B5D261207
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 13:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B5D261207
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0HebZiCbSj4Z0SS6Ui3L6MATDIhzgPrXVnMaGYUoIE=; b=Edz21y6sUPjm/z8XKld7yXo6TA
	DzvKBJhtY5ePod/SYUCHmcYKJKClW2s37kW/+pgfkYTSww0gOKUIhbin36CPQiNU72b8LIMHcTBdq
	vg6eBwEAGOCmQK1UpmFivmFVBUwfBR1xsuZUORqNS1exgDbZYZstluHQ0GRWONBzJiqEjYQna2QYs
	GI9/I4unghdrlEuImwtDlHKPmA33UOv8nPwX7smFpJlcbBIQk0XxzhiSGofx+CRE0q/gWyZErdsnO
	ywU3X40NmOLCwhWxqFp9A6vZCs0SsV6WVBp3W3fLDqzAfvhu3mX4HbqYQvF/SWnDYHB/UQJm0fDQ3
	HNBUNKpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlA8V-007zHD-7N; Thu, 11 Nov 2021 13:29:03 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlA8F-007zAA-OU; Thu, 11 Nov 2021 13:28:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 557401F45C17
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1636637325; bh=hKlJPVIsd3zl1fRS+HP0UR+QSYciJS0/XcKJEC6ReGU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=bt6bqF1fNP4inuT+/4OcgZZjROtLEbuwpi5Sb473NqCNEZ7q9PJoNl7vjPkEORvdZ
 pA6vwT0iSzB6cR+3DdoqueSaB4OOLHZW9cy3P/JT2azA1Ukcnp37fst7pVCL+OLDbe
 EY3XvRh7PywUblMcQ4V78VsFsqQsfBOGyibzME5KshpNZVHmQ3AsiDPHz9B1M9HEPf
 w/8nzQtjaOMBJC7o8yqgqoXnL4K3aDau+ZAvdyIMMfO1LZqE2JYqXZbLOBJZGYJwQl
 SUOlAem03Zfb2jQMZKyUliqnRRdwFAYpvOCHBLEx9WYeIael5rYClvZk1PEr6SFxUZ
 n5EX+fwU1LfhA==
Subject: Re: [PATCH v2 2/5] net: stmmac: dwmac-mediatek: Reuse more common
 features
To: Biao Huang <biao.huang@mediatek.com>, davem@davemloft.net,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, srv_heupstream@mediatek.com,
 macpaul.lin@mediatek.com
References: <20211111071214.21027-1-biao.huang@mediatek.com>
 <20211111071214.21027-3-biao.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <71620d46-c9d5-07cc-befd-da838f0dcd1f@collabora.com>
Date: Thu, 11 Nov 2021 14:28:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111071214.21027-3-biao.huang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_052847_961731_DB51A325 
X-CRM114-Status: GOOD (  10.96  )
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

Il 11/11/21 08:12, Biao Huang ha scritto:
> This patch makes dwmac-mediatek reuse more features
> supported by stmmac_platform.c.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>   .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 32 +++++++++----------
>   1 file changed, 15 insertions(+), 17 deletions(-)
> 

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
