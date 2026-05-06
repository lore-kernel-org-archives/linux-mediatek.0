Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E9ECD343B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2026 15:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9tn9Kq4tpdLI9N9hz49uapAKWylQwew2NPmVkeW/GA=; b=pbAJEbWSJ/CCC33K+a5oYN+5bt
	Ow0ydP+zrVR0cdnCg2GluZsgJrkLw1hHIxjWDlMb98Ubgcx7drrSC5wXUmtGcAiHlYTr/XF+YLigi
	0Pg2+mrbNUj/l0Pe55KJLWB02deG6+ao/8793hoIRZ2p9fBf8mcITS8938bvOYt8zOYhx/GeqJemJ
	pRVVkIMkKN6wPgzbaAIOxPy71ttzuFx8QTnR5HVbn6/XpmO5IuiVbtkYyJ+P6oX35WvhQtZ3Mzo8P
	MZzdBPcFI/j8WmnN+dQo6iGE2O8h77KUPeB12I4HZ7/pfj6FT7tvqHFBuWFH0NX1fh4e5uNhPKD1G
	bS6YNKfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeEZ-00000001LCV-1Y5f;
	Wed, 06 May 2026 15:32:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeEY-00000001LBc-05z3;
	Wed, 06 May 2026 15:32:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E9D1D6013B;
	Wed,  6 May 2026 15:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690D3C2BCB0;
	Wed,  6 May 2026 15:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778081540;
	bh=Z8nEPenX4TJdhrXgJ7ghrwizbjBvQ1xCIwn0oI8yavA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=URVdJszvdIFFyTDuQUlwecaT++vnVVLr0/BQkIc8MD8H2nfKf8gxdYHZbiNHA9Ylk
	 Y8cR0+NjDS5HhyPC+/gwBvbz/dsnXwYh35XLDyio9uIAPxP2YVQ2hUrfoVzFSPjVYB
	 Z7cF09xM7rdK6DhzPETQnq1K/1Q4zw611gAIaF0rV/x4LWgPes/1N1csPAhWdXglIL
	 GVhb2UVOFR/N6MuaPgG0pSmsvq55R7Pu1k2X7UMHS894+L5cW1uQbkhIu4H7g6lW/A
	 /sKevocI26B6gL9hj3xnZ5Er4zySpmEihZHCHxaxH0w6z7aGpCo/vBFtOCGeTTrFl8
	 33/ZbPuCbBHHQ==
Date: Wed, 6 May 2026 10:32:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, kernel@collabora.com,
	Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, linux-iio@vger.kernel.org,
	linux-pm@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>, Sen Chu <sen.chu@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, Lee Jones <lee@kernel.org>,
	linux-input@vger.kernel.org, Chen Zhong <chen.zhong@mediatek.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: mfd: mediatek: mt6397: Add MT6365 PMIC
 support
Message-ID: <177808153813.2165238.1499393868566610666.robh@kernel.org>
References: <20260429-mediatek-genio-mt6365-cleanup-v1-0-6f43838be92f@collabora.com>
 <20260429-mediatek-genio-mt6365-cleanup-v1-2-6f43838be92f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-mediatek-genio-mt6365-cleanup-v1-2-6f43838be92f@collabora.com>
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


On Wed, 29 Apr 2026 11:44:15 +0200, Louis-Alexis Eyraud wrote:
> MT6365 PMIC is compatible with MT6359, so add the compatible strings
> for the main and sub devices (regulator, rtc, audio codec).
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


