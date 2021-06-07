Return-Path: <SRS0=qtn6=LB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B077C47082
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 06:54:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A598611ED
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 06:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A598611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s/RrSASK4o+jTpF2H/RHewUMIwZddaovqjydXN3u2vA=; b=dmtuXf3umL7BMa
	cimMCzlW7VoAa7yrxdGGZPGMa6V1unNSb1Aw4yeFOtsNGMP/RxUKfLBK/C6SFajNQweOxhBxiMYnL
	2PEArw/hzd7P0yYsmk+Ey27sYDgd3fFy934Lanp8zsdZx3ryXkQDYNccRC1LViaY4l4z80D0foVf5
	Z5q7rDMQBEWoXtXKy8jFk/WxT8cwuSPSDHyBhU1VqxDfYoCD7/Qu77w9aqvhriMF5PqVxFPbQPGmh
	xsSeQxIAr/NB1VULHe4N9HQjEpdqZ8Ai3RA7e96xlckzngNOIPJg3Iwg2vD7bnt5RaKFVIvo+Xxzd
	O1oZVkH19RzZCfUx/fjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq99M-001pI3-OL; Mon, 07 Jun 2021 06:54:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq998-001pFK-0T; Mon, 07 Jun 2021 06:54:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C25060FF0;
 Mon,  7 Jun 2021 06:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623048841;
 bh=3WOLgfAMR0w8GUbFt52lE2XL9Zd739S4s8Bkg9JcIKk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n6+6O9A/1C0/pvDUSV0h+nRgmgF3u5+tVSfum3G87Nc0YLLFyVSNE11VNYkCq2EvT
 mjeH4ZWrt+XX90ZzTuRCVHkHr685vskt3e3c2A8CrewGwSVhEpbBqI/bXaeE9VXRUm
 sGe2H4i1W1uj1ExYGnljmGwie40weJv8ifJu3Ghtf1/v/a4oMyGGzPfOfCVTy37Cng
 r6GBcLiatke/HfikrNRpOV+EbOGrIgVyaRivS/YcApI7F0T3Jutk0WKwFoLRNsyua1
 Pkan85xwt5ywPQ0wz6CpKpYo8HvftGd+EFpdk38Evv8+sXx0H+jC8W9zXg+EN4XNDO
 fWKHCBZCIsi9g==
Date: Mon, 7 Jun 2021 12:23:57 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] fix mediatek UART APDMA desc logic
Message-ID: <YL3ChZxIQwqZpCTF@vkoul-mobl>
References: <20210513192642.29446-1-granquet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210513192642.29446-1-granquet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_235402_089452_98466B03 
X-CRM114-Status: UNSURE (   7.16  )
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

On 13-05-21, 21:26, Guillaume Ranquet wrote:
> The logic used in the apdma driver to handle the virt_dma_desc caused
> panics and various memory corruption.
> This is an attempt at sanitizing the logic a bit.

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
