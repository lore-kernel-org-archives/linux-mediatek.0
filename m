Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33AFC3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 08:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2goZEcSDINmw6G5tpttMPUVmBa3N0E7X3ZqHvzQaE6g=; b=NCz0bavMtre7FNzjzj8WQK5ART
	n7G1sbe8+ASXtZQjEQ2Hu5awTfNzWUF9IA4Hb5DEjTnfUCFftIMwER2TGd/n4A2BgNaDZye/w5DCq
	WnRusDexvFIebOMlVfs65O80hFu58dkJNAB46Ytm6i9MUMjDD5M5rcb/xGPzzxDXW8Yq67bz/XU3u
	VlqYcdapFi1gPnSQnZewshJs/rNzVXePpidH1jD+1jzL3SG/Lm98eGmRoooeGJ38IkVws6RpWsNyx
	4NPpS6zRLgFp3c+yvRzifIGMILhnWu0AVUmCUeThVIhmb1GNje2JmhkY65JUaknrLGEoAQEq3j9sZ
	ZgJKCpxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYigL-0000000EOlE-2Cs2;
	Tue, 30 Jul 2024 08:58:09 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYifs-0000000EOcW-05cp;
	Tue, 30 Jul 2024 08:57:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722329855;
	bh=9Eq45pApsAjGd9ob3SvORkeALA6iNVKRtX/3ghNH1tk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jyD9Wwo9AighdQk8GfBbN4SfFtXssLFmEYHBCYT6rPnOlOFDWgnkBAEBtx9eMn/dc
	 KYKqJ1qgZG7Kn+hY7PwxOQHiJSpsDrOFRQjRJKNejOTowEH81QhCCCWU8nz30Rub+l
	 5MEtiWx3WPq2zxZUuVwyBy1EtoBvFpT0bOLZ7GQ+JCpndfklVpBtiebpq6/kK0YlcF
	 +jZSliscbVVDRG9s4wudWZPsqzu0YV75Nt8f/UoAlEuwYc+skgrVqH5XqpsWMbMRnB
	 13MN9SrXfJSHiK536N+yy1kclgoeK/nYkIZszc/Fvu2DbMzdQ3zV3zcgMuMa6a8e5E
	 +HLcL6ti7qtxg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D4C0E3780BC9;
	Tue, 30 Jul 2024 08:57:34 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com, fchiby@baylibre.com, fparent@baylibre.com, 
 s.hauer@pengutronix.de, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <cover.1720331018.git.christophe.jaillet@wanadoo.fr>
References: <cover.1720331018.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v2 0/3] soc: mediatek: pwrap: Constify some data and
 other improvements
Message-Id: <172232985478.56643.13436869801664543083.b4-ty@collabora.com>
Date: Tue, 30 Jul 2024 10:57:34 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_015740_229233_83476205 
X-CRM114-Status: UNSURE (   9.73  )
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

On Sun, 07 Jul 2024 07:47:19 +0200, Christophe JAILLET wrote:
> This series is motivated by patch 1. The 2 other patches are some
> additionnal goodies spotted while looking at the code.
> 
> Patch 1 constifies struct pmic_wrapper_type to move some data to a
> read-only section, in order to increase safety.
> 
> Patch 2 does the same for some int arrays. This helps move about 7 ko of
> data to a read-only section. Not that bad!
> 
> [...]

Applied to v6.11-next/soc, thanks!

[1/3] soc: mediatek: pwrap: Constify struct pmic_wrapper_type
      commit: ded525f8ac5db53286b0eabb679ecf7edb974eaa
[2/3] soc: mediatek: pwrap: Constify some struct int[]
      commit: 10c1ea1eaf4d107c323321e92237ba67848de291
[3/3] soc: mediatek: pwrap: Use devm_clk_bulk_get_all_enable()
      commit: 1c28c9452d521bf21dc5d2c50a47c2e43002728d

Cheers,
Angelo



