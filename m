Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C38C43602
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2026 15:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/mTDxEEXhf1dHuXuCAdsHsLXruAQZQS4VLT12t4ez0w=; b=S3ezXhxVjcS4rMALorjHhLNG8z
	14dWR6kYbajGMT5FRMjg54JUHns8pHsrSydSiGDxR+pBbPlo7g4WPNRNT2k0VPLRKcgXq35ohpGIm
	gKZi+g/HNA6enCPcNdeYTubk0A9BcV/nW87kMBKvLbVBbGiimz1GQC3dXhl9R5SXgm7kbCADfWoln
	8ygbmd3un2T/H5SsLKdrfztRlAlGvoZ1BKITu8kbVvRHoRGtmym1J/ElRVBx4fhmvEEI2jG9sXLn/
	/yeLzi3OB34PFD+QfiS3MO7W0ok9icwx9n246Y4BcdTIKKZMQ5nMnJej32d5IB6XJQLYZaGsWAr97
	Q3LLhYqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJOa-00000004onk-3VVa;
	Thu, 02 Jul 2026 15:32:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJOa-00000004omt-12oY;
	Thu, 02 Jul 2026 15:32:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AFEF4601EE;
	Thu,  2 Jul 2026 15:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3CAC1F000E9;
	Thu,  2 Jul 2026 15:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783006327;
	bh=/mTDxEEXhf1dHuXuCAdsHsLXruAQZQS4VLT12t4ez0w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jzm3JnZHFwt/mqn9jWUA02Owh5bjidWASS5DJ/T1BuIak6b45txHrmHFY2OD7kTFZ
	 hawKT/j3+DeENwu/Y4qX5BKoOhyukLWxpmaylheHpl2c7Z5XG4aMRgNC50WGmMJSaw
	 0XjMKWpCykkafVObJ/OJiT1jPiMefA25l0lSEszULIo4FK3HUvCjWO/vqYVZ7+QVMM
	 51/xXH/BTzmWnRbmA7xrnv6qTjzSrkx609UIL3LD/aZo8Q1+7Pki2XsJDQVO7oBdEb
	 F/nQ2vVaX8qeNOZ5f/EF1yYQjpGrC9AIxl9I/FbIZfBZNySVAIRGDLMZVUOJN+UMbn
	 6P0VdgzeHdWGA==
From: Vinod Koul <vkoul@kernel.org>
To: Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@kernel.org>, Vladimir Zapolskiy <vz@kernel.org>
Cc: Long Cheng <long.cheng@mediatek.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260701200703.117929-1-vz@kernel.org>
References: <20260701200703.117929-1-vz@kernel.org>
Subject: Re: [PATCH] dmaengine: mediatek: mtk-uart-apdma: Return -ENOMEM on
 memory allocation failure
Message-Id: <178300632440.735405.9920364004468870936.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 21:02:04 +0530
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


On Wed, 01 Jul 2026 23:07:03 +0300, Vladimir Zapolskiy wrote:
> If dynamic memory allocation in driver's probe function execution fails, it
> should be reported to the driver's framework with -ENOMEM error code.
> 
> 

Applied, thanks!

[1/1] dmaengine: mediatek: mtk-uart-apdma: Return -ENOMEM on memory allocation failure
      commit: 467265c750edd7ab43803deeafe7d3120a791d32

Best regards,
-- 
~Vinod



