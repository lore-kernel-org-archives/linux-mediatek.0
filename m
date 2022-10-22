Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FCCC04A95
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Oct 2022 04:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pt3RmxMP1J8VX/N8ZW4rQfZLUHkvjBeGZ6atiNrbHPo=; b=taKWDsZIipXAWWnWgkC+vlGf6c
	NcSWHfRl8klN30lrtHWEjRDAjsYfZii86bs6ZkyjLKdcnoGG+gbiuAmW3REVp+pk3eGeRGtddvSiO
	WDDFpKR6orh7TREO14h2lGg3d4yWRbc1puc+OxuvAZnVliusp/dAHnlejFp15YsDXgCLKZZgocpc1
	taBVR3g2Sh0b6+Z41uyaoQYNPIu6AWa2igxLrS3UDHaVHXTbstYTsFd2QyCiaIc6KyRNG7rRzMJvm
	2BUqpML9ye2Q+J8jFTSBQbVvOmNtraDO6vZphYqc/xBld5DC57z9SRt43eyctUjxBKcV4ISoqItJF
	XFa/QBow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1om5pt-00B4vz-MD; Sat, 22 Oct 2022 04:10:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1om5pr-00B4vS-5l
	for linux-mediatek@lists.infradead.org; Sat, 22 Oct 2022 04:10:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9486BB80E52;
	Sat, 22 Oct 2022 04:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82600C43470;
	Sat, 22 Oct 2022 04:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666411808;
	bh=Pt3RmxMP1J8VX/N8ZW4rQfZLUHkvjBeGZ6atiNrbHPo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iIvT2PSR02rHyFk8ucy0JIUTq69sgCa6kJYR3l+B+7EqHdPszqRMh9nMpTeAol2Cy
	 uec4WC+3J4adlOeQat9J38VT51jPC/2jrfLlz0+OACFqZQbzMPq/sKHpqVR8WkPaoc
	 6dra2tHCZqN10w/nWx13jc4zKGaixZKfPYE3jsQ0nvtLaMdqkB4jB5S2tTz9/71RJf
	 YccK8PeUK5pA0Z+QWpt7qCeWj81hjEFdRkY1c4EtbCgH9mYBpFAh2oseRlwqFgpNKy
	 nZIB6LWiYYz0dYKv9VsOtkNxcm7RR9h8z2Tpyg+kzmAmPenGtDFxtu1MHjBHtmZcFJ
	 fug9RVZedAJlA==
Date: Fri, 21 Oct 2022 21:10:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 Bo.Jiao@mediatek.com, sujuan.chen@mediatek.com, ryder.Lee@mediatek.com,
 evelyn.tsai@mediatek.com, devicetree@vger.kernel.org, robh@kernel.org,
 daniel@makrotopia.org
Subject: Re: [PATCH net-next 0/6] introduce WED RX support to MT7986 SoC
Message-ID: <20221021211006.3c9b7f29@kernel.org>
In-Reply-To: <cover.1666368566.git.lorenzo@kernel.org>
References: <cover.1666368566.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_211011_384217_3A66EF64 
X-CRM114-Status: UNSURE (   6.97  )
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

On Fri, 21 Oct 2022 18:18:30 +0200 Lorenzo Bianconi wrote:
> Similar to TX counterpart available on MT7622 and MT7986, introduce
> RX Wireless Ethernet Dispatch available on MT7986 SoC in order to
> offload traffic received by wlan nic to the wired interfaces (lan/wan).

Run sparse over these, please. There's warnings in them thar patches.

