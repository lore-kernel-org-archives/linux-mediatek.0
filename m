Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E906C77B7F
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 May 2023 00:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nC7Cl3wtEaeiujzAuBm+wUJEnfu1cNkCH/Df3nDzMEY=; b=jNKFEPh4hkoLZmL7Sw9RyZSuzf
	0b4V1JiGwfJVbnrK7r+bKlo+8XtE8/nJvmOLP2z2HwDGY1mjEStMCvKpBnQPevO/EpBzSq/W9IBQ6
	fY357InqDrKKbpR3HwT2tARxOshES+SDmJywwnWdkrJIqB0jFILJxda5MmgtegX+FRUTElXtND15g
	SA0IGyAZT7oRUT2OaoarfGkJKroJXrgQbNFpLCh8ZjxA032YS94teiZTYZASynZt57Hvu7T2bDnsG
	1cDYfk1a8VKlIgDrOzwN3BBQGxDcvFyzotS8gdlECzZjLQNSkyuCpQMmINGOXuzszXzWKI859AEdl
	wAoMA8gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puNC0-006DpC-2d;
	Thu, 04 May 2023 00:51:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puNBx-006DnL-0g;
	Thu, 04 May 2023 00:51:30 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A819166029DE;
	Thu,  4 May 2023 01:51:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683161487;
	bh=ZuwMTWHm2iPyq3ojep0jRCMBzTJ63CqAsLJCGNoZM4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bucvv2nuoDCdR5cpffHY+fXqyyr7lKu3Lp695q9QahUtJgi2NMBczsUCdCqCICVuT
	 Wy3f3+u1Eu1PD2+V+tlvI3EzA1+pc975LPsnvk6ohdVu6TuGCm6j18RoJUJVFoLx54
	 lzGp+9DDXtZLiw5r4SwMda/n+KByUipc80cKD+wJUh2QpMZaAGJhY+hfObYLaxyvam
	 HVT0q5eovfnnnfIru3ZPy1pL0hlDFbzY6s/O/3qCkH+Hm6nrcx5d/ujjoH5gCo+xcW
	 k5aq0xqbD6/lExzcW1tdr24VdAkYahPKbjinTN08g8aZay6VzPCghA+X/6GqOFmyAZ
	 QNm6kKOjmT3og==
Date: Wed, 3 May 2023 20:51:21 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: bchihi@baylibre.com
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com,
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
	matthias.bgg@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
	ye.xingchen@zte.com.cn, p.zabel@pengutronix.de,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	wenst@chromium.org, james.lo@mediatek.com, rex-bc.chen@mediatek.com,
	abailon@baylibre.com, amergnat@baylibre.com, khilman@baylibre.com
Subject: Re: [PATCH v2 3/5] thermal/drivers/mediatek/lvts_thermal: Add mt8192
 support
Message-ID: <922e6f99-cc03-4b1d-b390-a3d3bcf2ef83@notapiano>
References: <20230425133052.199767-1-bchihi@baylibre.com>
 <20230425133052.199767-4-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230425133052.199767-4-bchihi@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_175129_379469_2A3DDD91 
X-CRM114-Status: UNSURE (   8.04  )
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

On Tue, Apr 25, 2023 at 03:30:50PM +0200, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add LVTS Driver support for MT8192.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> Co-developed-by : Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

As you're the one submitting the patch, your SoB should come last [1].

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

Otherwise, with the change to use filtered mode instead of immediate mode as I
mentioned before,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

