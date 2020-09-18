Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34A2C43463
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 07:03:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7216721534
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 07:03:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eYPwNIR1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vdyWkWcj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7216721534
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=db84dGULesQuLrO3TlRX8MEE2eNpnyiXPl4goDFZ3lw=; b=eYPwNIR1DloeFNGaJfFUU2uw2
	pB4tmJArO/O/InVtXIPrDnYp4yYpuLO3LlyJoqKdE6/Q7IxYJrNjJNgdTI8mB3BX0/ihXAcJpWHe+
	2X3nMxB7hFYjGO6K2UAGpAOtWRhGAOOEbaGsWoOkz20ewMoKg5ut37CR47Sceuc8GTFc/HRqH7vTY
	GVtCl0Z4MIt7T4QKCJYbr37ellIeKrR9DXq0rBkyxna9E9K/bwt1ZR9wXPMi7jW0CSqZZONFK0Qre
	IqzkAGKwCVqsbfH2ba80q8gkI183ViT/9zIjiGakBSVC6rt726VbSaGoIA5bCzh68a6HdEsYYY8bF
	M1mp3TzSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJAQJ-0007EW-EQ; Fri, 18 Sep 2020 07:03:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJAQD-0007Cn-Ri; Fri, 18 Sep 2020 07:03:06 +0000
Received: from localhost (unknown [136.185.124.244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 497A721534;
 Fri, 18 Sep 2020 07:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600412584;
 bh=7dCO+MgzUJBfhAuxZ7aK0yShgDW6KFq+EN2MVT6l+lM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vdyWkWcjuyPX1kQxOIZE6DsYreOwnYJYVh2KRLhmSIVa1U4QOWmiipjDEiLgaiH6w
 c9Gpai48JfitOAosliHC3HlP0vC7PKNKIDEMKAaM3Z40Ga1aT+6j30kDnB8fUzNak5
 1TcNES3E9w8grkVlnPHOM0hFR9F/t8RYBRFj/WRE=
Date: Fri, 18 Sep 2020 12:33:00 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Liu Shixin <liushixin2@huawei.com>
Subject: Re: [PATCH -next] dmaengine: mediatek: simplify the return
 expression of mtk_uart_apdma_runtime_resume()
Message-ID: <20200918070300.GH2968@vkoul-mobl>
References: <20200915032622.1772309-1-liushixin2@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915032622.1772309-1-liushixin2@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_030305_959853_8BFF94E0 
X-CRM114-Status: UNSURE (   8.19  )
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

On 15-09-20, 11:26, Liu Shixin wrote:
> Simplify the return expression.
> 

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
