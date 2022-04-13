Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35C1C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 07:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d+xum58vfTqiHKqBiLw/4QkURfJE0sxE/J3w8AdkcQQ=; b=Mm0NZT2F5w//Hd
	r0d1MBvMXixmmTE1XpZRSiAdunJ4GTe10QKjULYN5kCKlauYnx92wHUaCEFdO6TW841Qw++GcHcvg
	Q95YF0+gzYDli78nz7Ovfh+Vu1jfATUn+6edIPMBDFJ6bW3ugTcr0+X2Vuy254HCyxoSwQCCRWqRc
	K0ziePRP90nU4SLM8MnNgilypPjA3n0a1XJl2HQLo/cOJoUSbLHr93BMrh1ftpXxf6VEfYSPmEVs9
	RPYopZXf5+DI6qsC5oT+IN1Qy/ZOXcWVInWk1JVkjGdjdwVaPylACeqPpcAW0VwdArl3WuEeqE3uG
	+z9j3KFnAc2l3y00M+RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neXkw-00HT3B-2Z; Wed, 13 Apr 2022 07:49:38 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neXkl-00HT06-At; Wed, 13 Apr 2022 07:49:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A6882B8214B;
 Wed, 13 Apr 2022 07:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C45B7C385A3;
 Wed, 13 Apr 2022 07:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649836164;
 bh=P3PLLYEnQouhxbXJippcLF+VwcPI1Q2ZMS5OvlaMfyA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nSteYYZB6AVx6v/PHai0BVgRNkBYhVWJfvdWe1bnv0yrQYkYwgbU07JDTO80e2tyr
 ukdSwYpauO7qtS6AuSZ6eUCUXAXXuypOL5tAV8P7CSuws0dIrAC05YkyiQMtLwMfF3
 Z3DaTjVivkAYgPvCB7RUQ8Vv0KiJew0yDUCVz/ZHIuE/UPi5Fe7qEDmIuD9fxCn1Bx
 nHYsh6i/SxngdHcaEUcTdKkor3uK+CRi5ZSUUii6Fi1yWzP6dbjMjNLzso/nmPh3Dg
 hLrf+P5KU43ovVLVoSf/ZP8Fm2thEpIeCpJyLCNNKNO0G1thbQfdSFHnCibZMScTYo
 HgCAP5grseUgQ==
Date: Wed, 13 Apr 2022 13:19:20 +0530
From: Vinod Koul <vkoul@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 chunfeng.yun@mediatek.com, kishon@ti.com, matthias.bgg@gmail.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: mediatek: phy-mtk-hdmi: Simplify with dev_err_probe()
Message-ID: <YlaAgMk9bIGiMMV7@matsya>
References: <20220328111046.210736-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220328111046.210736-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_004927_552406_D4C0BEB3 
X-CRM114-Status: UNSURE (   6.14  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 28-03-22, 13:10, AngeloGioacchino Del Regno wrote:
> Use the dev_err_probe() helper to simplify error handling during probe.

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
