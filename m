Return-Path: <SRS0=W1mV=QC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F141C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 10:05:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CD6F63211
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 10:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CD6F63211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ztZfAmRQXYU6B8uwJtM0WRsOOyPVlIDQlPlLyQ/YLCE=; b=Q/fx33vif8aZnX
	u7pcP3xsb+A8vcX2H/ny38NowqvUze394Oqpe1OTyAW+jihT4jDe5e9s8EvNf5ywYiOJfzscL0qvo
	cwKOAcnK1hZjBrW/dfQqE2RE0yvOIY8yf6bME/QehDCAcWQfskYYb5pmdYh3fM3pOLSorbTMSw1j8
	hhLQdWCk+pN8K4UsLD3SVrF76oaoq/BsezxqxvgkvS1uUsKqpS6Ur9+EhgRfV+Da2SF1dl0Gzwx9B
	W4MTtsFgRrMKZWNPI82ixs/44VlEel1ImILV8aE2Lo+mfzQMvqOKDU9Dk3Rw/k4LAXCbojk/ueUct
	pp8OUdUaYCASLbahRYUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYrx-00F55d-4U; Mon, 15 Nov 2021 10:05:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmYIa-00Evhw-77; Mon, 15 Nov 2021 09:29:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D84C661AA7;
 Mon, 15 Nov 2021 09:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1636968551;
 bh=I6O2UV2fGViDnmQb3yT5G3yszWMS4rc3+0/gpS1qXvU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gtv0z9F+cg7m5iUigYzQSXdBmqjeNhYNc1I8EJFax1CT8PECJIzX3os6j/DxEhLkx
 93M6KA+U+kN3zisIL2iFiZybt3QOI5g4ISKMbL5XeBSS0SgZSKSo6xro2OHg3eDBBX
 qvbOul007NWliank+ghlFaz1YeU9MgaYAjP9xG1M=
Date: Mon, 15 Nov 2021 10:29:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Liu Junqi <liujunqi@pku.edu.cn>
Cc: linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: mt7621-dma: reindent to avoid '(' at the end
 of line
Message-ID: <YZIoZIuXKBh3mANt@kroah.com>
References: <20211113142455.370952-1-liujunqi@pku.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211113142455.370952-1-liujunqi@pku.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_012912_359510_BB01EAB1 
X-CRM114-Status: GOOD (  10.54  )
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

On Sat, Nov 13, 2021 at 10:24:56PM +0800, Liu Junqi wrote:
> A change to make the code more like typical coding style.
> 
> Signed-off-by: Liu Junqi <liujunqi@pku.edu.cn>
> ---
> V3 -> V4: Rewrote the text below the --- line
> V2 -> V3: Added describing text below the --- line
> V1 -> V2: Reindented the code
> 
>  drivers/staging/mt7621-dma/hsdma-mt7621.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

This file just got deleted:
	https://lore.kernel.org/r/20211113192045.32153-1-sergio.paracuellos@gmail.com

sorry.

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
