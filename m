Return-Path: <SRS0=GsAT=ZG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84AD5C432C3
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Nov 2019 06:48:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63C5A20715
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Nov 2019 06:48:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e1tuZ++A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Te48b4YP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63C5A20715
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tltN58fhGvBykiffh8O2MT+a02wOEzbgMWGrPmDpYTw=; b=e1tuZ++AlUvbCr
	CnQk7yNPBYZrO1xEgRIGLQuDjmLoNP/qxIVE6exsTh4P0nCLcxhzjLGu7KZg8uPOUGDQZqgfnfNq3
	Zbi+HH7GEQ+az7qaqj5XxBUJOz0scaH42fmBUrunUJDYPVL7SCYRDvjqHoDTpETeNPoararNkXwLf
	B4DhziB9zsW4tfV08QggVPt1IMilUNWhDhvezuoSNu/THxG+KMrjHxwPKw5fLvLUmE7kiZBR2zsIJ
	to4u9e/nEsdhZFexKhxW94uGsKH9Op8ul5ynM0AYklz2EMSQLztpOk2GwXrdqUwSCnTBe31IAuEUs
	6auS5U3GsUad64kGy59g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iV8vS-0001ib-9k; Thu, 14 Nov 2019 06:48:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iV8vE-0001Wx-Su; Thu, 14 Nov 2019 06:48:06 +0000
Received: from localhost (unknown [223.226.110.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C114C20715;
 Thu, 14 Nov 2019 06:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573714084;
 bh=kwJjaG+SEqpT4/sq5ZdwWvkA07Xb/lWO0se3jKCGklU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Te48b4YPfaWP8IvK5q0sJ5iOQakxbMaqikYck9YuSFBl0OdWCMaf9cfjmgKlRtGMm
 IaKGxhh4bei9KOuaVcG+5mVLi5o8EdQZhRrQS1p3gop2tHEabuIlr3/8C5e443VjOA
 Ys7XLVG8cL3JzzFerBZzyW0MEW7aXw+Ee3wKas7A=
Date: Thu, 14 Nov 2019 12:17:57 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Satendra Singh Thakur <sst2005@gmail.com>
Subject: Re: [PATCH v1] dmaengine: mediatek: hsdma_probe: fixed a memory leak
 when devm_request_irq fails
Message-ID: <20191114064757.GP952516@vkoul-mobl>
References: <20191105165914.GD952516@vkoul-mobl>
 <20191109113523.6067-1-sst2005@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191109113523.6067-1-sst2005@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191113_224804_953134_CC4274E7 
X-CRM114-Status: UNSURE (   6.66  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Satendra,

On 09-11-19, 17:05, Satendra Singh Thakur wrote:
> When devm_request_irq fails, currently, the function
> dma_async_device_unregister gets called. This doesn't free
> the resources allocated by of_dma_controller_register.
> Therefore, we have called of_dma_controller_free for this purpose.

This should have been a v2! Anyway I have applied this and other patch

Thanks
-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
