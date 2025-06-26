Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45373C7EE32
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jun 2025 00:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6EBkDTY1DVUwVzOvzQgyYtm8oQtXhbvi3mvrRtVqpno=; b=RcgjMh6gmVkHRaRWVFNxIndGOF
	Hl35barnrVqKrEG+EDzzZjgeHzQ3t5zHRV25cb16kMEPF9SSgcqFsNxb3lMVhwBK8ZyvSZG15aoJ6
	F5H69C4U2ww+j8v2mMgmuugurS0iZctxx9f9eBdpulFLcpY3nMSm9I6/hs+RF1SOJRd+REa6gPgkq
	I99DMgTHPF8Hfhz/N1kd2vJ/IZtxiuY3CCIZXxzFZCIfIfg8e77zeyuTWotr8OH8uQYBUPSk87A4c
	FaC5KeIiq7bJCm6K4zxLgnvBTDX5wZ26BKs+FsFT55J23zBq2Zk3i+V5Co74BC8XVEcloLfxMtU2l
	7eT4m3/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUweG-0000000DAae-01xV;
	Fri, 27 Jun 2025 00:08:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvKz-0000000Cy0U-1LF5;
	Thu, 26 Jun 2025 22:44:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC47744731;
	Thu, 26 Jun 2025 22:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D903C4CEEB;
	Thu, 26 Jun 2025 22:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750977896;
	bh=iIVxK75n9yifPDH8xfQqAE4cWRG5nMYGTwZryyQ4vxI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oF71iFGUJtNGLoUJckRGl4g6TBbZB6rRaYacVDiaeV+RJuIdIun5xbEGgLq6owLoZ
	 TPrmGyojuS3ZO95jLuPwmJVwsceBa9jXH4SHOpXyAy9e5EXbpy6GQzoGndU4cou+3z
	 3CbOlOzGg62A+oEYfq7ZQOS4w8y+mxniEAiSEArs6YDh6BFP4N5tWiOZu57ihil281
	 e9HosDW8+Mu27iNNbUBSxg0xDL4f45m5ALWSEbDVl/Ty3KojXZqujnXxTeH6/NeyUV
	 NaQgdFV6yFyjA0qnzqeEulDsfjr3P2gQwvPi+6B5yatq5f5Wkf5EaX7pGDEEyOccE7
	 ugIJe5IsQ+3Og==
From: Vinod Koul <vkoul@kernel.org>
To: sean.wang@mediatek.com, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, eugen.hristev@linaro.org, 
 Qiu-ji Chen <chenqiuji666@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 baijiaju1990@gmail.com, stable@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20250606090017.5436-1-chenqiuji666@gmail.com>
References: <20250606090017.5436-1-chenqiuji666@gmail.com>
Subject: Re: [PATCH v2] dmaengine: mediatek: Fix a flag reuse error in
 mtk_cqdma_tx_status()
Message-Id: <175097789639.71042.9318764811054484272.b4-ty@kernel.org>
Date: Thu, 26 Jun 2025 15:44:56 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_154457_396994_5100262D 
X-CRM114-Status: UNSURE (   5.06  )
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


On Fri, 06 Jun 2025 17:00:17 +0800, Qiu-ji Chen wrote:
> Fixed a flag reuse bug in the mtk_cqdma_tx_status() function.
> 
> 

Applied, thanks!

[1/1] dmaengine: mediatek: Fix a flag reuse error in mtk_cqdma_tx_status()
      commit: 8eba2187391e5ab49940cd02d6bd45a5617f4daf

Best regards,
-- 
~Vinod



