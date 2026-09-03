Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E479C61DD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 17:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DilgdbLi0RvprvJJDhqDDjROWxRbnzwuVzagfLzpeH4=; b=2fuj55pA/MtYgkKMMK3ZWNCWXq
	dyRvn1oUdpx3kqXMD805iJGV2Du0LJOJ6PJrtiKTKQT06iC7/WL+CRG47wOacnXUxu3P7kb7BzoWx
	4l98uxfDLKJaD1VrUU6TMRSK0CUV0caO3YsSH+5hUW+J25n78yJLZ8LKEoNFM+ljBBb5/4JhmKluN
	/2JNTUKdIetu8MctxTSGz+0BpRf00Lzsr1AtJMCaxnXOOep6dG88FZt7i2ytOA5BSV5CIOiS2zItm
	EMefAuc8hJw7xJQso2VqQg8ZDwBC9d+LqFWDGFa/wktz2fzsd50tsQGcL839wWYNU+/T0xMhNYm3i
	5X+QCApw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Arv-00000000EfY-0z1j;
	Thu, 03 Sep 2026 17:04:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Aru-00000000Eeh-0uV5;
	Thu, 03 Sep 2026 17:04:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A077944516;
	Thu,  3 Sep 2026 17:04:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A211F00A3D;
	Thu,  3 Sep 2026 17:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455093;
	bh=DilgdbLi0RvprvJJDhqDDjROWxRbnzwuVzagfLzpeH4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jtOJsKw1Z6E1n2jwe18GTnTVkKTS2vbKwew94YlpSdbjnegpMFp+73VObcU5yL9bq
	 gAeS1O+aFWl4/HN1uL0kpq5C+u5SuWU4kB8prn8W9P860OGN4r2HTW4LyXWYscsQIL
	 yiZvFWdcZazUZgQqvdp1pzQJDUvnEx1cPS6mmXOP22X/vzE9ozU0SZEXM7hN7Ut9dL
	 n/4gZsX6OeMhdgiUqpO+An/opUPBNL4Cp5uRcb+JumsjijOMhT57j8+Qz0xO/sUn6n
	 5aeZPXM1JaA0uLv+trQFkCSSb8dHuFoqD3Ol2mGG48048P59DSLu16ZydCP/WdUYCJ
	 P2WZaoZQCsMQQ==
From: Vinod Koul <vkoul@kernel.org>
To: Sean Wang <sean.wang@mediatek.com>, Frank Li <Frank.Li@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Myeonghun Pak <mhun512@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ijae Kim <ae878000@gmail.com>
In-Reply-To: <20260804153924.49627-1-mhun512@gmail.com>
References: <aj1RSj5ZXvc-9yu7@lizhi-Precision-Tower-5810>
 <20260804153924.49627-1-mhun512@gmail.com>
Subject: Re: [PATCH v2 RESEND] dmaengine: mediatek: hsdma: fix runtime PM
 leak on init failure
Message-Id: <178845509001.1711546.16011623641876129813.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:34:50 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Wed, 05 Aug 2026 00:39:24 +0900, Myeonghun Pak wrote:
> mtk_hsdma_hw_init() enables runtime PM and gets a runtime PM reference
> before enabling the HSDMA clock. It currently ignores failures from
> pm_runtime_get_sync(); if runtime resume fails, the usage count remains
> held. If clk_prepare_enable() then fails, the usage count remains held.
> 
> Use devm_pm_runtime_enable() to manage runtime PM enablement, and use
> pm_runtime_resume_and_get() so resume failures do not leak the usage count.
> If clk_prepare_enable() fails after a successful runtime resume, drop the
> runtime PM reference before returning.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: mediatek: hsdma: fix runtime PM leak on init failure
      commit: b616eb4ef1e9358296a88a2fa7230dcfac52b53e

Best regards,
-- 
~Vinod



