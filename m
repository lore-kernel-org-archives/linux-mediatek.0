Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6C6C6FA82
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Sep 2022 17:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Opk0lpe1WHTgLvPpoybu3TnxHtrvJ8ycWBJcvYOVqgg=; b=IiEoJwGIeyWyQOIZ51sS0NOuBv
	WhSerdgjH21/Yr+DVi8xFvVumd5kuVez2IXXKnBpz56ulZ0xXKzt/oBcicjU5wG6AZP+ajwIRKAuw
	qtaDIHle1GULwI9zpI12JHpTFaGKCtTuVim20Ev5OVG1j3bPcfM57kDKIvfBFqtoXqK/RJhDyaCJy
	JvNSTVRDbCjG0zezQQiWOVvSbVwqVozMqWYcS5IPUCtfnj79hLIsbtZPbsMKQ572UGz7wENiC3PfI
	i82VMazBk2gdry8ZYzmOohz/8psQ12A8eY9+pBlwV7dLkfImn3JWReZXnIYuG2CJxsFRTpz/rMo0e
	zxUDaTTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUtOI-008XDm-Nn; Sun, 04 Sep 2022 17:26:38 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUtNz-008X0d-BC; Sun, 04 Sep 2022 17:26:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E513FB80DE5;
	Sun,  4 Sep 2022 17:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC08CC433C1;
	Sun,  4 Sep 2022 17:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662312376;
	bh=R5gWxWKYx8VItI88Agd++HUcExaO5prF6Vu0sO1trTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DNTKxqSPyZkp/kuGSF6u/gx89TsnNB8ulCRyZcbdl0n279YMp1YgrwKR/Y1F8qTUX
	 5lr166D6Ss07JJaGg+NqWAm1ARI3fOlUHOM7Mixreix7k/5vhSMo2T2q+D7P1h6Mib
	 hELOuEVSNHXUUxIc6CwlXaAqIptUJqMjdbL/JeHl5NB6Gz5C0SheJwg8DU2LzUGec7
	 Ag3VCe+zHcQziNAefNRBAEP6irr2yQ1Z32U/7NWh9b8REE1fBN+FG2/YaWatex1swQ
	 ozIMBwivWEwr/mCJXmyhwN8z82jJY90/H9uO2KFZbI1Tz/MDAOGl0lyAtb67UGDArr
	 yB5grrR70VaVg==
Date: Sun, 4 Sep 2022 22:56:12 +0530
From: Vinod Koul <vkoul@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	chaotian.jing@mediatek.com, ulf.hansson@linaro.org,
	matthias.bgg@gmail.com, hsinyi@chromium.org,
	nfraprado@collabora.com, allen-kh.cheng@mediatek.com,
	fparent@baylibre.com, sam.shih@mediatek.com, sean.wang@mediatek.com,
	long.cheng@mediatek.com, wenbin.mei@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/8] dt-bindings: dma: mediatek,uart-dma: Add binding for
 MT6795 SoC
Message-ID: <YxTftFYUAAujw90V@matsya>
References: <20220729104441.39177-1-angelogioacchino.delregno@collabora.com>
 <20220729104441.39177-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729104441.39177-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_102619_555574_D67C6F4E 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 29-07-22, 12:44, AngeloGioacchino Del Regno wrote:
> Add mediatek,mt6795-uart-dma to the compatibles list to support
> the MT6795 Helio X10 SoC's UART APDMA.

Applied, thanks

-- 
~Vinod

