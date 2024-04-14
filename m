Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F78C4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Apr 2024 17:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9pdL6SkcbaLa7Ir8LYBLThg0t9pKzxq6qkAV0WVvaU=; b=QcMPl0c4Ls1nJ4SijNgc1PGeid
	rFUtjpqvSkIYTBgphRMAKgwwsTf8/LS+36BurHuce6LN2kly9OI1l76RZCYvCpxa2sZhrNM0xiiYt
	Cn2YniC7i1sJPmgPoGBgNnlvl0yXAjQPGgUQCwU1DYkvvIJBGXHdx63SUq4mG3Ixbm+corf0t5AGn
	2sl11qDUXu2d4sYuE9OTsghtmHNi5l9FvtokF3YJOupFGl6+iSDDfusWl5Ieh0qX++xP9hn2cXiBo
	h6CWa1d8k2Z/WJdaAtqo1xLnG5ZX39NUsFr1M/iBw4UeBBe5H4Kh2U8ko8FviP60g+5ytRZ4WMh3F
	1FCGoLsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw3qi-00000006140-0XNF;
	Sun, 14 Apr 2024 17:41:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw3qe-0000000612t-1dey;
	Sun, 14 Apr 2024 17:41:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 38E7960B2A;
	Sun, 14 Apr 2024 17:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96864C072AA;
	Sun, 14 Apr 2024 17:40:57 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id 2871D106134A; Sun, 14 Apr 2024 19:40:47 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: sre@kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, mazziesaccount@gmail.com, gene_chen@richtek.com, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240410084405.1389378-1-angelogioacchino.delregno@collabora.com>
References: <20240410084405.1389378-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] power: supply: mt6360_charger: Fix of_match for
 usb-otg-vbus regulator
Message-Id: <171311644713.1234207.8096080431405648048.b4-ty@collabora.com>
Date: Sun, 14 Apr 2024 19:40:47 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_104100_518812_77EE750B 
X-CRM114-Status: UNSURE (   8.24  )
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


On Wed, 10 Apr 2024 10:44:05 +0200, AngeloGioacchino Del Regno wrote:
> The of_match shall correspond to the name of the regulator subnode,
> or the deprecated `regulator-compatible` property must be used:
> failing to do so, the regulator won't probe (and the driver will
> as well not probe).
> 
> Since the devicetree binding for this driver is actually correct
> and wants DTs to use the "usb-otg-vbus-regulator" subnode name,
> fix this driver by aligning the `of_match` string to what the DT
> binding wants.
> 
> [...]

Applied, thanks!

[1/1] power: supply: mt6360_charger: Fix of_match for usb-otg-vbus regulator
      commit: bcbdcffd94ce21c8aeaa43f223373848fd1202be

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


