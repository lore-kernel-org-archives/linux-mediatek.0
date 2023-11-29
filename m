Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D757C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 13:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rxuY9Y2RDOYJ5L61aAMqH95W6anp/2dy8dhjuWQhZw=; b=rgJCsYiCMmSXXp
	b626ITrLOiHu8Pd5M/dlbK7DFVfn4t52kr1RM7372pmIkj7KKfijGHzPckD5DpY+7CqtWumyFkHqM
	rMNALpdcO53OORb21gKazE4Ayr/DdzC91dAEikhG5CdSsEa6cdOjAyTgNpPrbFp3yxcmvdw/30yj+
	3qifb6rJ1iBQ1V9zpznBFeXWRNvcXoCdQFeUTKcfcNfO2pVW0gUSc1aObJ8ZwgTSXz8xZF0uG8wsv
	Q/RMJ2NZQFlYazAeCHVLYnE4JmVwFW6ls7VXn7L9/3Edu/9PXwUIgnLY1qCB/bXZWZJsBkMJhDiEF
	/rrooRpaHIrRSiJy7R7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Kd4-008SpQ-0H;
	Wed, 29 Nov 2023 13:29:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8KcF-008SWX-0T;
	Wed, 29 Nov 2023 13:28:36 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EE4D5660732A;
	Wed, 29 Nov 2023 13:28:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701264514;
	bh=g+em6JqJZ00XbTVeewcZiGmqWrpvJAkV8acFNSWWYCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j/7urABsZgqtZgA1BNQ8hGus2qaocBPrL9QSm1MvmYfaeZYo/BkwwgqGtER0AmTxB
	 VfAZVwM+kR8cV7isyd3STG4fQeMxWnrV1o1ebsE7yAKmWJ12Wt2EfjDXXZlyThLA+m
	 C8x20mLODITo0PKsvZ31+vFsKx9JSIRys32oO68Gpg+Ct/jSeVOkfxFe9MhMYrWJvp
	 m4yVmoyJ0yPGebbVM8uGnqAvl4JbFJLCkymdU354CyWTCMHpQb3rtO2QCx9Wfc84mz
	 7mftC5eXqkMczQGUL0F2X7yfl+AP3nLfVV3J2+i7v7kC+BzwRZvIhea3j1LXYSZRPR
	 wXrGptJUIsGGw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v2 2/5] arm64: dts: mt7986: define 3W max power to both SFP on BPI-R3
Date: Wed, 29 Nov 2023 14:27:39 +0100
Message-ID: <170126437824.153055.13721908976403389958.b4-ty@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025170832.78727-3-linux@fw-web.de>
References: <20231025170832.78727-1-linux@fw-web.de> <20231025170832.78727-3-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_052835_316171_39C5D127 
X-CRM114-Status: UNSURE (   7.74  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org, Eric Woudstra <ericwouds@gmail.com>, matthias.bgg@gmail.com, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Wed, 25 Oct 2023 19:08:29 +0200, Frank Wunderlich wrote:
> All SFP power supplies are connected to the system VDD33 which is 3v3/8A.
> Set 3A per SFP slot to allow SFPs work which need more power than the
> default 1W.
> 
> 

Applied, thanks!

[2/5] arm64: dts: mt7986: define 3W max power to both SFP on BPI-R3
      (no commit info)

Best regards,
-- 
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

